-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- DROP DATABASE IF EXISTS mixedDrinks;
-- CREATE DATABASE mixedDrinks;

\c mixed-drinks;

-- ---
-- Table 'cocktail_ingredients'
--
-- ---

DROP TABLE IF EXISTS cocktail_ingredients;

-- ---
-- Table 'ingredients'
--
-- ---

DROP TABLE IF EXISTS ingredients;

CREATE TABLE ingredients (
  id SERIAL PRIMARY KEY,
  ingredient_name VARCHAR(100) NULL DEFAULT NULL
);

-- ---
-- Table 'cocktails'
--
-- ---

DROP TABLE IF EXISTS cocktails;

CREATE TABLE cocktails (
  id SERIAL PRIMARY KEY,
  cocktail_name VARCHAR(100) NULL DEFAULT NULL
);

CREATE TABLE cocktail_ingredients (
  id SERIAL PRIMARY KEY,
  cocktail_id INTEGER NOT NULL REFERENCES cocktails(id) NOT NULL,
  ingredient_id INTEGER NOT NULL REFERENCES ingredients(id) NOT NULL
);
-- ---
-- Foreign Keys
-- ---

-- ALTER TABLE cocktail_ingredients ADD FOREIGN KEY (cocktail_id) REFERENCES cocktails (id);
-- ALTER TABLE cocktail_ingredients ADD FOREIGN KEY (ingredient_id) REFERENCES ingredients (id);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE cocktail_ingredients ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE ingredients ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE cocktails ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO cocktail_ingredients (id,cocktail_id,ingredient_id) VALUES
-- ('','','');
-- INSERT INTO ingredients (id,ingredient_name) VALUES
-- ('','');
-- INSERT INTO cocktails (id,cocktail_name) VALUES
-- ('','');
