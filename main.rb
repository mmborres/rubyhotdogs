require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'
require 'pry'
require 'checkboxes'


# Rails will do all this for you automagically.
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.sqlite3'
)

# Optional bonus
ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger.level = Logger::DEBUG

# Models
class Hotdog < ActiveRecord::Base
  belongs_to :country, :optional => true # Since Rails 5
  belongs_to :topping, :optional => true # Since Rails 5
  has_many :ingredients
  has_many :toppings
  has_many :buns
end

class Country < ActiveRecord::Base
  has_many :hotdogs
end

class Topping < ActiveRecord::Base
  belongs_to :hotdog, :optional => true # Since Rails 5
  belongs_to :toppinglookup, :optional => true # Since Rails 5
  has_many :hotdogs
end

class Ingredient < ActiveRecord::Base
  belongs_to :hotdog, :optional => true # Since Rails 5
  belongs_to :ingredientlookup, :optional => true # Since Rails 5
end

class Ingredientlookup < ActiveRecord::Base
  has_many :ingredients
end

class Toppinglookup < ActiveRecord::Base
  has_many :toppings
end

class Bun < ActiveRecord::Base
  belongs_to :hotdog, :optional => true # Since Rails 5
  belongs_to :bunlookup, :optional => true # Since Rails 5
end

class Bunlookup < ActiveRecord::Base
  has_many :buns
end

get '/' do
  erb :home
end

# INDEX - Show all hotdogs
get '/hotdogs' do
  hotdogs = Hotdog.all
    @hotdogstotal = hotdogs.length
    @hotdogsitems = Hash.new
    country = Country.all

    country.each do | key |
        typein = key["name"]
        results = Hotdog.where( "country_id = ?", key["id"] )
        @hotdogsitems[typein] = results
    end

  erb :hotdogs_index
end

# NEW - Form for adding a new hotdog
get '/hotdogs/new' do
  erb :hotdogs_new
end

# CREATE - Add a new hotdog to the database
post '/hotdogs' do
  hotdog = Hotdog.new
  hotdog.name = params[:name]
  hotdog.description = params[:description]
  hotdog.image = params[:image]
  hotdog.country_id = params[:country_id]
  hotdog.save

  #Ingredients
  dd = 1

  until (dd > Ingredientlookup.all.size)
    par = "ingredient_#{dd}"
    par = par.to_sym
    name = params[par]
    
#binding.pry
    if name != nil
      ing = Ingredient.new 
      ing.hotdog_id = hotdog.id
      ing.name = name
      ing.save
    end
    dd += 1
  end

  #Toppings
  dd = 1

  until (dd > Toppinglookup.all.size)
    par = "topping_#{dd}"
    par = par.to_sym
    name = params[par]
    
#binding.pry
    if name != nil
      ing = Topping.new 
      ing.hotdog_id = hotdog.id
      ing.name = name
      ing.toppinglookup_id = dd #params[:toppinglookup_id]
      ing.save

      #save to Hotdog
      hotdog.topping_id = ing.id
#binding.pry
      hotdog.save
    end
    dd +=1
  end

#binding.pry
  redirect to("/hotdogs/#{ hotdog.id }") # GET request
end

# SHOW - Shows a single hotdog in more detail
get '/hotdogs/:id' do
  @hotdog = Hotdog.find params[:id]
#binding.pry
  erb :hotdogs_show
end

# EDIT - Shows a form to edit a single hotdog
get '/hotdogs/:id/edit' do
  @hotdog = Hotdog.find params[:id]
  erb :hotdogs_edit
end

# UPDATE - Modify the database with new information for a particular hotdog
post '/hotdogs/:id' do
  begin
    hotdog = Hotdog.find params[:id]
    hotdog.name = params[:name]
    hotdog.description = params[:description]
    hotdog.image = params[:image]
    hotdog.country_id = params[:country_id]
    hotdog.save
#binding.pry
    #loop through each Ingredient selected
    #params[:ingredient]]
    #if add, add new
    #if missing, delete
    
    dd = 1

    until (dd > Ingredientlookup.all.size)
      par = "ingredient_#{dd}"
      par = par.to_sym
      name = params[par]
#binding.pry
      if name != nil #ingredient is ticked
        par = "ingredient_#{dd}_id"
        par = par.to_sym
        parid = params[par].to_i #get ID of ingredient

        if parid > -1 #if ID found
          ing = Ingredient.find parid #check database if exists
        end

        if ing == nil || parid == -1 #need to create new
          ing = Ingredient.new
          ing.name = name
          ing.hotdog_id = hotdog.id
          ing.save         
        end

      else #name is not ticked, possible deletion if exists in database
