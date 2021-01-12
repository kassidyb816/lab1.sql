create table Recipe (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(25), description VARCHAR(50), instructions VARCHAR(500)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table Ingredient (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50)) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

create table Measure (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(30)) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

create table RecipeIngredient (recipe_id INT NOT NULL, ingredient_id INT NOT NULL, measure_id INT, amount INT, 

	CONSTRAINT fk_recipe FOREIGN KEY(recipe_id) REFERENCES Recipe(id), 

	CONSTRAINT fk_ingredient FOREIGN KEY(ingredient_id) REFERENCES Ingredient(id), 

	CONSTRAINT fk_measure FOREIGN KEY(measure_id) REFERENCES Measure(id)) 

	ENGINE=InnoDB DEFAULT CHARSET=utf8; 
    
INSERT INTO Measure (name) VALUES('CUP'), ('TEASPOON'), ('TABLESPOON'), ('WHOLE'), ('PACKAGE'), ('POUND');

/*add 6 ingredients to the ingredient table */
INSERT INTO Ingredient (name) VALUES('sugar'), ('butter'), ('eggs'), ('baking powder'), ('vanilla extract'), ('flour');
INSERT INTO Ingredient (name) VALUES('chicken'), ('noodles'), ('stock'), ('celery'), ('onions'), ('carrots');
INSERT INTO Ingredient (name) VALUES('beef'), ('beans'), ('tomato sauce'), ('chilis'), ('garlic'), ('cumin seed');

/*add name, description, and instuctions, for 3 recipes to the recipe table */
INSERT INTO Recipe (name, description, instructions) VALUES('Sugar Cookies', 'Moast delicous cookies', 'Mix dry ingredients. Mix in butter and egg. Bake at 350 for 12 minutes.');
INSERT INTO Recipe (name, description, instructions) VALUES('Chciken Noodle Soup', 'Just like grandma', 'Sweat the three veggies. Add pulled chicken and stock. Simmer until reduced 1.5 inches. Add noodles until soft.');
INSERT INTO Recipe (name, description, instructions) VALUES('Chili', 'Midwest style', 'Brown the beef. Add onions and garlic. Add tomato sauce and spices. Simmer for one hour.');

/*combine all the data into one table listing the recipes, measurments, ingredients, and instructions*/ 
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (1,1,1,1),(1,2,4,1),(1,3,2,1),(1,4,2,1),(1,5,2,1),(1,6,1,3);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (2,7,6,1),(2,8,1,1),(2,9,5,1),(2,10,1,1),(2,11,1,1),(2,12,1,1);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (3,13,6,1),(3,14,1,1),(3,15,4,1),(3,16,1,1),(3,17,3,1),(3,18,3,1);    

/* Query to list all the recipes*/
select * from Recipe

/*Quert to get a list of recipes that use a certain ingredient */
SELECT *
From Recipe r
JOIN RecipeIngredient ri on ri.recipe_id = r.id  
JOIN Ingredient i on i.id = ri.ingredient_id 
WHERE i.name = 'sugar'

/* update ingedient*/
UPDATE Ingredient
SET name = 'chicken'
WHERE name = 'beef';

/*delete the row of data from the recipe table where the id is 6*/
DELETE FROM Recipe WHERE id=6;
