
# This is a fix for InnoDB in MySQL >= 4.1.x
# It "suspends judgement" for fkey relationships until are tables are set.
SET FOREIGN_KEY_CHECKS = 0;

-- ---------------------------------------------------------------------
-- user
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(128) NOT NULL,
    `last_name` VARCHAR(128) NOT NULL,
    `address_1` VARCHAR(255) NOT NULL,
    `address_2` VARCHAR(255),
    `city` VARCHAR(128) NOT NULL,
    `state` VARCHAR(128) NOT NULL,
    `zip` VARCHAR(15) NOT NULL,
    `phone` VARCHAR(25),
    `email` VARCHAR(128),
    PRIMARY KEY (`id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- dealer
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `dealer`;

CREATE TABLE `dealer`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `address_1` VARCHAR(255) NOT NULL,
    `address_2` VARCHAR(255),
    `city` VARCHAR(128),
    `state` VARCHAR(128) NOT NULL,
    `zip` VARCHAR(15),
    `phone` VARCHAR(25) NOT NULL,
    `email` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- event
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` TEXT NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `description` TEXT,
    `dealer_id` INTEGER,
    PRIMARY KEY (`id`),
    INDEX `event_FI_1` (`dealer_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- vehicle
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `vehicle`;

CREATE TABLE `vehicle`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `make` VARCHAR(255) NOT NULL,
    `model` VARCHAR(255) NOT NULL,
    `year` INTEGER(5) NOT NULL,
    `description` TEXT,
    `dealer_id` INTEGER,
    `user_id` INTEGER,
    PRIMARY KEY (`id`),
    INDEX `vehicle_FI_1` (`dealer_id`),
    INDEX `vehicle_FI_2` (`user_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- trip
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `trip`;

CREATE TABLE `trip`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `map_url` TEXT NOT NULL,
    `description` TEXT NOT NULL,
    `user_id` INTEGER NOT NULL,
    `event_id` INTEGER,
    PRIMARY KEY (`id`),
    INDEX `trip_FI_1` (`user_id`),
    INDEX `trip_FI_2` (`event_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- special
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `special`;

CREATE TABLE `special`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `details` TEXT NOT NULL,
    `date_activated` DATE,
    `date_deactivated` DATE,
    `dealer_id` INTEGER NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `special_FI_1` (`dealer_id`)
) ENGINE=MyISAM;

# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;
