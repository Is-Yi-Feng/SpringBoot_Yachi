/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 8.0.21 : Database - yachidb00
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yachi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `yachi`;

DROP TABLE IF EXISTS `admincoupon_type`;
create table `admincoupon_type` (
	`admincoupon_type_id` int (11),
	`admincoupon_type_name` varchar (765)
); 
insert into `admincoupon_type` (`admincoupon_type_id`, `admincoupon_type_name`) values('1','折扣');
insert into `admincoupon_type` (`admincoupon_type_id`, `admincoupon_type_name`) values('2','贈品');
insert into `admincoupon_type` (`admincoupon_type_id`, `admincoupon_type_name`) values('3','免費');
insert into `admincoupon_type` (`admincoupon_type_id`, `admincoupon_type_name`) values('4','其他');



/*Table structure for table `admin_activity` */

DROP TABLE IF EXISTS `admin_activity`;

CREATE TABLE `admin_activity` (
  `adminactivity_id` int NOT NULL AUTO_INCREMENT,
  `adminactivity_begin` date DEFAULT NULL,
  `adminactivity_content` varchar(255) DEFAULT NULL,
  `adminactivity_end` date DEFAULT NULL,
  `adminactivity_name` varchar(255) DEFAULT NULL,
  `adminactivity_pic` mediumblob,
  `adminfile_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adminactivity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admin_activity` */

/*Table structure for table `admin_coupon` */

DROP TABLE IF EXISTS `admin_coupon`;

CREATE TABLE `admin_coupon` (
  `admincoupon_id` int NOT NULL AUTO_INCREMENT,
  `admincoupon_amount` int DEFAULT NULL,
  `admincoupon_begin` date DEFAULT NULL,
  `admincoupon_consumption` int DEFAULT NULL,
  `admincoupon_discount` int DEFAULT NULL,
  `admincoupon_end` date DEFAULT NULL,
  `admincoupon_info` varchar(255) DEFAULT NULL,
  `admincoupon_memo` varchar(255) DEFAULT NULL,
  `admincoupon_name` varchar(255) DEFAULT NULL,
  `admincoupon_pic` mediumblob,
  `admincoupon_rule` varchar(255) DEFAULT NULL,
  `adminfile_name` varchar(255) DEFAULT NULL,
  `FK_admincoupon_type_id` int DEFAULT NULL,
  PRIMARY KEY (`admincoupon_id`),
  KEY `FKmw8xqatut9smc9c2dvyp4ukdy` (`FK_admincoupon_type_id`),
  CONSTRAINT `FKmw8xqatut9smc9c2dvyp4ukdy` FOREIGN KEY (`FK_admincoupon_type_id`) REFERENCES `admincoupon_type` (`admincoupon_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admin_coupon` */

/*Table structure for table `admincoupon_type` */

DROP TABLE IF EXISTS `admincoupon_type`;

CREATE TABLE `admincoupon_type` (
  `admincoupon_type_id` int NOT NULL AUTO_INCREMENT,
  `admincoupon_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admincoupon_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admincoupon_type` */

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `cart_amount` int DEFAULT NULL,
  `cart_total` double DEFAULT NULL,
  `FK_member_id` int DEFAULT NULL,
  `FK_product_id` int DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FKg206pc5701k71nidcuv666edl` (`FK_member_id`),
  KEY `FKh6mgtak4vmy5wrifxph8bb4hh` (`FK_product_id`),
  CONSTRAINT `FKg206pc5701k71nidcuv666edl` FOREIGN KEY (`FK_member_id`) REFERENCES `member` (`memberId`),
  CONSTRAINT `FKh6mgtak4vmy5wrifxph8bb4hh` FOREIGN KEY (`FK_product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cart` */

/*Table structure for table `coupon` */

DROP TABLE IF EXISTS `coupon`;

CREATE TABLE `coupon` (
  `coupon_id` int NOT NULL AUTO_INCREMENT,
  `coupon_amount` int DEFAULT NULL,
  `coupon_begin` date DEFAULT NULL,
  `coupon_end` date DEFAULT NULL,
  `coupon_info` varchar(255) DEFAULT NULL,
  `coupon_memo` varchar(255) DEFAULT NULL,
  `coupon_name` varchar(255) DEFAULT NULL,
  `coupon_pic` mediumblob,
  `coupon_rule` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `FK_shop_id` int DEFAULT NULL,
  `FK_shop_type_id` int DEFAULT NULL,
  PRIMARY KEY (`coupon_id`),
  KEY `FK9sw6p875pu0gy1vb3l3aojyc5` (`FK_shop_id`),
  KEY `FKa3qk3ucb5tedg3w6kkovxo0aw` (`FK_shop_type_id`),
  CONSTRAINT `FK9sw6p875pu0gy1vb3l3aojyc5` FOREIGN KEY (`FK_shop_id`) REFERENCES `shop` (`shop_id`),
  CONSTRAINT `FKa3qk3ucb5tedg3w6kkovxo0aw` FOREIGN KEY (`FK_shop_type_id`) REFERENCES `shop_type` (`shop_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `coupon` */

/*Table structure for table `coupon_couponlist` */

DROP TABLE IF EXISTS `coupon_couponlist`;

CREATE TABLE `coupon_couponlist` (
  `FK_couponlist_id` int NOT NULL,
  `FK_coupon_id` int NOT NULL,
  PRIMARY KEY (`FK_couponlist_id`,`FK_coupon_id`),
  KEY `FKqgvh47unp4a7w0sj8d99gr30t` (`FK_coupon_id`),
  CONSTRAINT `FK6tp37rr7h6hpvycxyv1pi2b05` FOREIGN KEY (`FK_couponlist_id`) REFERENCES `favorite_couponlist` (`coupon_list_id`),
  CONSTRAINT `FKqgvh47unp4a7w0sj8d99gr30t` FOREIGN KEY (`FK_coupon_id`) REFERENCES `coupon` (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `coupon_couponlist` */

insert  into `coupon_couponlist`(`FK_couponlist_id`,`FK_coupon_id`) values 
(1,1),
(1,2),
(1,3);

/*Table structure for table `coupon_used` */

DROP TABLE IF EXISTS `coupon_used`;

CREATE TABLE `coupon_used` (
  `coupon_used_id` int NOT NULL AUTO_INCREMENT,
  `coupon_used_memo` varchar(255) DEFAULT NULL,
  `coupon_used_or_not` bit(1) DEFAULT NULL,
  `coupon_used_time` datetime(6) DEFAULT NULL,
  `FK_coupon_id` int DEFAULT NULL,
  `FK_member_id` int DEFAULT NULL,
  `FK_shop_id` int DEFAULT NULL,
  PRIMARY KEY (`coupon_used_id`),
  KEY `FKmmv648yklf0fa50sfjjvlkskd` (`FK_coupon_id`),
  KEY `FKn2f7i70wcm6sufry5nu9jvcn4` (`FK_member_id`),
  KEY `FKcldks8ol9myx4warn8f5wh1d8` (`FK_shop_id`),
  CONSTRAINT `FKcldks8ol9myx4warn8f5wh1d8` FOREIGN KEY (`FK_shop_id`) REFERENCES `shop` (`shop_id`),
  CONSTRAINT `FKmmv648yklf0fa50sfjjvlkskd` FOREIGN KEY (`FK_coupon_id`) REFERENCES `coupon` (`coupon_id`),
  CONSTRAINT `FKn2f7i70wcm6sufry5nu9jvcn4` FOREIGN KEY (`FK_member_id`) REFERENCES `member` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `coupon_used` */

/*Table structure for table `favorite_couponlist` */

DROP TABLE IF EXISTS `favorite_couponlist`;

CREATE TABLE `favorite_couponlist` (
  `coupon_list_id` int NOT NULL AUTO_INCREMENT,
  `FK_member_id` int DEFAULT NULL,
  PRIMARY KEY (`coupon_list_id`),
  KEY `FKnywaf6p8225n8pifylm0jh0xj` (`FK_member_id`),
  CONSTRAINT `FKnywaf6p8225n8pifylm0jh0xj` FOREIGN KEY (`FK_member_id`) REFERENCES `member` (`memberId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `favorite_couponlist` */

insert  into `favorite_couponlist`(`coupon_list_id`,`FK_member_id`) values 
(1,1);

/*Table structure for table `favorite_shoplist` */

DROP TABLE IF EXISTS `favorite_shoplist`;

CREATE TABLE `favorite_shoplist` (
  `shop_list_id` int NOT NULL AUTO_INCREMENT,
  `subscribe_time` datetime(6) DEFAULT NULL,
  `FK_member_id` int DEFAULT NULL,
  PRIMARY KEY (`shop_list_id`),
  KEY `FKq9wvqkf7fv9rjut2n47sohves` (`FK_member_id`),
  CONSTRAINT `FKq9wvqkf7fv9rjut2n47sohves` FOREIGN KEY (`FK_member_id`) REFERENCES `member` (`memberId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `favorite_shoplist` */

insert  into `favorite_shoplist`(`shop_list_id`,`subscribe_time`,`FK_member_id`) values 
(1,'2020-12-31 23:59:59.000000',1);

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `memberId` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `image` mediumblob,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `registerTime` datetime(6) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `FK_shop_id` int DEFAULT NULL,
  PRIMARY KEY (`memberId`),
  KEY `FK4mce76fcm5c3dyutgr7vx4y3s` (`FK_shop_id`),
  CONSTRAINT `FK4mce76fcm5c3dyutgr7vx4y3s` FOREIGN KEY (`FK_shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `member` */

insert  into `member`(`memberId`,`address`,`birthday`,`code`,`email`,`fileName`,`fullname`,`image`,`password`,`phone`,`registerTime`,`sex`,`status`,`username`,`FK_shop_id`) values 
(1,NULL,'2021-03-04','PXdQAp1V','as@gmail.com',NULL,'胖虎',NULL,'$2a$10$Srsr6l8epzP7ZMqFtrvhCeD0XahE9TrKAMs2BGx51NEt8BYJdGOTe','0977777777','2021-03-23 00:51:23.782000',NULL,1,'a',1),
(2,NULL,'2021-03-10','ZZeKhTEs','asf@gmail.com',NULL,'小夫',NULL,'$2a$10$aqmYVJzROBAzlIWPTLM2ku.yfPCNJsMq7GsDTErjnXKugmZhC0Ccy','0977777777','2021-03-23 00:52:14.175000',NULL,1,'aa',2),
(3,NULL,'2021-03-03','QHN6haSG','asf@gmail.com',NULL,'多拉A夢',NULL,'$2a$10$zKtnsxcNne0YvsIOCAtgpOJLFKw7c51RGL8BPR1b48JaWrc7kzW6G','0977777777','2021-03-23 00:55:39.046000',NULL,1,'aaa',NULL);

/*Table structure for table `member_role` */

DROP TABLE IF EXISTS `member_role`;

CREATE TABLE `member_role` (
  `fk_member_id` int NOT NULL,
  `fk_roles_id` int NOT NULL,
  PRIMARY KEY (`fk_member_id`,`fk_roles_id`),
  KEY `FKlr8cty1xvth5esyylie94eep3` (`fk_roles_id`),
  CONSTRAINT `FK9vud7plly7pxwaox829ap7o6j` FOREIGN KEY (`fk_member_id`) REFERENCES `member` (`memberId`),
  CONSTRAINT `FKlr8cty1xvth5esyylie94eep3` FOREIGN KEY (`fk_roles_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `member_role` */

insert  into `member_role`(`fk_member_id`,`fk_roles_id`) values 
(1,1),
(2,2),
(3,3);

/*Table structure for table `nightmarket` */

DROP TABLE IF EXISTS `nightmarket`;

CREATE TABLE `nightmarket` (
  `market_id` int NOT NULL AUTO_INCREMENT,
  `market_comment` varchar(255) DEFAULT NULL,
  `market_memo` varchar(255) DEFAULT NULL,
  `market_name` varchar(255) DEFAULT NULL,
  `market_score` double DEFAULT NULL,
  `marketURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`market_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `nightmarket` */

insert  into `nightmarket`(`market_id`,`market_comment`,`market_memo`,`market_name`,`market_score`,`marketURL`) values 
(1,NULL,NULL,'饒河夜市',4.2,NULL),
(2,NULL,NULL,'華西街觀光夜市',4,NULL),
(3,NULL,NULL,'寧夏夜市',3.9,NULL),
(4,NULL,NULL,'士林夜市',2.5,NULL),
(5,NULL,NULL,'臨江街觀光夜市',4,NULL),
(6,NULL,NULL,'延三夜市',4.6,NULL),
(7,NULL,NULL,'廣州街夜市',4.3,NULL),
(8,NULL,NULL,'南機場夜市',4.1,NULL);

/*Table structure for table `order_item` */

DROP TABLE IF EXISTS `order_item`;

CREATE TABLE `order_item` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `amount` int DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `order_memo` varchar(255) DEFAULT NULL,
  `unitPrice` double DEFAULT NULL,
  `FK_order_id` int DEFAULT NULL,
  `FK_product_id` int DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `FKefmdrrdch72f081b69vrumj7k` (`FK_order_id`),
  KEY `FKdn5wfkvhmvp1rja2x2t3eaym1` (`FK_product_id`),
  CONSTRAINT `FKdn5wfkvhmvp1rja2x2t3eaym1` FOREIGN KEY (`FK_product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FKefmdrrdch72f081b69vrumj7k` FOREIGN KEY (`FK_order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `order_item` */

/*Table structure for table `order_status` */

DROP TABLE IF EXISTS `order_status`;

CREATE TABLE `order_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `order_status` */

insert  into `order_status`(`status_id`,`status_name`) values 
(1,'未付款'),
(2,'未出貨'),
(3,'送貨中'),
(4,'已送達'),
(5,'已取消'),
(6,'退貨中');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(255) DEFAULT NULL,
  `company_title` varchar(255) DEFAULT NULL,
  `invoice_num` varchar(255) DEFAULT NULL,
  `orderNumber` varchar(255) DEFAULT NULL,
  `order_address` varchar(255) DEFAULT NULL,
  `order_datetime` datetime(6) DEFAULT NULL,
  `order_memo` varchar(255) DEFAULT NULL,
  `order_total` double DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `FK_member_id` int DEFAULT NULL,
  `FK_orderstatus_id` int DEFAULT NULL,
  `FK_paytype_id` int DEFAULT NULL,
  `FK_shiptype_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `UK_co70u7tjfb1vnhh2l85yxqdfb` (`orderNumber`),
  KEY `FK6r5sbky9djgfljnjyrs37yacl` (`FK_member_id`),
  KEY `FK4h965kpq3c8mdnhro7mvqvngx` (`FK_orderstatus_id`),
  KEY `FKrhpn85sww7ps7eqtbdc7xura6` (`FK_paytype_id`),
  KEY `FKq36by0qtjyc5vp3vrkxnei17h` (`FK_shiptype_id`),
  CONSTRAINT `FK4h965kpq3c8mdnhro7mvqvngx` FOREIGN KEY (`FK_orderstatus_id`) REFERENCES `order_status` (`status_id`),
  CONSTRAINT `FK6r5sbky9djgfljnjyrs37yacl` FOREIGN KEY (`FK_member_id`) REFERENCES `member` (`memberId`),
  CONSTRAINT `FKq36by0qtjyc5vp3vrkxnei17h` FOREIGN KEY (`FK_shiptype_id`) REFERENCES `ship_type` (`ship_type_id`),
  CONSTRAINT `FKrhpn85sww7ps7eqtbdc7xura6` FOREIGN KEY (`FK_paytype_id`) REFERENCES `pay_type` (`pay_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `orders` */

/*Table structure for table `pay_type` */

DROP TABLE IF EXISTS `pay_type`;

CREATE TABLE `pay_type` (
  `pay_type_id` int NOT NULL AUTO_INCREMENT,
  `pay_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pay_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pay_type` */

insert  into `pay_type`(`pay_type_id`,`pay_type_name`) values 
(1,'信用卡/金融卡'),
(2,'銀行轉帳'),
(3,'超商貨到付款');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `filenameA` varchar(255) DEFAULT NULL,
  `product_release` date DEFAULT NULL,
  `product_info` text,
  `product_memo` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_pic` longblob,
  `product_picA` longblob,
  `product_price` double DEFAULT NULL,
  `product_spec` varchar(255) DEFAULT NULL,
  `product_status` int NOT NULL DEFAULT '0',
  `product_stock` int DEFAULT NULL,
  `FK_product_type_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKc9sqrle3uny7sdork7a91qbph` (`FK_product_type_id`),
  CONSTRAINT `FKc9sqrle3uny7sdork7a91qbph` FOREIGN KEY (`FK_product_type_id`) REFERENCES `product_type` (`product_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `product` */

insert  into `product`(`product_id`,`filename`,`filenameA`,`product_release`,`product_info`,`product_memo`,`product_name`,`product_pic`,`product_picA`,`product_price`,`product_spec`,`product_status`,`product_stock`,`FK_product_type_id`) values 
(1,NULL,NULL,NULL,'產品特點:\r\n1.使用食品級進口400克加厚牛卡紙，安全衛生!!\r\n2.可透視的PET窗口，透明度高，可以更好的展現美食!!\r\n3.三邊卡扣設計，產品打開關閉都方便，密封性能良好!\r\n4.內部防水防油設計，有效防止滲漏!\r\n5.可用於炸薯條、炸雞、水果、沙拉、炒飯、早午餐等等\r\n',NULL,'美式薯條外帶盒',NULL,NULL,300,'50入/組',0,1,6),
(2,NULL,NULL,NULL,'產地：美國',NULL,'美國原裝進口保冷箱',NULL,NULL,2700,'紅色款',0,1,5),
(3,NULL,NULL,NULL,NULL,NULL,'三格裝小麥餐盒',NULL,NULL,79,'粉色',0,5,2),
(4,NULL,NULL,NULL,'外尺寸:21X13X7cm\r\n容量：1000ml。※飯菜分離設計，不僅美觀，更加實用\r\n※內附筷勺餐具，超級貼心\r\n※带提手 。尺寸、容量、重量皆以手工測量，請以實物為準\"',NULL,'秸稈餐盒套組',NULL,NULL,79,'蘋果綠',0,3,2),
(5,NULL,NULL,NULL,'\"尺寸：4.7公分\r\n共8入\r\n材質：ABS樹脂\r\n耐冷.熱：-20～70度\"',NULL,'日本原裝水果叉',NULL,NULL,89,'萬聖款',0,20,2),
(6,NULL,NULL,NULL,'\"產品優勢:\r\n1.?四種尺寸，由大到小，放餐點不互相沾染!\r\n2.?耐高溫，可微波爐加熱，通過美國FDA認證!\r\n3.?安全矽膠，折疊後體積超小，攜帶超方便!\r\n4.?矽膠可塑性高，非如陶瓷或是玻璃，容易撞擊破碎!\"',NULL,'安全矽膠折疊盒',NULL,NULL,199,'湖水綠款',0,3,2),
(7,NULL,NULL,NULL,'\"m\'sa造型 食物叉\r\n能讓食物增添童趣??\r\n產品尺寸:花椰菜-44×13×13mm 鑫鑫腸-44×15×13mm 蛋-44×12×7mm 蝦-45×21×9mm\r\n材質：樹脂\r\n耐熱：70度-20度\"',NULL,'日本原裝便當小物',NULL,NULL,70,'便當款',0,24,2),
(8,NULL,NULL,NULL,'\"【商品規格】\r\n湯匙尺寸：長18.7cm 寬3.8cm 重量33g\r\n筷子尺寸：長18.6cm 重量16g\r\n外盒尺寸：長23cm 寬5.2cm高3.5cm 重量56g\r\n商品顏色：深藍、軍綠、粉橘、酒紅\r\n商品材質：304不鏽鋼、矽膠、ABS\"',NULL,'304超值感餐具組',NULL,NULL,99,'霧色款',0,1,2),
(9,NULL,NULL,NULL,'\"品名：珍珠奶茶帆布包\r\n材質：絲絨布\r\n尺寸：(小)35cm×30cm；(大)40cm×35cm\r\n重量：(小)117g；(大)151g\r\n\r\n特色：\r\n1.暗扣內袋\r\n便於收納，可放私密物品等小物件\r\n\r\n2.加大容量\r\n更多的儲物空間，滿足上課、出行需求\r\n\r\n3.加厚肩帶\r\n柔韌耐用\r\n安心置物不勒肩\r\n\r\n4.雙重車線\r\n精密縫線，耐用耐磨，不易破損\r\n\r\n5.絲絨表層\r\n與眾不同的手感體驗\r\n\"',NULL,'珍珠奶茶帆布袋',NULL,NULL,149,'珍珠奶茶款',0,7,3),
(10,NULL,NULL,NULL,'\"⭐️尺寸: \r\n小盤20cm\r\n大盤27cm\r\n\r\n⭐️使用說明:\r\n?可重複使用\r\n?可放90℃以下熱食\r\n❌不可微波\r\n❌不可放入烤箱\r\n❌不可放入洗碗機\r\n❌不可放入消毒櫃\"',NULL,'高質感免洗盤',NULL,NULL,250,'50入',0,9,6),
(11,NULL,NULL,NULL,'\"。彈性矽膠綁帶，兼容市售 350ml 到 750ml 飲料杯\r\n。吸管環設計，粗/細吸管都可牢牢套住\r\n。簡約輕巧隨身帶，使用好方便\r\n。矽膠材質輕鬆可水洗，髒污不殘留\r\n\r\n\r\n商品規格\r\n基本資訊\r\n本體重量        逗扣角色款：25 g / 簡約黑白款：17 g\r\n本體尺寸        逗扣角色款：W120 x H180 x D15 mm / 簡約黑白款：W120 x H180 x D10 mm\r\n材質        矽膠\r\n包裝內容物        Cup Tie 環保杯綁\r\n。可愛萌角色/個性簡約風，隨心變換風格\r\n\r\n本商品適用杯口直徑 7 - 10cm、寬口杯型&需有杯緣(太細/太窄的杯緣不建議使用，例如COCO)，可兼容市面上 350ml 到 750ml 飲料杯。* 冰霸杯&巧力杯因為沒有杯緣，不建議使用哦 * *若使用我們不建議的杯款，會造成杯子脫落，還請注意*\"',NULL,'造型飲料提環',NULL,NULL,119,'卡通款',0,5,1),
(12,NULL,NULL,NULL,'\"商品皆為手工製作 品質有保障\r\n杯套砸重本 縫製雙層雙面都可使用 提帶長度可掛機車勾勾\r\n一般手搖飲料、咖啡皆可使用\r\n材質：兩面用 厚實可水洗帆布 髒了方便清洗  \r\n外面美到不行 裡面也美到不行\r\n\r\n今年開始買飲料不提供杯袋\r\n人人都應該擁有環保飲料提袋 一起省錢愛地球\r\n\r\n方形提袋款還可以當作手提小包包 放手機鑰匙小物\"',NULL,'大理石環保杯袋',NULL,NULL,49,'大理石款',0,6,1),
(13,NULL,NULL,NULL,'\"二手??極新??日式木作攤車/古早味日式飯糰?餐車/木質早餐攤車\r\n！白鐵訂製款！\r\nNT.38000\r\n\r\n尺寸：\r\n150*85*210公分\"',NULL,'飯糰攤車',NULL,NULL,10000,'飯糰餐車',0,0,8),
(14,NULL,NULL,NULL,'\"五臟俱全可拆質感攤車」\r\n\r\n⭐️攤車表面微防潑水，有髒污也好清潔\r\n⭐️桌面內部有貼心「鐵板」做隔熱，耐高溫耐髒好清理！\r\n⭐️兩長桿可以懸掛帆布Logo,讓攤車更吸睛\r\n⭐️有「抽屜可上鎖」，鈔票找零手機可放抽屜！\r\n⭐️攤車內部有足夠收納空間\r\n⭐️附「長型質感玻璃櫃」可以展示商品\r\n⭐️附上大傘可供遮陽避雨\r\n⭐️輪子皆有安全煞車裝置\r\n⭐️可以再自行貼皮改顏色\r\n\r\n?重點?\r\n可拆成扁平的，一般轎車可載！\r\n一台轎車就可以出去做生意了～\r\n日常也好收納！！\r\n\"',NULL,'雞蛋糕餐車',NULL,NULL,15000,'蛋糕攤車',0,1,8),
(15,NULL,NULL,NULL,NULL,NULL,'植纖外帶餐盒',NULL,NULL,800,'250入/組',0,14,6),
(16,NULL,NULL,NULL,'\"尺寸：長15cm 高27.5cm 寬9cm\r\n\r\n自製款哦，字母用紅色比較簡單顯眼，看起來也獨特\r\n\r\n拍照灰常好看的喔\r\n\r\n可以當做禮品包裝袋，糖果袋 烘焙餅乾袋\"',NULL,'防油笑臉紙袋',NULL,NULL,200,'100入/組',0,33,7),
(17,NULL,NULL,NULL,'\"?尺寸：11*16CM（實際可裝大小)\r\n?材質：紙\r\n?紙質微透，\r\n內層防水防油塗層，可當做餅乾分裝袋！\r\n適合分裝小物送禮自用都ok，\r\n小熊圖案粉嫩可愛，共有四種款式可以挑選～\r\n此款紙袋尺寸偏小，建議小仙女購買前先測量大小唷！\r\n\r\n\"',NULL,'小熊紙袋',NULL,NULL,250,'100入/組',0,29,7),
(18,NULL,NULL,NULL,'\"尺吋：8英吋 20.5公分（帶柄長度）15.5公分（面徑））5.5公分（高度）\r\n           容量500ML\r\n尺寸正負誤差一公分內（因每個使用的尺不同）           \r\n材質：陶瓷 \r\n適用：洗碗機、微波爐、消毒櫃 \r\n風格：歐式純色 \r\n工藝：印彩釉下彩 \r\n產品根據餐具生產標準嚴格把關，釉下彩色印花對身體無任何副作用，請放心使用。\r\n\r\n陶瓷餐盤難免有缺釉、小氣泡、流釉、氣泡孔或黑點、色暈等小瑕，\r\n出貨檢查不影響使用才會寄出。\r\n請能接受再下標，拿貨前都會幫大家檢查，高標買家請繞道去實體店面購買。\r\n陶瓷商品因易碎的特殊性 開箱請錄音保障彼此 不接受回家發現尺寸太小或者太大 商品尺寸均有標識 這些都不予退貨 \r\n感謝您！\"',NULL,'陶瓷握柄鍋碗',NULL,NULL,129,'墨綠款',0,10,4),
(19,NULL,NULL,NULL,'?商品詳情\r\n➢適合直徑 11cm左右的奶茶杯\r\n➢杯套寬 7cm 手繩長約 19cm\r\n➢顏色: 白色一家人杯套,粉色查理杯套\r\n➢材質: 布\r\n➢風格：卡通\r\n\"',NULL,'史奴比環保杯套',NULL,NULL,59,'史奴比款',0,1,1),
(20,NULL,NULL,NULL,'性價比非常高的一款磁性黑板，真正的物美價廉，建議搭配熒光筆一起購買。\r\n\r\n需要貨到付的請聯系客服！\r\n\r\n因大件商品。只能走宅配，運輸途中如有破損，可換可退，水水們放心選購！\r\n\r\n復古做舊立式實木小黑板花架，板面為鉄皮面，適用于粉筆,熒光筆，有磁性，可吸附磁釘，固定海報等！！\r\n材質：天然桐木\r\n邊框有7種顏色：藍色 粉色  棕色 黃色 乳白色  玫紅色\r\n\r\n全尺寸42*42*115CM，書寫區38*58CM，黑板是一款非常適合做店鋪廣告的小黑板\r\n產品測量為手工測量：可能會存在1CM左右的誤差唷\r\n注意 : 本產品雖然會隨貨附贈粉筆，\r\n但是運送途中有可能讓粉筆折斷。\r\n在此特別強調，我們販售的價格就是黑板的價格，\r\n其它附帶的贈品都是額外送的，\r\n無法因贈品有任何狀況要求退換貨！\r\n許多賣家乾脆把贈品全部拿出來丟棄，\r\n以免除不必要的困擾。本店本著服務顧客的心態，\r\n仍將贈品保留送給客人，\r\n但也請各位有所認知，\r\n不得因贈品有任何狀況要求退換貨。\r\nPS.粉筆太容易斷了。',NULL,'磁性立式黑板',NULL,NULL,300,'粉色款',0,2,5),
(21,NULL,NULL,NULL,'9尺戶外休閒遮陽傘2.7米',NULL,'大型擺攤傘',NULL,NULL,2800,'綠款2.7米',0,0,5),
(22,NULL,NULL,NULL,'\"⧗ 尺寸：\r\n   (1) 湯匙：長約23公分、寬約4.1-4.3公分。\r\n   (2) 筷子：長約23.5公分。\r\n⧗ 特色：\r\n1. 採用原木製成的湯匙、筷子，經製切割打磨，無毛刺也不扎手。\r\n2. 外觀設計符合人體工學，握感極佳。\r\n3. 外觀極簡時尚，造型線條優雅，淡淡的就能讓人感到食光的美好。\r\n4. 不管是在自家餐桌上、店面、甜點、早午餐店、餐廳，都是賞心悅目的美好存在。\r\n5. 日韓網紅、擺拍常用的餐具款式，天然優良的品質材料，兼具美觀與實用。\"',NULL,'簡約木質餐具組',NULL,NULL,50,'木紋組',0,30,2),
(23,NULL,NULL,NULL,'小麥秸桿餐具組\r\n內容物：筷子、湯匙、叉子、收納盒\r\n材質：秸桿+PP材質\r\n\r\n便於攜帶的餐具組，\r\n現在環保意識抬頭，\r\n加上衛生習慣，\r\n很多人都開始自帶餐具出門了，\r\n這組算是便宜的入門款，\r\n可以很好的養成習慣，\r\n即使忘了弄丟了也不會太心疼。\"',NULL,'輕巧小麥餐具組',NULL,NULL,39,'粉色款',0,10,2),
(24,NULL,NULL,NULL,'\"手提長:15cm\r\n可裝500cc與700cc的飲料，\r\n側邊有附吸管扣(鬆緊式)，環保又方便！\r\n<手工測量，會有微微誤差，能接受再下單喔>\"',NULL,'玩轉飲料提袋',NULL,NULL,49,'卡通款',0,5,1),
(25,NULL,NULL,NULL,'❣️商品說明\r\n  〔提袋材質〕白織布 無防水\r\n  〔吸管收納〕側邊有吸管收納 \r\n  〔提袋尺寸〕9.5x12cm \r\n  〔手提長〕15cm\r\n  〔適合杯子〕\r\n8.5cm~9.5cm杯圓\r\n500c.c~700c.c\r\n※本商品不適用胖胖杯與冰壩杯\"',NULL,'日韓可愛飲料提袋',NULL,NULL,59,'小熊款',0,10,1),
(26,NULL,NULL,NULL,'\"素素的環保杯綁設計。讓自己感受到地球在呼吸的創意設計\r\n一起愛心做環保，簡約個性單色，\r\n彈性矽膠綁帶，通用性佳?\r\n可以輕鬆水洗，速乾不怕髒?\r\n適用杯口直徑7 - 10cm，\r\n兼容市售350 - 750ml的飲料杯?\r\n冷熱飲都能一手搞定☕\r\n吸管不怕沒地方放，\r\n吸管環設計超方便，粗細吸管都能收?\r\n可收折而且超輕，不用的時候也可以收在隨身包裡~\r\n環保又有型❤使用心情也美好?\r\n\r\n?商品特色\r\n?矽膠材質?好清洗不怕髒，彈性好、更通用\r\n?方便攜帶?可收折，輕鬆收納進包包裡\r\n?吸管環設計?粗細吸管都能放，不怕無處放\r\n?兼容好用?市售350~750ml飲料杯，冷熱飲都能使用\r\n\r\n?商品規格\r\n品牌：Bone\r\n尺寸：約 12 x 18 x 1.5 cm\r\n淨重：約 25 g\r\n材質：矽膠',NULL,'超彈力環保杯套',NULL,NULL,99,'黑色款',0,3,1),
(27,NULL,NULL,NULL,'訂製品(不含燈籠)\r\n尺寸:長157x寬64x高225cm',NULL,'復古木製攤車',NULL,NULL,7500,'杉木款',0,1,8),
(28,NULL,NULL,NULL,'兩用包有手提把手、另有長背帶可肩背、側背?旁邊口袋上有熊熊的刺繡，可愛度滿滿?\r\n\r\n顏色：黑色、米色、棕色\r\n材質：偏厚的帆布，很有質感\r\n尺寸：22x21.5cm',NULL,'韓國兩用帆布袋',NULL,NULL,200,'白色款',0,1,3),
(29,NULL,NULL,NULL,'\"商品特色:\r\n1. 採用牛津布耐磨耐用不易損壞。\r\n2. 超大容量，外出攜帶超便利。\r\n3. 保溫、保冷、保冰都很適合。\r\n4. 有拉鍊，密封效果更好。\r\n5. 有提手，無論當便當袋或購物袋都很適合。\r\n\r\n品名: 北歐風超大防水便當袋\r\n\r\n材質: 牛津布+珍珠棉+PVC\r\n\r\n尺寸: 長款(高度33+手把12*寬度24*側面15CM)\r\n短款(高度22+手把12*寬度24*側面15CM)\"',NULL,'簡約風防水保溫袋',NULL,NULL,199,'黑色款',0,10,3),
(30,NULL,NULL,NULL,'\"牛皮系列各式尺寸紙湯杯/杯蓋\r\n⚠️紙湯杯跟蓋子分開販售\"\",選項中分別有對應的價格喔⚠️\r\n\r\n?此賣場單位為\'箱\'，選項中的價錢為一箱?\r\n整箱分別數量可以參考以下說明\r\n\r\n?750cc 紙湯杯\r\n     口徑：127mm \r\n     高度：76mm\r\n     數量：600入/箱(50個*12條)\r\n\r\n?850cc 紙湯杯\r\n     口徑：142mm \r\n     高度：84mm \r\n     數量：600入/箱(50個*12條)\r\n\r\n?1000cc 紙湯杯\r\n     口徑：142mm \r\n     高度：106mm \r\n     數量：600入/箱(50個*12條)\r\n\r\n?配件-850紙湯杯內襯(通用780/850/1000紙湯碗)\r\n     款式: 整層 / 三格\r\n     口徑:13.7cmx高度約4.5cm\r\n     數量：1200入/箱(50個*24條)\r\n\"',NULL,'牛皮紙湯碗',NULL,NULL,480,'50入/組',0,3,6),
(31,NULL,NULL,NULL,'材質：牛皮紙\r\n形狀：圓形\r\n\r\n',NULL,'牛皮紙杯',NULL,NULL,300,'50入/組',0,3,6),
(32,NULL,NULL,NULL,'?一面具吸油的功能~雙重功用經濟實惠?',NULL,'三角房油紙袋',NULL,NULL,200,'40入/組',0,2,7),
(33,NULL,NULL,NULL,'7吋喇叭碗，湯麵碗\r\n面徑18公分，高8公分\r\n',NULL,'撞色剉冰碗',NULL,NULL,79,'湖水綠款',0,1,4),
(34,NULL,NULL,NULL,'尺寸如圖所示\r\n材質:陶瓷\r\n此商品可用於:烤箱、微波爐、洗碗機、烘碗機',NULL,'日本陶瓷拉麵碗',NULL,NULL,69,'藍色款',0,2,4),
(35,NULL,NULL,NULL,'※ 產品說明\r\n材質：表面不鏽鋼、內部聚氨酯泡沫\r\n顏色：金屬銀色\r\n容量：51L\r\n外徑尺寸：長61cmX寬39cmX高42cm\r\n內徑尺寸：長53cmX寬33cmX高33cm\r\n\r\n※ 產品特色\r\n1.良好隔熱材料，保溫效果極佳，可有效保溫4天。\r\n2.大容量可容納85罐可口可樂鋁罐的空間。\r\n3.金屬質感、盡顯尊貴。\r\n4.超強耐用的不鏽鋼材質，清潔更容易堅固。\r\n5.增強底部空氣流通，進一步提升保溫效果。\r\n6.箱側不鏽鋼條寬大活動把手，抓握處特別增加柔軟材質。\r\n7鎖扣皆爲耐用的不鏽鋼材質。\r\n8.配有排水塞、箱蓋溝槽設計。',NULL,'不鏽鋼保溫箱',NULL,NULL,4999,'經典款',0,1,5);

/*Table structure for table `product_type` */

DROP TABLE IF EXISTS `product_type`;

CREATE TABLE `product_type` (
  `product_type_id` int NOT NULL AUTO_INCREMENT,
  `product_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `product_type` */

insert  into `product_type`(`product_type_id`,`product_type_name`) values 
(1,'環保杯套'),
(2,'環保餐具'),
(3,'環保購物袋'),
(4,'陶瓷碗盤'),
(5,'攤販用具'),
(6,'免洗餐具'),
(7,'紙袋'),
(8,'餐車'),
(9,'零食'),
(10,'玩具'),
(11,'文具'),
(12,'折價券'),
(13,'衣服'),
(14,'文創商品'),
(15,'雜貨'),
(16,'飲料'),
(17,'食品');

/*Table structure for table `random_number` */

DROP TABLE IF EXISTS `random_number`;

CREATE TABLE `random_number` (
  `random_id` int NOT NULL AUTO_INCREMENT,
  `random_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`random_id`),
  UNIQUE KEY `UK_cemqpowwpimd8va0tvwv1qgm6` (`random_code`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `random_number` */

insert  into `random_number`(`random_id`,`random_code`) values 
(1,'YA00001CHI'),
(2,'YA00012CHI'),
(3,'YA00023CHI'),
(4,'YA00034CHI'),
(5,'YA00045CHI'),
(6,'YA00056CHI'),
(7,'YA00067CHI'),
(8,'YA00078CHI'),
(9,'YA00089CHI'),
(10,'YA00100CHI'),
(11,'YA00111CHI'),
(12,'YA00122CHI'),
(13,'YA00133CHI'),
(14,'YA00144CHI'),
(15,'YA00155CHI'),
(16,'YA00166CHI'),
(17,'YA00177CHI'),
(18,'YA00188CHI'),
(19,'YA00199CHI'),
(20,'YA00210CHI'),
(21,'YA00221CHI'),
(22,'YA00232CHI'),
(23,'YA00243CHI'),
(24,'YA00254CHI'),
(25,'YA00265CHI'),
(26,'YA00276CHI'),
(27,'YA00287CHI'),
(28,'YA00298CHI'),
(29,'YA00309CHI'),
(30,'YA00320CHI'),
(31,'YA00331CHI'),
(32,'YA00342CHI'),
(33,'YA00353CHI'),
(34,'YA00364CHI'),
(35,'YA00375CHI'),
(36,'YA00386CHI'),
(37,'YA00397CHI'),
(38,'YA00408CHI'),
(39,'YA00419CHI'),
(40,'YA00430CHI'),
(41,'YA00441CHI'),
(42,'YA00452CHI'),
(43,'YA00463CHI'),
(44,'YA00474CHI'),
(45,'YA00485CHI'),
(46,'YA00496CHI'),
(47,'YA00507CHI'),
(48,'YA00518CHI'),
(49,'YA00529CHI'),
(50,'YA00540CHI'),
(51,'YA00551CHI'),
(52,'YA00562CHI'),
(53,'YA00573CHI'),
(54,'YA00584CHI'),
(55,'YA00595CHI'),
(56,'YA00606CHI'),
(57,'YA00617CHI'),
(58,'YA00628CHI'),
(59,'YA00639CHI'),
(60,'YA00650CHI'),
(61,'YA00661CHI'),
(62,'YA00672CHI'),
(63,'YA00683CHI'),
(64,'YA00694CHI'),
(65,'YA00705CHI'),
(66,'YA00716CHI'),
(67,'YA00727CHI'),
(68,'YA00738CHI'),
(69,'YA00749CHI'),
(70,'YA00760CHI'),
(71,'YA00771CHI'),
(72,'YA00782CHI'),
(73,'YA00793CHI'),
(74,'YA00804CHI'),
(75,'YA00815CHI'),
(76,'YA00826CHI'),
(77,'YA00837CHI'),
(78,'YA00848CHI'),
(79,'YA00859CHI'),
(80,'YA00870CHI'),
(81,'YA00881CHI'),
(82,'YA00892CHI'),
(83,'YA00903CHI'),
(84,'YA00914CHI'),
(85,'YA00925CHI'),
(86,'YA00936CHI'),
(87,'YA00947CHI'),
(88,'YA00958CHI'),
(89,'YA00969CHI'),
(90,'YA00980CHI'),
(91,'YA00991CHI'),
(92,'YA01002CHI'),
(93,'YA01013CHI'),
(94,'YA01024CHI'),
(95,'YA01035CHI'),
(96,'YA01046CHI'),
(97,'YA01057CHI'),
(98,'YA01068CHI'),
(99,'YA01079CHI'),
(100,'YA01090CHI');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_code` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `role` */

insert  into `role`(`id`,`role_code`,`role_name`) values 
(1,'USER','會員'),
(2,'USER','會員'),
(3,'ADMIN','管理員');

/*Table structure for table `ship_type` */

DROP TABLE IF EXISTS `ship_type`;

CREATE TABLE `ship_type` (
  `ship_type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ship_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ship_type` */

insert  into `ship_type`(`ship_type_id`,`type_name`) values 
(1,'宅配到府'),
(2,'超商取貨'),
(3,'中華郵政i郵箱');

/*Table structure for table `shop` */

DROP TABLE IF EXISTS `shop`;

CREATE TABLE `shop` (
  `shop_id` int NOT NULL AUTO_INCREMENT,
  `shop_addr` varchar(255) DEFAULT NULL,
  `shop_file_name` varchar(255) DEFAULT NULL,
  `shop_hours` varchar(255) DEFAULT NULL,
  `shop_hyperlink` varchar(255) DEFAULT NULL,
  `shop_info` text,
  `shop_media` longblob,
  `shop_memo` varchar(255) DEFAULT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `shop_owner` varchar(255) DEFAULT NULL,
  `shop_phone` varchar(255) DEFAULT NULL,
  `shop_pic` longblob,
  `shop_score` double DEFAULT NULL,
  `FK_nightmarket_id` int DEFAULT NULL,
  `FK_shop_type_id` int DEFAULT NULL,
  PRIMARY KEY (`shop_id`),
  KEY `FKayhr6w5yps12nfh7t4ftywapw` (`FK_nightmarket_id`),
  KEY `FK3ucxfej4ev4agj9b5q2rt4w0m` (`FK_shop_type_id`),
  CONSTRAINT `FK3ucxfej4ev4agj9b5q2rt4w0m` FOREIGN KEY (`FK_shop_type_id`) REFERENCES `shop_type` (`shop_type_id`),
  CONSTRAINT `FKayhr6w5yps12nfh7t4ftywapw` FOREIGN KEY (`FK_nightmarket_id`) REFERENCES `nightmarket` (`market_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `shop` */

insert  into `shop`(`shop_id`,`shop_addr`,`shop_file_name`,`shop_hours`,`shop_hyperlink`,`shop_info`,`shop_media`,`shop_memo`,`shop_name`,`shop_owner`,`shop_phone`,`shop_pic`,`shop_score`,`FK_nightmarket_id`,`FK_shop_type_id`) values 
(1,'台北市民生西路999號',NULL,'18：00～賣完為止',NULL,'一家推薦的夜市小吃是平常出現在早點的飯糰！「慈音古早味阿婆飯糰」原是當地人宵夜的飽食首選，但因媒體採訪、觀光客蜂擁，雖不在【寧夏夜市】主要攤販區，依舊人氣爆棚，5點多攤子還沒擺齊，攤位前已大排長龍（約等候20-30分鐘）。',NULL,NULL,'古早味阿婆飯糰',NULL,'0933-789-456',NULL,NULL,3,1),
(2,'台北市民生西路996號',NULL,'16：00~01：00',NULL,'阿婆飯糰斜對面的「皇家雞蛋蚵仔煎」也是大排長龍的名店，【寧夏夜市】有三家蚵仔煎生意都不錯，這家應該是人氣NO.1，外帶的人很多，內用會被帶到旁邊店面，等候時間約15-20分鐘，沒有想像中久。「黃加雞蛋蚵仔煎」的蚵仔煎很厚實，表皮煎得焦脆市特色，蚵仔尺寸一般、醬汁口味稍淡不死鹹，整體水準優於其他夜市的蚵仔煎。',NULL,NULL,'皇家雞蛋蚵仔煎',NULL,'02-7781-2345',NULL,NULL,3,1),
(3,'台北市大同區民生西路810號',NULL,'10：00~01：00',NULL,'街口另一邊的「古早味豆花」在日劇＜孤獨的美食家＞推薦後，成為日韓港遊客來台必吃的爆紅美食，2018年剛引退的日本歌姬安室奈美惠曾是座上賓，也是總統府國宴、金馬影展慶功宴的台式甜點常客。店家注重食安，是嚴選食材並以台灣在地作物為主，透過古法烹煮的天然健康養生甜點，網路評價高。招牌中的招牌是加了花生、粉圓的『豆花壹號』＄50，選用來自加拿大單一品種（非混豆）\\r\\n的非基因改造黃豆費工製成的豆花香醇溫潤軟溜，點綴慢煮數十小時的雲林花生、天然黑糖拌炒珍珠，以冬瓜糖、黑糖及二砂調成的靈魂糖水都是好吃的關鍵。',NULL,NULL,'古早味豆花',NULL,'0937-656-333',NULL,NULL,3,1),
(4,'台北市大同區寧夏路003攤位',NULL,'18:00~賣完為止',NULL,'民生西路、南京西路與重慶北路中間路段，分三大類：中間是內用攤位、左邊是買了可邊走邊吃的TOGO攤位、右邊是街邊店。編號002：「鹽烤杏鮑菇」位於街口，一開店就出現排隊人潮。特色是使用A級巨無霸杏鮑直火現烤，因新鮮多汁而獲得好口碑。',NULL,NULL,'王家鹽烤杏鮑菇',NULL,'0919-234-009',NULL,NULL,3,1),
(5,'台北市大同區寧夏路001攤位',NULL,'17:00~23:00',NULL,'「苗栗客家純糖麻糬冰」最受老客人喜愛的是使用圓糯米經手工製作的冷熱燒麻糬，冬天很受歡迎的紅豆湯與花生湯也是招牌。把渾圓飽滿的大麻吉從滾燙糖水鍋中撈起後，撒上花生碎糖粉與黑芝麻的『燒麻糬』，微甜麻糬軟Q彈牙混合著花生粉香氣，是簡單迷人的古早味。',NULL,NULL,'三義客家純糖麻糬',NULL,'0937-342278',NULL,NULL,3,1),
(6,'台北市大同區寧夏路002攤位',NULL,'17:00~22:00',NULL,'『鵝肉冬粉/麵』＄80的鵝肉嫩中帶點嚼感、湯頭清爽鮮甜且可續加、Q彈爽脆的『燙鵝腸』＄100與如豆腐般滑嫩的『鵝血』＄60，都是滿滿一盤、份量十足，敢吃辣一定要加一小瓢店家自製辣椒，味道更棒。',NULL,NULL,'寧夏鵝肉店',NULL,'0922-831256',NULL,NULL,3,1),
(7,'台北市大同區寧夏路056攤位',NULL,'18:00~23:00',NULL,'賣得是台灣漢堡：割包，及肉粽、四神湯，【寧夏夜市】許多攤位沒有名稱，只有產品也是特色之一。以慢火熬煮數小時的『四神豬腸湯』，是把薏仁取代蓮子的北部口味，豬腸軟而不爛、湯頭濃郁清甜。',NULL,NULL,'陳記刈包',NULL,'02-1010-6788',NULL,NULL,3,1),
(8,'台北市大同區寧夏路057攤位',NULL,'16:30~22:30',NULL,'推薦的現點現炸12盎司超大『雞排』＄75，一看就讓人食指大動，除了原味還可以選擇椒鹽、孜然、檸檬等口味。咬開後雞排厚厚的斷面秀令人嘆為觀止，最厲害的是竟然很Juicy，皮香酥、肉鮮嫩多汁，吮指回味。',NULL,NULL,'嘉義仙人雞排',NULL,'0916-366-578',NULL,NULL,3,1),
(9,'台北市大同區寧夏路058攤位',NULL,'17:00~20:00',NULL,'方家雞肉飯已經連續兩年獲得米其林必比登推介(2019~2020)，其評語是「淋上雞汁與油葱的雞絲飯香味四溢，招牌滷豆腐軟嫩得超乎想像。」',NULL,NULL,'方方雞肉飯',NULL,'0916-778-999',NULL,NULL,3,1),
(10,'士林夜市新士林市場地下一樓美食區',NULL,'16:30~21:00',NULL,'老字號蚵仔煎可以說是士林夜市最具代表性的道地小吃了，1972 年就開業的老字號，和別家蚵仔煎不一樣的是忠誠號的雞蛋都是使用土雞蛋，蛋黃既金黃又新鮮。',NULL,NULL,'老字號蚵仔煎',NULL,'0987-667-889',NULL,NULL,4,1),
(11,'台北市士林區基河路 997號',NULL,'11:00~20:00',NULL,'林夜市著名的藥燉排骨店，即使不是冬天進補的季節也是高朋滿座，以超過 10 種以上的中藥製作湯頭，每日超過 5 小時慢火細燉。菜單高掛在牆上，可以看到除了各式藥燉系列之外，店裡也有提供各種快炒與小吃可選擇。\"',NULL,NULL,'順順十全排骨',NULL,'02-0890-7788',NULL,NULL,4,1),
(12,'台北市士林區基河路911號',NULL,'17:30~22:00',NULL,'\"店家的雞排作法為先炸後烤，配上含特殊中藥的特調醬汁，吃起來外皮沒有一般酥炸雞排的脆，是那種抹上醬料後潤潤的口感，烤肉醬滿香的不會過鹹，吃到後面可以吃出有加一點點肉桂粉提味，雞肉本身多汁又軟嫩，一點都不柴！\"',NULL,NULL,'新竹家鄉碳烤雞排',NULL,'0912-347-687',NULL,NULL,4,1),
(13,'台北市士林區文林路666號',NULL,'15:00~20:00',NULL,'\"這家老字號的林家蔥油餅也是人龍頗長的熱門小吃，炸法其實有點像是花蓮的炸蛋蔥油餅，吃起來特別酥脆，建議大家要買加蛋的會更好吃喔！醬料部分可以加點小辣，其實不會很辣而且是帶有蒜香的辣醬，美味度大大提升～\"',NULL,NULL,'林家蔥油餅',NULL,'0988-567-223',NULL,NULL,4,1),
(14,'台北市士林區大東路與大南路口',NULL,'17:00~21:00',NULL,'\"士林夜市老字號小吃之一，簡單的肉片包夾著蔥，以火燒烤而成，在燒烤時就已經香氣十足，吃進口中後在口中爆開的肉汁，與蔥的香氣相互交融，看似簡單的滋味卻讓人相當過癮！\"',NULL,NULL,'周記碳烤肉捲',NULL,'0937-001-002',NULL,NULL,4,1),
(15,'台北市大安區臨江街84號附近',NULL,'17:00~21:30',NULL,'老闆堅持以傳統手法用鏟子一顆一顆重壓地瓜球，逼掉油也逼出Q勁；請先跟老闆預定要買多少錢的($20/$30/$50)，他會告訴你是第幾鍋(要記好)，由於不記名又沒號碼牌，所以可別跑遠了！',NULL,NULL,'傳奇地瓜球',NULL,'0988-980-990',NULL,NULL,5,1),
(16,'台北市大安區臨江街與通化街口',NULL,'16:30~20:00',NULL,'炸好的芋頭餅內餡鬆軟還吃得到芋頭顆粒，厚厚的芋頭泥配上酥脆的餅皮，真的是臨江夜市必吃之一，如果你也是芋頭控推薦來試試這攤的口味！',NULL,NULL,'無名芋頭餅',NULL,'0916-567-887',NULL,NULL,5,1),
(17,'台北市大安區臨江街999號',NULL,'15:00~00:30',NULL,'焦糖楓的Google評價相當高(4.7分/1272則評論)，不同一般烤肉店只刷醬調味，這家還會撒上獨家烤肉粉增添風味，這粉是用十餘種中藥漢方加蔗糖調配而成，刷醬則是偏日式甘味醬油，呈現出多層次獨特味道。',NULL,NULL,'焦糖楓日式串燒',NULL,'0985-667-890',NULL,NULL,5,3),
(18,'台北市大安區臨江街888號',NULL,'17:00~22:30',NULL,'\"他們家特別把臭豆腐切成約3cm見方大小，一口一個吃起來很方便。炸得酥脆的臭豆腐搭配酸酸甜甜的泡菜，真是好吃；另外值得一提的是泡菜分量給得很大方唷，小份$45元/大份$55元。',NULL,NULL,'一口金酥臭豆腐',NULL,'0900-890-012',NULL,NULL,5,1),
(19,'台北市大安區通化街57巷附近',NULL,'17:30~22:00',NULL,'這家正是鼎鼎有名的「全台人氣小籠包評比大PK第三名」的宜蘭正好鮮肉小籠包加盟店。外皮白嫩薄透，新鮮豬肉與知名三星蔥混合而成的內餡，不只吃得到蔥香和肉甜還飽含不油膩的湯汁。',NULL,NULL,'鮮肉小籠湯包',NULL,'02-6788-5666',NULL,NULL,5,1),
(20,'台北市大安區通化街57巷附近',NULL,'16:00~00:00',NULL,'評價CP值超高的壽司店，網友極力大推臨江街夜市必吃美食吃一！',NULL,NULL,'明日壽司店',NULL,'025611-0987',NULL,NULL,5,3);

/*Table structure for table `shop_comment` */

DROP TABLE IF EXISTS `shop_comment`;

CREATE TABLE `shop_comment` (
  `shop_comment_id` int NOT NULL AUTO_INCREMENT,
  `shop_cmment_photo` longblob,
  `shop_comment_content` varchar(255) DEFAULT NULL,
  `shop_comment_memo` varchar(255) DEFAULT NULL,
  `shop_comment_time` datetime(6) DEFAULT NULL,
  `shop_response` varchar(255) DEFAULT NULL,
  `shop_score` double DEFAULT NULL,
  `FK_member_id` int DEFAULT NULL,
  `FK_shop_id` int DEFAULT NULL,
  PRIMARY KEY (`shop_comment_id`),
  KEY `FK9iejanwkfi7i9ecyvh55bamih` (`FK_member_id`),
  KEY `FKgx9dxp39pm4uwkl78gwpfkb2b` (`FK_shop_id`),
  CONSTRAINT `FK9iejanwkfi7i9ecyvh55bamih` FOREIGN KEY (`FK_member_id`) REFERENCES `member` (`memberId`),
  CONSTRAINT `FKgx9dxp39pm4uwkl78gwpfkb2b` FOREIGN KEY (`FK_shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `shop_comment` */

/*Table structure for table `shop_menu` */

DROP TABLE IF EXISTS `shop_menu`;

CREATE TABLE `shop_menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `menu_detail` varchar(255) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_photo` longblob,
  `menu_price` double DEFAULT NULL,
  `FK_shop_id` int DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `FKtpd68t36nq2xm1dth3k9t8dr9` (`FK_shop_id`),
  CONSTRAINT `FKtpd68t36nq2xm1dth3k9t8dr9` FOREIGN KEY (`FK_shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `shop_menu` */

insert  into `shop_menu`(`menu_id`,`menu_detail`,`menu_name`,`menu_photo`,`menu_price`,`FK_shop_id`) values 
(1,'好吃的鐵板麵','鐵板麵',NULL,80,1),
(2,'好吃的沙朗牛排','厚切沙朗牛排',NULL,150,1),
(3,'好吃的菲力牛排','厚切菲力牛排',NULL,180,1),
(4,'好吃的魷魚','厚切魷魚排',NULL,150,1),
(5,'好吃的排骨','小碗的藥燉排骨',NULL,80,2),
(6,'選用台灣豬','大碗的藥燉排骨',NULL,150,2),
(7,'好吃的麵線','麵線',NULL,20,2),
(8,'好吃的荷包蛋','荷包蛋',NULL,10,2);

/*Table structure for table `shop_shoplist` */

DROP TABLE IF EXISTS `shop_shoplist`;

CREATE TABLE `shop_shoplist` (
  `FK_ShopList_id` int NOT NULL,
  `FK_Shop_id` int NOT NULL,
  PRIMARY KEY (`FK_ShopList_id`,`FK_Shop_id`),
  KEY `FKmm2suasksuig3iy7xsok9dhan` (`FK_Shop_id`),
  CONSTRAINT `FKllblb7lymn6lycstw7dp79uur` FOREIGN KEY (`FK_ShopList_id`) REFERENCES `favorite_shoplist` (`shop_list_id`),
  CONSTRAINT `FKmm2suasksuig3iy7xsok9dhan` FOREIGN KEY (`FK_Shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `shop_shoplist` */

insert  into `shop_shoplist`(`FK_ShopList_id`,`FK_Shop_id`) values 
(1,1);

/*Table structure for table `shop_type` */

DROP TABLE IF EXISTS `shop_type`;

CREATE TABLE `shop_type` (
  `shop_type_id` int NOT NULL AUTO_INCREMENT,
  `shop_type_memo` varchar(255) DEFAULT NULL,
  `shop_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shop_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `shop_type` */

insert  into `shop_type`(`shop_type_id`,`shop_type_memo`,`shop_type_name`) values 
(1,NULL,'中式料理'),
(2,NULL,'西式料理'),
(3,NULL,'日式料理'),
(4,NULL,'飲料'),
(5,NULL,'衣服'),
(6,NULL,'飾品'),
(7,NULL,'手機周邊'),
(8,NULL,'日常生活用品'),
(9,NULL,'遊戲');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
