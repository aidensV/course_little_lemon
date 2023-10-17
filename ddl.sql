-- litle_lemon.customers definition

CREATE TABLE `customers` (
  `CustomerId` int NOT NULL AUTO_INCREMENT,
  `Fullname` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `PostalCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CustomerId`)
) ENGINE=InnoDB AUTO_INCREMENT=21001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- litle_lemon.menus definition

CREATE TABLE `menus` (
  `MenuId` int NOT NULL AUTO_INCREMENT,
  `Cuisine` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MenuId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- litle_lemon.menuitems definition

CREATE TABLE `menuitems` (
  `MenuItemsId` int NOT NULL AUTO_INCREMENT,
  `MenuId` int DEFAULT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `TypeItem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MenuItemsId`),
  KEY `MenuId` (`MenuId`),
  CONSTRAINT `menuitems_ibfk_1` FOREIGN KEY (`MenuId`) REFERENCES `menus` (`MenuId`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- litle_lemon.orders definition

CREATE TABLE `orders` (
  `OrderId` int NOT NULL AUTO_INCREMENT,
  `MenuId` int DEFAULT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `DeliveryCost` decimal(10,0) DEFAULT NULL,
  `CustomerId` int DEFAULT NULL,
  `Cost` decimal(10,0) DEFAULT NULL,
  `Sales` decimal(10,0) DEFAULT NULL,
  `Discount` decimal(10,0) DEFAULT NULL,
  `TotalCost` int DEFAULT NULL,
  `odid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`OrderId`),
  KEY `CustomerId` (`CustomerId`),
  KEY `MenuId` (`MenuId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customers` (`CustomerId`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`MenuId`) REFERENCES `menus` (`MenuId`)
) ENGINE=InnoDB AUTO_INCREMENT=441001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- litle_lemon.orderitems definition

CREATE TABLE `orderitems` (
  `OrderItemId` int NOT NULL AUTO_INCREMENT,
  `OrderId` int DEFAULT NULL,
  `ItemId` int DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  PRIMARY KEY (`OrderItemId`),
  KEY `ItemId` (`ItemId`),
  KEY `OrderId` (`OrderId`),
  CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`ItemId`) REFERENCES `menuitems` (`MenuItemsId`),
  CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`OrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=13596746 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;