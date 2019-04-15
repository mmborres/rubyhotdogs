CREATE TABLE countries (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL UNIQUE,
  flag TEXT -- URL for a photo
);

CREATE TABLE toppings (			
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	hotdog_id INTEGER,
	toppinglookup_id, INTEGER,
	description TEXT,
	image TEXT, -- URL for a photo
	UNIQUE(name, hotdog_id),
	FOREIGN KEY (hotdog_id) REFERENCES hotdogs(id),
	FOREIGN KEY (toppinglookup_id) REFERENCES toppinglookups(id)
);

CREATE TABLE hotdogs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL UNIQUE,
  country_id INTEGER,
  topping_id INTEGER,
  description TEXT,
  image TEXT, -- URL for a photo
  FOREIGN KEY (country_id) REFERENCES countries(id),
  FOREIGN KEY (topping_id) REFERENCES toppings(id)
);

CREATE TABLE toppinglookups (			
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL UNIQUE,
	description TEXT,
	image TEXT -- URL for a photo
);

CREATE TABLE buns (			
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	hotdog_id INTEGER,
	bunlookup_id, INTEGER,
	description TEXT,
	image TEXT, -- URL for a photo
	UNIQUE(name, hotdog_id),
	FOREIGN KEY (hotdog_id) REFERENCES hotdogs(id),
	FOREIGN KEY (bunlookup_id) REFERENCES bunlookups(id)
);

CREATE TABLE bunlookups (			
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL UNIQUE,
	image TEXT -- URL for a photo
);

CREATE TABLE ingredients (			
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	hotdog_id INTEGER,
	ingredientlookup_id, INTEGER,
	description TEXT,
	image TEXT, -- URL for a photo
	UNIQUE(name, hotdog_id),
	FOREIGN KEY (hotdog_id) REFERENCES hotdogs(id),
	FOREIGN KEY (ingredientlookup_id) REFERENCES ingredientlookups(id)	
);

CREATE TABLE ingredientlookups (			
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL UNIQUE,
	image TEXT -- URL for a photo
);


-- seed
INSERT INTO ingredientlookups (name) VALUES ('Pork');
INSERT INTO ingredientlookups (name) VALUES ('Beef');
INSERT INTO ingredientlookups (name) VALUES ('Vegan');

INSERT INTO ingredients (name, hotdog_id, ingredientlookup_id) VALUES ('Pork', 5, 1);
INSERT INTO ingredients (name, hotdog_id, ingredientlookup_id) VALUES ('Beef', 1, 2);
INSERT INTO ingredients (name, hotdog_id, ingredientlookup_id) VALUES ('Beef', 5, 2);
INSERT INTO ingredients (name, hotdog_id, ingredientlookup_id) VALUES ('Beef', 7, 2);

INSERT INTO toppinglookups (name) VALUES ('Mustard');
INSERT INTO toppinglookups (name) VALUES ('Onions');
INSERT INTO toppinglookups (name) VALUES ('Tomato');
INSERT INTO toppinglookups (name) VALUES ('Pepper');
INSERT INTO toppinglookups (name) VALUES ('Salt');
INSERT INTO toppinglookups (name) VALUES ('Ketchup');
INSERT INTO toppinglookups (name) VALUES ('Mayonnaise');
INSERT INTO toppinglookups (name) VALUES ('Bacon');
INSERT INTO toppinglookups (name) VALUES ('Beans');
INSERT INTO toppinglookups (name) VALUES ('Salsa');
INSERT INTO toppinglookups (name) VALUES ('Chili Sauce');
INSERT INTO toppinglookups (name) VALUES ('Cinnamon');
INSERT INTO toppinglookups (name) VALUES ('Cheddar Cheese');
INSERT INTO toppinglookups (name) VALUES ('Sauerkraut');
INSERT INTO toppinglookups (name) VALUES ('Thousand Island Dressing');
INSERT INTO toppinglookups (name) VALUES ('Caraway');
INSERT INTO toppinglookups (name) VALUES ('Red Onion Sauce');
INSERT INTO toppinglookups (name) VALUES ('Pickle Relish');
INSERT INTO toppinglookups (name) VALUES ('Dill');

