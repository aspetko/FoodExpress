-- MySQL dump 10.13  Distrib 5.7.20, for macos10.12 (x86_64)
--
-- Host: localhost    Database: FoodExpress
-- ------------------------------------------------------
-- Server version	5.7.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `middle_name` varchar(2) DEFAULT NULL,
  `street` varchar(500) NOT NULL,
  `app_number` varchar(15) NOT NULL,
  `zip` varchar(15) NOT NULL,
  `city` varchar(200) DEFAULT NULL,
  `place_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`place_Id`),
  CONSTRAINT `country_id` FOREIGN KEY (`place_Id`) REFERENCES `places` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='the primary key';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Alfred','Miller','J.','Washington Boulevard','151','90210','L.A.',1),(2,'Bruce','Summerfield','H.','42nd Street','3','10001','New York',1);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_people`
--

DROP TABLE IF EXISTS `delivery_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(2) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `street` varchar(500) NOT NULL,
  `app_number` varchar(15) NOT NULL,
  `zip` varchar(15) NOT NULL,
  `city` varchar(200) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `mobile_phone` varchar(15) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_people__state_id_fk` (`state_id`),
  CONSTRAINT `delivery_people__state_id_fk` FOREIGN KEY (`state_id`) REFERENCES `employee_states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_people`
--