#binding.pry
        par = "ingredient_#{dd}_id" 
        par = par.to_sym
        parid = params[par].to_i #get ID of ingredient

        if parid > -1 #if ID found
#binding.pry
          ing = Ingredient.find parid #check database if exists
          #ing = Ingredient.where("hotdog_id = ? AND name = ?", params[:hotdog_id].to_i, Ingredient.find(dd).name )
          #ONLY id can be used in destroy
          if ing != nil #delete if found, else ignore
            ing.destroy
          end
        end
      end
      dd += 1
    end

    #Topping

    dd = 1

    until (dd > Toppinglookup.all.size)
      par = "topping_#{dd}"
      par = par.to_sym
      name = params[par]

      if name != nil #topping is ticked
#binding.pry
        par = "topping_#{dd}_id"
        par = par.to_sym
        parid = params[par].to_i #get ID of topping

        if parid > -1 #if ID found
          ing = Topping.find parid #check database if exists
        end

        if ing == nil || parid == -1 #need to create new
          ing = Topping.new
          ing.name = name
          ing.hotdog_id = hotdog.id
          ing.toppinglookup_id = dd #params[:toppinglookup_id]
          ing.save
          #save to Hotdog
          hotdog.topping_id = ing.id
          hotdog.save
        end
      else #no entry, possible deletion
        par = "topping_#{dd}_id"
        par = par.to_sym
        parid = params[par].to_i #get ID

        if parid > -1 #if ID found
#binding.pry          
          ing = Topping.find parid #find topping in database
          if ing != nil #delete if found, else ignore
            ing.destroy
            #save to Hotdog
            hotdog.topping_id = nil
            hotdog.save
          end
        end
      end
      dd += 1
    end
#binding.pry
    redirect to("/hotdogs/#{ params[:id] }")
  rescue Exception => e
#binding.pry
    logger.debug(e)
    redirect to("/hotdogs/#{ params[:id] }")
  end
end

# DESTROY - Deletes a given a hotdog from the database
get '/hotdogs/:id/delete' do
  hotdog = Hotdog.find params[:id]
  hotdog.destroy
  redirect to("/hotdogs")
end

# Countries CRUD ######################################################
# INDEX
get '/countries' do
  @countries = Country.all
  erb :countries_index
end

# NEW
get '/countries/new' do
  erb :countries_new
end

# CREATE
post '/countries' do
  country = Country.new
  country.name = params[:name]
  country.flag = params[:flag]
  country.save
  redirect to("/countries/#{ country.id }")
end

# SHOW
get '/countries/:id' do
  @country = Country.find params[:id]
  erb :countries_show
end

# EDIT
get '/countries/:id/edit' do
  @country = Country.find params[:id]
  erb :countries_edit
end

# UPDATE
post '/countries/:id' do
  country = Country.find params[:id]
  country.name = params[:name]
  country.flag = params[:flag]
  country.save
  redirect to("/countries/#{ country.id }")
end

# DELETE
get '/countries/:id/delete' do
  country = Country.find params[:id]
  country.destroy
  redirect to("/countries")
end

# TOPPINGS CRUD ###############

# INDEX
get '/toppings' do
  @toppings = Topping.all
  @toppings = @toppings.uniq {|x| x["name"] }
  #@toppingImages = Toppinglookup.all
#binding.pry
#binding.pry
  erb :toppings_index
end

# NEW
get '/toppings/new' do
  erb :toppings_new
end

# CREATE
post '/toppings' do
  topLookup = Toppinglookup.new
  topLookup.name = params[:name]
  topLookup.image = params[:image]
  topLookup.description = params[:description]
binding.pry
  topLookup.save

  topping = Topping.new
  topping.name = params[:name]
  topping.image = params[:image]
  topping.description = params[:description]
  topping.toppinglookup_id = topLookup.id
binding.pry
  topping.save

binding.pry
  redirect to("/toppings/#{ topping.id }")
end

# SHOW
get '/toppings/:id' do
  @topping = Topping.find params[:id]
#binding.pry
  erb :toppings_show
end

get '/toppings/:id/edit' do
  @topping = Topping.find params[:id]
  erb :toppings_edit
end

# UPDATE
post '/toppings/:id' do
  topping = Topping.find params[:id]
  topping.name = params[:name]
  topping.image = params[:image]
  topping.description = params[:description]
  topping.save
  redirect to("/toppings/#{ topping.id }")
end

# DELETE
get '/toppings/:id/delete' do
  topping = Topping.find params[:id]
  topping.destroy
  redirect to("/toppings")
end

after do
  ActiveRecord::Base.connection.close
end
