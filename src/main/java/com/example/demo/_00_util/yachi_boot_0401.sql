/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.21 : Database - yachi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yachi` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `yachi`;

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
  `fk_admincoupon_type_id` int DEFAULT NULL,
  PRIMARY KEY (`admincoupon_id`),
  KEY `FKnd8tfs62d3w0la52sw4ncf67h` (`fk_admincoupon_type_id`),
  CONSTRAINT `FKnd8tfs62d3w0la52sw4ncf67h` FOREIGN KEY (`fk_admincoupon_type_id`) REFERENCES `admin_coupon_type` (`admincoupon_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admin_coupon` */

/*Table structure for table `admin_coupon_type` */

DROP TABLE IF EXISTS `admin_coupon_type`;

CREATE TABLE `admin_coupon_type` (
  `admincoupon_type_id` int NOT NULL AUTO_INCREMENT,
  `admincoupon_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admincoupon_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admin_coupon_type` */

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `cart_amount` int DEFAULT NULL,
  `cart_total` double DEFAULT NULL,
  `fk_member_id` int DEFAULT NULL,
  `fk_product_id` int DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FKaevuia51eq9cw5h20pb1e1vkx` (`fk_member_id`),
  KEY `FKl2n5xmfan63t22rg80uhmq0s6` (`fk_product_id`),
  CONSTRAINT `FKaevuia51eq9cw5h20pb1e1vkx` FOREIGN KEY (`fk_member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `FKl2n5xmfan63t22rg80uhmq0s6` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`product_id`)
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
  `fk_shop_id` int DEFAULT NULL,
  `fk_shop_type_id` int DEFAULT NULL,
  PRIMARY KEY (`coupon_id`),
  KEY `FK8w0vqmrj4qq1dbgr5tnxddbdn` (`fk_shop_id`),
  KEY `FKdnq3pmv2f8glm2pddya81lbbd` (`fk_shop_type_id`),
  CONSTRAINT `FK8w0vqmrj4qq1dbgr5tnxddbdn` FOREIGN KEY (`fk_shop_id`) REFERENCES `shop` (`shop_id`),
  CONSTRAINT `FKdnq3pmv2f8glm2pddya81lbbd` FOREIGN KEY (`fk_shop_type_id`) REFERENCES `shop_type` (`shop_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `coupon` */

/*Table structure for table `coupon_coupon_list` */

DROP TABLE IF EXISTS `coupon_coupon_list`;

CREATE TABLE `coupon_coupon_list` (
  `fk_couponlist_id` int NOT NULL,
  `fk_coupon_id` int NOT NULL,
  PRIMARY KEY (`fk_couponlist_id`,`fk_coupon_id`),
  KEY `FK79xpsf5b0kmuo9j79l7t5kb76` (`fk_coupon_id`),
  CONSTRAINT `FK79xpsf5b0kmuo9j79l7t5kb76` FOREIGN KEY (`fk_coupon_id`) REFERENCES `coupon` (`coupon_id`),
  CONSTRAINT `FKb5ftrvhwaclx7byk4jhpu6clc` FOREIGN KEY (`fk_couponlist_id`) REFERENCES `favorite_coupon_list` (`coupon_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `coupon_coupon_list` */

/*Table structure for table `coupon_used` */

DROP TABLE IF EXISTS `coupon_used`;

CREATE TABLE `coupon_used` (
  `coupon_used_id` int NOT NULL AUTO_INCREMENT,
  `coupon_used_memo` varchar(255) DEFAULT NULL,
  `coupon_used_or_not` bit(1) DEFAULT NULL,
  `coupon_used_time` datetime(6) DEFAULT NULL,
  `fk_coupon_id` int DEFAULT NULL,
  `fk_member_id` int DEFAULT NULL,
  `fk_shop_id` int DEFAULT NULL,
  PRIMARY KEY (`coupon_used_id`),
  KEY `FKd7x23i1mqqnpoa6nc080glpt3` (`fk_coupon_id`),
  KEY `FKsx5v48mmcveorc5ytm7qycwir` (`fk_member_id`),
  KEY `FK9wpv5lksr84thmfpitotdh3y1` (`fk_shop_id`),
  CONSTRAINT `FK9wpv5lksr84thmfpitotdh3y1` FOREIGN KEY (`fk_shop_id`) REFERENCES `shop` (`shop_id`),
  CONSTRAINT `FKd7x23i1mqqnpoa6nc080glpt3` FOREIGN KEY (`fk_coupon_id`) REFERENCES `coupon` (`coupon_id`),
  CONSTRAINT `FKsx5v48mmcveorc5ytm7qycwir` FOREIGN KEY (`fk_member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `coupon_used` */

/*Table structure for table `favorite_coupon_list` */

DROP TABLE IF EXISTS `favorite_coupon_list`;

CREATE TABLE `favorite_coupon_list` (
  `coupon_list_id` int NOT NULL AUTO_INCREMENT,
  `fk_member_id` int DEFAULT NULL,
  PRIMARY KEY (`coupon_list_id`),
  KEY `FKe2kif27egyx7uy1pis026gn0d` (`fk_member_id`),
  CONSTRAINT `FKe2kif27egyx7uy1pis026gn0d` FOREIGN KEY (`fk_member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `favorite_coupon_list` */

/*Table structure for table `favorite_shop_list` */

DROP TABLE IF EXISTS `favorite_shop_list`;

CREATE TABLE `favorite_shop_list` (
  `shop_list_id` int NOT NULL AUTO_INCREMENT,
  `subscribe_time` datetime(6) DEFAULT NULL,
  `fk_member_id` int DEFAULT NULL,
  PRIMARY KEY (`shop_list_id`),
  KEY `FKakwuakkk23pjyw4byci4hfjr3` (`fk_member_id`),
  CONSTRAINT `FKakwuakkk23pjyw4byci4hfjr3` FOREIGN KEY (`fk_member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `favorite_shop_list` */

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `birthday` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `image` mediumblob,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `register_time` datetime(6) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `fk_shop_id` int DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `FKetpd9hjxt0cktxh20higey65a` (`fk_shop_id`),
  CONSTRAINT `FKetpd9hjxt0cktxh20higey65a` FOREIGN KEY (`fk_shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `member` */

insert  into `member`(`member_id`,`address`,`birthday`,`code`,`email`,`file_name`,`fullname`,`image`,`password`,`phone`,`register_time`,`sex`,`status`,`username`,`fk_shop_id`) values 
(1,'é«˜é›„å¸‚å‰éŽ®å€äº”ç¦è·¯13è™Ÿ','2021-03-02 00:00:00.000000','1guXVJbE','yarong111035@gmail.com','å¹³å°å„ªæ´»å‹•æ»¿åƒé€ç™¾.PNG','èƒ–è™Ž','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0ª\0\0y\0\0\0Î%nw\0\0\0sRGB\0®Îé\0\0\0gAMA\0\0±üa\0\0\0	pHYs\0\0t\0\0tÞfx\0\0WIDATx^í÷ÔÆÖÆý7¾77÷&„ÞBh¡ØÆ½wÛØ`\\éÁô¦wHB\ZiBHóêY_yG³GZi›µëç‡ï\'Á’fFÚÝytÎœ9\'Oýú®\"„’FoS/M*Pÿ÷jþU\n•\Z(‹eg§úçþ7êŸþqòûoêÅÉmò5!¤èÍÂ±{­mX%>/(T„’a®^Ù§fÍ¯pˆÕÜéâ$¯6Õª_+V/®‘¯	‡*Š÷zëú1ñ¹¸A¡\"„qàÇ»gTAqƒc÷»JÅÉþÅ\'çe±úô¢x~˜xÖSªfLZ‘ƒCýâ3qƒBE!ãHcs‡C¨À•†qÂqù°,V·>³,¯:ñš°0XP4vSf—ª?ž\\Ÿ‡…ŠBÆ™þþ^‡P%Eâ„ÿâä°úç·ç±‚õãwJíî¯	7V•8îïè¡mâ³ PBHØ½k“c\"mo¯\'}u _ýóèûX±úõ™z1²I¾&Ô-ŒU”4ŠÏA‚BE!!áì©jÒtgàÁ²9.ÃmêÅ±beñâÂ~ùšqæl­óÞ>¹zP|&*B	ßÞ8®¼]í˜Ð_}-?3ùUª×¯Êbuñ@ìù!`Ñ¬hPEGg·øL(T„BÊªZb>kq	²øèl¬XýüX<w¼.‰UükR¾zøÝñþu(T„R:Vw;„\n®,àÅåC¡zñíçâyãÍýÕ¥ê¿“£÷³}xƒxïàã÷¨+(T„f6m\ZtX·B²xqj»zqãCõâ³ËJ­¯Ï	KWŽÝËü%Õâ}Ø¿uì\n!„„œ#‡Þ›´mÊæ»Yd49CÕ/œÙ5v¯<½¤Vw¯q§PBHðùÇ‡ÕôyeŽ	|æ´õB‚l@ÏÿW]7šÿï«ÏŽF,,ý…ŠB²„_^PËëc&òo;ä´KaÆÌÿ·oÏfÇ¿u(T„’eÔ5¶ÇLæçjå ‹°bæÿó‚BE!YÈºÞu1ú–\"9íRXÑóÿ¹ÑÜ¶šBE!ÙÊ®±i—š»¤]\n!fþ?‘à>)T„’Å¼wiŸzeJ4Ü,žåRÛ*„4,rŽä5¨ooDkVQ¨!$Ëypç´zsq•c²yr¾z¸&üAêœAƒ}1÷G¡\"„¡¤¢Ù1éìY’\"L,\rU_³¶\'æ¾(T„’C´µw9„\nì-wÅk|úxÍ{¢PBHŽ±qclÚ¥îåá\r²øiM©zãh¨úÁý[÷C¡\"„äÌÉ¡È!	EèÍUÌ[Xé¸\n!„ä(·®SSg—:Äjê”õ{¯,ãÉ—mÎPõkD‹*R¨!$‡ùç—+êíü:‡€–0H‚1žÔj¥êë›ÚÇîBE!€šúU¡Ç«Ã•v	i ôñýüà|dì*B™ ô¬‹M»´¾0\\KfGƒ*¶nŠŒ›BE!ˆÃck[Õ-OÅ®Òh¨ºTA¡\"„	Æ§R/¿]oÍGÚ¥‡Ý¥êµ×£VÕ¥s{(T„2yöãy5×²Xt±÷VÚ¥žÑPõ×fgF¨ ˆÒß	!„Œ/+K›B.×oÅç­ÎPõŒUÿ@l’AB!á@J»´³t|ƒ,ªD]“iªûßžR\rMâ1B!á`Çö¡KÇ/íÒ‘Êh¨zÚ…\ná…Ë\nëÅc„BÂÃ»÷:„\näÏŸˆ@äÿ›üz†„\ná…Há!#„.¾¿}J½>Ó¹F„(¼§=™²€E—v¡B…}£¿=¾(žC!$|,^^;6Û\\kÉlÚ¥«M£‚™V¡B®&ûïÞ<!žC!$œT×Å¦]ÂÚ‘$*é¢p^aú„\nAúÍ}ôþñ<B!áeÃ†Ç\\úó3x \"û¨D¡ßØ‰cÛÅó!„„›Ó\'v8æsP¹ 3Aô•¥O¨&OwfÁÞ žG!$üÜübD½49šÚÌ™^ þé—&•¤E¨ô \n›µ==â¹„B²ƒ¿Ÿ]V³æWÄÌï·ÚÓ˜¡**‹MÉQS·J<—BHv!¥]:_—¾ ‹”•Da³dE­x>!„ì^2sžßVœž ‹”Uo_oÌà2àþùô’x\r!„ìãàþ­1s}ë’Ô§]J¹P™ƒÖ¹ë¤x\r!„ìäÚcæú¥sR˜°PaQíÙÃóêÇ»gÔ¯O¨ŸUÇŽÇX7”(Ò!„Œ?Oœ‹‰ô~åµ|õcwj‚,D¡úäêAµqã€Z×»NutvG²Ÿ—W·ª‚âµhYšýVE$ÔË¯9+D¦’E\rêÒyÖ±\"„lAJ»ôaSòi—<-ªÇ÷ÏFËì8¼¹¨J·,3i<„BÂMKÛê˜yÙ%$ò‹o×ß¹S;#å:Ì¤ŠW§©=»7‹}BÉ¶oˆ™ãQ^^!?^£úòÚµfmlXb2lÜ8¨~ý‰ÙÕ	!$W¸|!6ñCéüÄ‚,¦€[pçŽjþâª˜Áø¥sõ\ZõãÝÓbû„B²Dz›óþŒ©ê×^Y$>k)I\\¨tà¬¬i•µm‘¼QR[„Br)íÒW«âY\\¨+ŽD¦D¨@E\0¡zøÝ±\rB!¹I•e ˜ZpºF²x¼¦4²¦eŸ—¡Â>\'½óx­ïÛ!„’»`î7õ`óJgÚ¥S–xÍŸáÌÒž¡\Z\ZŠí`Ï•ô÷ÿ¼^(¶C!$·9yl{Œ&4.^©U«â7c÷æ66w$/T?ÿx^Í[XÓøž]›\"+ÞÎ¯‹9ÉBjBHnóõç#¢.èÌYP©ŽÝS›´P<«ŽvãàÞ­“j¹°ÿªcu·£B!‡?¾“vÉ™ÙíX†½{6\'/TõMíŽ.žÝsÎ÷·O©‚âFÇyÀ<BÈÄ¢°dTŠJ›Ô¦Mƒêƒ+û#ÿð½ª¼ª%r,)¡Bˆ¹-:¯LY©>~ÿ€xÀ~)³ âAÔ!„L,lëéöWÇ#TSK§C+’ª­[‡\"L›[ñ9Jçè<ºwF•VŽ*$¨fÕ_B!\'F¶«9b÷[„…êï_®D‚(™âûoO‰çH<ùþœcÏÕÏÎ‹çB™ ¨î¤iEq²™5¿<q¡ºtnO$Ií³ƒ\rÄ©ºntóÌ<éB!ƒŸî(4Ìƒ^$,T¢xñüŠxÌ¿<¼ jÚÕ’µâqB!,%¡ö!öåb­J?–PÝàêóâ·Ç#cÞ?B!n$L‘\nþxzIõ÷÷ŠÇ!„q*ð×³Ëâß	!„PHf½‹BHî\Z¡\"„B$(T„BB\r…ŠBH¨¡PB	5*B!¡†BE!$ÔP¨!„„\Z\n!„PC¡\"„j(T„BB\r…ŠBH¨¡PB	5*B!¡†BE!$ÔP¨!„„\Z\n!„PC¡\"„j(T„BB\r…ŠBH¨¡PB	5*B!¡†BE!$ÔP¨!„„\Z\n!„PC¡\"„j(T„BB\r…ŠBH¨¡PB	5*B!¡†BE!$ÔP¨!„„\Z\n!„PC¡\"„j(T„BB\r…ŠBH¨¡PB	5*B!¡†BE!$ÔP¨!„„\Z\n!„PC¡\"„j(T„BBMÞ_?_B!a ïÿ^ÍW3æ•«Â’Fµª½KmÙ2¤Ž«kTîœ/\"„B2ED¨¼ø×¤5wa¥*«lQ]ÝkÕöá\rêì©êËkGÔãïÏŠB!©\"oòôbQ üòÊ”•jáÒ\ZU]·J­ë]§öîÞ¬.Û£n~9¢ž?º vJ!„ø%o¨µeLt¶v´ªöúfUTT¯f½Yî¤Dy}f‰ZZP§\Z›;ÔÐP¿:tàuõò>u÷æ	õ\'×Ç!„Ä!oUmÓ˜¨ìZÝªÔ@™ƒ\'ëkÕ\r-êâP»Ú×Ó®úÛÚTCu“Z¾¢FM]ê¥D˜>¯,²>ÖÖÞ¥6oTÇ«O®T?Üæú!„K¨*KëÇDã`w¬Pyña_TäJ‹ëÕšÆU^Ú æ-¬T/M.;–(ÿš”Y+­lQ«»×DÖÇÎœÜ©¾øä°z|Ÿëc„2È[aYF¶0ï	&T§ÖFÝ†5å\r1ÇŸ­¯Q77¶¨ËëÛÕË\Z\\Õ¦\ZÿgMK5öß7Vª‘õ±¶ÈúØžÈúØnuó‹õËC®BH.÷æ‚Š±‰ÿÜº–±ñbwgT¨š-’Îqããþ¨5öß)+U_K‹ª­hT‹Þ®V¯N]9v,^›Q¬–æ×©†æ5YÛªÞ¿¼OÝùú„úóé%ñB	yv°\'öwû‚	Õú–æ±k;ê›ÅsÜ¸Ò½væ¼Øã¿U©;šÔÚÕÑ¾vµ©s•j«kQE+ëÔìù©	ô˜>·L7ªÖU«#ëcÇŽ«#ëc§Ä‡E!$ó8öQ}ÔLlºê£VQOS0‘;ÛµÆ–,­ÏñÂ¾¬oƒ5Ö ÞZTéø{²ütë`„2Þäõ¶´F&å¶Ú`®;ÐPÙ86©¶ª‘5Q¡B †tŽOªÇ®7cÎùn N]Y×¬vu¶¨Õ– Ôª74ëÑÅå–pBHæÈÃ¤~­?¸Hâ¢º±I}Ëª`º¢BÕp}ëÛh¤\"x8X+žçÆ¯•êFC$d£eÕ[‚kZco½]­~{|Q|h„B2GD¨åt_ÛØÄþÃP0«–Ž}íš€nÃû¢–ÜK“\nÔŸƒây~x:X­:ë£ëe ¹µS½x.?0B!™%)¡?XÖÌã¡\Zñ˜È‚aÃ¦€ÖØÙž¨°L™U\"žã‡O-K2??\ZžNŸØ!>(B!ãCÒB•(Wú£Buk(v–‡º£ÖØ[‹+ÅsâqtM«ÒóN›c‰.³ÅBHè7¡TªûCuâ1/†5kAÒ9nü5X®ú[¢B*ª[Õ_Ï˜wBÂÈ¸\nU¢üÒ\r|8°f•xŽÄ­zU¡¥Œ;¶o!„p•BeswÐ¿ËY7fkáÿóza$Õ’ôP!„„‡¬*¿lmwºú–¯¬gè9!„d	9-TjUSu4” y­ô !„„“œª«}ÍjñÛU‘ºze¿ø!„„—œª½]­êå×ÇêÍÅUêÉçÄ@!$Üä”Pý2P©ºœY&PâãŸçWÄ›\'„~òV×7Gö%îiU_4ªŸƒg™_ô7ª•…µ‘:yl»xÓ„B²G™„n#IkUYC¤|ÇîÕ­êBo‹új A=¬…b<9¾¦%’JÉÿ”Y¥êþ­“â\rBÉ.D¡ŠR¡†Ô@[›(™â…ÅP«3ô¼´²Eýù3³LBH®‡pm¤Z´¬&Rº]Ÿôýh‰d¹3P¯ª-‹OËŽíÄ›$„’½äIÄfXdm8wz—\ZÞ¶A­êèRùE\rbáÁÛ2/T×5«7TŒá¥ÉêÆ§GcîƒBHö#\n•ÉÙ“;ÕL-ýÍÝà	e“e¸Ãéê[ZP§ž?º Ž›BHöW¨¶lrX¾¼Z‘tòh°ZµÕ49Æ±fíZqÌ„BrW¡úáö)ÕØÒé0Ø”yWßG}Mj™%Žú8®^Þ\'Ž›Œ#ŸlWêÃa¥žÐÂÁ~¾ïO*õ±õœNö*µÃú-m¨Rjg³õÌÎË×ìÄþ¬¿;.ÃßH D¡zßEËœ{’À»Ý™wõìjQ¯N-\ZÃÜ•ê§ûgcÆLÆ™GÖg²½1úÙmªQêh·RŸïæ\\·^¬ JÚw{Œõ•J}±G¾Ž¤ˆÉwÇ”:?4ú²ðÕù¼D0&ïo•¯#\"1Bµw÷æÈ>*] æÌ/WÏû+äž&~¬P=Î,uíêŸ_˜e\"”|ºK©!—ïÈ`¹R§úäë&\nN+µ­^~>àdÈ’%f}žW6¥ŽÛ!	vúåòè½ì°^Œêà{Z•ú9EU(T)eL¨~yx^uu¯u¨-VA7ÜèoP¥EuŽqœ{–‰Tÿ°3Á]ëmRº— àÍôP§øYFÀ„pƒ	Õ¡Õòóasÿíó_ÔpsþxFî+“<»¤ÔþvyŒxÑúd‡|]P(T)%\"T_|rX•9ÀÞ–Ì»úN­mQ3ç•{»¾»yB|¨Hõ;¤êÇòí¥6yØdÛ\Zž‹tÙD²Z:¾Ï,+&UK2xYÿ©²ª(T)%ïØÑa5mnTÀ´Ù¥ê«žÌçüÛØæ=/.oV<µÞ€„‡Ž‰,Tgúåöm.gY¹\nUú¾Ï\"ï$Ñ°ªöºdÕ€AÈ¤ë‚@¡J)1)”Ê\n3/P÷jU}…3ËÄöá,Ë21Q…ê¾eínõ°¼±.óÃ)ùÚ°B¡Jß÷ë•ïn–ûÌ$¼3:iŒpc\'+¦ª”âª¾šÌ»ú®¬kV;^ÿôˆ8ØP3Q…êÜ€Üv˜:iS¨Òû}Æšå§;å~3ÖË¶5Èãƒîlé:¿P¨RJD¨&O+Rg;2/R;;[\"élZ¼¼Výò0KC™\'¢PÝ;®Ô–ÌÛ†BœtŸÃ VÇÖÊcçåküB¡J)yË«Õ£¾Ì–îx2P­:êœÁÝkÖªÂ\0³†‰&Tpœ°&C©Ý°‘*¡Â›ö—{c7oÚŒ¬‘¯Ãß¥óÁÅõò5XÔ—Î÷&JéÞ’áÝXgrs›Í5J]}\'þKÄ\nÄ¥~2ö®a›9®Ö|ˆíÏ’¨Â@¡J)¯ð{­¯Iä;7cƒ±4¸¬ÂM¨‚næÄ$ƒÍ²R[‰¼%{	h2?–¯ö[Møj“‰¤L¨¬ÏŸt\r@?Òu^ý»õ…ÏM:<A4Ü‘.y¼6lòÆùø/þ-gƒàl•\0]Lð‚\n¸üR1\nUJÉ¨Pénqd`Ÿ5¿B=º‚½©`\"	&,¼ñKm†\nUò`M\'ÞgŽïúUã;…KV‹¬³Ó–kM¿6Ü>‹T\0Šg±Æ*ì+C¸~`ÉNÐ,/ª?*T_³3ËDMý*õ÷³qSM%I¨.nÛ+©ªl ‘ïH<`exeÕ\0°ŒÜ¢ùðw/W¡Í¾vk‚?\'·”°U\"øé7GI»P}3P¯*Kë\"ub$äY&a¢Õ7‡”Úè±¹ÒnëÍ[z#to—R[\0îEL`Òu~Áz‰t/nP¨FÏ\"žûN²¤LüŠÕ;– Þ<(·\nUN‘V¡:ÛÓ¢æ¾-p8iZ‘º›\rY&ÁKÂJP¡‚ûÇKT\0D%èÎ~/a\'…j4“¢ââ‰K€ˆ•[Fß%ËjOÆH¡Ê)Ò&T[W9³L–4ªßŸdI–‰DÈu¡Ân~$ò”Ú±¥‹KºÞ\nUêH…PÁ¢e#µ¯cGAJm¸ágÍÊfw‹RwFävâA¡Ê)R.T?ÖªæêF‡H\rg[–‰DÈe¡‚¹R:Øü+]lª°SxM‚É¬(|Î~¬d#Iä¥ E‘ßˆÑD­+\nUN‘R¡z¿·Y½½ÔYàðúµ,Ì2‘¹,T~ÖàLôGD¡Š%ÓB…ZLñ&l°™lZ,ôd³8Æ†\n~CÇÑ¾Y- U ð%<R¿6ª”’2¡Ú»ºE½2eå˜@-\\Z£žý8ª–æªPù)¼c_•t½²E¨² BõðÌhù?\0ëV©Ê€±‹·æi‚óSYà0]Ä*?¿=2FÒBõl°Ju78³Lt!ËÄs¹ÃœÅM¨0À×.E£I «³›ëëÒ5^ K€Ôˆ÷cÁÛc¼	Ç!fÒõ~¡P¥¿B…0p¸ùÖûpó¸àÞÛ’ú¹p7b±_¡´`±°à:„5üá¶Ñlþ^êUa½u—õ»Å3‚…²òAîB•R’ªÏûTñJgÃœÈ2‘nB…x¶†§cAš$¯I\"lºF‚‚’õRÛ\0î!ìÛ’®‹&ÖD\\T¹,T(l®r®“ªq7 \0ø¬üYèàEìÂz÷¢Œ†FOúwnDT\\–Î÷˜ ¿?\nUJIX¨Ž­iQÓç”Ž	ÔŒyåêáw9’e\"rQ¨l\nG²ÌðVë–«.}ö6¹(T˜ÈX/~-(Xø·~/Ó\r’Ôzy\0ÜÀËŒ[©{b˜çG\\Õ.îÃ‡–À»Lýxª”X¨þ(Wë[¡çÕumêïd8æ¹,T\0–	ÑíkñcFöô0Oê©ªxÁaÇï¦ÛlBÏ-(qmG¬+ÏÀmï—Ûïß¥ ¡øª”H¨nÔ«ÚrgÃã#ã˜ý8L¸	~ÙºFe‚Eôã=JmÕÞ`)Tá\0k0XGñ\nt€‹-Þ6|_\\áåŽÍø=Å‹BÄXã­Â\ZD6tóZdG—Î‡á{cžï<ž¯t…*¥øª=Íê­E•c…¿»_çh–‰Dð²\\ÂJ\"?LvOµÉp\"	U6€É{œw˜û¼\nã¥æ“ÿ¥7ƒõ.“)Ð?ÆŠõ\'·õ4l@&qÈ˜×\"`B:_²ÀÀÎæ`	a)T)Å—PmïhQÿšµ¢ò‹\Zr;ËD\"L¡2¡P…XçÒDŽ$³º¥u+XZž±Ï	ƒPÙc‘Bè!Æ÷}¼(ÿtNwXhæ¹àèšØs½ P¥O¡z8P£VÕ:CÏ‡·M€,‰@¡\n]¨I\'Ý@$¥íæƒ˜ÇÃ$T6XXƒ°xfnwCúmº¹òÜî;è\nUJqª{›ÔŠ5‘úr¢d™H\nU,x&Ò5&^màÇŽ½t]º@ri,Ù\"áì\"Ý€[íG—mF¡²‰·g\"ÝÖ­°~ež— y.,N¯€\r	\nUJ…ê`w«zmzñ˜@½µ¤zbe™\nÜ+zD\\¶@¡’q›¤‡FóÛ!  ‡WizÇäê¸°jàv»;\"\\£‰ò“±?ÔÛ&@	éÞÒ,W)ŒwŠäÎƒU†õ(ý<¸á4Ï…›T}Ü‹[dn:ß@ÈpÕ¯•ª·ÉYà°«Y&ìÈžˆx½=÷ÔËÒ£PÉ¸	Ö|ìßÞèU‰	›¢ãüƒ«J_c1ÁdøÑöØìz¢Xìÿù\\sebò”òå!øàF)­!ÌBå aºóÜ/°Æ…µ.û<\nUÆªë\rª¼ÄYàð½K4ËDP(T2Ù*TX8—Æ¢ß&9]x —6Žn¬•¾-Ëë+^b!º®ýæ¤D±ºX!~ÌÆ-ˆ\"„Y¨ÜBÎM÷¢[(;Öñôó(T£Y\'L’ˆPêiQ³ç—	ÔÔ9¥;ËDPŽÅmÏ‡ù%óŽd‘‚(TÁq{föý¸U9†AÀ$¡²\'Eˆ…°·ûÓPƒ	›[ý/ÔBÉM…1dp#ÌBå&,æ÷ÓÍòBvý<\n•õ\"tÙ}/Z\ZÈÛl8¬©_¥þšèY&‚âõÅ¥PÅ\'[„\nbãUåøðÿ\"è¼„\nÀ½7Ÿ\"¾«eÔÍ‡@ˆ\rúÀ‰¿ëíØàÚóC£ÖBµmKÍnG¿ŸLf¡rK‹d†¨KkYÒoŠB5*êø¾KÇÒ@ž.RÇ2ËDB`!o¹Ò—L_×\0ªXÂ$Tè}JcA€‚`Q#Í”Ûõxæ:–½þ„u&Xi¸Þ¼wŸþ7=Ç6öÂu…ï¢ÞG¦³P¹í¥2¿[’ËW\nc§PþqG:–\"Bõòë…ê³L$Ž×Ôœ¬)T±„I¨¼’’\"êÏ¶\\tÌ|snb–˜(!bnVþî–9<(^ŸÃx’Šï©ô;ÐÔ-r3×û¼„\n/‰dû÷JY6¡º{lt\\¸Wéx\ZÈ[^X¯~`O‰Y•Í/—¹`K¡Š%LBå5	ásF°ƒigúêÍ@‹d€{9,%i–|Ð=>nä²P! ÂlWßKå¶Îlþ~×w$Ñïk˜~ñ8Ó›¥š&ò¤?’€xm5bÝ„cdÍèÀ8Wj#ÕB…©t]6O<Ý\"Äôg«‡Œ#DÝÜ|Š#yo²b…‰Ÿ·Ý.Ü|ºH\"’PÊ*‘(¹,TÒwYÿL¥ˆ?|~R–u|&U¨PW[†ÆE¡JnáÌÒÝM8¤777Ü„BŸxBåfën\"€7É¬sÑž¾·I?nFHíAä`\r™ HëšpIA°žE_Ús•,¹,T°zÍvñØ›~ñ;5?+·ìY¨>²ž“>6¸¥óR…*YÜv³©@…j|‰\'TnÖ1Ö­°~k	û—ôˆ=¬Qé/$d/×¯×A”Öô~Ã@.•yoø­ìj‰Ö˜’„ÌŽ\nÄgŽÏß\räOÌe¡Âz,wd]ùt×è‹¼B¨\n\rO^’ô±é%…L¤\\Š	B¡J·Ýì\0“™™oB5¾Ä*i-`QoæÕoçÇÄg®a™àM]²¦ü€ÏøtlùŽTËB…ÏQ›°H¥I_\n€Áç„ß°niáû“ëÖëÞ·y¯ÇÜá‚{>³Nj7	(TÉ‚/¾[yosŸ P/^BåÆì2˜ð Ò9™ëWnåÔÇ|ïðý“ÆjºMÃÜ§pï¹½€˜à7,îÅõwó 5ôºo‘°˜Ã.µ‘(TÉâHaOn:ªñÅK¨¼öÃéyá ºëo¼€Ë‰jõ{/²E¨1%ÍÒ~hÜ<4q„ÊÅRñÜ¤ñ!\n0Í›Ì)TÉ/kº>¹Ùx	G²¤Z¨àŸ–|Ï©ÆÍŠx“Û×._—pÏI÷\nÜRèHÏaêñÞ2Ó\rÞt3—°	ž\n+\"\\~Û\ZäÏ6(¸ÜëD*€u*i|×Ëç§\nU2`ÍÂí+R€lªL–©›©g\'€ÛëAÞÄ±f…Ex3Œ]kO˜\\ãYl˜|ý´—)Â$T^¹7“ëV×vN<¡BÖ{<H®l¦›’®I!ªdÀä£X:n_.\nU,aø‘zEoÂjÆãIÄk™ˆ¼ó¿´G:(„œÇ[+@âÍ6ÁÉ&¡‚5+\\\ZK²àñ]˜hB…õ\'Œ‰’í‚›öß\0Ö²ÌkR…*QàöÃ~ûƒ2‘Ö§\0…*–0üHaýº¹òº|*S#Áb‚ëý^XïoÍkRxVaq÷é„I¨€×Úqðb€µ,üž8…\ZÜËD*ŒVücc-ÊÞWe–BI1ªDAa:LúÊFßHhB¡Š%?R·‰Mÿ,Ý2§c2Ã[ìŒæ9É‚ (ÿaŽ;,„M¨ÜÖãÏnC|ŽØÈ-¹W½„*Œ·P}mYK˜p³âÐƒq\"àB:ž(T‰€7Z·à\0_tøÉ¥kÝ„#H\n%70Qš?,\nU|`-¹¹ýÌìÙz\Z#Ljp1™‚Ç+’èD!¦:&\ZHß¡Dù`›%T.Â€{@X¿t]2x}/¼\"8u fxùÀ‹\nÂÔý¸TÑ÷D*3\rœ6¿»I>–(T‰àõö`\"K×7ážîˆÞÄ¥þ\0…jüÈÜÞ¾%—Æ\'–pàÅÌæ1¸ˆÁb(b…±½SZ„\nB“è:U¦\'Útáõ›q[sD0~ƒøÎá&ò0‘„ê©±Ô<Oéï)€BLþx[–¾P\0î@¸¥kA*…\n‹™[¬Þ%¼Â§ñö‹	Oj7ÓŒ§PyYÇ°ˆ¤¤¤:¸ö˜œ°¾m£“¡Ô^:ÀñYCÈ°†1Ã80n7WÌD*€Fs}I:/(Í¢\nª  ÖŒôe²A€…Y¿FéEÌZ4 ‘,X3ÁþiñÀd*%ÜÆS¨¼¬c<[<c{“(>\'L~Ãxï£r˜×Fà‰\"Té‚B•q(TAAY¸ƒ¤õLp#I×¥½6Lâ	j&O¡‚ûÎíóÄ³Å9X_qœIô‡µL õpKz¹´(TÉA¡Ê8ªDÀ$€M™æ5Þ´3=ùKutâI7,n?0ÞkT\0ÏC‡;\r›{qŸ÷	kRÔÇ•h¢·œî†‚;Ùªi–¬pÁÕo­€B•^Ï6¹^áw P%&2L,ø2E2Qx¬M¥‹xiœLPN=Í›ó¡°–í5DÓ*Áä0Çç¬k¸á*º>‚~ÑRX±&0´ã¼c“Òv™P¨’Ãëù%ú}\rËo ¤P¨’k®87 ÏR-LZxƒ‡•€~„ßJÂ@˜~¤°nðYJëwø»9>Ö«Pma¼¤I×x16lAÀz¢ÿÐç®–ÑÏV5^Bð}”®%©ƒB•q(T©\0aÂ^k$7xtn4ÒÙ³éÇÏ|bâµß‹´@¡\"„j(T„BB\r…j¢ƒE~É…!¥c’ „’f(TÙŠ÷!MO2Õ5Ýq$`&¸•€ ¥za9¬Øaä%F2ÂŠÓ%Äè›Ã“‰ÐDø|‡­Ï!^†\r7‚`\rD–â~¬AÆ\nU¶‚	û¢-M¡rcGh¹[Ùr¿áà~‹=8H’j÷…ôNAÄç\"Ë	Âìõñb…WnB7^o·a‘Æž/lÏ ÅL2\0…*Á›2rº™o½A’•R¨FAš$ˆ&`…Ÿ}K ›§á\"µ÷ã™àÙ¢’´t	>wé{atß„Ó«Xä®/Gp\rã¥\n–Y¶ƒ–ûäû$iƒB•Hûyt0éùÍ8‘„Ê^Oƒ° q+¬$õ5-¥ `³7jI}úV‰WEZ¸w¥ë$¼rÝ”Ž~¥v€ßïðúŽdAî›¤\nU¶IÖOÞ9L¾Hûsm§ë Ó¤CÈÐj!Å6ÅÂÂÈDYX¨U%ÉØŸå&˜Aò2Bô¼j¥asºŸ ¸–½ÇË\'¨C¡\"IB¡Ê&P\ZùƒX\0˜ “µÒE¡Âä\nW”-BÈ¼y«È‰L–Öp.ÃDƒ\r¼ÜlA3ÝÃjrf|ðü¤ët°öæö½\Z$Ë	…Š$	…*Á\"¶WADT¨u+\n8ÞÄ*“J¿‡	ˆÈAËj3Í%ž%dgr÷Ú‚Å#µü<wœ#]ð!]ç…Š$	…*[Ád„åzÆo¬Uáí9›]‰–1I°0ìB|È·oìAñrÿ¡Zm¨N¼Ì`ñ_jx‰—5µËg\0……Š$	…*ÛÁ¤µ(sb±£Ñð£Êf¡BPHº×—$Ð§ýb ¿k2‰âåþK¤Ö™Zn·u¢GŽE»[\"¾S¨Íe^\nI\nU®€Í¿ú$ggsÏv¡‚;\rÖ„t}*ÁäK~‚\rÒ„Ð+ú/$æ5öÚÄÀÂ¦‹<^f ^ß’ÏnâŽtYç‹½\"dKD*@¿^â‡ûN¤j6	%ª\\oÃÈ €H7¿“m6„§cÿÔ¾ppbMÏË2CP†Ôw¦yo‹s\\XÃz“ÛæÚ0¼ˆàóÇ÷À[:eçußxñxpZ¾–dª\\ã™õf¤cÙ TT0]›ø÷Æêh½-ÔfB8:îV‘™gãÀxô6tÂ\"T¤w¬IöðêÑôIñÜU¨¤ï„\"B¥ëHVB¡šèdƒP¡²3 /dÎ‰G¶UP&ªPa{‚4—®#Y	…j¢ã&T\0n\'3…Œ	¬\Z·7ÛT	U*›Py=w/Ìg:Q…\n‘—ÒX\0×§r\nÕD\'Ñ	Ó*w}îvÐÛ™ˆB…,X‹•ÆÂô½#)B• CEª¢¬(T£dƒP!¬üÚg;Q¨$áB`mI×‘¬…B•m PÀN„Lß“¬D¡\Z%„*‘lñžÆ%]—Â ²^Œ‡K“ˆP¨²	„œ›ûlð–\rwP¢‚E¡\Z%„*–…Ê?ªÐ@¡Ê&¼Ê{@°`aMoC¡\Z%ìB%¹ýBå\nUh Pe~Ë{`_Q²…ütÜ&“0‰Â&TÈ¸IÐ~‡„(ÊTm`¥Pù‡B\Z(TÙ€^vÞxû¾¸>5¹é(T™Å-ì:U*ÿP¨B…*€à|²c4côƒ’€B%„Ê­XaªÜ~€Bå\nUh PeIG&o¯Ò\05œtI&W^ºp†ûFKiH›‹“Å+åÄ@º&Ø	‚ãá6q»¹ýðÍsÇ“ »—P!²¥H®lJ/G»åþ…*4P¨²LÀbÂäjþ¸)Ù±õó³I¨Âþ–xþÒ½š¸ÕÞ27ùÚä²PeÊb÷\nj¡P…\nU6sgÄYÃå±çQ¨Æ?B…—©œ	^FÜêPQ¨’‡B•P¨²ì­‚u‘r+ïA¡\Z_üÕýrT\'þ†g…ÏìjåÓJím‹=<¡P‘4A¡Ê>³ÞºÝ~TªñÅP…©ä~¢P¨Hš PMÜ„\nY¦¥Å¤j’®…\'oâV¬BÅÍí—mP¨Hš PMÜ„\n?Ré|·ÉÄïDâ6P¨¢¸¹ýâ±¿ct\"õË­ÃþöãáÛ!¤6¼Z’žBE|B¡šx	Ö´î°z	ò¢’®y­>aªtIc–Æ2=·Ï\'Èb!µç‚2¤HQ	XÂnA©‚BE|B¡šx	•ÛdaOÜ^B…±4ùë?p\n•7n›|ã—,,$©M	Ôp\n\Z|ÏýªõùIí¥/¡\nªÐ@¡ÊV‘[&\n\nUx…êƒw¼7\"»5-ä”Ú”ÀFñDúÁ5R”ŽË„BE|B¡Ê¾=bý¨ªG\'[©ÜG\"B…ýY?KL¨p>®CßªÄñ\Z3>Sé\Z	»†™ÔŽ VÇ{ä­É@¡\">¡PåØäkÿ¸°(Éú·¾¨ˆPa‚ÄDI¡\Z?¾: GMêÏ7p-ê›Â%FÖ(µ×ºé˜ÎÁŽÑE©ŸD PŸP¨²¬=ìný‘íjÍ\\s¼„JoK?ùáNŒ\'döµX/ÑCÙí¶)T‰siƒ<V¬iA€¤ktpÎá»¡ƒ¼Š~µ!’ÎÑA{~úö…Šø„B•íx…6Ûë~„êüs\"·ëýÕ—{Gêõˆ²S}£Ç(T‰ÏÍmo•[î?¼dÄE‡KO„X¡mé\\´‹öõþBE|B¡Êv¼2\Zœ=\'žPI“øzKtP€ÑPIoþ‡V£P%F¢n?= pÂm£µŽT\n.ã.ßXbXûÒ¯\rŠ—P\r[V#’+C(Ò	ê¶Iý\nUh Pe3^¡Í˜¨0Ùá¼xB…·c©tÈPIÅþì`\nUb¸½€D¬d—u\"¸zw·È×™¸å…/ô/Jßû;–^B¥¿Ò‰Û÷P¨B…*›A1=·\rœzør<¡‚ëNš0`Å*7•í:¤PÇë/æù˜Lvú?÷³ÎäW¬mŠïÔF<(TÄ\'ªlÉ!kr’~`ÀvûxBåºh_?êFò*¯52¬P¨‚óñvù¢€­8.:dPÇK‚_ˆî{dYºfŸøŽaUºÄŠBE|B¡ÊVì½SÒÌÌZà%TnQƒ\0“%‚\"¼„Ê­m€\0‹w7ËÇ(T2^$Fn¯)Áýw¸K>Ob“È^(ô‡íñÄê„Õv<€BE|B¡ÊV¼‚(0ÑaÂ³Ïõ*s²0\'$,š#°BÿÀD‚õ‰-ÖÙþ„M_Ä‡¥…ÉÑþ·…*ˆ2UH“7ž%¬Wý|ˆÎb…kñYÛ\"”xb…HÁ (TÄ\'ªlÄk\r˜U~Ý„\nÖŽ¹Ï”Ÿ,èñæ¿¿}ôzýon…ÊI¼@ˆ]Ö±§BÊ$#¤k\0ÚLE(9ÄJr&*R€BE|B¡ÊF¼òÃAdÌ‰ÉM¨0ùéÿ¶7úÙKc‰2´Þø½\\’:ªQ \0XËs›°u°f(EÙáÅÅÌ>ˆ¼¶\'nEI -„´Û}ÀšKT¤\0…Šø„B•mÄË‚\0sròZGÒ970z>Çvá¹	\"Üú‚¿½\'`-Åþ»î\ZÔ¡P>+?‘u:8Ñ˜?œr¶eçóÃäzeSðõ\"¿Øb•¬H/¡\nªÐ@¡Ê6¼¢ì R\r!7¡Âdc·µ¯Ý9ñÀ…‡·rlˆ”&Lú†F\'NsOÎÝË:³&Ml…µ`^&ºPÙ¾4?à¹ÃõzmgôÙC¼Ò%P:èã·ÿÿG]²›‡”ºjYûv-³xP¨ˆO(TÙ&„ÃÖÛ´ô£n9à¼‚)°N…gó\rQepºM&˜ô‘©Ù+¤7kLVø»›ke\"U²\"eÑ‚Û{©°Õ\0áí˜`AR øÌìë\0„/\Z°Ð°îy¤{ô¥‰—¸xMkÐäñ‚BE|B¡Ê&â­ÿÀ$]ç%T˜4½ÞÂ½„ÊÏ\Z…*¬1Jû¤l0N¼8`’ô\n”-Ü›tÏ*â\nU6áµÖ³7ƒú½\"\"¯“¬P!RÌ¼Ld¡‚µºË%Â–Šþ9âEAø»t~˜y¼ PŸP¨²L\0^aãR…M¦„*HµZ„²ë×¦›0	@ÂÕ‚u|QH‘àfE…ßç;`Óí;(A¡\">¡PepÏ¡ ¢^óÉ“×‡Ãòu SBo—Ž]$S„M¨\0Öuáq[cÔµ…½oa,)¡^B…—2ˆ6ÖÇÒÉÑn¹@¡\n\rªln#,Äëkñ&¸Lºþ¤Lê&öž+óÚtF¡B°‰¾enÔöâÎÑÑm\0~ö¬e»,Œ4V7¼„Êíû•jÜÖP…*4P¨²,¶Û® · \n›L\n,;¯·},,	óºtF¡ˆ¬DÄžkÊ\r„†#,QyØø—bª-.¼\\@m°f†è?-€ebFŽÆƒBE|B¡Êv°Ñ3Þ‘ŒPÝØ7:‘ê“À$…zSæùfIzL˜8(ªc­Å¼&`¬³y6Hð*]—	>Û5º_M:–,°Ú°¾‰	7~÷?¥\n·ïpû~¥\Z¼XIýT2Æ‹„tÉ(*BÆ›x[™à¤V¨‚l.$„B|:¡º{L©›åc„BH‚¤N¨°þ\0_»tŒBIÔÕÏ—FÐ¯úXœ\'„B\Z¡údÇh„¬*é8!„’ ©*dß†P¡ì¸tœBIä…\nûfì=3Øø\'C!„$HòB…â{¶PaS§t!„’ ñ…êÙe¥~:?šQàÁ©ÑÚØÅ~gD©o5k\n`77,,7žrŸ!„`ÄªH=œa¥Þ©wŠR<Â&µO!„xÌõw}ïh¹kIŒ$P–ú«r[„Bˆ[£‚Ï-Ñ)€ðÚNùZB!$\0‰S .‚\'$¡’Î\'„B q¡Bº$[˜P«F*l\0–®!„B’¸P[;*J¨ÙòõA¥¾ÜªÝ­ò5„BH@ªïŽ\nÒþv¥îi…Åt±z˜êœ„BržÄ„êò¦Q‹êñùØc¶X½·%ö!„àB…J¤çåc6«íÌRA!$y‚Õ{ä¿›\\ßÇM¾„B’&ñ`\nB!$P¨!„„š¤…ê÷\'—ÔÕËûÔ–ÍCj` Ou¯Y«ZW­Vµ\r«Tie‹ªªmSÍ­ªËúûÀ`ŸÚºuH}ý]‚„Bü‘P}þñaµkç&Ui‰Ðÿ½šŸsT¨žu=êÜé]b„Bð-Tî‰ˆÓâåµ¢ð$CQY“ºtÞg!„	E\\¡úæËcª¯¿W½1«D‰—&å«YÓ\nTÁÜB5Fú·õoé<¸¿¼vD!„‰‰§PÞ¦¦Ì*EÅfñìµvùJuª¦X}½ªD=^[\ZÍN¡ñcw©ºÖR¢¶©â7Å¶lŽzG!„‰‡(TOœ‹?H\"òŸÉùj%LçëŠÕCK|$Qòípe±Z8«@ìAÒØ!„L,b„êûoO©%+b×¡¦L)PC…EêNgââ$ñ[o™ÚYZ¤fL,Š!„‡P=ùáœÊ/jˆŒŽ¥+ÕÃ5ñê¾2u«£T}Ó^ª~µH:Ç»–\0®˜ë<1²Ý1`B™Hüùô²ø÷‰Ä˜Pýñä’ª¨iŠÍEE¢°€›í%joÙèšÓLÁ\"‚ñÙW^¬ù:PþV¬X]ÿ”„‰ÇùÓ»\"s`Eu«ºùåˆzñüŠx^®3&TÍ1qË²Œ$1ð,˜)¯-yÑ²d¥z¿±DlSæµpIê\'„\\çµÅŽyð_“\nÔÎÕ³…Ê9LD¨îßêxà\'Á‚K¯nÑÊ˜sƒÁú¢Õ[°\nç9-«âòfõüÑñ&!$©®sOªðv~úô£Cêï_rßÊÊ»{ó„š:Ç‚þnC¬ˆ«*V¯½î|P:å–iºª£K\r\rõGèèìVUÖCž<ÝùF ³¡ÐÝ­ødmlX<¬>é&!$9{jgÌ<(Ñ?Ð§~º—»ÅjóÚVu9nn7S4$W€¢ïß·%®zæäÎˆUj£yñÊ˜þlN×ÄŠÜgÖ„Ô!„ä\"K­yVŸ§ÍvßÛ:k~…z÷â^õçÏ¹€‘§ßä›3\nÔ³§ËO©W¦¬Œ„Ž#!­Ô¨ÇŽ«isÊbÚC0†Þ§\"õs×öôˆmBH.²w÷fÇXWÑ¨¯iUå%õŽ¿›ÀÃu?GÖöBu ¼Ø!ŸµÆ¦MZ^X¯n&‘ýüöWÇU]c{L»½ù²e…µ,ý<¸¼{Zl›Br\rlš6×ù‚s°!2?~>Ð¨[ZÔÜ·*Çu^ŸY¢NÛ®~{|Ql?ª·f8)ô›pß=þ>5~P”1Û?ZéJ›z#€Q/R›„’‹õ;æÀÞæÇùÛ`…:µ¶%bméç™TÖ´©[×©Ïå~ÂÊ˜P­7ª8£îJ+¬#4›6:ú\0çjcÅêR½s­\nÜ¥ö!$ùæËÇøêÔ\"õl°*f®ßô×«­í-jñÛUŽkt^~½PíÙµIýò0;ÂÜÇ„ês-\\–~Sÿ²R}ùIz6Ý6µt:úZ6G^¯*0ÂÕÓ5B	#(H«Ï{V·Šs¥ÎÅuÍª­¦)W _«³´ >RcðŸ‡¹G„\n{–ô›ƒXè7²wÏfñâTðÝ7\'ÕÌ7ËýI.À}åÎ ŽtŽ‰BÂÆû—÷9æÀ…Kd‹JâÞ@­ÚÕÙªòókm˜`kÑãûásÕ®Ò¨ÛÏ´¦\nK\ZÅSÉ‘ƒï8ú”¬ª«œA°Ä¤¶!$WAâ}¼Ðë\\«òÃÕÞ&ÕÝÐ¬¦xÔœ»°2\"Œ…$Ì=\"THkßD¾‘6¥â‘gpþb§?UZ«š7#š¶	V˜Ô!„ä*Øâ£Ï“Ue£Ñ‰ðx ZêjQ¥EÎ}Z&íÝê‡Ûãæž§GûýÐåŒôC¶	é¢t°}xƒ£oÔ¼Ò*è4öTåÊBñ2©Ï_\\í˜¯4ÆÌ•Aù¬¯A\r47«9óË0:È`túÄŽÀûgSA^íÂ¨›íDµÓí·aÃ€xQ:ÀZ•Þ·..\ZÑW.ìÛ\"„\\eÛ¶õŽypmcp÷Ÿ¿TªkšUmyl¹\'ªÚ6uûÆqq|é OK7³@\\>¿G¼(]˜þWXxúCD©{ýø¡[Åv!$Wùþö)5iZ4¸ì?¯ªŸkse*¸Ù_¯6·5«…Æ²Œ¢	÷íÝ¢~y˜Þ„áy§j¢kAæúTº;7AÞ@½ÿËõÎä¸¦krãÆÌY|„JNŸwtÆUO†ók›UKu£úÏNÐAÖ¢/¯IK˜{ž^s\nî6»S¤*’.H\'7>=ê¸qÔ½ÒÖ¯ëœiDÚÚ»Äv!$—Á¾\'}.|sa¥c®L÷jÕÎŽµ|¹w˜;Œˆ\'ßŸÇžyú ¦M‰\nÂ¥ÒÉwN;n¶?ß™-ã¹!TpJíBH®SÛàÌ™zº\'ukU~x]£êªoRoÌtsŸ¿¤Z}ðî~õ×³äÂÜó~ïvüŸÉÑV¬l/H\'¿?¾ä¸Iit<˜FçÞ¶Al‡BrgFËÔÛ”×;æËLñt JXÝ¬JVz‡¹w®îV,cDº—xä=]uýé…ÇE¨ž8…ªò-çÆßM+Ù)à•Ú!„‰\0Ö…ô9ñÓþ&ÇœióÓúZµ¦±eì¼‘ž6ñ¼dA˜{_S“šõfl9\'›óÊ#!±Vº\'‰¼ÝQ¡Z2{|](ß¡ßPó§E…ºUö1$e”ÚOþ¶ÌÛû·Nªß? ŽGjvé|úá!õÇÓÌïA „ä&f\0Zg}³cÎ„@mìŒ-«ôæ‚\nÇy©æÏ\nu¬»YU—y×Ìª©_¥î|}B¼7¼;ZV\n¸ÚìÆ#˜u®ô›Ð7ýþÙW¦þ=)z5­¤62ÉµªõëT~Qƒš>Ïý\rB[YÛ¦X_°{–¨IíBˆ~þñ¼#Wê¿¬9òÁ`mD ¶®^¥^š5>tÊ3è&¼Õ_§6µ6«·UŠcÐ›ƒû·ªçäHó¼¯VECÀ¼ _¯Ä|ª¹xn·£ÿ\rÚ¯k-Îõ)Ü”ÔFºAYýŽÎnË|õ\'LñÀÅ‡ïîû\"„x 1ƒ>§líhõÌãWSÞ ~¨›[3ÉùµMª¹ªA½üš{˜û\nëÅà/žGÃÜó>µÀn{ªô.C é¦«ÛYL™(ì±!q®~ìëÏ¯2œGoSË\n¼ÍØd@ÙèëŸrÍŒoo·,)ÙrÒ@½Û—ÙÈ@7~¨QÛW5«eËœé t^š\\ ¶lRO8§òô½Jßj3½OI7aÿ;9?âî³Ç¦WùÍdBÚs§vú¨Ê…jÝŠ•joY‘ºÒP¢nw”ª?¬ñ#¤Ïõz[‰:RY¬ªŒ‚”&XË’ÆA!nàEWšO@˜Jâƒuª³®I½6Ãi(éä™!àgE•µöº—™Ú$ï]rÖZA:\'{L/,¦OŽÙ|¥6RÍ‘CÎò#&\'ˆ.¨~€pm/)Róµlð:ÜF	–Ìy$ìe‚ŠÅû;›UQamÌ½ä!$]?¹k™3ß_¦ÞðWYÖ›Þï­ÌÇ–5¢ƒ€Hm¤’öŽnGŸ6Ì­EEêÞjgÂDø£·,\"t3§É‚%‹B$Ê*£áçàjŸ30›ø¢¯Aõ66ÅDêQéëT—œ¢€h¶t[UwožPÿ~-:Y/²¬ºú£ƒÞVì\\Ÿºuý˜ØNª@f`½?0ÙtÔOk’(“ï,ÑkZì|A\0—Öˆã#„“#ÛóGG¼§*›ø{ \\èn*¸¡ôƒ%óë(é¶ªÐ¾ÞÖyôñ T¾}lÁÛÕb©BòõV¼Uè(.™. „fß¬dLñÃß¿\\Q¬—[{îøï+Õ7ýã“­\"ÕD„\n±þG3ú _“ôp’åÝ‹{ýÌžV žõDEáf»ÓÂ[ÝµFl\'lÙìL\0ñÐŸ°Š®6–¨ÓÖ³;P^¹îxu±ú¨¹$â&ô»ŽE±\"„$ÊŽíÎ´[³×ý§*pÖ(ý¾lŽÓªZVXïº+QàR„{KïÇ†FXú©ãé	™?vÔYâ XB‹\\€kµuÎT-™¯È¬q°¢8(µióASì˜õÒ¸	!ÄÙ}ôè¹¹o•«_2“Y=Œ	jQé>&ËT¿Ù£=½ýrÃ²º¦ìO÷S¿^†ŒfhäÊy²HÙ¥G!&ž7¬/©pÀ4ýü…ËjRþ¢@É=Öõ®sÌûWg¿U5&T‘2ê?í.KŸÊ©W^Ëì5ÒûGz\'ýdqÚJ3]þÛ³#ûŸô±\0<ŸY.z‰R»°0’uÃì4\ZpMJã\'„$ëÖç‚üÔWÿÍ4¡š;½@=Ñ²©ƒUoÇF£!ÏÞí¯«—?S¤€@ö•;…ùñ¤6“aïîÍŽ>^{½@}£“ØÀ[¤%Ä•È/nˆ… <þù3»\"y\0‘jäÈ6µkçFÕÐÔ!^g³yeìýc}îUKÀís`QÂú“îƒBlÌùærOvG\0æ•W·:naÒæIRèô´9eêØ‘añ!¹±kç&õ†ƒÊ\\—²A™ý¼;_\'&Žn|õùQ5išSM«ò|ûnéªº¶ÈÚ‘ßðýG÷Î¨=–0.-ë¶ ³…Þ7.qŽ¯g]Ø6!„Ø\\:·Ç1o4T4ÄÌ-ÙDÞåóÎ~Å\nÀ‡È=éaŸœW{÷lVKVÄî6n\"…ì\rÿÒÎ[Yj½í\'CuÝ*ÇX¦Iƒ›Hµ´­Ž$M”ÚôÃßÏ®D,¹9*bÚ†«áïþ²Èz–}ü?oª;	Z³„‰¼<úÜòMŸw¨úµþ¦¿‡0ø\"7´iÓ ã†€$VKe±¥•-ª¹µSõö®‹¸Àºº×¨ZKÄôü}:¨&ì&RàLðÎ;ëÅ#QvïÚähÿõ7œ.¿Kõ±\"…Eü’ÚK„\'ßŸÝ zÖx\0×£~|p¨_lBl°¡ÏýÍrPÅWZTeYTÔÞ^Z­þLo½ª D„\nôô9n\n@¬ôRõ\0Í—¡ëAi°,—Zy	è×|ñÉá˜\"Q¥üU—ßw¥jÎtgÐD*Ñu¹x˜b…º[æóÑŸ9r0þ`IgBÈÄ\0QÂ³ßŠzmÞ°æ\r=TÕVïL»ds»¿Î1ÿŒ7cBº×8Ël\0d…0£ñ°yÖÐb-­JçF6ÁêmI<ì.X\\öu‹–¥6•Pe3E’éò33œ§S¤l`}ê}6ínc?ÒßKíBˆé-Û×Õª¾\ZlTÝMÎØ¦ªFÇÜB††úcŽH87[ª}éJµ`f£/˜ôz¾ZjYƒEê‹VoJçX•ÓíkÏg¢ìÜ±ÑÑö”7\nÔ-mîP¡Si÷ùÇ©³æÜ@ùz½_ µü¡«4Âoc@BH<PæýßZ‘Â%KÝë?½µ¸Rìn›sÂDŒPTÏ•ndÀ©,ü#•öýhYEÒ9~07Þ¿¼/fŒ‰\0÷!JÁëm#Ý‘Ý/„A?öïM}H¼X×ÓûFVý¹Àeª¿ÏRö„8t®vÎ+&3æ–©­êù`•c¾	¢Po¾<¦þcYæM!SÄç¬£ <][\ZÉTn÷‡`Œ¿~¾,Ž1(f(>&~½ïîåÎûE‚Z©tqÕd½ÿ2ëYëãÛa„ªgº3!$û¼5\0[s6¬jU?OYú ¸\n@h¹•öòäüHix©ÁdAZ!½¯ŽÕ©)’¸}Ø™¬ùù¾Õ\\~’5…}VR[éäÍEUŽ1èÏ–ª~¬gÝ:±\rBÑ©0^Ò×66«[ƒÙ“YÝS¨l„ˆ@P³°0&‹C²´.qZ5§O&o5|öÑaõÊTg»H«÷Û—ï<ŽÀ©­tc–<14â%Á>–Ž½e„ÜãÔ‰Žye]SöTþ¾„\nŒVSç8sïTÞgdsH”ÇkK#vÛXOÂ^#i<A0+_\"‡žÙ·^‚Œ‡5t–¿Gé}œÈÀn[¼Ü2Ù…6!Äó…=wLž^¤î„+ÝßB¾½q<&ŒÚ¦nÑÊ¤­«#Ú9¥qaÛ;ëm\"ë¹îò¦Û¯²¶Ml+˜©Oô` Õ¬ùb„b‚vúÜ²©-sVÕwëÕ”Y%ª  Ví\\Ýªî\rÉ@Bec®÷ØÀº2-€ @ìôöØ*öï—kR¯Lñvùì	ÓÏIGò[¿|øžsáÓŒüÓ…jòtë^„6!Ä¹Fõ\\«3ç•©\'ÕŽù%]9ó›þûµÕ\\Ý¨Î¯kQÿ”‹×è$$Tà“«UaI££s0mJúÚÈªàì2÷a}wó„Ø·_ÖIoOrùÔžÒÏ»7ŽaßgNîtŒåh¥»E¤6!D¢¿¿×1ìêÌŒUµµÃ}ƒñü…•jc[«újÀ=qnÂBe³aÃ@LÇmFbU?ÀÅ¥·Q\\Þ,öç3(aæ´×Êº‹´õ)X`R{™bßÞ-Žq#1®>V]¨¸é—„¯>;ê˜_.©Rû°h’åÞ@ú¯áÝ’¨,­W#kZÕ3cOWÒBÌB]˜LõNü€ê¾zÃÃÄ¾ü\0k%ôöäVê@ÄìóÆ{Ý§¯ÏùÆóQ³Ó:}UËN­R„â†¹åèHwf*\0w54;úõbÚìRµ¶©Y}Ô?:¶”ê1é*„`ë×$Ž•úŠÇ?¿\\Q%ÎbæÍ3Ñ\'ÿ·óëÄv3ú×Çþ‹Vi9õc°\Z¥6!Ä+÷:æ‘‚üÌløE	½_D!­ïWsT:þn’o/%B…\\xzÃñ„ÁúõÅb?~Ø¼Ù™„q¶e-¡¤½Ô¯¾6†u7©ÝLðãÝ3Ž±£•>ÎÃ•N÷(*	KíBˆØƒé˜Kz2cUUiåDÀ¥s»ÕïO.©“Ç¶ÇÔÔI‰P:îÜL¶½$XÖ\n3˜!Q·ßGïˆqùar—úÔ™2%êú{sq•Øv&0÷P™u©¢ü½¿ÊÂ„¢säs®ÁÚ>×èÜ¨d²@äÞÖÎ6ñ¿œYçp«2¶a\r\rqs:­¬”•¸ðnƒÿ¨¿Û–µ£_n~1\"öãÅ_Ï.«’r§ËY.¤>MæÏˆ\nÕk3Æ\'äû×Ÿ.ªo;3_mŠ>Ç›íN·³RBå·ÇcÄà£>kNÑæÅGƒÕj}kKÌ¸ðôó‚bfp¿!,ó \n: {ßnJ„\nÉ[õŽÈœ¾ÅØÃ”h´ßÆÎèÃ¹Óã»ülVh¥ÞÁ³Ï‹}¤sošYaÖ•~›÷¤v!Ä¨i§Ï)­5£„ê¾;:ZÕt!HV¨v¯v†ªÇKW‡é)*}?2ŸKƒsõªôA\'2pe¿úÏëÎvü¸ülP¾D¿6ÓYÉaîbó®>†O[¢ÖÂêQ*_?~ï–ø „$æs©äÈšVõÖ\"÷à†¶ÿ‰Y2üdYjÈRa·ù¯IêÑ=ïeŒ”ÕôyecˆøCÊ%û:› •tÿxz)b…émÝÇeFÓµµg¶¼‡™Ù¸k™süf¢Þº†äSKBHWwlUw‰ò’zu©7u›ƒû[œkUHu\'Ï&i¡úûÙeG‡ëVø‰!Ã’)¯²„Ð‡æ†ã7g¨»>]~:¦û/SIiÍõ=Œ_/:y²Úiiá\rè†eImBH®}pÐ1¿˜¯¬SçÖ¥>{Ågô_¼ý«IÒéš)¼xk¦Ó…¬Rn òïË†ËïH€þuÌ|™(ó±®w£Op®6:~d“×=@2¡	!Ä¤º®Í1Ç\0ì]:Ñ“Þ²ôUÎ|Ç‹ãIÕ•Îlß_¶ù‹ø“\nYwAÔJq™s/@ûÒ`.?ßzËÔb£ÔGºÖªž?ºq/ê}Þ|çøñoýx‘u¿R{„’(gO9ó‹B¤ôy(]\\îu.ÙxíŸMZ¨††úýnMøÒ LzV8\'a¨ºÔ¾¦Ëo¾e}gŠéf{voûO”ÞÝ¯–ÖÇô³ÊXWÛWî´ð\0®•Ú$„d03âœíÉL²Z”ýÐûýÐeŽKZ¨\nŠ£¾Æy3\nÄÁH c„>ÀCJz¼{q¯zù5§Ë/ˆËÑ„…ëí‚†¦Žˆ/W\Z‹_îÞ<³ec®ë™åøÁà`ŸØ.!„$^Èõù¦¦Ì=“y*9Ôí$sË_š”P!¯žÞIý\"®7¸õë°ÎôàÎi±¸ÍàÓ¯ïLÂå\'!‰@„DR\Z—ÆúÞ¥}jU{W¤þŠÔææ•Îì4•¨—Œr\'( ùâù±BITRŸ6\'\Z½\r>êmtÌMéàù`¥š=¿ÜÑï¯cË;%%T(L¨w€€i0&–°è×©ä»~½Óå·`fA$©­ÔO2¸‰@8þÚžµ×z91²=’äQK\n!–õƒ½enâ¸¢¤÷‰:^SµtN ²¦5’Kz„’*àµÑçžÕuÉï™òÃ¦UN«j` Ö{””P™Ùü¦NÒsë‘#ÛÄöM.ŸßcMþN—ß±ªÔ¸ü$P\rØŒºK”Ù]+èï5–DDW?–ãÏã%ƒ2ñ@ê:}þÁV˜;ÁJÆ\'ÂzõïÉÑ¹oÒôâH°œ>¶¤„ª²ÆÖø´\'¾eóY«Óí÷êÔ¢H™©}gÏÇdü57Æ¦ƒçëÊÔpIQd“ÞwPPœq%PÒ3Ú´26pbùÊúHéhéYBH:h]µÚ1mhÉLVõŽ:gàÞ=Î ¶¤„jÒ´è;}ª¿@\ndÐÔÔê¯øßúõÎèBLü‰¸ü~í8„U·Ðjcµ%vgk‹Õ“µñÛBÃþ|ÿ¢…pw¤gB•Þ¿ûcÛÃZ]é|§…-«Q÷¿=%>BIØ›ªÏE³ß,W¿TÆÌ]©	qõ~ÕË*$\nÔ®Yè/uÒ+Z‘B€:$Rû:—Îíq˜†àDup—ß­öR5Íp;ê”Y¢u¶Ï-«Oº^–Ö­ŽÒˆËyau¡ŠðKô®Z{è‘˜¢µ×²®þk<€¨—ï)R„qÂLI·ufBÕËJœÛvôz{	ÂÉõFýR|bY$ú5¯Ï,QOœÛ·yú Öå·fyp—DEo#°Ø`=½o‰Î_}r›AA¦‰]¥EKNêsçŽâ3 „L1rdØ1/-[^-Îg:O†jÔõÁä‚/	Cï·¼ºulL	UK›Ó—‰µ\'©sTþÕ¯ñ“üÕÜP¼dvºÐå÷Ó\ZY¤ÌŒån \0!ð°–~è\nînDöóõ…E®ÖÜ²‚úHÑGéþ	!$“üùô’š¿¸Ê1G]\\\'¯U½Û×¢jÊ£{iÏ\'‘ðïrµÀè÷Ëk£µªªYFì»Ô±É¿´óRwHmÛ\\<·[½d¸üNÖsùýÓ_)=¢·ì¾ïÝ:©ìÛ¢*kcó]¹k!öp?b	Ipa-ýiY^XC†Œk-%‘à	„¹ë¥îMS\"æ½BÈxlæú<Uml\06ÊfkGrù·w:­ªÎ®5‘ñ$$TØœ«7æ\'{†ôk¦Í)lˆ•ÚØ€¦×¹‚ÚöB\n|p[»o‰\\šµ\r«bê[¥\ZX¤¨£%ƒBÆ¬“#\"[Ÿ³®4º\n”M2x0XãézøÝ™Ä„êÌÉŽ†\Z-«AêT§a‘Óíg+¥¦ËoéìBõ}@·ÛÊy±bsô°¿=[x8ÇŽG‚üºãñŠõÁ÷¬ëQ×…ÒË„&Ö¬íqÌ_^UQR¯ÞMQ½ªž&g­*T\"NH¨•AohÄÇ¦[ý|pñìn±m€c¨ú¨ŸüwR»n@<õëÁÁýþó	ê<ýá\\$“z×šµjÉ\ngE? Ü|ó¦Áˆ›QjŸBÂÆçç3dZ?½.µå@¾°,7½óÊªEËœ“5¬¥\r…Eê¸%X(ßavŒnýü™óË#•y¥¶±ù×tù)Æp¾~=@BX©¿D@¤\"ö Íþ¾ˆuˆÄµe•-ª¶¡]­¶þ}_§ŽïP÷o1Ôœ’`ÄœKÁ‚Å•êàšVõb \\œƒ“¥®Â©…\n!z“^ÏWËæF`ma•~&¥Ô60óM-·Ú	i7\\›å–Ô!„w°—IŸKgÌµæØŽVõl0~Èz2\\èuºÿÊUè\r$‚[ò—Ÿó\\dnD¢¨_ªjƒÕ¹\"„e¹Q?ïÔÚÌl\0^¾¼f¬ÏÀB…dˆmÇ¦°é–ºê7à‡¹+#åAÌv¼€\nú¹}FÅ[/®\ZQ…`Îï:ü„B¼Ù¿w‹c^­*«çàT³¯+\ZªžÐ\Z•Í+S£kA¥]jEñj5eveÌÞ\'Þ¾ub[(¡Ÿ·bn¡úÑ#\r‘Îƒ®Rõ–‘y–™Ô!„ÿüüà¼š1Ï¹oöÃÞô—\0y:X=f%,TØs¤¼ý>õÏ?ÿDøóÏ¿Ôõ¯n«×gFoÎÞ—$E¾]0ü \0‰\\¥ÁKÔ¡ïàöã1ýB	ŽY0Sµª†ZG×ª*„ë?<rqL¨l–D#Fi]jgÔåçŒÏyr¾ºÙî¯¶ÕF¡DÆÉãñÝBñÇ·7Ž9â°øn­8\'§’oFµ!a¡Â&,{Ðàãk_ÅUUƒS…ÿp©T›_$o$;\'C:Ž›×ôõ÷Š}BIœU]Ž¹vskfjUµÖ4%.TØ/dxòô2õèÑ“¡ê^çÌ`ëIoÊ*ª¹L6X“4øëm±ÁAJÚBñÏïîwÌ·óT¨?*Äù9•¼ß×œ¸P!¢Îðò¢Î‘;÷8×±PÃÊ¾Iÿýš{Ð…Nãbg­+Ô‚šgäð[±²Á1>B!©¥´Ò¹¿éÈêÌXU		’ÉêƒmëzGªs?tœ×Ú¶:²¯É-¬ý¿SŠÕæmG,‹ÍÑ‡(À§ÿ«Âkn ž5¿Â3Á-!„ä91²Ý1÷®,Hÿ:HH¨>ýðc°ýß‰0´ù úý÷?\"÷è§§êYQ‹Ífö´‚H]\'ýo°Ê>¾zP\'!„Ôñ÷³ËjÁÛÕŽ9øêºFQ\\ÀÕ¾æHédË$$T°Šô&CUý€úì‹›1Ö˜¿ÄYÙWâøÈ°8FB!©gûðÇÜ\\+Tßô×«öZçü=Ðœ¸›0°P¥\"…ÒŒù5ªcÍ6uúÜUQ lVu½#^oƒ&‘BHz@=Â×f8½hwê\"‚‚MºC-Íêeaù¦¬8ñŒ…Ê€(®\\ëJiõ:UßºÁ¥aÕ·~ŸÚ2<¢>ÿòQ”Lú†ö:ú1Y×+g¸ „’^0ÿêóñ†¶–HÊ£™óäøƒ¥ËªÕí	Õªvgý›K\ZÕ/Ï…&ÞÙqÌÑ@9eÿKŽXßÄ0tB/ïUŸŸQ±]ÿ·\rBØ÷u·ª¿“,â[¨Npî‰}rCšd8pø|L?(ý1|ûT¤>ÊýoYã‰BÆ“ú¦Ž˜¹ÚfêìRµ­£5â\n”„\'(¾„êæ#1Ù¹÷dŒÈüüì¹Úwðì˜ë¯½{›:~êÝ˜óÜÀš•Ù\nêcùóçËŽBÉ<—Î9ÓèäthiQ÷G×¬RE\\¡úëÙå˜òmcD‚ôÚÙ?	Ñ‚ˆ™×è¼ÿÁjÒt§ù¸´ÀºYaL„BÆ3ýÝÈÚÔ–¥¥Lý?¹ëdÊ¿;\0\0\0\0IEND®B`‚','$2a$10$GUc02a5zTdpMvOMblNJ5j.emnu8cpi.TWyC/aLx73D36opL3Cjof2','0977777777','2021-03-30 11:45:02.000000','Male',1,'a',NULL);

/*Table structure for table `member_role` */

DROP TABLE IF EXISTS `member_role`;

CREATE TABLE `member_role` (
  `fk_member_id` int NOT NULL,
  `fk_roles_id` int NOT NULL,
  PRIMARY KEY (`fk_member_id`,`fk_roles_id`),
  KEY `FKjbpk7b90h59dt253x9g3b317m` (`fk_roles_id`),
  CONSTRAINT `FKjbpk7b90h59dt253x9g3b317m` FOREIGN KEY (`fk_roles_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKmlb08pc2sbp26pu5by1t41u59` FOREIGN KEY (`fk_member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `member_role` */

insert  into `member_role`(`fk_member_id`,`fk_roles_id`) values 
(1,1);

/*Table structure for table `night_market` */

DROP TABLE IF EXISTS `night_market`;

CREATE TABLE `night_market` (
  `market_id` int NOT NULL AUTO_INCREMENT,
  `marketurl` varchar(255) DEFAULT NULL,
  `market_comment` varchar(255) DEFAULT NULL,
  `market_memo` varchar(255) DEFAULT NULL,
  `market_name` varchar(255) DEFAULT NULL,
  `market_score` double DEFAULT NULL,
  PRIMARY KEY (`market_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `night_market` */

insert  into `night_market`(`market_id`,`marketurl`,`market_comment`,`market_memo`,`market_name`,`market_score`) values 
(1,NULL,NULL,NULL,'é¥’æ²³å¤œå¸‚',4.2),
(2,NULL,NULL,NULL,'è¯è¥¿è¡—è§€å…‰å¤œå¸‚',4),
(3,NULL,NULL,NULL,'å¯§å¤å¤œå¸‚',3.9),
(4,NULL,NULL,NULL,'å£«æž—å¤œå¸‚',2.5),
(5,NULL,NULL,NULL,'è‡¨æ±Ÿè¡—è§€å…‰å¤œå¸‚',4),
(6,NULL,NULL,NULL,'å»¶ä¸‰å¤œå¸‚',4.6),
(7,NULL,NULL,NULL,'å»£å·žè¡—å¤œå¸‚',4.3),
(8,NULL,NULL,NULL,'å—æ©Ÿå ´å¤œå¸‚',4.1);

/*Table structure for table `order_item` */

DROP TABLE IF EXISTS `order_item`;

CREATE TABLE `order_item` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `amount` int DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `order_memo` varchar(255) DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `fk_order_id` int DEFAULT NULL,
  `fk_product_id` int DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `FK89h3ibjs3o4v4gk3fwm9j9irk` (`fk_order_id`),
  KEY `FKjs3hhxbqu3gtdu2yfhq1t24wq` (`fk_product_id`),
  CONSTRAINT `FK89h3ibjs3o4v4gk3fwm9j9irk` FOREIGN KEY (`fk_order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FKjs3hhxbqu3gtdu2yfhq1t24wq` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`product_id`)
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
(1,'æœªä»˜æ¬¾'),
(2,'æœªå‡ºè²¨'),
(3,'é€è²¨ä¸­'),
(4,'å·²é€é”'),
(5,'å·²å–æ¶ˆ'),
(6,'é€€è²¨ä¸­');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(255) DEFAULT NULL,
  `company_title` varchar(255) DEFAULT NULL,
  `invoice_num` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `order_address` varchar(255) DEFAULT NULL,
  `order_datetime` datetime(6) DEFAULT NULL,
  `order_memo` varchar(255) DEFAULT NULL,
  `order_total` double DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `fk_member_id` int DEFAULT NULL,
  `fk_orderstatus_id` int DEFAULT NULL,
  `fk_paytype_id` int DEFAULT NULL,
  `fk_shiptype_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `UK_nthkiu7pgmnqnu86i2jyoe2v7` (`order_number`),
  KEY `FK5rk3n7epk1ro0ddwtwhgnc35w` (`fk_member_id`),
  KEY `FKf2e0sfxysvpbupeqxw2gctfi2` (`fk_orderstatus_id`),
  KEY `FKa0uxab47ld86fwxogvuul1tg7` (`fk_paytype_id`),
  KEY `FKj0gqv9n43g791xiqxo1jdn3bb` (`fk_shiptype_id`),
  CONSTRAINT `FK5rk3n7epk1ro0ddwtwhgnc35w` FOREIGN KEY (`fk_member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `FKa0uxab47ld86fwxogvuul1tg7` FOREIGN KEY (`fk_paytype_id`) REFERENCES `pay_type` (`pay_type_id`),
  CONSTRAINT `FKf2e0sfxysvpbupeqxw2gctfi2` FOREIGN KEY (`fk_orderstatus_id`) REFERENCES `order_status` (`status_id`),
  CONSTRAINT `FKj0gqv9n43g791xiqxo1jdn3bb` FOREIGN KEY (`fk_shiptype_id`) REFERENCES `ship_type` (`ship_type_id`)
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
(1,'ä¿¡ç”¨å¡/é‡‘èžå¡'),
(2,'éŠ€è¡Œè½‰å¸³'),
(3,'è¶…å•†è²¨åˆ°ä»˜æ¬¾');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `filenamea` varchar(255) DEFAULT NULL,
  `product_info` text,
  `product_memo` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_pic` longblob,
  `product_pica` longblob,
  `product_price` double DEFAULT NULL,
  `product_release` date DEFAULT NULL,
  `product_spec` varchar(255) DEFAULT NULL,
  `product_status` int NOT NULL DEFAULT '0',
  `product_stock` int DEFAULT NULL,
  `fk_product_type_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK4jktecovxfynpkk3i74g8sima` (`fk_product_type_id`),
  CONSTRAINT `FK4jktecovxfynpkk3i74g8sima` FOREIGN KEY (`fk_product_type_id`) REFERENCES `product_type` (`product_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `product` */

insert  into `product`(`product_id`,`filename`,`filenamea`,`product_info`,`product_memo`,`product_name`,`product_pic`,`product_pica`,`product_price`,`product_release`,`product_spec`,`product_status`,`product_stock`,`fk_product_type_id`) values 
(1,NULL,NULL,'ç”¢å“ç‰¹é»ž:\r\n1.ä½¿ç”¨é£Ÿå“ç´šé€²å£400å…‹åŠ åŽšç‰›å¡ç´™ï¼Œå®‰å…¨è¡›ç”Ÿ!!\r\n2.å¯é€è¦–çš„PETçª—å£ï¼Œé€æ˜Žåº¦é«˜ï¼Œå¯ä»¥æ›´å¥½çš„å±•ç¾ç¾Žé£Ÿ!!\r\n3.ä¸‰é‚Šå¡æ‰£è¨­è¨ˆï¼Œç”¢å“æ‰“é–‹é—œé–‰éƒ½æ–¹ä¾¿ï¼Œå¯†å°æ€§èƒ½è‰¯å¥½!\r\n4.å…§éƒ¨é˜²æ°´é˜²æ²¹è¨­è¨ˆï¼Œæœ‰æ•ˆé˜²æ­¢æ»²æ¼!\r\n5.å¯ç”¨æ–¼ç‚¸è–¯æ¢ã€ç‚¸é›žã€æ°´æžœã€æ²™æ‹‰ã€ç‚’é£¯ã€æ—©åˆé¤ç­‰ç­‰\r\n',NULL,'ç¾Žå¼è–¯æ¢å¤–å¸¶ç›’',NULL,NULL,300,NULL,'50å…¥/çµ„',0,1,6),
(2,NULL,NULL,'ç”¢åœ°ï¼šç¾Žåœ‹',NULL,'ç¾Žåœ‹åŽŸè£é€²å£ä¿å†·ç®±',NULL,NULL,2700,NULL,'ç´…è‰²æ¬¾',0,1,5),
(3,NULL,NULL,NULL,NULL,'ä¸‰æ ¼è£å°éº¥é¤ç›’',NULL,NULL,79,NULL,'ç²‰è‰²',0,5,2),
(4,NULL,NULL,'å¤–å°ºå¯¸:21X13X7cm\r\nå®¹é‡ï¼š1000mlã€‚â€»é£¯èœåˆ†é›¢è¨­è¨ˆï¼Œä¸åƒ…ç¾Žè§€ï¼Œæ›´åŠ å¯¦ç”¨\r\nâ€»å…§é™„ç­·å‹ºé¤å…·ï¼Œè¶…ç´šè²¼å¿ƒ\r\nâ€»å¸¦ææ‰‹ ã€‚å°ºå¯¸ã€å®¹é‡ã€é‡é‡çš†ä»¥æ‰‹å·¥æ¸¬é‡ï¼Œè«‹ä»¥å¯¦ç‰©ç‚ºæº–\"',NULL,'ç§¸ç¨ˆé¤ç›’å¥—çµ„',NULL,NULL,79,NULL,'è˜‹æžœç¶ ',0,3,2),
(5,NULL,NULL,'\"å°ºå¯¸ï¼š4.7å…¬åˆ†\r\nå…±8å…¥\r\næè³ªï¼šABSæ¨¹è„‚\r\nè€å†·.ç†±ï¼š-20ï½ž70åº¦\"',NULL,'æ—¥æœ¬åŽŸè£æ°´æžœå‰',NULL,NULL,89,NULL,'è¬è–æ¬¾',0,20,2),
(6,NULL,NULL,'\"ç”¢å“å„ªå‹¢:\r\n1.?å››ç¨®å°ºå¯¸ï¼Œç”±å¤§åˆ°å°ï¼Œæ”¾é¤é»žä¸äº’ç›¸æ²¾æŸ“!\r\n2.?è€é«˜æº«ï¼Œå¯å¾®æ³¢çˆåŠ ç†±ï¼Œé€šéŽç¾Žåœ‹FDAèªè­‰!\r\n3.?å®‰å…¨çŸ½è† ï¼ŒæŠ˜ç–Šå¾Œé«”ç©è¶…å°ï¼Œæ”œå¸¶è¶…æ–¹ä¾¿!\r\n4.?çŸ½è† å¯å¡‘æ€§é«˜ï¼Œéžå¦‚é™¶ç“·æˆ–æ˜¯çŽ»ç’ƒï¼Œå®¹æ˜“æ’žæ“Šç ´ç¢Ž!\"',NULL,'å®‰å…¨çŸ½è† æŠ˜ç–Šç›’',NULL,NULL,199,NULL,'æ¹–æ°´ç¶ æ¬¾',0,3,2),
(7,NULL,NULL,'\"m\'saé€ åž‹ é£Ÿç‰©å‰\r\nèƒ½è®“é£Ÿç‰©å¢žæ·»ç«¥è¶£??\r\nç”¢å“å°ºå¯¸:èŠ±æ¤°èœ-44Ã—13Ã—13mm é‘«é‘«è…¸-44Ã—15Ã—13mm è›‹-44Ã—12Ã—7mm è¦-45Ã—21Ã—9mm\r\næè³ªï¼šæ¨¹è„‚\r\nè€ç†±ï¼š70åº¦-20åº¦\"',NULL,'æ—¥æœ¬åŽŸè£ä¾¿ç•¶å°ç‰©',NULL,NULL,70,NULL,'ä¾¿ç•¶æ¬¾',0,24,2),
(8,NULL,NULL,'\"ã€å•†å“è¦æ ¼ã€‘\r\næ¹¯åŒ™å°ºå¯¸ï¼šé•·18.7cm å¯¬3.8cm é‡é‡33g\r\nç­·å­å°ºå¯¸ï¼šé•·18.6cm é‡é‡16g\r\nå¤–ç›’å°ºå¯¸ï¼šé•·23cm å¯¬5.2cmé«˜3.5cm é‡é‡56g\r\nå•†å“é¡è‰²ï¼šæ·±è—ã€è»ç¶ ã€ç²‰æ©˜ã€é…’ç´…\r\nå•†å“æè³ªï¼š304ä¸é½é‹¼ã€çŸ½è† ã€ABS\"',NULL,'304è¶…å€¼æ„Ÿé¤å…·çµ„',NULL,NULL,99,NULL,'éœ§è‰²æ¬¾',0,1,2),
(9,NULL,NULL,'\"å“åï¼šçç å¥¶èŒ¶å¸†å¸ƒåŒ…\r\næè³ªï¼šçµ²çµ¨å¸ƒ\r\nå°ºå¯¸ï¼š(å°)35cmÃ—30cmï¼›(å¤§)40cmÃ—35cm\r\né‡é‡ï¼š(å°)117gï¼›(å¤§)151g\r\n\r\nç‰¹è‰²ï¼š\r\n1.æš—æ‰£å…§è¢‹\r\nä¾¿æ–¼æ”¶ç´ï¼Œå¯æ”¾ç§å¯†ç‰©å“ç­‰å°ç‰©ä»¶\r\n\r\n2.åŠ å¤§å®¹é‡\r\næ›´å¤šçš„å„²ç‰©ç©ºé–“ï¼Œæ»¿è¶³ä¸Šèª²ã€å‡ºè¡Œéœ€æ±‚\r\n\r\n3.åŠ åŽšè‚©å¸¶\r\næŸ”éŸŒè€ç”¨\r\nå®‰å¿ƒç½®ç‰©ä¸å‹’è‚©\r\n\r\n4.é›™é‡è»Šç·š\r\nç²¾å¯†ç¸«ç·šï¼Œè€ç”¨è€ç£¨ï¼Œä¸æ˜“ç ´æ\r\n\r\n5.çµ²çµ¨è¡¨å±¤\r\nèˆ‡çœ¾ä¸åŒçš„æ‰‹æ„Ÿé«”é©—\r\n\"',NULL,'çç å¥¶èŒ¶å¸†å¸ƒè¢‹',NULL,NULL,149,NULL,'çç å¥¶èŒ¶æ¬¾',0,7,3),
(10,NULL,NULL,'\"â­ï¸å°ºå¯¸: \r\nå°ç›¤20cm\r\nå¤§ç›¤27cm\r\n\r\nâ­ï¸ä½¿ç”¨èªªæ˜Ž:\r\n?å¯é‡è¤‡ä½¿ç”¨\r\n?å¯æ”¾90â„ƒä»¥ä¸‹ç†±é£Ÿ\r\nâŒä¸å¯å¾®æ³¢\r\nâŒä¸å¯æ”¾å…¥çƒ¤ç®±\r\nâŒä¸å¯æ”¾å…¥æ´—ç¢—æ©Ÿ\r\nâŒä¸å¯æ”¾å…¥æ¶ˆæ¯’æ«ƒ\"',NULL,'é«˜è³ªæ„Ÿå…æ´—ç›¤',NULL,NULL,250,NULL,'50å…¥',0,9,6),
(11,NULL,NULL,'\"ã€‚å½ˆæ€§çŸ½è† ç¶å¸¶ï¼Œå…¼å®¹å¸‚å”® 350ml åˆ° 750ml é£²æ–™æ¯\r\nã€‚å¸ç®¡ç’°è¨­è¨ˆï¼Œç²—/ç´°å¸ç®¡éƒ½å¯ç‰¢ç‰¢å¥—ä½\r\nã€‚ç°¡ç´„è¼•å·§éš¨èº«å¸¶ï¼Œä½¿ç”¨å¥½æ–¹ä¾¿\r\nã€‚çŸ½è† æè³ªè¼•é¬†å¯æ°´æ´—ï¼Œé«’æ±¡ä¸æ®˜ç•™\r\n\r\n\r\nå•†å“è¦æ ¼\r\nåŸºæœ¬è³‡è¨Š\r\næœ¬é«”é‡é‡        é€—æ‰£è§’è‰²æ¬¾ï¼š25 g / ç°¡ç´„é»‘ç™½æ¬¾ï¼š17 g\r\næœ¬é«”å°ºå¯¸        é€—æ‰£è§’è‰²æ¬¾ï¼šW120 x H180 x D15 mm / ç°¡ç´„é»‘ç™½æ¬¾ï¼šW120 x H180 x D10 mm\r\næè³ª        çŸ½è† \r\nåŒ…è£å…§å®¹ç‰©        Cup Tie ç’°ä¿æ¯ç¶\r\nã€‚å¯æ„›èŒè§’è‰²/å€‹æ€§ç°¡ç´„é¢¨ï¼Œéš¨å¿ƒè®Šæ›é¢¨æ ¼\r\n\r\næœ¬å•†å“é©ç”¨æ¯å£ç›´å¾‘ 7 - 10cmã€å¯¬å£æ¯åž‹&éœ€æœ‰æ¯ç·£(å¤ªç´°/å¤ªçª„çš„æ¯ç·£ä¸å»ºè­°ä½¿ç”¨ï¼Œä¾‹å¦‚COCO)ï¼Œå¯å…¼å®¹å¸‚é¢ä¸Š 350ml åˆ° 750ml é£²æ–™æ¯ã€‚* å†°éœ¸æ¯&å·§åŠ›æ¯å› ç‚ºæ²’æœ‰æ¯ç·£ï¼Œä¸å»ºè­°ä½¿ç”¨å“¦ * *è‹¥ä½¿ç”¨æˆ‘å€‘ä¸å»ºè­°çš„æ¯æ¬¾ï¼Œæœƒé€ æˆæ¯å­è„«è½ï¼Œé‚„è«‹æ³¨æ„*\"',NULL,'é€ åž‹é£²æ–™æç’°',NULL,NULL,119,NULL,'å¡é€šæ¬¾',0,5,1),
(12,NULL,NULL,'\"å•†å“çš†ç‚ºæ‰‹å·¥è£½ä½œ å“è³ªæœ‰ä¿éšœ\r\næ¯å¥—ç ¸é‡æœ¬ ç¸«è£½é›™å±¤é›™é¢éƒ½å¯ä½¿ç”¨ æå¸¶é•·åº¦å¯æŽ›æ©Ÿè»Šå‹¾å‹¾\r\nä¸€èˆ¬æ‰‹æ–é£²æ–™ã€å’–å•¡çš†å¯ä½¿ç”¨\r\næè³ªï¼šå…©é¢ç”¨ åŽšå¯¦å¯æ°´æ´—å¸†å¸ƒ é«’äº†æ–¹ä¾¿æ¸…æ´—  \r\nå¤–é¢ç¾Žåˆ°ä¸è¡Œ è£¡é¢ä¹Ÿç¾Žåˆ°ä¸è¡Œ\r\n\r\nä»Šå¹´é–‹å§‹è²·é£²æ–™ä¸æä¾›æ¯è¢‹\r\näººäººéƒ½æ‡‰è©²æ“æœ‰ç’°ä¿é£²æ–™æè¢‹ ä¸€èµ·çœéŒ¢æ„›åœ°çƒ\r\n\r\næ–¹å½¢æè¢‹æ¬¾é‚„å¯ä»¥ç•¶ä½œæ‰‹æå°åŒ…åŒ… æ”¾æ‰‹æ©Ÿé‘°åŒ™å°ç‰©\"',NULL,'å¤§ç†çŸ³ç’°ä¿æ¯è¢‹',NULL,NULL,49,NULL,'å¤§ç†çŸ³æ¬¾',0,6,1),
(13,NULL,NULL,'\"äºŒæ‰‹??æ¥µæ–°??æ—¥å¼æœ¨ä½œæ”¤è»Š/å¤æ—©å‘³æ—¥å¼é£¯ç³°?é¤è»Š/æœ¨è³ªæ—©é¤æ”¤è»Š\r\nï¼ç™½éµè¨‚è£½æ¬¾ï¼\r\nNT.38000\r\n\r\nå°ºå¯¸ï¼š\r\n150*85*210å…¬åˆ†\"',NULL,'é£¯ç³°æ”¤è»Š',NULL,NULL,10000,NULL,'é£¯ç³°é¤è»Š',0,0,8),
(14,NULL,NULL,'\"äº”è‡Ÿä¿±å…¨å¯æ‹†è³ªæ„Ÿæ”¤è»Šã€\r\n\r\nâ­ï¸æ”¤è»Šè¡¨é¢å¾®é˜²æ½‘æ°´ï¼Œæœ‰é«’æ±¡ä¹Ÿå¥½æ¸…æ½”\r\nâ­ï¸æ¡Œé¢å…§éƒ¨æœ‰è²¼å¿ƒã€Œéµæ¿ã€åšéš”ç†±ï¼Œè€é«˜æº«è€é«’å¥½æ¸…ç†ï¼\r\nâ­ï¸å…©é•·æ¡¿å¯ä»¥æ‡¸æŽ›å¸†å¸ƒLogo,è®“æ”¤è»Šæ›´å¸ç›\r\nâ­ï¸æœ‰ã€ŒæŠ½å±œå¯ä¸ŠéŽ–ã€ï¼Œéˆ”ç¥¨æ‰¾é›¶æ‰‹æ©Ÿå¯æ”¾æŠ½å±œï¼\r\nâ­ï¸æ”¤è»Šå…§éƒ¨æœ‰è¶³å¤ æ”¶ç´ç©ºé–“\r\nâ­ï¸é™„ã€Œé•·åž‹è³ªæ„ŸçŽ»ç’ƒæ«ƒã€å¯ä»¥å±•ç¤ºå•†å“\r\nâ­ï¸é™„ä¸Šå¤§å‚˜å¯ä¾›é®é™½é¿é›¨\r\nâ­ï¸è¼ªå­çš†æœ‰å®‰å…¨ç…žè»Šè£ç½®\r\nâ­ï¸å¯ä»¥å†è‡ªè¡Œè²¼çš®æ”¹é¡è‰²\r\n\r\n?é‡é»ž?\r\nå¯æ‹†æˆæ‰å¹³çš„ï¼Œä¸€èˆ¬è½Žè»Šå¯è¼‰ï¼\r\nä¸€å°è½Žè»Šå°±å¯ä»¥å‡ºåŽ»åšç”Ÿæ„äº†ï½ž\r\næ—¥å¸¸ä¹Ÿå¥½æ”¶ç´ï¼ï¼\r\n\"',NULL,'é›žè›‹ç³•é¤è»Š',NULL,NULL,15000,NULL,'è›‹ç³•æ”¤è»Š',0,1,8),
(15,NULL,NULL,NULL,NULL,'æ¤çº–å¤–å¸¶é¤ç›’',NULL,NULL,800,NULL,'250å…¥/çµ„',0,14,6),
(16,NULL,NULL,'\"å°ºå¯¸ï¼šé•·15cm é«˜27.5cm å¯¬9cm\r\n\r\nè‡ªè£½æ¬¾å“¦ï¼Œå­—æ¯ç”¨ç´…è‰²æ¯”è¼ƒç°¡å–®é¡¯çœ¼ï¼Œçœ‹èµ·ä¾†ä¹Ÿç¨ç‰¹\r\n\r\næ‹ç…§ç°å¸¸å¥½çœ‹çš„å–”\r\n\r\nå¯ä»¥ç•¶åšç¦®å“åŒ…è£è¢‹ï¼Œç³–æžœè¢‹ çƒ˜ç„™é¤…ä¹¾è¢‹\"',NULL,'é˜²æ²¹ç¬‘è‡‰ç´™è¢‹',NULL,NULL,200,NULL,'100å…¥/çµ„',0,33,7),
(17,NULL,NULL,'\"?å°ºå¯¸ï¼š11*16CMï¼ˆå¯¦éš›å¯è£å¤§å°)\r\n?æè³ªï¼šç´™\r\n?ç´™è³ªå¾®é€ï¼Œ\r\nå…§å±¤é˜²æ°´é˜²æ²¹å¡—å±¤ï¼Œå¯ç•¶åšé¤…ä¹¾åˆ†è£è¢‹ï¼\r\né©åˆåˆ†è£å°ç‰©é€ç¦®è‡ªç”¨éƒ½okï¼Œ\r\nå°ç†Šåœ–æ¡ˆç²‰å«©å¯æ„›ï¼Œå…±æœ‰å››ç¨®æ¬¾å¼å¯ä»¥æŒ‘é¸ï½ž\r\næ­¤æ¬¾ç´™è¢‹å°ºå¯¸åå°ï¼Œå»ºè­°å°ä»™å¥³è³¼è²·å‰å…ˆæ¸¬é‡å¤§å°å”·ï¼\r\n\r\n\"',NULL,'å°ç†Šç´™è¢‹',NULL,NULL,250,NULL,'100å…¥/çµ„',0,29,7),
(18,NULL,NULL,'\"å°ºå‹ï¼š8è‹±å‹ 20.5å…¬åˆ†ï¼ˆå¸¶æŸ„é•·åº¦ï¼‰15.5å…¬åˆ†ï¼ˆé¢å¾‘ï¼‰ï¼‰5.5å…¬åˆ†ï¼ˆé«˜åº¦ï¼‰\r\n           å®¹é‡500ML\r\nå°ºå¯¸æ­£è² èª¤å·®ä¸€å…¬åˆ†å…§ï¼ˆå› æ¯å€‹ä½¿ç”¨çš„å°ºä¸åŒï¼‰           \r\næè³ªï¼šé™¶ç“· \r\né©ç”¨ï¼šæ´—ç¢—æ©Ÿã€å¾®æ³¢çˆã€æ¶ˆæ¯’æ«ƒ \r\né¢¨æ ¼ï¼šæ­å¼ç´”è‰² \r\nå·¥è—ï¼šå°å½©é‡‰ä¸‹å½© \r\nç”¢å“æ ¹æ“šé¤å…·ç”Ÿç”¢æ¨™æº–åš´æ ¼æŠŠé—œï¼Œé‡‰ä¸‹å½©è‰²å°èŠ±å°èº«é«”ç„¡ä»»ä½•å‰¯ä½œç”¨ï¼Œè«‹æ”¾å¿ƒä½¿ç”¨ã€‚\r\n\r\né™¶ç“·é¤ç›¤é›£å…æœ‰ç¼ºé‡‰ã€å°æ°£æ³¡ã€æµé‡‰ã€æ°£æ³¡å­”æˆ–é»‘é»žã€è‰²æšˆç­‰å°ç‘•ï¼Œ\r\nå‡ºè²¨æª¢æŸ¥ä¸å½±éŸ¿ä½¿ç”¨æ‰æœƒå¯„å‡ºã€‚\r\nè«‹èƒ½æŽ¥å—å†ä¸‹æ¨™ï¼Œæ‹¿è²¨å‰éƒ½æœƒå¹«å¤§å®¶æª¢æŸ¥ï¼Œé«˜æ¨™è²·å®¶è«‹ç¹žé“åŽ»å¯¦é«”åº—é¢è³¼è²·ã€‚\r\né™¶ç“·å•†å“å› æ˜“ç¢Žçš„ç‰¹æ®Šæ€§ é–‹ç®±è«‹éŒ„éŸ³ä¿éšœå½¼æ­¤ ä¸æŽ¥å—å›žå®¶ç™¼ç¾å°ºå¯¸å¤ªå°æˆ–è€…å¤ªå¤§ å•†å“å°ºå¯¸å‡æœ‰æ¨™è­˜ é€™äº›éƒ½ä¸äºˆé€€è²¨ \r\næ„Ÿè¬æ‚¨ï¼\"',NULL,'é™¶ç“·æ¡æŸ„é‹ç¢—',NULL,NULL,129,NULL,'å¢¨ç¶ æ¬¾',0,10,4),
(19,NULL,NULL,'?å•†å“è©³æƒ…\r\nâž¢é©åˆç›´å¾‘ 11cmå·¦å³çš„å¥¶èŒ¶æ¯\r\nâž¢æ¯å¥—å¯¬ 7cm æ‰‹ç¹©é•·ç´„ 19cm\r\nâž¢é¡è‰²: ç™½è‰²ä¸€å®¶äººæ¯å¥—,ç²‰è‰²æŸ¥ç†æ¯å¥—\r\nâž¢æè³ª: å¸ƒ\r\nâž¢é¢¨æ ¼ï¼šå¡é€š\r\n\"',NULL,'å²å¥´æ¯”ç’°ä¿æ¯å¥—',NULL,NULL,59,NULL,'å²å¥´æ¯”æ¬¾',0,1,1),
(20,NULL,NULL,'æ€§åƒ¹æ¯”éžå¸¸é«˜çš„ä¸€æ¬¾ç£æ€§é»‘æ¿ï¼ŒçœŸæ­£çš„ç‰©ç¾Žåƒ¹å»‰ï¼Œå»ºè­°æ­é…ç†’å…‰ç­†ä¸€èµ·è³¼è²·ã€‚\r\n\r\néœ€è¦è²¨åˆ°ä»˜çš„è«‹è¯ç³»å®¢æœï¼\r\n\r\nå› å¤§ä»¶å•†å“ã€‚åªèƒ½èµ°å®…é…ï¼Œé‹è¼¸é€”ä¸­å¦‚æœ‰ç ´æï¼Œå¯æ›å¯é€€ï¼Œæ°´æ°´å€‘æ”¾å¿ƒé¸è³¼ï¼\r\n\r\nå¾©å¤åšèˆŠç«‹å¼å¯¦æœ¨å°é»‘æ¿èŠ±æž¶ï¼Œæ¿é¢ç‚ºé‰„çš®é¢ï¼Œé©ç”¨äºŽç²‰ç­†,ç†’å…‰ç­†ï¼Œæœ‰ç£æ€§ï¼Œå¯å¸é™„ç£é‡˜ï¼Œå›ºå®šæµ·å ±ç­‰ï¼ï¼\r\næè³ªï¼šå¤©ç„¶æ¡æœ¨\r\né‚Šæ¡†æœ‰7ç¨®é¡è‰²ï¼šè—è‰² ç²‰è‰²  æ£•è‰² é»ƒè‰² ä¹³ç™½è‰²  çŽ«ç´…è‰²\r\n\r\nå…¨å°ºå¯¸42*42*115CMï¼Œæ›¸å¯«å€38*58CMï¼Œé»‘æ¿æ˜¯ä¸€æ¬¾éžå¸¸é©åˆåšåº—é‹ªå»£å‘Šçš„å°é»‘æ¿\r\nç”¢å“æ¸¬é‡ç‚ºæ‰‹å·¥æ¸¬é‡ï¼šå¯èƒ½æœƒå­˜åœ¨1CMå·¦å³çš„èª¤å·®å”·\r\næ³¨æ„ : æœ¬ç”¢å“é›–ç„¶æœƒéš¨è²¨é™„è´ˆç²‰ç­†ï¼Œ\r\nä½†æ˜¯é‹é€é€”ä¸­æœ‰å¯èƒ½è®“ç²‰ç­†æŠ˜æ–·ã€‚\r\nåœ¨æ­¤ç‰¹åˆ¥å¼·èª¿ï¼Œæˆ‘å€‘è²©å”®çš„åƒ¹æ ¼å°±æ˜¯é»‘æ¿çš„åƒ¹æ ¼ï¼Œ\r\nå…¶å®ƒé™„å¸¶çš„è´ˆå“éƒ½æ˜¯é¡å¤–é€çš„ï¼Œ\r\nç„¡æ³•å› è´ˆå“æœ‰ä»»ä½•ç‹€æ³è¦æ±‚é€€æ›è²¨ï¼\r\nè¨±å¤šè³£å®¶ä¹¾è„†æŠŠè´ˆå“å…¨éƒ¨æ‹¿å‡ºä¾†ä¸Ÿæ£„ï¼Œ\r\nä»¥å…é™¤ä¸å¿…è¦çš„å›°æ“¾ã€‚æœ¬åº—æœ¬è‘—æœå‹™é¡§å®¢çš„å¿ƒæ…‹ï¼Œ\r\nä»å°‡è´ˆå“ä¿ç•™é€çµ¦å®¢äººï¼Œ\r\nä½†ä¹Ÿè«‹å„ä½æœ‰æ‰€èªçŸ¥ï¼Œ\r\nä¸å¾—å› è´ˆå“æœ‰ä»»ä½•ç‹€æ³è¦æ±‚é€€æ›è²¨ã€‚\r\nPS.ç²‰ç­†å¤ªå®¹æ˜“æ–·äº†ã€‚',NULL,'ç£æ€§ç«‹å¼é»‘æ¿',NULL,NULL,300,NULL,'ç²‰è‰²æ¬¾',0,2,5),
(21,NULL,NULL,'9å°ºæˆ¶å¤–ä¼‘é–’é®é™½å‚˜2.7ç±³',NULL,'å¤§åž‹æ“ºæ”¤å‚˜',NULL,NULL,2800,NULL,'ç¶ æ¬¾2.7ç±³',0,0,5),
(22,NULL,NULL,'\"â§— å°ºå¯¸ï¼š\r\n   (1) æ¹¯åŒ™ï¼šé•·ç´„23å…¬åˆ†ã€å¯¬ç´„4.1-4.3å…¬åˆ†ã€‚\r\n   (2) ç­·å­ï¼šé•·ç´„23.5å…¬åˆ†ã€‚\r\nâ§— ç‰¹è‰²ï¼š\r\n1. æŽ¡ç”¨åŽŸæœ¨è£½æˆçš„æ¹¯åŒ™ã€ç­·å­ï¼Œç¶“è£½åˆ‡å‰²æ‰“ç£¨ï¼Œç„¡æ¯›åˆºä¹Ÿä¸æ‰Žæ‰‹ã€‚\r\n2. å¤–è§€è¨­è¨ˆç¬¦åˆäººé«”å·¥å­¸ï¼Œæ¡æ„Ÿæ¥µä½³ã€‚\r\n3. å¤–è§€æ¥µç°¡æ™‚å°šï¼Œé€ åž‹ç·šæ¢å„ªé›…ï¼Œæ·¡æ·¡çš„å°±èƒ½è®“äººæ„Ÿåˆ°é£Ÿå…‰çš„ç¾Žå¥½ã€‚\r\n4. ä¸ç®¡æ˜¯åœ¨è‡ªå®¶é¤æ¡Œä¸Šã€åº—é¢ã€ç”œé»žã€æ—©åˆé¤åº—ã€é¤å»³ï¼Œéƒ½æ˜¯è³žå¿ƒæ‚…ç›®çš„ç¾Žå¥½å­˜åœ¨ã€‚\r\n5. æ—¥éŸ“ç¶²ç´…ã€æ“ºæ‹å¸¸ç”¨çš„é¤å…·æ¬¾å¼ï¼Œå¤©ç„¶å„ªè‰¯çš„å“è³ªææ–™ï¼Œå…¼å…·ç¾Žè§€èˆ‡å¯¦ç”¨ã€‚\"',NULL,'ç°¡ç´„æœ¨è³ªé¤å…·çµ„',NULL,NULL,50,NULL,'æœ¨ç´‹çµ„',0,30,2),
(23,NULL,NULL,'å°éº¥ç§¸æ¡¿é¤å…·çµ„\r\nå…§å®¹ç‰©ï¼šç­·å­ã€æ¹¯åŒ™ã€å‰å­ã€æ”¶ç´ç›’\r\næè³ªï¼šç§¸æ¡¿+PPæè³ª\r\n\r\nä¾¿æ–¼æ”œå¸¶çš„é¤å…·çµ„ï¼Œ\r\nç¾åœ¨ç’°ä¿æ„è­˜æŠ¬é ­ï¼Œ\r\nåŠ ä¸Šè¡›ç”Ÿç¿’æ…£ï¼Œ\r\nå¾ˆå¤šäººéƒ½é–‹å§‹è‡ªå¸¶é¤å…·å‡ºé–€äº†ï¼Œ\r\né€™çµ„ç®—æ˜¯ä¾¿å®œçš„å…¥é–€æ¬¾ï¼Œ\r\nå¯ä»¥å¾ˆå¥½çš„é¤Šæˆç¿’æ…£ï¼Œ\r\nå³ä½¿å¿˜äº†å¼„ä¸Ÿäº†ä¹Ÿä¸æœƒå¤ªå¿ƒç–¼ã€‚\"',NULL,'è¼•å·§å°éº¥é¤å…·çµ„',NULL,NULL,39,NULL,'ç²‰è‰²æ¬¾',0,10,2),
(24,NULL,NULL,'\"æ‰‹æé•·:15cm\r\nå¯è£500ccèˆ‡700ccçš„é£²æ–™ï¼Œ\r\nå´é‚Šæœ‰é™„å¸ç®¡æ‰£(é¬†ç·Šå¼)ï¼Œç’°ä¿åˆæ–¹ä¾¿ï¼\r\n<æ‰‹å·¥æ¸¬é‡ï¼Œæœƒæœ‰å¾®å¾®èª¤å·®ï¼Œèƒ½æŽ¥å—å†ä¸‹å–®å–”>\"',NULL,'çŽ©è½‰é£²æ–™æè¢‹',NULL,NULL,49,NULL,'å¡é€šæ¬¾',0,5,1),
(25,NULL,NULL,'â£ï¸å•†å“èªªæ˜Ž\r\n  ã€”æè¢‹æè³ªã€•ç™½ç¹”å¸ƒ ç„¡é˜²æ°´\r\n  ã€”å¸ç®¡æ”¶ç´ã€•å´é‚Šæœ‰å¸ç®¡æ”¶ç´ \r\n  ã€”æè¢‹å°ºå¯¸ã€•9.5x12cm \r\n  ã€”æ‰‹æé•·ã€•15cm\r\n  ã€”é©åˆæ¯å­ã€•\r\n8.5cm~9.5cmæ¯åœ“\r\n500c.c~700c.c\r\nâ€»æœ¬å•†å“ä¸é©ç”¨èƒ–èƒ–æ¯èˆ‡å†°å£©æ¯\"',NULL,'æ—¥éŸ“å¯æ„›é£²æ–™æè¢‹',NULL,NULL,59,NULL,'å°ç†Šæ¬¾',0,10,1),
(26,NULL,NULL,'\"ç´ ç´ çš„ç’°ä¿æ¯ç¶è¨­è¨ˆã€‚è®“è‡ªå·±æ„Ÿå—åˆ°åœ°çƒåœ¨å‘¼å¸çš„å‰µæ„è¨­è¨ˆ\r\nä¸€èµ·æ„›å¿ƒåšç’°ä¿ï¼Œç°¡ç´„å€‹æ€§å–®è‰²ï¼Œ\r\nå½ˆæ€§çŸ½è† ç¶å¸¶ï¼Œé€šç”¨æ€§ä½³?\r\nå¯ä»¥è¼•é¬†æ°´æ´—ï¼Œé€Ÿä¹¾ä¸æ€•é«’?\r\né©ç”¨æ¯å£ç›´å¾‘7 - 10cmï¼Œ\r\nå…¼å®¹å¸‚å”®350 - 750mlçš„é£²æ–™æ¯?\r\nå†·ç†±é£²éƒ½èƒ½ä¸€æ‰‹æžå®šâ˜•\r\nå¸ç®¡ä¸æ€•æ²’åœ°æ–¹æ”¾ï¼Œ\r\nå¸ç®¡ç’°è¨­è¨ˆè¶…æ–¹ä¾¿ï¼Œç²—ç´°å¸ç®¡éƒ½èƒ½æ”¶?\r\nå¯æ”¶æŠ˜è€Œä¸”è¶…è¼•ï¼Œä¸ç”¨çš„æ™‚å€™ä¹Ÿå¯ä»¥æ”¶åœ¨éš¨èº«åŒ…è£¡~\r\nç’°ä¿åˆæœ‰åž‹â¤ä½¿ç”¨å¿ƒæƒ…ä¹Ÿç¾Žå¥½?\r\n\r\n?å•†å“ç‰¹è‰²\r\n?çŸ½è† æè³ª?å¥½æ¸…æ´—ä¸æ€•é«’ï¼Œå½ˆæ€§å¥½ã€æ›´é€šç”¨\r\n?æ–¹ä¾¿æ”œå¸¶?å¯æ”¶æŠ˜ï¼Œè¼•é¬†æ”¶ç´é€²åŒ…åŒ…è£¡\r\n?å¸ç®¡ç’°è¨­è¨ˆ?ç²—ç´°å¸ç®¡éƒ½èƒ½æ”¾ï¼Œä¸æ€•ç„¡è™•æ”¾\r\n?å…¼å®¹å¥½ç”¨?å¸‚å”®350~750mlé£²æ–™æ¯ï¼Œå†·ç†±é£²éƒ½èƒ½ä½¿ç”¨\r\n\r\n?å•†å“è¦æ ¼\r\nå“ç‰Œï¼šBone\r\nå°ºå¯¸ï¼šç´„ 12 x 18 x 1.5 cm\r\næ·¨é‡ï¼šç´„ 25 g\r\næè³ªï¼šçŸ½è† ',NULL,'è¶…å½ˆåŠ›ç’°ä¿æ¯å¥—',NULL,NULL,99,NULL,'é»‘è‰²æ¬¾',0,3,1),
(27,NULL,NULL,'è¨‚è£½å“(ä¸å«ç‡ˆç± )\r\nå°ºå¯¸:é•·157xå¯¬64xé«˜225cm',NULL,'å¾©å¤æœ¨è£½æ”¤è»Š',NULL,NULL,7500,NULL,'æ‰æœ¨æ¬¾',0,1,8),
(28,NULL,NULL,'å…©ç”¨åŒ…æœ‰æ‰‹ææŠŠæ‰‹ã€å¦æœ‰é•·èƒŒå¸¶å¯è‚©èƒŒã€å´èƒŒ?æ—é‚Šå£è¢‹ä¸Šæœ‰ç†Šç†Šçš„åˆºç¹¡ï¼Œå¯æ„›åº¦æ»¿æ»¿?\r\n\r\né¡è‰²ï¼šé»‘è‰²ã€ç±³è‰²ã€æ£•è‰²\r\næè³ªï¼šååŽšçš„å¸†å¸ƒï¼Œå¾ˆæœ‰è³ªæ„Ÿ\r\nå°ºå¯¸ï¼š22x21.5cm',NULL,'éŸ“åœ‹å…©ç”¨å¸†å¸ƒè¢‹',NULL,NULL,200,NULL,'ç™½è‰²æ¬¾',0,1,3),
(29,NULL,NULL,'\"å•†å“ç‰¹è‰²:\r\n1. æŽ¡ç”¨ç‰›æ´¥å¸ƒè€ç£¨è€ç”¨ä¸æ˜“æå£žã€‚\r\n2. è¶…å¤§å®¹é‡ï¼Œå¤–å‡ºæ”œå¸¶è¶…ä¾¿åˆ©ã€‚\r\n3. ä¿æº«ã€ä¿å†·ã€ä¿å†°éƒ½å¾ˆé©åˆã€‚\r\n4. æœ‰æ‹‰éŠï¼Œå¯†å°æ•ˆæžœæ›´å¥½ã€‚\r\n5. æœ‰ææ‰‹ï¼Œç„¡è«–ç•¶ä¾¿ç•¶è¢‹æˆ–è³¼ç‰©è¢‹éƒ½å¾ˆé©åˆã€‚\r\n\r\nå“å: åŒ—æ­é¢¨è¶…å¤§é˜²æ°´ä¾¿ç•¶è¢‹\r\n\r\næè³ª: ç‰›æ´¥å¸ƒ+çç æ£‰+PVC\r\n\r\nå°ºå¯¸: é•·æ¬¾(é«˜åº¦33+æ‰‹æŠŠ12*å¯¬åº¦24*å´é¢15CM)\r\nçŸ­æ¬¾(é«˜åº¦22+æ‰‹æŠŠ12*å¯¬åº¦24*å´é¢15CM)\"',NULL,'ç°¡ç´„é¢¨é˜²æ°´ä¿æº«è¢‹',NULL,NULL,199,NULL,'é»‘è‰²æ¬¾',0,10,3),
(30,NULL,NULL,'\"ç‰›çš®ç³»åˆ—å„å¼å°ºå¯¸ç´™æ¹¯æ¯/æ¯è“‹\r\nâš ï¸ç´™æ¹¯æ¯è·Ÿè“‹å­åˆ†é–‹è²©å”®\"\",é¸é …ä¸­åˆ†åˆ¥æœ‰å°æ‡‰çš„åƒ¹æ ¼å–”âš ï¸\r\n\r\n?æ­¤è³£å ´å–®ä½ç‚º\'ç®±\'ï¼Œé¸é …ä¸­çš„åƒ¹éŒ¢ç‚ºä¸€ç®±?\r\næ•´ç®±åˆ†åˆ¥æ•¸é‡å¯ä»¥åƒè€ƒä»¥ä¸‹èªªæ˜Ž\r\n\r\n?750cc ç´™æ¹¯æ¯\r\n     å£å¾‘ï¼š127mm \r\n     é«˜åº¦ï¼š76mm\r\n     æ•¸é‡ï¼š600å…¥/ç®±(50å€‹*12æ¢)\r\n\r\n?850cc ç´™æ¹¯æ¯\r\n     å£å¾‘ï¼š142mm \r\n     é«˜åº¦ï¼š84mm \r\n     æ•¸é‡ï¼š600å…¥/ç®±(50å€‹*12æ¢)\r\n\r\n?1000cc ç´™æ¹¯æ¯\r\n     å£å¾‘ï¼š142mm \r\n     é«˜åº¦ï¼š106mm \r\n     æ•¸é‡ï¼š600å…¥/ç®±(50å€‹*12æ¢)\r\n\r\n?é…ä»¶-850ç´™æ¹¯æ¯å…§è¥¯(é€šç”¨780/850/1000ç´™æ¹¯ç¢—)\r\n     æ¬¾å¼: æ•´å±¤ / ä¸‰æ ¼\r\n     å£å¾‘:13.7cmxé«˜åº¦ç´„4.5cm\r\n     æ•¸é‡ï¼š1200å…¥/ç®±(50å€‹*24æ¢)\r\n\"',NULL,'ç‰›çš®ç´™æ¹¯ç¢—',NULL,NULL,480,NULL,'50å…¥/çµ„',0,3,6),
(31,NULL,NULL,'æè³ªï¼šç‰›çš®ç´™\r\nå½¢ç‹€ï¼šåœ“å½¢\r\n\r\n',NULL,'ç‰›çš®ç´™æ¯',NULL,NULL,300,NULL,'50å…¥/çµ„',0,3,6),
(32,NULL,NULL,'?ä¸€é¢å…·å¸æ²¹çš„åŠŸèƒ½~é›™é‡åŠŸç”¨ç¶“æ¿Ÿå¯¦æƒ ?',NULL,'ä¸‰è§’æˆ¿æ²¹ç´™è¢‹',NULL,NULL,200,NULL,'40å…¥/çµ„',0,2,7),
(33,NULL,NULL,'7å‹å–‡å­ç¢—ï¼Œæ¹¯éºµç¢—\r\né¢å¾‘18å…¬åˆ†ï¼Œé«˜8å…¬åˆ†\r\n',NULL,'æ’žè‰²å‰‰å†°ç¢—',NULL,NULL,79,NULL,'æ¹–æ°´ç¶ æ¬¾',0,1,4),
(34,NULL,NULL,'å°ºå¯¸å¦‚åœ–æ‰€ç¤º\r\næè³ª:é™¶ç“·\r\næ­¤å•†å“å¯ç”¨æ–¼:çƒ¤ç®±ã€å¾®æ³¢çˆã€æ´—ç¢—æ©Ÿã€çƒ˜ç¢—æ©Ÿ',NULL,'æ—¥æœ¬é™¶ç“·æ‹‰éºµç¢—',NULL,NULL,69,NULL,'è—è‰²æ¬¾',0,2,4),
(35,NULL,NULL,'â€» ç”¢å“èªªæ˜Ž\r\næè³ªï¼šè¡¨é¢ä¸é½é‹¼ã€å…§éƒ¨èšæ°¨é…¯æ³¡æ²«\r\né¡è‰²ï¼šé‡‘å±¬éŠ€è‰²\r\nå®¹é‡ï¼š51L\r\nå¤–å¾‘å°ºå¯¸ï¼šé•·61cmXå¯¬39cmXé«˜42cm\r\nå…§å¾‘å°ºå¯¸ï¼šé•·53cmXå¯¬33cmXé«˜33cm\r\n\r\nâ€» ç”¢å“ç‰¹è‰²\r\n1.è‰¯å¥½éš”ç†±ææ–™ï¼Œä¿æº«æ•ˆæžœæ¥µä½³ï¼Œå¯æœ‰æ•ˆä¿æº«4å¤©ã€‚\r\n2.å¤§å®¹é‡å¯å®¹ç´85ç½å¯å£å¯æ¨‚é‹ç½çš„ç©ºé–“ã€‚\r\n3.é‡‘å±¬è³ªæ„Ÿã€ç›¡é¡¯å°Šè²´ã€‚\r\n4.è¶…å¼·è€ç”¨çš„ä¸é½é‹¼æè³ªï¼Œæ¸…æ½”æ›´å®¹æ˜“å …å›ºã€‚\r\n5.å¢žå¼·åº•éƒ¨ç©ºæ°£æµé€šï¼Œé€²ä¸€æ­¥æå‡ä¿æº«æ•ˆæžœã€‚\r\n6.ç®±å´ä¸é½é‹¼æ¢å¯¬å¤§æ´»å‹•æŠŠæ‰‹ï¼ŒæŠ“æ¡è™•ç‰¹åˆ¥å¢žåŠ æŸ”è»Ÿæè³ªã€‚\r\n7éŽ–æ‰£çš†çˆ²è€ç”¨çš„ä¸é½é‹¼æè³ªã€‚\r\n8.é…æœ‰æŽ’æ°´å¡žã€ç®±è“‹æºæ§½è¨­è¨ˆã€‚',NULL,'ä¸é½é‹¼ä¿æº«ç®±',NULL,NULL,4999,NULL,'ç¶“å…¸æ¬¾',0,1,5);

/*Table structure for table `product_type` */

DROP TABLE IF EXISTS `product_type`;

CREATE TABLE `product_type` (
  `product_type_id` int NOT NULL AUTO_INCREMENT,
  `product_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `product_type` */

insert  into `product_type`(`product_type_id`,`product_type_name`) values 
(1,'ç’°ä¿æ¯å¥—'),
(2,'ç’°ä¿é¤å…·'),
(3,'ç’°ä¿è³¼ç‰©è¢‹'),
(4,'é™¶ç“·ç¢—ç›¤'),
(5,'æ”¤è²©ç”¨å…·'),
(6,'å…æ´—é¤å…·'),
(7,'ç´™è¢‹'),
(8,'é¤è»Š'),
(9,'é›¶é£Ÿ'),
(10,'çŽ©å…·'),
(11,'æ–‡å…·'),
(12,'æŠ˜åƒ¹åˆ¸'),
(13,'è¡£æœ'),
(14,'æ–‡å‰µå•†å“'),
(15,'é›œè²¨'),
(16,'é£²æ–™'),
(17,'é£Ÿå“');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `role` */

insert  into `role`(`id`,`role_code`,`role_name`) values 
(1,'USER','æœƒå“¡');

/*Table structure for table `ship_type` */

DROP TABLE IF EXISTS `ship_type`;

CREATE TABLE `ship_type` (
  `ship_type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ship_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ship_type` */

insert  into `ship_type`(`ship_type_id`,`type_name`) values 
(1,'å®…é…åˆ°åºœ'),
(2,'è¶…å•†å–è²¨'),
(3,'ä¸­è¯éƒµæ”¿iéƒµç®±');

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
  `fk_nightmarket_id` int DEFAULT NULL,
  `fk_shop_type_id` int DEFAULT NULL,
  PRIMARY KEY (`shop_id`),
  KEY `FKnmlw14gxwexbkx1g4unuqvgqf` (`fk_nightmarket_id`),
  KEY `FKhb0at2yuvyfpj1k959ydc6a25` (`fk_shop_type_id`),
  CONSTRAINT `FKhb0at2yuvyfpj1k959ydc6a25` FOREIGN KEY (`fk_shop_type_id`) REFERENCES `shop_type` (`shop_type_id`),
  CONSTRAINT `FKnmlw14gxwexbkx1g4unuqvgqf` FOREIGN KEY (`fk_nightmarket_id`) REFERENCES `night_market` (`market_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `shop` */

insert  into `shop`(`shop_id`,`shop_addr`,`shop_file_name`,`shop_hours`,`shop_hyperlink`,`shop_info`,`shop_media`,`shop_memo`,`shop_name`,`shop_owner`,`shop_phone`,`shop_pic`,`shop_score`,`fk_nightmarket_id`,`fk_shop_type_id`) values 
(1,'å°åŒ—å¸‚æ°‘ç”Ÿè¥¿è·¯999è™Ÿ',NULL,'18ï¼š00ï½žè³£å®Œç‚ºæ­¢',NULL,'ä¸€å®¶æŽ¨è–¦çš„å¤œå¸‚å°åƒæ˜¯å¹³å¸¸å‡ºç¾åœ¨æ—©é»žçš„é£¯ç³°ï¼ã€Œæ…ˆéŸ³å¤æ—©å‘³é˜¿å©†é£¯ç³°ã€åŽŸæ˜¯ç•¶åœ°äººå®µå¤œçš„é£½é£Ÿé¦–é¸ï¼Œä½†å› åª’é«”æŽ¡è¨ªã€è§€å…‰å®¢èœ‚æ“ï¼Œé›–ä¸åœ¨ã€å¯§å¤å¤œå¸‚ã€‘ä¸»è¦æ”¤è²©å€ï¼Œä¾èˆŠäººæ°£çˆ†æ£šï¼Œ5é»žå¤šæ”¤å­é‚„æ²’æ“ºé½Šï¼Œæ”¤ä½å‰å·²å¤§æŽ’é•·é¾ï¼ˆç´„ç­‰å€™20-30åˆ†é˜ï¼‰ã€‚',NULL,NULL,'å¤æ—©å‘³é˜¿å©†é£¯ç³°',NULL,'0933-789-456',NULL,NULL,3,1),
(2,'å°åŒ—å¸‚æ°‘ç”Ÿè¥¿è·¯996è™Ÿ',NULL,'16ï¼š00~01ï¼š00',NULL,'é˜¿å©†é£¯ç³°æ–œå°é¢çš„ã€Œçš‡å®¶é›žè›‹èšµä»”ç…Žã€ä¹Ÿæ˜¯å¤§æŽ’é•·é¾çš„ååº—ï¼Œã€å¯§å¤å¤œå¸‚ã€‘æœ‰ä¸‰å®¶èšµä»”ç…Žç”Ÿæ„éƒ½ä¸éŒ¯ï¼Œé€™å®¶æ‡‰è©²æ˜¯äººæ°£NO.1ï¼Œå¤–å¸¶çš„äººå¾ˆå¤šï¼Œå…§ç”¨æœƒè¢«å¸¶åˆ°æ—é‚Šåº—é¢ï¼Œç­‰å€™æ™‚é–“ç´„15-20åˆ†é˜ï¼Œæ²’æœ‰æƒ³åƒä¸­ä¹…ã€‚ã€Œé»ƒåŠ é›žè›‹èšµä»”ç…Žã€çš„èšµä»”ç…Žå¾ˆåŽšå¯¦ï¼Œè¡¨çš®ç…Žå¾—ç„¦è„†å¸‚ç‰¹è‰²ï¼Œèšµä»”å°ºå¯¸ä¸€èˆ¬ã€é†¬æ±å£å‘³ç¨æ·¡ä¸æ­»é¹¹ï¼Œæ•´é«”æ°´æº–å„ªæ–¼å…¶ä»–å¤œå¸‚çš„èšµä»”ç…Žã€‚',NULL,NULL,'çš‡å®¶é›žè›‹èšµä»”ç…Ž',NULL,'02-7781-2345',NULL,NULL,3,1),
(3,'å°åŒ—å¸‚å¤§åŒå€æ°‘ç”Ÿè¥¿è·¯810è™Ÿ',NULL,'10ï¼š00~01ï¼š00',NULL,'è¡—å£å¦ä¸€é‚Šçš„ã€Œå¤æ—©å‘³è±†èŠ±ã€åœ¨æ—¥åŠ‡ï¼œå­¤ç¨çš„ç¾Žé£Ÿå®¶ï¼žæŽ¨è–¦å¾Œï¼Œæˆç‚ºæ—¥éŸ“æ¸¯éŠå®¢ä¾†å°å¿…åƒçš„çˆ†ç´…ç¾Žé£Ÿï¼Œ2018å¹´å‰›å¼•é€€çš„æ—¥æœ¬æ­Œå§¬å®‰å®¤å¥ˆç¾Žæƒ æ›¾æ˜¯åº§ä¸Šè³“ï¼Œä¹Ÿæ˜¯ç¸½çµ±åºœåœ‹å®´ã€é‡‘é¦¬å½±å±•æ…¶åŠŸå®´çš„å°å¼ç”œé»žå¸¸å®¢ã€‚åº—å®¶æ³¨é‡é£Ÿå®‰ï¼Œæ˜¯åš´é¸é£Ÿæä¸¦ä»¥å°ç£åœ¨åœ°ä½œç‰©ç‚ºä¸»ï¼Œé€éŽå¤æ³•çƒ¹ç…®çš„å¤©ç„¶å¥åº·é¤Šç”Ÿç”œé»žï¼Œç¶²è·¯è©•åƒ¹é«˜ã€‚æ‹›ç‰Œä¸­çš„æ‹›ç‰Œæ˜¯åŠ äº†èŠ±ç”Ÿã€ç²‰åœ“çš„ã€Žè±†èŠ±å£¹è™Ÿã€ï¼„50ï¼Œé¸ç”¨ä¾†è‡ªåŠ æ‹¿å¤§å–®ä¸€å“ç¨®ï¼ˆéžæ··è±†ï¼‰\\r\\nçš„éžåŸºå› æ”¹é€ é»ƒè±†è²»å·¥è£½æˆçš„è±†èŠ±é¦™é†‡æº«æ½¤è»Ÿæºœï¼Œé»žç¶´æ…¢ç…®æ•¸åå°æ™‚çš„é›²æž—èŠ±ç”Ÿã€å¤©ç„¶é»‘ç³–æ‹Œç‚’çç ï¼Œä»¥å†¬ç“œç³–ã€é»‘ç³–åŠäºŒç ‚èª¿æˆçš„éˆé­‚ç³–æ°´éƒ½æ˜¯å¥½åƒçš„é—œéµã€‚',NULL,NULL,'å¤æ—©å‘³è±†èŠ±',NULL,'0937-656-333',NULL,NULL,3,1),
(4,'å°åŒ—å¸‚å¤§åŒå€å¯§å¤è·¯003æ”¤ä½',NULL,'18:00~è³£å®Œç‚ºæ­¢',NULL,'æ°‘ç”Ÿè¥¿è·¯ã€å—äº¬è¥¿è·¯èˆ‡é‡æ…¶åŒ—è·¯ä¸­é–“è·¯æ®µï¼Œåˆ†ä¸‰å¤§é¡žï¼šä¸­é–“æ˜¯å…§ç”¨æ”¤ä½ã€å·¦é‚Šæ˜¯è²·äº†å¯é‚Šèµ°é‚Šåƒçš„TOGOæ”¤ä½ã€å³é‚Šæ˜¯è¡—é‚Šåº—ã€‚ç·¨è™Ÿ002ï¼šã€Œé¹½çƒ¤æé®‘è‡ã€ä½æ–¼è¡—å£ï¼Œä¸€é–‹åº—å°±å‡ºç¾æŽ’éšŠäººæ½®ã€‚ç‰¹è‰²æ˜¯ä½¿ç”¨Aç´šå·¨ç„¡éœ¸æé®‘ç›´ç«ç¾çƒ¤ï¼Œå› æ–°é®®å¤šæ±è€Œç²å¾—å¥½å£ç¢‘ã€‚',NULL,NULL,'çŽ‹å®¶é¹½çƒ¤æé®‘è‡',NULL,'0919-234-009',NULL,NULL,3,1),
(5,'å°åŒ—å¸‚å¤§åŒå€å¯§å¤è·¯001æ”¤ä½',NULL,'17:00~23:00',NULL,'ã€Œè‹—æ —å®¢å®¶ç´”ç³–éº»ç³¬å†°ã€æœ€å—è€å®¢äººå–œæ„›çš„æ˜¯ä½¿ç”¨åœ“ç³¯ç±³ç¶“æ‰‹å·¥è£½ä½œçš„å†·ç†±ç‡’éº»ç³¬ï¼Œå†¬å¤©å¾ˆå—æ­¡è¿Žçš„ç´…è±†æ¹¯èˆ‡èŠ±ç”Ÿæ¹¯ä¹Ÿæ˜¯æ‹›ç‰Œã€‚æŠŠæ¸¾åœ“é£½æ»¿çš„å¤§éº»å‰å¾žæ»¾ç‡™ç³–æ°´é‹ä¸­æ’ˆèµ·å¾Œï¼Œæ’’ä¸ŠèŠ±ç”Ÿç¢Žç³–ç²‰èˆ‡é»‘èŠéº»çš„ã€Žç‡’éº»ç³¬ã€ï¼Œå¾®ç”œéº»ç³¬è»ŸQå½ˆç‰™æ··åˆè‘—èŠ±ç”Ÿç²‰é¦™æ°£ï¼Œæ˜¯ç°¡å–®è¿·äººçš„å¤æ—©å‘³ã€‚',NULL,NULL,'ä¸‰ç¾©å®¢å®¶ç´”ç³–éº»ç³¬',NULL,'0937-342278',NULL,NULL,3,1),
(6,'å°åŒ—å¸‚å¤§åŒå€å¯§å¤è·¯002æ”¤ä½',NULL,'17:00~22:00',NULL,'ã€Žéµè‚‰å†¬ç²‰/éºµã€ï¼„80çš„éµè‚‰å«©ä¸­å¸¶é»žåš¼æ„Ÿã€æ¹¯é ­æ¸…çˆ½é®®ç”œä¸”å¯çºŒåŠ ã€Qå½ˆçˆ½è„†çš„ã€Žç‡™éµè…¸ã€ï¼„100èˆ‡å¦‚è±†è…èˆ¬æ»‘å«©çš„ã€Žéµè¡€ã€ï¼„60ï¼Œéƒ½æ˜¯æ»¿æ»¿ä¸€ç›¤ã€ä»½é‡åè¶³ï¼Œæ•¢åƒè¾£ä¸€å®šè¦åŠ ä¸€å°ç“¢åº—å®¶è‡ªè£½è¾£æ¤’ï¼Œå‘³é“æ›´æ£’ã€‚',NULL,NULL,'å¯§å¤éµè‚‰åº—',NULL,'0922-831256',NULL,NULL,3,1),
(7,'å°åŒ—å¸‚å¤§åŒå€å¯§å¤è·¯056æ”¤ä½',NULL,'18:00~23:00',NULL,'è³£å¾—æ˜¯å°ç£æ¼¢å ¡ï¼šå‰²åŒ…ï¼ŒåŠè‚‰ç²½ã€å››ç¥žæ¹¯ï¼Œã€å¯§å¤å¤œå¸‚ã€‘è¨±å¤šæ”¤ä½æ²’æœ‰åç¨±ï¼Œåªæœ‰ç”¢å“ä¹Ÿæ˜¯ç‰¹è‰²ä¹‹ä¸€ã€‚ä»¥æ…¢ç«ç†¬ç…®æ•¸å°æ™‚çš„ã€Žå››ç¥žè±¬è…¸æ¹¯ã€ï¼Œæ˜¯æŠŠè–ä»å–ä»£è“®å­çš„åŒ—éƒ¨å£å‘³ï¼Œè±¬è…¸è»Ÿè€Œä¸çˆ›ã€æ¹¯é ­æ¿ƒéƒæ¸…ç”œã€‚',NULL,NULL,'é™³è¨˜åˆˆåŒ…',NULL,'02-1010-6788',NULL,NULL,3,1),
(8,'å°åŒ—å¸‚å¤§åŒå€å¯§å¤è·¯057æ”¤ä½',NULL,'16:30~22:30',NULL,'æŽ¨è–¦çš„ç¾é»žç¾ç‚¸12ç›Žå¸è¶…å¤§ã€Žé›žæŽ’ã€ï¼„75ï¼Œä¸€çœ‹å°±è®“äººé£ŸæŒ‡å¤§å‹•ï¼Œé™¤äº†åŽŸå‘³é‚„å¯ä»¥é¸æ“‡æ¤’é¹½ã€å­œç„¶ã€æª¸æª¬ç­‰å£å‘³ã€‚å’¬é–‹å¾Œé›žæŽ’åŽšåŽšçš„æ–·é¢ç§€ä»¤äººå˜†ç‚ºè§€æ­¢ï¼Œæœ€åŽ²å®³çš„æ˜¯ç«Ÿç„¶å¾ˆJuicyï¼Œçš®é¦™é…¥ã€è‚‰é®®å«©å¤šæ±ï¼Œå®æŒ‡å›žå‘³ã€‚',NULL,NULL,'å˜‰ç¾©ä»™äººé›žæŽ’',NULL,'0916-366-578',NULL,NULL,3,1),
(9,'å°åŒ—å¸‚å¤§åŒå€å¯§å¤è·¯058æ”¤ä½',NULL,'17:00~20:00',NULL,'æ–¹å®¶é›žè‚‰é£¯å·²ç¶“é€£çºŒå…©å¹´ç²å¾—ç±³å…¶æž—å¿…æ¯”ç™»æŽ¨ä»‹(2019~2020)ï¼Œå…¶è©•èªžæ˜¯ã€Œæ·‹ä¸Šé›žæ±èˆ‡æ²¹è‘±çš„é›žçµ²é£¯é¦™å‘³å››æº¢ï¼Œæ‹›ç‰Œæ»·è±†è…è»Ÿå«©å¾—è¶…ä¹Žæƒ³åƒã€‚ã€',NULL,NULL,'æ–¹æ–¹é›žè‚‰é£¯',NULL,'0916-778-999',NULL,NULL,3,1),
(10,'å£«æž—å¤œå¸‚æ–°å£«æž—å¸‚å ´åœ°ä¸‹ä¸€æ¨“ç¾Žé£Ÿå€',NULL,'16:30~21:00',NULL,'è€å­—è™Ÿèšµä»”ç…Žå¯ä»¥èªªæ˜¯å£«æž—å¤œå¸‚æœ€å…·ä»£è¡¨æ€§çš„é“åœ°å°åƒäº†ï¼Œ1972 å¹´å°±é–‹æ¥­çš„è€å­—è™Ÿï¼Œå’Œåˆ¥å®¶èšµä»”ç…Žä¸ä¸€æ¨£çš„æ˜¯å¿ èª è™Ÿçš„é›žè›‹éƒ½æ˜¯ä½¿ç”¨åœŸé›žè›‹ï¼Œè›‹é»ƒæ—¢é‡‘é»ƒåˆæ–°é®®ã€‚',NULL,NULL,'è€å­—è™Ÿèšµä»”ç…Ž',NULL,'0987-667-889',NULL,NULL,4,1),
(11,'å°åŒ—å¸‚å£«æž—å€åŸºæ²³è·¯ 997è™Ÿ',NULL,'11:00~20:00',NULL,'æž—å¤œå¸‚è‘—åçš„è—¥ç‡‰æŽ’éª¨åº—ï¼Œå³ä½¿ä¸æ˜¯å†¬å¤©é€²è£œçš„å­£ç¯€ä¹Ÿæ˜¯é«˜æœ‹æ»¿åº§ï¼Œä»¥è¶…éŽ 10 ç¨®ä»¥ä¸Šçš„ä¸­è—¥è£½ä½œæ¹¯é ­ï¼Œæ¯æ—¥è¶…éŽ 5 å°æ™‚æ…¢ç«ç´°ç‡‰ã€‚èœå–®é«˜æŽ›åœ¨ç‰†ä¸Šï¼Œå¯ä»¥çœ‹åˆ°é™¤äº†å„å¼è—¥ç‡‰ç³»åˆ—ä¹‹å¤–ï¼Œåº—è£¡ä¹Ÿæœ‰æä¾›å„ç¨®å¿«ç‚’èˆ‡å°åƒå¯é¸æ“‡ã€‚\"',NULL,NULL,'é †é †åå…¨æŽ’éª¨',NULL,'02-0890-7788',NULL,NULL,4,1),
(12,'å°åŒ—å¸‚å£«æž—å€åŸºæ²³è·¯911è™Ÿ',NULL,'17:30~22:00',NULL,'\"åº—å®¶çš„é›žæŽ’ä½œæ³•ç‚ºå…ˆç‚¸å¾Œçƒ¤ï¼Œé…ä¸Šå«ç‰¹æ®Šä¸­è—¥çš„ç‰¹èª¿é†¬æ±ï¼Œåƒèµ·ä¾†å¤–çš®æ²’æœ‰ä¸€èˆ¬é…¥ç‚¸é›žæŽ’çš„è„†ï¼Œæ˜¯é‚£ç¨®æŠ¹ä¸Šé†¬æ–™å¾Œæ½¤æ½¤çš„å£æ„Ÿï¼Œçƒ¤è‚‰é†¬æ»¿é¦™çš„ä¸æœƒéŽé¹¹ï¼Œåƒåˆ°å¾Œé¢å¯ä»¥åƒå‡ºæœ‰åŠ ä¸€é»žé»žè‚‰æ¡‚ç²‰æå‘³ï¼Œé›žè‚‰æœ¬èº«å¤šæ±åˆè»Ÿå«©ï¼Œä¸€é»žéƒ½ä¸æŸ´ï¼\"',NULL,NULL,'æ–°ç«¹å®¶é„‰ç¢³çƒ¤é›žæŽ’',NULL,'0912-347-687',NULL,NULL,4,1),
(13,'å°åŒ—å¸‚å£«æž—å€æ–‡æž—è·¯666è™Ÿ',NULL,'15:00~20:00',NULL,'\"é€™å®¶è€å­—è™Ÿçš„æž—å®¶è”¥æ²¹é¤…ä¹Ÿæ˜¯äººé¾é —é•·çš„ç†±é–€å°åƒï¼Œç‚¸æ³•å…¶å¯¦æœ‰é»žåƒæ˜¯èŠ±è“®çš„ç‚¸è›‹è”¥æ²¹é¤…ï¼Œåƒèµ·ä¾†ç‰¹åˆ¥é…¥è„†ï¼Œå»ºè­°å¤§å®¶è¦è²·åŠ è›‹çš„æœƒæ›´å¥½åƒå–”ï¼é†¬æ–™éƒ¨åˆ†å¯ä»¥åŠ é»žå°è¾£ï¼Œå…¶å¯¦ä¸æœƒå¾ˆè¾£è€Œä¸”æ˜¯å¸¶æœ‰è’œé¦™çš„è¾£é†¬ï¼Œç¾Žå‘³åº¦å¤§å¤§æå‡ï½ž\"',NULL,NULL,'æž—å®¶è”¥æ²¹é¤…',NULL,'0988-567-223',NULL,NULL,4,1),
(14,'å°åŒ—å¸‚å£«æž—å€å¤§æ±è·¯èˆ‡å¤§å—è·¯å£',NULL,'17:00~21:00',NULL,'\"å£«æž—å¤œå¸‚è€å­—è™Ÿå°åƒä¹‹ä¸€ï¼Œç°¡å–®çš„è‚‰ç‰‡åŒ…å¤¾è‘—è”¥ï¼Œä»¥ç«ç‡’çƒ¤è€Œæˆï¼Œåœ¨ç‡’çƒ¤æ™‚å°±å·²ç¶“é¦™æ°£åè¶³ï¼Œåƒé€²å£ä¸­å¾Œåœ¨å£ä¸­çˆ†é–‹çš„è‚‰æ±ï¼Œèˆ‡è”¥çš„é¦™æ°£ç›¸äº’äº¤èžï¼Œçœ‹ä¼¼ç°¡å–®çš„æ»‹å‘³å»è®“äººç›¸ç•¶éŽç™®ï¼\"',NULL,NULL,'å‘¨è¨˜ç¢³çƒ¤è‚‰æ²',NULL,'0937-001-002',NULL,NULL,4,1),
(15,'å°åŒ—å¸‚å¤§å®‰å€è‡¨æ±Ÿè¡—84è™Ÿé™„è¿‘',NULL,'17:00~21:30',NULL,'è€é—†å …æŒä»¥å‚³çµ±æ‰‹æ³•ç”¨éŸå­ä¸€é¡†ä¸€é¡†é‡å£“åœ°ç“œçƒï¼Œé€¼æŽ‰æ²¹ä¹Ÿé€¼å‡ºQå‹ï¼›è«‹å…ˆè·Ÿè€é—†é å®šè¦è²·å¤šå°‘éŒ¢çš„($20/$30/$50)ï¼Œä»–æœƒå‘Šè¨´ä½ æ˜¯ç¬¬å¹¾é‹(è¦è¨˜å¥½)ï¼Œç”±æ–¼ä¸è¨˜ååˆæ²’è™Ÿç¢¼ç‰Œï¼Œæ‰€ä»¥å¯åˆ¥è·‘é äº†ï¼',NULL,NULL,'å‚³å¥‡åœ°ç“œçƒ',NULL,'0988-980-990',NULL,NULL,5,1),
(16,'å°åŒ—å¸‚å¤§å®‰å€è‡¨æ±Ÿè¡—èˆ‡é€šåŒ–è¡—å£',NULL,'16:30~20:00',NULL,'ç‚¸å¥½çš„èŠ‹é ­é¤…å…§é¤¡é¬†è»Ÿé‚„åƒå¾—åˆ°èŠ‹é ­é¡†ç²’ï¼ŒåŽšåŽšçš„èŠ‹é ­æ³¥é…ä¸Šé…¥è„†çš„é¤…çš®ï¼ŒçœŸçš„æ˜¯è‡¨æ±Ÿå¤œå¸‚å¿…åƒä¹‹ä¸€ï¼Œå¦‚æžœä½ ä¹Ÿæ˜¯èŠ‹é ­æŽ§æŽ¨è–¦ä¾†è©¦è©¦é€™æ”¤çš„å£å‘³ï¼',NULL,NULL,'ç„¡åèŠ‹é ­é¤…',NULL,'0916-567-887',NULL,NULL,5,1),
(17,'å°åŒ—å¸‚å¤§å®‰å€è‡¨æ±Ÿè¡—999è™Ÿ',NULL,'15:00~00:30',NULL,'ç„¦ç³–æ¥“çš„Googleè©•åƒ¹ç›¸ç•¶é«˜(4.7åˆ†/1272å‰‡è©•è«–)ï¼Œä¸åŒä¸€èˆ¬çƒ¤è‚‰åº—åªåˆ·é†¬èª¿å‘³ï¼Œé€™å®¶é‚„æœƒæ’’ä¸Šç¨å®¶çƒ¤è‚‰ç²‰å¢žæ·»é¢¨å‘³ï¼Œé€™ç²‰æ˜¯ç”¨åé¤˜ç¨®ä¸­è—¥æ¼¢æ–¹åŠ è”—ç³–èª¿é…è€Œæˆï¼Œåˆ·é†¬å‰‡æ˜¯åæ—¥å¼ç”˜å‘³é†¬æ²¹ï¼Œå‘ˆç¾å‡ºå¤šå±¤æ¬¡ç¨ç‰¹å‘³é“ã€‚',NULL,NULL,'ç„¦ç³–æ¥“æ—¥å¼ä¸²ç‡’',NULL,'0985-667-890',NULL,NULL,5,3),
(18,'å°åŒ—å¸‚å¤§å®‰å€è‡¨æ±Ÿè¡—888è™Ÿ',NULL,'17:00~22:30',NULL,'\"ä»–å€‘å®¶ç‰¹åˆ¥æŠŠè‡­è±†è…åˆ‡æˆç´„3cmè¦‹æ–¹å¤§å°ï¼Œä¸€å£ä¸€å€‹åƒèµ·ä¾†å¾ˆæ–¹ä¾¿ã€‚ç‚¸å¾—é…¥è„†çš„è‡­è±†è…æ­é…é…¸é…¸ç”œç”œçš„æ³¡èœï¼ŒçœŸæ˜¯å¥½åƒï¼›å¦å¤–å€¼å¾—ä¸€æçš„æ˜¯æ³¡èœåˆ†é‡çµ¦å¾—å¾ˆå¤§æ–¹å”·ï¼Œå°ä»½$45å…ƒ/å¤§ä»½$55å…ƒã€‚',NULL,NULL,'ä¸€å£é‡‘é…¥è‡­è±†è…',NULL,'0900-890-012',NULL,NULL,5,1),
(19,'å°åŒ—å¸‚å¤§å®‰å€é€šåŒ–è¡—57å··é™„è¿‘',NULL,'17:30~22:00',NULL,'é€™å®¶æ­£æ˜¯é¼Žé¼Žæœ‰åçš„ã€Œå…¨å°äººæ°£å°ç± åŒ…è©•æ¯”å¤§PKç¬¬ä¸‰åã€çš„å®œè˜­æ­£å¥½é®®è‚‰å°ç± åŒ…åŠ ç›Ÿåº—ã€‚å¤–çš®ç™½å«©è–„é€ï¼Œæ–°é®®è±¬è‚‰èˆ‡çŸ¥åä¸‰æ˜Ÿè”¥æ··åˆè€Œæˆçš„å…§é¤¡ï¼Œä¸åªåƒå¾—åˆ°è”¥é¦™å’Œè‚‰ç”œé‚„é£½å«ä¸æ²¹è†©çš„æ¹¯æ±ã€‚',NULL,NULL,'é®®è‚‰å°ç± æ¹¯åŒ…',NULL,'02-6788-5666',NULL,NULL,5,1),
(20,'å°åŒ—å¸‚å¤§å®‰å€é€šåŒ–è¡—57å··é™„è¿‘',NULL,'16:00~00:00',NULL,'è©•åƒ¹CPå€¼è¶…é«˜çš„å£½å¸åº—ï¼Œç¶²å‹æ¥µåŠ›å¤§æŽ¨è‡¨æ±Ÿè¡—å¤œå¸‚å¿…åƒç¾Žé£Ÿåƒä¸€ï¼',NULL,NULL,'æ˜Žæ—¥å£½å¸åº—',NULL,'025611-0987',NULL,NULL,5,3);

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
  `fk_member_id` int DEFAULT NULL,
  `fk_shop_id` int DEFAULT NULL,
  PRIMARY KEY (`shop_comment_id`),
  KEY `FK6jibcqwht89v5xwydr5ycktxv` (`fk_member_id`),
  KEY `FK851llm4ytbp86r3qet1vtcs5j` (`fk_shop_id`),
  CONSTRAINT `FK6jibcqwht89v5xwydr5ycktxv` FOREIGN KEY (`fk_member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `FK851llm4ytbp86r3qet1vtcs5j` FOREIGN KEY (`fk_shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `shop_comment` */

/*Table structure for table `shop_menu` */

DROP TABLE IF EXISTS `shop_menu`;

CREATE TABLE `shop_menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `menu_detail` varchar(255) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_photo` mediumblob,
  `menu_price` double DEFAULT NULL,
  `fk_shop_id` int DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `FKbq2cthqsi20uryigbebatrpah` (`fk_shop_id`),
  CONSTRAINT `FKbq2cthqsi20uryigbebatrpah` FOREIGN KEY (`fk_shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `shop_menu` */

insert  into `shop_menu`(`menu_id`,`file_name`,`menu_detail`,`menu_name`,`menu_photo`,`menu_price`,`fk_shop_id`) values 
(1,NULL,'å¥½åƒçš„éµæ¿éºµ','éµæ¿éºµ',NULL,80,1),
(2,NULL,'å¥½åƒçš„æ²™æœ—ç‰›æŽ’','åŽšåˆ‡æ²™æœ—ç‰›æŽ’',NULL,150,1),
(3,NULL,'å¥½åƒçš„è²åŠ›ç‰›æŽ’','åŽšåˆ‡è²åŠ›ç‰›æŽ’',NULL,180,1),
(4,NULL,'å¥½åƒçš„é­·é­š','åŽšåˆ‡é­·é­šæŽ’',NULL,150,1),
(5,NULL,'å¥½åƒçš„æŽ’éª¨','å°ç¢—çš„è—¥ç‡‰æŽ’éª¨',NULL,80,2),
(6,NULL,'é¸ç”¨å°ç£è±¬','å¤§ç¢—çš„è—¥ç‡‰æŽ’éª¨',NULL,150,2),
(7,NULL,'å¥½åƒçš„éºµç·š','éºµç·š',NULL,20,2),
(8,NULL,'å¥½åƒçš„è·åŒ…è›‹','è·åŒ…è›‹',NULL,10,2);

/*Table structure for table `shop_shop_list` */

DROP TABLE IF EXISTS `shop_shop_list`;

CREATE TABLE `shop_shop_list` (
  `fk_shop_list_id` int NOT NULL,
  `fk_shop_id` int NOT NULL,
  PRIMARY KEY (`fk_shop_list_id`,`fk_shop_id`),
  KEY `FKjtwtq1rp622yl0tp9slwnaxr0` (`fk_shop_id`),
  CONSTRAINT `FKjtwtq1rp622yl0tp9slwnaxr0` FOREIGN KEY (`fk_shop_id`) REFERENCES `shop` (`shop_id`),
  CONSTRAINT `FKls929b7xpjl4pute6wt7qdix2` FOREIGN KEY (`fk_shop_list_id`) REFERENCES `favorite_shop_list` (`shop_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `shop_shop_list` */

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
(1,NULL,'ä¸­å¼æ–™ç†'),
(2,NULL,'è¥¿å¼æ–™ç†'),
(3,NULL,'æ—¥å¼æ–™ç†'),
(4,NULL,'é£²æ–™'),
(5,NULL,'è¡£æœ'),
(6,NULL,'é£¾å“'),
(7,NULL,'æ‰‹æ©Ÿå‘¨é‚Š'),
(8,NULL,'æ—¥å¸¸ç”Ÿæ´»ç”¨å“'),
(9,NULL,'éŠæˆ²');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
