-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: instant_foods
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menuID` int NOT NULL AUTO_INCREMENT,
  `restaurantID` int DEFAULT NULL,
  `itemName` varchar(255) DEFAULT NULL,
  `description` text,
  `imageURL` varchar(500) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `isAvailable` tinyint(1) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`menuID`),
  KEY `restaurantID_idx` (`restaurantID`),
  CONSTRAINT `fk_category_id` FOREIGN KEY (`restaurantID`) REFERENCES `restaurant` (`restaurantID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'Classic Hummus Plate','Creamy chickpea hummus drizzled with olive oil, served with warm pita.','https://images.unsplash.com/photo-1637775297479-7a554a9388a1?w=800',8.50,1,'Appetizer','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(2,1,'Lamb Kebab Skewers','Grilled marinated lamb served over a bed of turmeric rice.','https://images.unsplash.com/photo-1662116765997-6a9c149eb5e5?w=800',18.00,1,'Main Course','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(3,1,'Greek Village Salad','Cucumbers, tomatoes, Kalamata olives, and block feta with oregano vinaigrette.','https://images.unsplash.com/photo-1529312266912-b33cfce2eefd?w=800',12.00,1,'Appetizer','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(4,1,'Pistachio Baklava','Layered phyllo dough with chopped pistachios and honey syrup.','https://images.unsplash.com/photo-1614529061099-0d173c329584?w=800',6.00,1,'Dessert','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(5,2,'Harvest Quinoa Bowl','Roasted sweet potatoes, kale, avocado, and tahini dressing over quinoa.','https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800',15.00,1,'Main Course','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(6,2,'Green Detox Juice','Cold-pressed celery, green apple, ginger, and lemon.','https://images.unsplash.com/photo-1610970881699-44a5587ce529?w=800',7.00,1,'Beverage','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(7,2,'Smashed Avocado Toast','Thick-cut sourdough, microgreens, radish, and red pepper flakes.','https://images.unsplash.com/photo-1541519227354-08fa5d50c44d?w=800',11.00,1,'Appetizer','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(8,2,'Açaí Berry Bowl','Organic açaí topped with house granola, fresh berries, and honey.','https://images.unsplash.com/photo-1590165482156-f5fd38e7808e?w=800',13.00,1,'Main Course','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(9,3,'Margherita Verace','San Marzano tomatoes, fresh mozzarella, and basil on a wood-fired crust.','https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=800',19.00,1,'Main Course','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(10,3,'Truffle Mushroom Pie','Wild mushrooms, truffle oil, ricotta base, and fresh thyme.','https://images.unsplash.com/photo-1513104890138-7c749659a591?w=800',23.00,1,'Main Course','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(11,3,'Spicy Pepperoni','Crispy cup-and-char pepperoni with a hot honey drizzle.','https://images.unsplash.com/photo-1628840042765-356cda07504e?w=800',21.00,1,'Main Course','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(12,3,'Garlic Knots','Wood-fired dough knots tossed in garlic butter, served with marinara.','https://images.unsplash.com/photo-1573140247632-f8fd74997d5c?w=800',8.00,1,'Appetizer','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(13,4,'Chicken Shawarma Wrap','Slow-roasted marinated chicken with garlic sauce and pickles in a warm pita.','https://images.unsplash.com/photo-1528736235302-52922df5c122?w=800',13.00,1,'Main Course','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(14,4,'Smoky Baba Ganoush','Roasted eggplant dip mixed with tahini and lemon, served with pita.','https://images.unsplash.com/photo-1596313835698-3561a052b615?w=800',8.00,1,'Appetizer','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(15,4,'Crispy Falafel Plate','Six golden falafels served with tahini sauce, mixed greens, and pickles.','https://images.unsplash.com/photo-1543339308-43e59d6b73a6?w=800',14.00,1,'Main Course','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(16,4,'Mint Lemonade','Freshly squeezed lemon juice blended with fresh mint leaves and ice.','https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=800',5.00,1,'Beverage','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(17,5,'Heirloom Tomato Salad','Locally sourced heirloom tomatoes with burrata and balsamic reduction.','https://images.unsplash.com/photo-1592417817098-8fd3d9eb14a5?w=800',14.00,1,'Appetizer','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(18,5,'Herb Roasted Chicken','Half free-range chicken roasted with seasonal herbs and root vegetables.','https://images.unsplash.com/photo-1598514982205-f36b96d1e8d4?w=800',24.00,1,'Main Course','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(19,5,'Roasted Root Vegetables','Oven-roasted carrots, parsnips, and sweet potatoes with a honey glaze.','https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=800',9.00,1,'Appetizer','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(20,5,'Seasonal Berry Cobbler','Warm mixed berry compote topped with a buttery biscuit crust.','https://images.unsplash.com/photo-1551024601-bec78aea704b?w=800',8.50,1,'Dessert','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(21,6,'Cacio e Pepe','Hand-made tonnarelli pasta tossed with Pecorino Romano and black pepper.','https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=800',18.00,1,'Main Course','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(22,6,'Classic Lasagna','Layers of fresh pasta, rich Bolognese ragu, béchamel, and Parmigiano.','https://images.unsplash.com/photo-1619895092538-128341789043?w=800',22.00,1,'Main Course','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(23,6,'House Focaccia','Warm sourdough focaccia flooded with extra virgin olive oil and sea salt.','https://images.unsplash.com/photo-1596313835698-3561a052b615?w=800',9.00,1,'Appetizer','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(24,6,'Classic Tiramisu','Espresso-soaked ladyfingers layered with rich mascarpone cream.','https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=800',10.00,1,'Dessert','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(25,7,'Ultimate Veggie Burger','House-made black bean and mushroom patty with vegan mayo on a brioche bun.','https://images.unsplash.com/photo-1520072959219-c595dc870360?w=800',16.00,1,'Main Course','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(26,7,'Jackfruit Carnitas Tacos','Slow-cooked pulled jackfruit in corn tortillas with pineapple salsa.','https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?w=800',14.00,1,'Main Course','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(27,7,'Crispy Cauliflower Wings','Battered cauliflower florets tossed in spicy buffalo sauce.','https://images.unsplash.com/photo-1614777986387-015c2a89b696?w=800',10.00,1,'Appetizer','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(28,7,'Raw Cashew Cheesecake','Dairy-free berry cheesecake with a date and walnut crust.','https://images.unsplash.com/photo-1533134242443-d4fd215305ad?w=800',9.00,1,'Dessert','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(29,8,'Crispy Calamari','Lightly dusted and fried calamari rings served with lemon aioli.','https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=800',14.00,1,'Appetizer','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(30,8,'Garlic Butter Prawns','Sizzling tiger prawns cooked in a rich garlic and white wine sauce.','https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=800',18.00,1,'Main Course','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(31,8,'Citrus Ceviche','Fresh white fish cured in lime juice with red onion, cilantro, and jalapeño.','https://images.unsplash.com/photo-1537210249814-b9a10a161ae4?w=800',16.00,1,'Appetizer','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(32,8,'Grilled Octopus','Tender charred octopus tentacles served over a potato and paprika puree.','https://images.unsplash.com/photo-1599388179264-c48c5b9679ec?w=800',22.00,1,'Main Course','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(33,9,'Grilled Halloumi Cheese','Pan-seared halloumi slices topped with a drizzle of pomegranate molasses.','https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800',11.00,1,'Appetizer','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(34,9,'Shish Taouk Skewers','Yogurt-marinated chicken breast cubes grilled and served with garlic sauce.','https://images.unsplash.com/photo-1603360946369-dc9bb6258143?w=800',17.00,1,'Main Course','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(35,9,'Fresh Tabbouleh','Finely chopped parsley, tomatoes, mint, and bulgur with a lemon-olive oil dressing.','https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800',9.00,1,'Appetizer','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(36,9,'Fattoush Salad','Mixed greens, radishes, and tomatoes topped with crispy fried pita bread.','https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=800',10.00,1,'Appetizer','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(37,10,'Fresh Sourdough Loaf','A whole crusty artisanal sourdough loaf baked fresh this morning.','https://images.unsplash.com/photo-1589367920969-ab8e050bfbf7?w=800',8.00,1,'Appetizer','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(38,10,'Almond Croissant','Flaky, buttery pastry filled with sweet almond frangipane and dusted with powdered sugar.','https://images.unsplash.com/photo-1509365465985-25d11c17e812?w=800',5.50,1,'Dessert','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(39,10,'Avocado Bagel Sandwich','Toasted everything bagel stacked with cream cheese, avocado, and microgreens.','https://images.unsplash.com/photo-1517433367423-c7e5b0f35086?w=800',10.50,1,'Main Course','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL),(40,10,'Iced Matcha Latte','Premium ceremonial grade matcha blended with oat milk over ice.','https://images.unsplash.com/photo-1515823064-d6e0c04616a7?w=800',6.00,1,'Beverage','2026-06-27 08:28:45','2026-06-27 08:28:45',NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `orderID` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `restaurantID` int DEFAULT NULL,
  `orderDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `totalAmount` decimal(10,2) DEFAULT NULL,
  `status` enum('delivered','pending','failed') DEFAULT NULL,
  `paymentMethod` enum('upi','cod') DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `fk_category_id_idx` (`userID`),
  KEY `fk_category_resid_idx` (`restaurantID`),
  CONSTRAINT `fk_category_resid` FOREIGN KEY (`restaurantID`) REFERENCES `restaurant` (`restaurantID`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,3,'2026-06-27 00:00:00',43.00,'pending','cod');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `orderItemID` int NOT NULL AUTO_INCREMENT,
  `orderID` int DEFAULT NULL,
  `menuID` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `itemTotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`orderItemID`),
  KEY `fk_order_id_idx` (`orderID`),
  KEY `fk_menu_id_idx` (`menuID`),
  CONSTRAINT `fk_menu_id` FOREIGN KEY (`menuID`) REFERENCES `menu` (`menuID`),
  CONSTRAINT `fk_order_id` FOREIGN KEY (`orderID`) REFERENCES `order` (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (7,1,9,2,38.00);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurantID` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `cuisineType` varchar(100) DEFAULT NULL,
  `deliveryTime` int DEFAULT NULL,
  `address` text,
  `imageURL` varchar(500) DEFAULT NULL,
  `adminUserID` int DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`restaurantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'The Olive Branch','Mediterranean',30,'123 Sunlit Ave','https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=800&q=80',1,4.80,1),(2,'Citrus & Salt','Healthy Salads',20,'456 Market St','https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800&q=80',1,4.60,1),(3,'Rustic Crust','Artisan Pizza',40,'789 Brick Lane','https://images.unsplash.com/photo-1604068549290-dea0e4a305ca?w=800&q=80',1,4.90,1),(4,'Golden Pita','Middle Eastern',25,'12 Fig Tree Blvd','https://images.unsplash.com/photo-1529312266912-b33cfce2eefd?w=800&q=80',1,4.70,1),(5,'Sunlit Harvest','Farm to Table',35,'88 Orchard Way','https://images.unsplash.com/photo-1543339308-43e59d6b73a6?w=800&q=80',1,4.80,1),(6,'Basilico','Italian Pasta',30,'221 Vine Street','https://images.unsplash.com/photo-1551183053-bf91a1d81141?w=800&q=80',1,4.50,1),(7,'The Green Fig','Plant-based',25,'404 Vegan Alley','https://images.unsplash.com/photo-1511690656952-34342bb7c2f2?w=800&q=80',1,4.90,1),(8,'Coastal Catch','Seafood Tapas',45,'90 Marina Drive','https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=800&q=80',1,4.60,1),(9,'Saffron & Spice','Lebanese',35,'77 Bazaar Court','https://images.unsplash.com/photo-1528137871618-79d2761e3fd5?w=800&q=80',1,4.70,1),(10,'Hearth & Honey','Bakery & Cafe',15,'10 Morning Rd','https://images.unsplash.com/photo-1509440159596-0249088772ff?w=800&q=80',1,4.80,1);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_favorites`
--

DROP TABLE IF EXISTS `user_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_favorites` (
  `favoriteID` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `restaurantID` int NOT NULL,
  PRIMARY KEY (`favoriteID`),
  KEY `userID` (`userID`),
  KEY `restaurantID` (`restaurantID`),
  CONSTRAINT `user_favorites_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE,
  CONSTRAINT `user_favorites_ibfk_2` FOREIGN KEY (`restaurantID`) REFERENCES `restaurant` (`restaurantID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_favorites`
--

LOCK TABLES `user_favorites` WRITE;
/*!40000 ALTER TABLE `user_favorites` DISABLE KEYS */;
INSERT INTO `user_favorites` VALUES (5,1,2);
/*!40000 ALTER TABLE `user_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `role` enum('customer','restaurant admin','super admin','delivery agent') NOT NULL,
  `createdDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `lastLoginDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Sam','sam@gmail.com','$2a$12$/2uOOosudor12J.c.N.XEOyL3.mo54Im5bQLEEIfuwGgNPGcQyFTy','BTM','customer','2026-06-19 06:07:45','2026-06-19 06:07:45');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-27 12:23:58
