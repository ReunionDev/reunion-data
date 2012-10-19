SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(28) NOT NULL,
  `username` varchar(28) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

INSERT INTO `accounts` (`id`, `email`, `level`, `name`, `password`, `username`) VALUES
(1, 'admin@admin.com', 260, 'AdminUser', 'admin', 'admin'),
(2, 'test@test.com', 0, 'TestUser', 'test', 'test');

DROP TABLE IF EXISTS `characters`;
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `accountid` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `strength` int(11) DEFAULT NULL,
  `wisdom` int(11) DEFAULT NULL,
  `dexterity` int(11) DEFAULT NULL,
  `constitution` int(11) DEFAULT NULL,
  `leadership` int(11) DEFAULT NULL,
  `race` int(11) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `hair` int(11) DEFAULT NULL,
  `totalExp` bigint(20) DEFAULT NULL,
  `levelUpExp` bigint(20) DEFAULT NULL,
  `lime` bigint(20) DEFAULT NULL,
  `statusPoints` int(11) DEFAULT NULL,
  `penaltyPoints` int(11) DEFAULT NULL,
  `guildid` int(11) DEFAULT NULL,
  `guildlvl` int(11) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `z` int(11) DEFAULT NULL,
  `mapId` int(11) DEFAULT NULL,
  `petid` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `counterobjectivestate`;
CREATE TABLE IF NOT EXISTS `counterobjectivestate` (
  `counter` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD5FF13F4C8166FB4` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `equipment`;
CREATE TABLE IF NOT EXISTS `equipment` (
  `charid` int(11) NOT NULL,
  `slot` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  PRIMARY KEY (`charid`,`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `exchange`;
CREATE TABLE IF NOT EXISTS `exchange` (
  `charid` int(11) NOT NULL DEFAULT '0',
  `itemid` int(11) NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `guilds`;
CREATE TABLE IF NOT EXISTS `guilds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `charid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `tab` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `objectivestate`;
CREATE TABLE IF NOT EXISTS `objectivestate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `objective_id` int(11) DEFAULT NULL,
  `queststate_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK82E3E6F8CE7EA7FB` (`queststate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `pet`;
CREATE TABLE IF NOT EXISTS `pet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hp` int(11) NOT NULL DEFAULT '96',
  `closeDefence` int(11) NOT NULL DEFAULT '12',
  `distantDefence` int(11) NOT NULL DEFAULT '7',
  `closeAttack` int(11) NOT NULL DEFAULT '24',
  `distantAttack` int(11) NOT NULL DEFAULT '16',
  `exp` bigint(20) NOT NULL DEFAULT '0',
  `loyalty` int(11) NOT NULL DEFAULT '0',
  `amulet` int(11) NOT NULL DEFAULT '-1',
  `name` varchar(32) NOT NULL DEFAULT 'Labiyong',
  `level` int(11) NOT NULL DEFAULT '1',
  `basket` int(11) NOT NULL DEFAULT '-1',
  `state` int(11) NOT NULL DEFAULT '1',
  `breedtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `petequipment`;
CREATE TABLE IF NOT EXISTS `petequipment` (
  `petid` int(11) NOT NULL,
  `slot` int(11) NOT NULL,
  `itemid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `queststates`;
CREATE TABLE IF NOT EXISTS `queststates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quest_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `quickslot`;
CREATE TABLE IF NOT EXISTS `quickslot` (
  `charid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `slot` int(11) NOT NULL,
  PRIMARY KEY (`charid`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `roaming`;
CREATE TABLE IF NOT EXISTS `roaming` (
  `itemid` int(11) NOT NULL,
  `mapid` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `z` int(11) NOT NULL,
  `rotation` double NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `skills`;
CREATE TABLE IF NOT EXISTS `skills` (
  `charid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`charid`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `slots`;
CREATE TABLE IF NOT EXISTS `slots` (
  `accountid` int(11) NOT NULL,
  `charid` int(11) NOT NULL,
  `slot` int(11) NOT NULL,
  PRIMARY KEY (`accountid`,`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE IF NOT EXISTS `warehouse` (
  `accountid` int(11) NOT NULL DEFAULT '0',
  `pos` int(11) NOT NULL DEFAULT '0',
  `itemid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `counterobjectivestate`
  ADD CONSTRAINT `FKD5FF13F4C8166FB4` FOREIGN KEY (`id`) REFERENCES `objectivestate` (`id`);

ALTER TABLE `objectivestate`
  ADD CONSTRAINT `FK82E3E6F8CE7EA7FB` FOREIGN KEY (`queststate_id`) REFERENCES `queststates` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
