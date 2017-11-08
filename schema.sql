-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'ingredients'
--
-- ---
DROP DATABASE IF EXISTS mixedDrinks;
CREATE DATABASE mixedDrinks;

\c mixedDrinks;

-- DROP TABLE IF EXISTS `ingredients`;

CREATE TABLE `ingredients` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `ingredient_name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'cocktails'
--
-- ---

-- DROP TABLE IF EXISTS `cocktails`;

CREATE TABLE `cocktails` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `cocktail_name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'cocktail_ingredients'
--
-- ---

-- DROP TABLE IF EXISTS `cocktail_ingredients`;

CREATE TABLE `cocktail_ingredients` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `cocktail_id` INTEGER NULL DEFAULT NULL,
  `ingredient_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `cocktail_ingredients` ADD FOREIGN KEY (cocktail_id) REFERENCES `cocktails` (`id`);
ALTER TABLE `cocktail_ingredients` ADD FOREIGN KEY (ingredient_id) REFERENCES `ingredients` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `ingredients` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `cocktails` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `cocktail_ingredients` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `ingredients` (`id`,`ingredient_name`) VALUES
-- ('','');
-- INSERT INTO `cocktails` (`id`,`cocktail_name`) VALUES
-- ('','');
-- INSERT INTO `cocktail_ingredients` (`id`,`cocktail_id`,`ingredient_id`) VALUES
-- ('','','');
