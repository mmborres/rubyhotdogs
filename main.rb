require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'
require 'pry'

# Rails will do all this for you automagically.
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.sqlite3'
)

# Optional bonus
ActiveRecord::Base.logger = Logger.new(STDERR)

# Models
class Hotdog < ActiveRecord::Base
  belongs_to :country, :optional => true # Since Rails 5
end

class Country < ActiveRecord::Base
  has_many :hotdogs
end

get '/' do
  erb :home
end

# INDEX - Show all hotdogs
get '/hotdogs' do
  @hotdogs = Hotdog.all
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
  hotdog.plant_id = params[:plant_id]
  hotdog.save

  redirect to("/hotdogs/#{ hotdog.id }") # GET request
end

# SHOW - Shows a single hotdog in more detail
get '/hotdogs/:id' do
  @hotdog = Hotdog.find params[:id]
  erb :hotdogs_show
end

# EDIT - Shows a form to edit a single hotdog
get '/hotdogs/:id/edit' do
  @hotdog = Hotdog.find params[:id]
  erb :hotdogs_edit
end

# UPDATE - Modify the database with new information for a particular hotdog
post '/hotdogs/:id' do
  hotdog = Hotdog.find params[:id]
  hotdog.name = params[:name]
  hotdog.description = params[:description]
  hotdog.image = params[:image]
  hotdog.plant_id = params[:plant_id]
  hotdog.save
  redirect to("/hotdogs/#{ params[:id] }")
end

# DESTROY - Deletes a given a hotdog from the database
get '/hotdogs/:id/delete' do
  hotdog = Hotdog.find params[:id]
  hotdog.destroy
  redirect to("/hotdogs")
end

# Countries CRUD ######################################################
# INDEX
get '/countrys' do
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
  country.image = params[:image]
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
  country.image = params[:image]
  country.save
  redirect to("/countries/#{ country.id }")
end

# DELETE
get '/countries/:id/delete' do
  country = Country.find params[:id]
  country.destroy
  redirect to("/countries")
end

after do
  ActiveRecord::Base.connection.close
end