LOCK TABLES `delivery_people` WRITE;
/*!40000 ALTER TABLE `delivery_people` DISABLE KEYS */;
INSERT INTO `delivery_people` VALUES (1,'Phillip','J.','Fry','57th Street','267','10001','New York','347-774-7081','212-509-6995 ',1),(2,'Jane','L.','Bob','Jones Street','16','10002','New York','718-652-1152','703-213-9079',2),(3,'Kris','G.','Dushku','Dekalb Avenue','34','13420','New York','607-265-3023','620-797-7424',1),(4,'Jessica','A.','Eliza','9th street','267','10001','New York','516-634-6731','847-431-0435',3),(5,'Sydney','B.','Bristow','Bleecker Street','12','10001','New York','646-335-1112','216-338-4434',2);
/*!40000 ALTER TABLE `delivery_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_states`
--

DROP TABLE IF EXISTS `delivery_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_states`
--

LOCK TABLES `delivery_states` WRITE;
/*!40000 ALTER TABLE `delivery_states` DISABLE KEYS */;
INSERT INTO `delivery_states` VALUES (1,'ordered'),(2,'delivered'),(3,'canceled');
/*!40000 ALTER TABLE `delivery_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desserts`
--

DROP TABLE IF EXISTS `desserts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desserts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `desserts_name_uindex` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desserts`
--

LOCK TABLES `desserts` WRITE;
/*!40000 ALTER TABLE `desserts` DISABLE KEYS */;
INSERT INTO `desserts` VALUES (1,'Allahabadi cake','Cake',5.32),(2,'Allerheiligenstriezel','German Cake',2.34),(3,'Lane cake','Cake',3.43),(4,'Pignolo','Cookie',4.65),(5,'Pizzelle','Lucky Cookie',2.23),(6,'Angel food cake','Peanut Butter Cake',8.43),(7,'Polvorón','Cake',2.13),(8,'Peanut butter cookie','80% Peanut butter cookie, 10% Rat Poison, 10% Holy Water',5.34);
/*!40000 ALTER TABLE `desserts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_states`
--

DROP TABLE IF EXISTS `employee_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_states`
--

LOCK TABLES `employee_states` WRITE;
/*!40000 ALTER TABLE `employee_states` DISABLE KEYS */;
INSERT INTO `employee_states` VALUES (1,'delivering'),(2,'availible'),(3,'call in sick');
/*!40000 ALTER TABLE `employee_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_variation`
--

DROP TABLE IF EXISTS `food_variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_variation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `as_of` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `main_dish_1_Id` int(11) NOT NULL,
  `main_dish_2_id` int(11) NOT NULL,
  `dessert_1_id` int(11) NOT NULL,
  `dessert_2_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `food_variation_as_of_uindex` (`as_of`),
  KEY `food_variation__main_dish_1_fk` (`main_dish_1_Id`),
  KEY `food_variation__main_dish_2_fk` (`main_dish_2_id`),
  KEY `food_variation___dessert_1_fk` (`dessert_1_id`),
  KEY `food_variation___dessert_2_fk` (`dessert_2_id`),
  CONSTRAINT `food_variation___dessert_1_fk` FOREIGN KEY (`dessert_1_id`) REFERENCES `desserts` (`id`),
  CONSTRAINT `food_variation___dessert_2_fk` FOREIGN KEY (`dessert_2_id`) REFERENCES `desserts` (`id`),
  CONSTRAINT `food_variation__main_dish_1_fk` FOREIGN KEY (`main_dish_1_Id`) REFERENCES `main_dishes` (`id`),
  CONSTRAINT `food_variation__main_dish_2_fk` FOREIGN KEY (`main_dish_2_id`) REFERENCES `main_dishes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_variation`
--

LOCK TABLES `food_variation` WRITE;
/*!40000 ALTER TABLE `food_variation` DISABLE KEYS */;
INSERT INTO `food_variation` VALUES (1,'2017-11-12 10:33:49',1,2,1,2),(2,'2017-11-22 18:23:56',2,3,2,1);
/*!40000 ALTER TABLE `food_variation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_dishes`
--

DROP TABLE IF EXISTS `main_dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_dishes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `price` float NOT NULL,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_dishes_name_uindex` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_dishes`
--

LOCK TABLES `main_dishes` WRITE;
/*!40000 ALTER TABLE `main_dishes` DISABLE KEYS */;
INSERT INTO `main_dishes` VALUES (1,'an Italian seafood pizza that may be served with scampi, mussels or squid',2.5,'Ai frutti di Mare'),(2,'folded over dough usually filled with ricotta and other ingredients',2.5,'Calzone'),(3,'a pizza based on rosemary and olive oil, sometimes served with prosciutto, usually served as appetizer',2.5,'Focaccia al rosmarino'),(5,'with tomato, mozzarella, mushrooms, artichokes, black and green olives',2.5,'Pizza capricciosa'),(6,'tomato and mozzarella',2.5,'Pizza Margherita'),(7,'tomato, oregano and garlic',2.5,'Pizza marinara'),(8,'tomato, mozzarella and onions',2.5,'Pizza pugliese'),(9,'pizza with mushroom and sausage or boscaiola, with mozzarella, mushrooms and sausages, with or without tomato',2.5,'Pizza ai funghi e salsiccia'),(10,'(four cheese pizza) with four different cheeses (sometimes melted together, sometimes in sectors), with (rossa, red) or without tomato sauce (bianca, white)',2.5,'Pizza ai quattro formaggi'),(11,'tomato, mozzarella and anchovy',2.5,'Pizza alla napoletana'),(12,' (four seasons pizza) – based on tomato and divided in four sectors, one for each season',2.5,'Pizza quattro stagioni'),(13,'tomato, mozzarella, capperi and anchovy',2.5,'Pizza romana'),(14,'tomato, mozzarella, capperi, olive and anchovy',2.5,'Pizza siciliana');
/*!40000 ALTER TABLE `main_dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `customer_Id` int(11) DEFAULT NULL,
  `main_dish_1` int(11) DEFAULT NULL,
  `main_dish_2` int(11) DEFAULT NULL,
  `dessert_1` int(11) DEFAULT NULL,
  `dessert_2` int(11) DEFAULT NULL,
  `delivery_state_id` int(11) NOT NULL,
  `food_variation_id` int(11) DEFAULT NULL,
  `as_of` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `delivered_by_id` int(11) DEFAULT NULL,
  KEY `food_variation_id` (`food_variation_id`),
  KEY `orders__customer_id_fk` (`customer_Id`),
  KEY `orders_delivery_people_id_fk` (`delivered_by_id`),
  CONSTRAINT `food_variation_id` FOREIGN KEY (`food_variation_id`) REFERENCES `food_variation` (`id`),
  CONSTRAINT `orders__customer_id_fk` FOREIGN KEY (`customer_Id`) REFERENCES `clients` (`id`),
  CONSTRAINT `orders_delivery_people_id_fk` FOREIGN KEY (`delivered_by_id`) REFERENCES `delivery_people` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,0,0,1,1,1,'2017-11-12 06:56:49',1),(2,0,1,1,0,2,2,'2017-11-12 06:56:49',2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `tax` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (1,'USA',12),(2,'Canada',3),(3,'Germany',7);
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_business_transaction`
--

DROP TABLE IF EXISTS `v_business_transaction`;
/*!50001 DROP VIEW IF EXISTS `v_business_transaction`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_business_transaction` AS SELECT 
 1 AS `purchase_date`,
 1 AS `id`,
 1 AS `first_name`,
 1 AS `middle_name`,
 1 AS `last_name`,
 1 AS `street`,
 1 AS `app_number`,
 1 AS `zip`,
 1 AS `city`,
 1 AS `country`,
 1 AS `food_variation_id`,
 1 AS `ammount_main_dish_1`,
 1 AS `dish1`,
 1 AS `dish1_price`,
 1 AS `total_main_dish_1`,
 1 AS `ammount_main_dish_2`,
 1 AS `dish2`,
 1 AS `dish2_price`,
 1 AS `total_main_dish_2`,
 1 AS `ammount_dessert_1`,
 1 AS `dessert1`,
 1 AS `dessert1_price`,
 1 AS `total_desssert_1`,
 1 AS `ammount_dessert_2`,
 1 AS `dessert2`,
 1 AS `dessert2_price`,
 1 AS `total_desssert_2`,
 1 AS `total`,
 1 AS `gross`,
 1 AS `vat`,
 1 AS `vat_in_percent`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_employee_list`
--

DROP TABLE IF EXISTS `v_employee_list`;
/*!50001 DROP VIEW IF EXISTS `v_employee_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_employee_list` AS SELECT 
 1 AS `id`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `middle_name`,
 1 AS `street`,
 1 AS `app_number`,
 1 AS `zip`,
 1 AS `city`,
 1 AS `telefone`,
 1 AS `mobile_phone`,
 1 AS `state`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_menu_list`
--

DROP TABLE IF EXISTS `v_menu_list`;
/*!50001 DROP VIEW IF EXISTS `v_menu_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_menu_list` AS SELECT 
 1 AS `as_of`,
 1 AS `main_1`,
 1 AS `main_description_1`,
 1 AS `main_price_1`,
 1 AS `main_2`,
 1 AS `main_description_2`,
 1 AS `main_price_2`,
 1 AS `dessert_1`,
 1 AS `dessert_1_description`,
 1 AS `desssert_price_1`,
 1 AS `desssert_2_name`,
 1 AS `desssert_2_description`,
 1 AS `desssert_2_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_order_history`
--

DROP TABLE IF EXISTS `v_order_history`;
/*!50001 DROP VIEW IF EXISTS `v_order_history`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_order_history` AS SELECT 
 1 AS `menu_date`,
 1 AS `last_name`,
 1 AS `first_name`,
 1 AS `middle_name`,
 1 AS `street`,
 1 AS `app_number`,
 1 AS `zip`,
 1 AS `city`,
 1 AS `place`,
 1 AS `main_dish_1`,
 1 AS `main_dish`,
 1 AS `main_dish_1_price`,
 1 AS `main_dish_2`,
 1 AS `main_dish2`,
 1 AS `main_dish_2_price`,
 1 AS `dessert_1`,
 1 AS `dessert_1_name`,
 1 AS `dessert_1_price`,
 1 AS `dessert_2`,
 1 AS `dessert_2_name`,
 1 AS `dessert_2_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_business_transaction`
--

/*!50001 DROP VIEW IF EXISTS `v_business_transaction`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_business_transaction` AS select date_format(`menu`.`as_of`,'%Y-%m-%d') AS `purchase_date`,`customer`.`id` AS `id`,`customer`.`first_name` AS `first_name`,`customer`.`middle_name` AS `middle_name`,`customer`.`last_name` AS `last_name`,`customer`.`street` AS `street`,`customer`.`app_number` AS `app_number`,`customer`.`zip` AS `zip`,`customer`.`city` AS `city`,`country`.`name` AS `country`,`purchase`.`food_variation_id` AS `food_variation_id`,`purchase`.`main_dish_1` AS `ammount_main_dish_1`,`dish_1`.`name` AS `dish1`,`dish_1`.`price` AS `dish1_price`,round((`purchase`.`main_dish_1` * `dish_1`.`price`),2) AS `total_main_dish_1`,`purchase`.`main_dish_2` AS `ammount_main_dish_2`,`dish_2`.`name` AS `dish2`,`dish_2`.`price` AS `dish2_price`,round((`purchase`.`main_dish_2` * `dish_2`.`price`),2) AS `total_main_dish_2`,`purchase`.`dessert_1` AS `ammount_dessert_1`,`desssert_1`.`name` AS `dessert1`,`desssert_1`.`price` AS `dessert1_price`,round((`purchase`.`dessert_1` * `desssert_1`.`price`),2) AS `total_desssert_1`,`purchase`.`dessert_2` AS `ammount_dessert_2`,`desssert_2`.`name` AS `dessert2`,`desssert_2`.`price` AS `dessert2_price`,round((`purchase`.`dessert_2` * `desssert_2`.`price`),2) AS `total_desssert_2`,round(((((`purchase`.`main_dish_1` * `dish_1`.`price`) + (`purchase`.`main_dish_2` * `dish_2`.`price`)) + (`purchase`.`dessert_1` * `desssert_1`.`price`)) + (`purchase`.`dessert_2` * `desssert_2`.`price`)),2) AS `total`,round(((((((`purchase`.`main_dish_1` * `dish_1`.`price`) + (`purchase`.`main_dish_2` * `dish_2`.`price`)) + (`purchase`.`dessert_1` * `desssert_1`.`price`)) + (`purchase`.`dessert_2` * `desssert_2`.`price`)) * (`country`.`tax` + 100)) / 100),2) AS `gross`,round((((((((`purchase`.`main_dish_1` * `dish_1`.`price`) + (`purchase`.`main_dish_2` * `dish_2`.`price`)) + (`purchase`.`dessert_1` * `desssert_1`.`price`)) + (`purchase`.`dessert_2` * `desssert_2`.`price`)) * (`country`.`tax` + 100)) / 100) - ((((`purchase`.`main_dish_1` * `dish_1`.`price`) + (`purchase`.`main_dish_2` * `dish_2`.`price`)) + (`purchase`.`dessert_1` * `desssert_1`.`price`)) + (`purchase`.`dessert_2` * `desssert_2`.`price`))),2) AS `vat`,`country`.`tax` AS `vat_in_percent` from (((((((`food_variation` `menu` join `main_dishes` `dish_1`) join `main_dishes` `dish_2`) join `desserts` `desssert_1`) join `desserts` `desssert_2`) join `clients` `customer`) join `places` `country`) join `orders` `purchase`) where ((`menu`.`main_dish_1_Id` = `dish_1`.`id`) and (`menu`.`main_dish_2_id` = `dish_2`.`id`) and (`menu`.`dessert_1_id` = `desssert_1`.`id`) and (`menu`.`dessert_2_id` = `desssert_2`.`id`) and (`country`.`id` = `customer`.`place_Id`) and (`purchase`.`customer_Id` = `customer`.`id`) and (`purchase`.`food_variation_id` = `menu`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_employee_list`
--

/*!50001 DROP VIEW IF EXISTS `v_employee_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_employee_list` AS select `employee`.`id` AS `id`,`employee`.`first_name` AS `firstname`,`employee`.`last_name` AS `lastname`,`employee`.`middle_name` AS `middle_name`,`employee`.`street` AS `street`,`employee`.`app_number` AS `app_number`,`employee`.`zip` AS `zip`,`employee`.`city` AS `city`,`employee`.`telefone` AS `telefone`,`employee`.`mobile_phone` AS `mobile_phone`,`state`.`name` AS `state` from (`delivery_people` `employee` join `employee_states` `state`) where (`employee`.`state_id` = `state`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_menu_list`
--

/*!50001 DROP VIEW IF EXISTS `v_menu_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_menu_list` AS select `menu`.`as_of` AS `as_of`,`dish_1`.`name` AS `main_1`,`dish_1`.`description` AS `main_description_1`,`dish_1`.`price` AS `main_price_1`,`dish_2`.`name` AS `main_2`,`dish_2`.`description` AS `main_description_2`,`dish_2`.`price` AS `main_price_2`,`desssert_1`.`name` AS `dessert_1`,`desssert_1`.`description` AS `dessert_1_description`,`desssert_1`.`price` AS `desssert_price_1`,`desssert_2`.`name` AS `desssert_2_name`,`desssert_2`.`description` AS `desssert_2_description`,`desssert_2`.`price` AS `desssert_2_price` from ((((`food_variation` `menu` join `main_dishes` `dish_1`) join `main_dishes` `dish_2`) join `desserts` `desssert_1`) join `desserts` `desssert_2`) where ((`menu`.`main_dish_1_Id` = `dish_1`.`id`) and (`menu`.`main_dish_2_id` = `dish_2`.`id`) and (`menu`.`dessert_1_id` = `desssert_1`.`id`) and (`menu`.`dessert_2_id` = `desssert_2`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_order_history`
--

/*!50001 DROP VIEW IF EXISTS `v_order_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_order_history` AS select date_format(`purchase`.`as_of`,'%Y-%m-%d') AS `menu_date`,`customer`.`last_name` AS `last_name`,`customer`.`first_name` AS `first_name`,`customer`.`middle_name` AS `middle_name`,`customer`.`street` AS `street`,`customer`.`app_number` AS `app_number`,`customer`.`zip` AS `zip`,`customer`.`city` AS `city`,`place`.`name` AS `place`,`purchase`.`main_dish_1` AS `main_dish_1`,`dish_1`.`name` AS `main_dish`,`dish_1`.`price` AS `main_dish_1_price`,`purchase`.`main_dish_2` AS `main_dish_2`,`dish_2`.`name` AS `main_dish2`,`dish_2`.`price` AS `main_dish_2_price`,`purchase`.`dessert_1` AS `dessert_1`,`dessert1`.`name` AS `dessert_1_name`,`dessert1`.`price` AS `dessert_1_price`,`purchase`.`dessert_2` AS `dessert_2`,`dessert2`.`name` AS `dessert_2_name`,`dessert2`.`price` AS `dessert_2_price` from (((((((`orders` `purchase` join `clients` `customer`) join `places` `place`) join `food_variation` `menu`) join `main_dishes` `dish_1`) join `main_dishes` `dish_2`) join `desserts` `dessert1`) join `desserts` `dessert2`) where ((`purchase`.`customer_Id` = `customer`.`id`) and (`place`.`id` = `customer`.`place_Id`) and (date_format(`purchase`.`as_of`,'%Y-%m-%d') = date_format(`menu`.`as_of`,'%Y-%m-%d')) and (`dish_1`.`id` = `menu`.`main_dish_1_Id`) and (`dish_2`.`id` = `menu`.`main_dish_2_id`) and (`dessert1`.`id` = `menu`.`dessert_1_id`) and (`dessert2`.`id` = `menu`.`dessert_2_id`) and (`purchase`.`delivery_state_id` = 2)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-10 15:55:23
