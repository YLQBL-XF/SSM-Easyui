/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.20 : Database - mydb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mydb` /*!40100 DEFAULT CHARACTER SET gbk */;

USE `mydb`;

/*Table structure for table `path` */

DROP TABLE IF EXISTS `path`;

CREATE TABLE `path` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  CONSTRAINT `path_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `route` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=gbk;

/*Data for the table `path` */

insert  into `path`(`id`,`longitude`,`latitude`,`pid`) values (2,108.947,34.3099,1),(3,108.947,34.3409,1),(4,108.96,34.3409,1),(5,108.966,34.3409,1),(6,108.971,34.3398,1),(7,108.986,34.3403,1),(8,108.996,34.3421,1),(9,108.996,34.3586,1),(10,108.999,34.3606,1),(11,109.019,34.3584,1),(12,109.021,34.3568,1),(13,109.025,34.3569,1),(14,109.057,34.3529,1),(15,109.058,34.3518,1),(16,109.056,34.3343,1),(17,109.047,34.3153,1),(18,109.044,34.3113,1),(19,108.941,34.3104,1);

/*Table structure for table `route` */

DROP TABLE IF EXISTS `route`;

CREATE TABLE `route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

/*Data for the table `route` */

insert  into `route`(`id`,`NAME`) values (1,'北京->漠河');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `age` int(4) NOT NULL COMMENT '年龄',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `education` varchar(10) DEFAULT NULL COMMENT '学历',
  `identity` varchar(18) NOT NULL COMMENT '身份证号',
  `phon` varchar(11) DEFAULT NULL COMMENT '手机号',
  `unitname` varchar(255) DEFAULT NULL COMMENT '单位名称',
  `unitaddress` varchar(255) DEFAULT NULL COMMENT '单位地址',
  `create_date` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  `modification_time` varchar(255) DEFAULT NULL COMMENT '修改时间',
  `upload_file` varchar(255) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`password`,`age`,`address`,`education`,`identity`,`phon`,`unitname`,`unitaddress`,`create_date`,`status`,`modification_time`,`upload_file`) values (124,'nnn','nnnnnn',7,'uu','本科','110101199901016391','18291683055','jj','jj',NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