INSERT INTO toppings (name, hotdog_id, toppinglookup_id) VALUES ('Mustard', 1, 1);
INSERT INTO toppings (name, hotdog_id, toppinglookup_id) VALUES ('Onions', 1, 2);
INSERT INTO toppings (name, hotdog_id, toppinglookup_id) VALUES ('Tomato', 1, 3);
INSERT INTO toppings (name, hotdog_id, toppinglookup_id) VALUES ('Pepper', 1, 4);
INSERT INTO toppings (name, hotdog_id, toppinglookup_id) VALUES ('Salt', 1, 5);
INSERT INTO toppings (name, hotdog_id, toppinglookup_id) VALUES ('Ketchup', 4, 6);
INSERT INTO toppings (name, hotdog_id, toppinglookup_id) VALUES ('Mayonnaise', 4, 7);
INSERT INTO toppings (name, hotdog_id, toppinglookup_id) VALUES ('Bacon', 7, 8);
INSERT INTO toppings (name, hotdog_id, toppinglookup_id) VALUES ('Beans', 7, 9);
INSERT INTO toppings (name, hotdog_id, toppinglookup_id) VALUES ('Salsa', 7, 10);
INSERT INTO toppings (name, hotdog_id, toppinglookup_id) VALUES ('Chili Sauce', 7, 11);
INSERT INTO toppings (name, hotdog_id, toppinglookup_id) VALUES ('Cinnamon', 7, 12);
INSERT INTO toppings (name, hotdog_id, toppinglookup_id) VALUES ('Cheddar Cheese', 7, 13);
INSERT INTO toppings (name, hotdog_id, toppinglookup_id) VALUES ('Sauerkraut', 7, 14);
INSERT INTO toppings (name, hotdog_id, toppinglookup_id) VALUES ('Thousand Island Dressing', 7, 15);
INSERT INTO toppings (name, hotdog_id, toppinglookup_id) VALUES ('Caraway', 7, 16);
INSERT INTO toppings (name, hotdog_id, toppinglookup_id) VALUES ('Red Onion Sauce', 7, 17);
INSERT INTO toppings (name, hotdog_id, toppinglookup_id, image) VALUES ('Pickle Relish', 1, 18, 'https://cdn2.bigcommerce.com/n-nr1m3w/c3s1a/products/876/images/1065/IMG_0428__71016.1395525058.1280.1280.JPG?c=2');
INSERT INTO toppings (name, hotdog_id, toppinglookup_id, image) VALUES ('Dill', 1, 19, 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2007/10/11/0/EA1110_Pickle.jpg.rend.hgtvcom.826.620.suffix/1382538655602.jpeg');


INSERT INTO bunlookups (name) VALUES ('Poppy Seed');
INSERT INTO bunlookups (name) VALUES ('Side-loading');
INSERT INTO bunlookups (name) VALUES ('French Baguette');
INSERT INTO bunlookups (name) VALUES ('New England');
INSERT INTO bunlookups (name) VALUES ('Austrian Baguette');
INSERT INTO bunlookups (name) VALUES ('Bolillo');


INSERT INTO buns (name, hotdog_id, image) VALUES ('Poppy Seed', 1, 'https://d2gk7xgygi98cy.cloudfront.net/6923-3-large.jpg');
INSERT INTO buns (name, hotdog_id, image) VALUES ('Side-loading', 4, 'https://glutenfreenation.com/wp-content/uploads/2014/02/hot-dog-bun.jpg');
INSERT INTO buns (name, hotdog_id, image) VALUES ('French Baguette', 4, 'http://open.imagebank.lantmannen.com/Lantmannen%20Unibake/pimimage/3616.jpg');
INSERT INTO buns (name, hotdog_id, image, description) VALUES ('New England', 4, 'https://s3.amazonaws.com/cdn.hancockgourmetlobster.com/images/popup/New-England-Split-Top-Rolls-815.jpg', 'Top-loading bun');
INSERT INTO buns (name, hotdog_id, image, description) VALUES ('Austrian Baguette', 4, 'https://media.istockphoto.com/photos/fresh-and-crispy-baguette-picture-id941864038', 'Hallowed-out Baguette in Austria');
INSERT INTO buns (name, hotdog_id, image, description) VALUES ('Bolillo', 4, 'https://www.mexicanplease.com/wp-content/uploads/2017/03/easy-bolillos-recipe-after-baking.jpg', 'Used in Sonoran hot dog');


INSERT INTO countries (name, flag) VALUES ('USA', 'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1280px-Flag_of_the_United_States.svg.png');
INSERT INTO countries (name, flag) VALUES ('Austria', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_Austria.svg/1200px-Flag_of_Austria.svg.png');
INSERT INTO countries (name, flag) VALUES ('France', 'https://upload.wikimedia.org/wikipedia/en/thumb/c/c3/Flag_of_France.svg/250px-Flag_of_France.svg.png');


INSERT INTO hotdogs (name, country_id, topping_id, description, image) VALUES ('Chicago', 1, 2, 'A Chicago-style hot dog, Chicago Dog, or Chicago Red Hot is an all-beef frankfurter on a poppy seed bun, originating from the city of Chicago, Illinois.', 				'http://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Chicago-style_hot_dog_Johnniebeefs.jpg/440px-Chicago-style_hot_dog_Johnniebeefs.jpg');

INSERT INTO hotdogs (name, country_id, topping_id, description, image) VALUES ('Austrian', 2, 1, 'An Austrian "hot dog with grill sausage." In Austria any sausage placed into a piece of hollowed-out baguette bread is called a "hot dog."', 'https://media-cdn.tripadvisor.com/media/photo-s/07/d8/50/7a/hotdog.jpg');

INSERT INTO hotdogs (name, country_id, topping_id, description, image) VALUES ('French', 3, 1, 'French hotdogs: You take a french baguette, toast it, cut a hole in the middle of the baquette and put some sauce on the bottom then add the hot dog.', 'https://danskmadpaaengelsk.files.wordpress.com/2014/01/fransk_hotdog619x340.png');

INSERT INTO hotdogs (name, country_id, topping_id, description, image) VALUES ('Sonoran', 1, 2, 'A bacon-wrapped hot dog topped with pinto beans, grilled onions and green peppers, and tomatillo jalapeño salsa.', 'https://assets.atlasobscura.com/media/W1siZiIsInVwbG9hZHMvdGhpbmdfaW1hZ2VzLzIxYWQwNGQ2LTIyOGUtNDkxMi1iODU1LTRkNDhlNTU0ZTIzZGY4ODExNDc0OTVkZmVmMjEyM19Tb25vcmFuSG90RG9nX1RyaWJ1bmUgQ29udGVudCBBZ2VuY3kgTExDIDogQWxhbXkgU3RvY2sgUGhvdG8uanBnIl0sWyJwIiwiY29udmVydCIsIiJdLFsicCIsImNvbnZlcnQiLCItcXVhbGl0eSA4MSAtYXV0by1vcmllbnQiXSxbInAiLCJ0aHVtYiIsIjU4MHg1ODAjIl1d/SonoranHotDog_Tribune%20Content%20Agency%20LLC%20%3A%20Alamy%20Stock%20Photo.jpg');

INSERT INTO hotdogs (name, country_id, topping_id, description, image) VALUES ('Cincinnati Coney', 1, 2, 'A pork and beef hot dog topped with cinnamon and chocolate-tinged chili and Cheddar cheese.', 		'https://i.pinimg.com/originals/80/14/2e/80142ebd7b8720115d65f56e55b8c4d6.jpg');

INSERT INTO hotdogs (name, country_id, topping_id, description, image) VALUES ('New York', 1, 4, 'A hot dog in the Big Apple is traditionally topped with a spicy brown mustard and either sauerkraut or onions sautéed with tomato paste.', 'https://hips.hearstapps.com/del.h-cdn.co/assets/cm/15/10/54f6529383bd9_-_beer-steeped-sauerkraut-fyeghq-xl.jpg?crop=1xw:1.0xh;center,top&resize=768:*');

INSERT INTO hotdogs (name, country_id, topping_id, description, image) VALUES ('Kansas City', 1, 3, 'Traditional ballpark frank and the deliciously gooey Reuben sandwich, stacked high with corned beef and Swiss. All-beef dogs are topped with melted cheese, caraway, sauerkraut, and Thousand Island dressing.', 'https://hips.hearstapps.com/del.h-cdn.co/assets/cm/15/10/54f65293ab8c5_-_grilled-reuben-dogs-recipe-rbk0611-i7mkgl-agu4th-xl.jpg?resize=768:*');

