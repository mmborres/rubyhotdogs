CREATE TABLE hotdogs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL UNIQUE,
  country_id INTEGER,
  description TEXT,
  image TEXT -- URL for a photo
);

CREATE TABLE country (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL UNIQUE,
  flag TEXT -- URL for a photo
);

CREATE TABLE ingredients (			
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL UNIQUE,
	hotdog_id INTEGER,
	description TEXT,
	image TEXT -- URL for a photo
);

CREATE TABLE toppings (			
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL UNIQUE,
	hotdog_id INTEGER,
	description TEXT,
	image TEXT -- URL for a photo
);

CREATE TABLE bun (			
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL UNIQUE,
	hotdog_id INTEGER,
	description TEXT,
	image TEXT -- URL for a photo
);

-- seed

INSERT INTO ingredients (name) VALUES ('Pork');
INSERT INTO ingredients (name) VALUES ('Beef');


INSERT INTO toppings (name) VALUES ('Mustard');
INSERT INTO toppings (name) VALUES ('Onions');
INSERT INTO toppings (name) VALUES ('Tomato');
INSERT INTO toppings (name) VALUES ('Pepper');
INSERT INTO toppings (name) VALUES ('Salt');
INSERT INTO toppings (name) VALUES ('Ketchup');
INSERT INTO toppings (name) VALUES ('Mayonnaise');
INSERT INTO toppings (name) VALUES ('Bacon');
INSERT INTO toppings (name) VALUES ('Beans');
INSERT INTO toppings (name) VALUES ('Salsa');
INSERT INTO toppings (name) VALUES ('Chili Sauce');
INSERT INTO toppings (name) VALUES ('Cinnamon');
INSERT INTO toppings (name) VALUES ('Cheddar Cheese');
INSERT INTO toppings (name) VALUES ('Sauerkraut');
INSERT INTO toppings (name) VALUES ('Thousand Island Dressing');
INSERT INTO toppings (name) VALUES ('Caraway');
INSERT INTO toppings (name) VALUES ('Red Onion Sauce');
INSERT INTO toppings (name, image) VALUES ('Pickle Relish', 'https://cdn2.bigcommerce.com/n-nr1m3w/c3s1a/products/876/images/1065/IMG_0428__71016.1395525058.1280.1280.JPG?c=2');
INSERT INTO toppings (name, image) VALUES ('Dill', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2007/10/11/0/EA1110_Pickle.jpg.rend.hgtvcom.826.620.suffix/1382538655602.jpeg');


INSERT INTO bun (name, image) VALUES ('Poppy Seed', 'https://d2gk7xgygi98cy.cloudfront.net/6923-3-large.jpg');
INSERT INTO bun (name, image) VALUES ('Side-loading', 'https://glutenfreenation.com/wp-content/uploads/2014/02/hot-dog-bun.jpg');
INSERT INTO bun (name, image) VALUES ('French Baguette', 'http://open.imagebank.lantmannen.com/Lantmannen%20Unibake/pimimage/3616.jpg');
INSERT INTO bun (name, image, description) VALUES ('New England', 'https://s3.amazonaws.com/cdn.hancockgourmetlobster.com/images/popup/New-England-Split-Top-Rolls-815.jpg', 'Top-loading bun');
INSERT INTO bun (name, image, description) VALUES ('Austrian Baguette', 'https://media.istockphoto.com/photos/fresh-and-crispy-baguette-picture-id941864038', 'Hallowed-out Baguette in Austria');
INSERT INTO bun (name, image, description) VALUES ('Bolillo', 'https://www.mexicanplease.com/wp-content/uploads/2017/03/easy-bolillos-recipe-after-baking.jpg', 'Used in Sonoran hot dog');


INSERT INTO country (name, flag) VALUES ('USA', 'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1280px-Flag_of_the_United_States.svg.png');
INSERT INTO country (name, flag) VALUES ('Austria', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_Austria.svg/1200px-Flag_of_Austria.svg.png');
INSERT INTO country (name, flag) VALUES ('France', 'https://upload.wikimedia.org/wikipedia/en/thumb/c/c3/Flag_of_France.svg/250px-Flag_of_France.svg.png');


INSERT INTO hotdogs (name, country_id, description, image) VALUES ('Chicago', 1, 'A Chicago-style hot dog, Chicago Dog, or Chicago Red Hot is an all-beef frankfurter on a poppy seed bun, originating from the city of Chicago, Illinois.', 				'http://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Chicago-style_hot_dog_Johnniebeefs.jpg/440px-Chicago-style_hot_dog_Johnniebeefs.jpg');

INSERT INTO hotdogs (name, country_id, description, image) VALUES ('Austrian', 2, 'An Austrian "hot dog with grill sausage." In Austria any sausage placed into a piece of hollowed-out baguette bread is called a "hot dog."', 'https://media-cdn.tripadvisor.com/media/photo-s/07/d8/50/7a/hotdog.jpg');

INSERT INTO hotdogs (name, country_id, description, image) VALUES ('French', 3, 'French hotdogs: You take a french baguette, toast it, cut a hole in the middle of the baquette and put some sauce on the bottom then add the hot dog.', 'https://danskmadpaaengelsk.files.wordpress.com/2014/01/fransk_hotdog619x340.png');

INSERT INTO hotdogs (name, country_id, description, image) VALUES ('Sonoran', 1, 'A bacon-wrapped hot dog topped with pinto beans, grilled onions and green peppers, and tomatillo jalapeño salsa.', 'https://assets.atlasobscura.com/media/W1siZiIsInVwbG9hZHMvdGhpbmdfaW1hZ2VzLzIxYWQwNGQ2LTIyOGUtNDkxMi1iODU1LTRkNDhlNTU0ZTIzZGY4ODExNDc0OTVkZmVmMjEyM19Tb25vcmFuSG90RG9nX1RyaWJ1bmUgQ29udGVudCBBZ2VuY3kgTExDIDogQWxhbXkgU3RvY2sgUGhvdG8uanBnIl0sWyJwIiwiY29udmVydCIsIiJdLFsicCIsImNvbnZlcnQiLCItcXVhbGl0eSA4MSAtYXV0by1vcmllbnQiXSxbInAiLCJ0aHVtYiIsIjU4MHg1ODAjIl1d/SonoranHotDog_Tribune%20Content%20Agency%20LLC%20%3A%20Alamy%20Stock%20Photo.jpg');

INSERT INTO hotdogs (name, country_id, description, image) VALUES ('Cincinnati Coney', 1, 'A pork and beef hot dog topped with cinnamon and chocolate-tinged chili and Cheddar cheese.', 		'https://i.pinimg.com/originals/80/14/2e/80142ebd7b8720115d65f56e55b8c4d6.jpg');

INSERT INTO hotdogs (name, country_id, description, image) VALUES ('New York', 1, 'A hot dog in the Big Apple is traditionally topped with a spicy brown mustard and either sauerkraut or onions sautéed with tomato paste.', 'https://hips.hearstapps.com/del.h-cdn.co/assets/cm/15/10/54f6529383bd9_-_beer-steeped-sauerkraut-fyeghq-xl.jpg?crop=1xw:1.0xh;center,top&resize=768:*');

INSERT INTO hotdogs (name, country_id, description, image) VALUES ('Kansas City', 1, 'Traditional ballpark frank and the deliciously gooey Reuben sandwich, stacked high with corned beef and Swiss. All-beef dogs are topped with melted cheese, caraway, sauerkraut, and Thousand Island dressing.', 'https://hips.hearstapps.com/del.h-cdn.co/assets/cm/15/10/54f65293ab8c5_-_grilled-reuben-dogs-recipe-rbk0611-i7mkgl-agu4th-xl.jpg?resize=768:*');

