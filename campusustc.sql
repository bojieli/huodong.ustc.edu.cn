/*
SQLyog Ultimate v8.32 
MySQL - 5.1.37-community : Database - campusustc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`campusustc` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `campusustc`;

/*Table structure for table `ustc_act` */

DROP TABLE IF EXISTS `ustc_act`;

CREATE TABLE `ustc_act` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `gid` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_time` int(10) DEFAULT NULL,
  `end_time` int(10) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `rate` int(10) NOT NULL DEFAULT '0',
  `shared` int(10) NOT NULL DEFAULT '0',
  `poster` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`aid`),
  KEY `gid` (`gid`),
  KEY `key_starttime` (`start_time`),
  KEY `key_endtime` (`end_time`),
  KEY `key_place` (`place`),
  KEY `key_rate` (`rate`),
  CONSTRAINT `ustc_act_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `ustc_org` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ustc_act` */

/*Table structure for table `ustc_act_comment` */

DROP TABLE IF EXISTS `ustc_act_comment`;

CREATE TABLE `ustc_act_comment` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) NOT NULL,
  `gid` int(10) NOT NULL,
  `author` int(10) NOT NULL,
  `content` text,
  PRIMARY KEY (`cid`),
  KEY `aid` (`aid`),
  KEY `gid` (`gid`),
  KEY `author` (`author`),
  CONSTRAINT `ustc_act_comment_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `ustc_act` (`aid`),
  CONSTRAINT `ustc_act_comment_ibfk_2` FOREIGN KEY (`gid`) REFERENCES `ustc_org` (`gid`),
  CONSTRAINT `ustc_act_comment_ibfk_3` FOREIGN KEY (`author`) REFERENCES `ustc_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ustc_act_comment` */

/*Table structure for table `ustc_attachment` */

DROP TABLE IF EXISTS `ustc_attachment`;

CREATE TABLE `ustc_attachment` (
  `attachid` int(10) NOT NULL AUTO_INCREMENT,
  `author` int(10) NOT NULL,
  `time` int(10) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filepath` varchar(255) NOT NULL,
  PRIMARY KEY (`attachid`),
  KEY `author` (`author`),
  CONSTRAINT `ustc_attachment_ibfk_1` FOREIGN KEY (`author`) REFERENCES `ustc_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ustc_attachment` */

/*Table structure for table `ustc_email_notify` */

DROP TABLE IF EXISTS `ustc_email_notify`;

CREATE TABLE `ustc_email_notify` (
  `source` int(10) NOT NULL,
  `target` int(10) NOT NULL,
  `gid` int(10) NOT NULL,
  `time` int(10) NOT NULL,
  `status` enum('success','failed') NOT NULL,
  `retry_num` int(5) NOT NULL DEFAULT '0',
  `last_retry` int(10) NOT NULL,
  `title` varchar(80) NOT NULL,
  `content` text,
  KEY `source` (`source`),
  KEY `target` (`target`),
  KEY `gid` (`gid`),
  KEY `key_time` (`time`),
  CONSTRAINT `ustc_email_notify_ibfk_1` FOREIGN KEY (`source`) REFERENCES `ustc_user` (`uid`),
  CONSTRAINT `ustc_email_notify_ibfk_2` FOREIGN KEY (`target`) REFERENCES `ustc_user` (`uid`),
  CONSTRAINT `ustc_email_notify_ibfk_3` FOREIGN KEY (`gid`) REFERENCES `ustc_org` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ustc_email_notify` */

/*Table structure for table `ustc_follow_org` */

DROP TABLE IF EXISTS `ustc_follow_org`;

CREATE TABLE `ustc_follow_org` (
  `uid` int(10) NOT NULL,
  `gid` int(10) NOT NULL,
  `start_time` int(10) NOT NULL,
  KEY `uid` (`uid`),
  KEY `gid` (`gid`),
  CONSTRAINT `ustc_follow_org_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `ustc_user` (`uid`),
  CONSTRAINT `ustc_follow_org_ibfk_2` FOREIGN KEY (`gid`) REFERENCES `ustc_org` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ustc_follow_org` */

/*Table structure for table `ustc_forum_post` */

DROP TABLE IF EXISTS `ustc_forum_post`;

CREATE TABLE `ustc_forum_post` (
  `fpid` int(10) NOT NULL AUTO_INCREMENT,
  `gid` int(10) NOT NULL,
  `parent` int(10) NOT NULL,
  `author` int(10) NOT NULL,
  `time` int(10) NOT NULL,
  `pid` int(10) NOT NULL DEFAULT '0',
  `content` text,
  PRIMARY KEY (`fpid`),
  KEY `gid` (`gid`),
  KEY `key_parent` (`parent`),
  KEY `author` (`author`),
  KEY `key_pid` (`pid`),
  CONSTRAINT `ustc_forum_post_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `ustc_org` (`gid`),
  CONSTRAINT `ustc_forum_post_ibfk_2` FOREIGN KEY (`author`) REFERENCES `ustc_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ustc_forum_post` */

/*Table structure for table `ustc_login_log` */

DROP TABLE IF EXISTS `ustc_login_log`;

CREATE TABLE `ustc_login_log` (
  `uid` int(10) NOT NULL,
  `time` int(10) NOT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `result` enum('success','failed') NOT NULL,
  KEY `uid` (`uid`),
  KEY `key_time` (`time`),
  KEY `key_method` (`method`),
  KEY `key_result` (`result`),
  CONSTRAINT `ustc_login_log_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `ustc_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ustc_login_log` */

/*Table structure for table `ustc_org` */

DROP TABLE IF EXISTS `ustc_org`;

CREATE TABLE `ustc_org` (
  `gid` int(10) NOT NULL AUTO_INCREMENT,
  `sid` int(10) NOT NULL,
  `owner` int(10) NOT NULL,
  `status` enum('active','locked','inactivated') NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`gid`),
  KEY `sid` (`sid`),
  KEY `owner` (`owner`),
  KEY `key_status` (`status`),
  CONSTRAINT `ustc_org_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `ustc_school` (`sid`),
  CONSTRAINT `ustc_org_ibfk_2` FOREIGN KEY (`owner`) REFERENCES `ustc_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ustc_org` */

insert  into `ustc_org`(`gid`,`sid`,`owner`,`status`,`name`) values (1,1,1,'active','格物致知');

/*Table structure for table `ustc_project` */

DROP TABLE IF EXISTS `ustc_project`;

CREATE TABLE `ustc_project` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `gid` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `gid` (`gid`),
  KEY `key_name` (`name`),
  CONSTRAINT `ustc_project_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `ustc_org` (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `ustc_project` */

insert  into `ustc_project`(`pid`,`gid`,`name`) values (1,1,'学生门户'),(2,1,'暂无项目'),(3,1,'苛刻'),(4,1,'卡卡卡');

/*Table structure for table `ustc_school` */

DROP TABLE IF EXISTS `ustc_school`;

CREATE TABLE `ustc_school` (
  `sid` int(10) NOT NULL AUTO_INCREMENT,
  `admin` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `admin` (`admin`),
  KEY `key_name` (`name`),
  CONSTRAINT `ustc_school_ibfk_1` FOREIGN KEY (`admin`) REFERENCES `ustc_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ustc_school` */

insert  into `ustc_school`(`sid`,`admin`,`name`) values (1,1,'自动化');

/*Table structure for table `ustc_share` */

DROP TABLE IF EXISTS `ustc_share`;

CREATE TABLE `ustc_share` (
  `attachid` int(10) NOT NULL,
  `gid` int(10) NOT NULL,
  `pid` int(10) NOT NULL,
  `author` int(10) NOT NULL,
  `upload_time` int(10) NOT NULL,
  `folder` varchar(100) NOT NULL,
  PRIMARY KEY (`attachid`),
  KEY `gid` (`gid`),
  KEY `key_pid` (`pid`),
  KEY `author` (`author`),
  KEY `key_folder` (`folder`),
  CONSTRAINT `ustc_share_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `ustc_org` (`gid`),
  CONSTRAINT `ustc_share_ibfk_2` FOREIGN KEY (`author`) REFERENCES `ustc_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ustc_share` */

/*Table structure for table `ustc_todolist` */

DROP TABLE IF EXISTS `ustc_todolist`;

CREATE TABLE `ustc_todolist` (
  `item` int(10) NOT NULL AUTO_INCREMENT,
  `gid` int(10) NOT NULL,
  `pid` int(10) NOT NULL,
  `author` int(10) NOT NULL,
  `status` enum('doing','complete') NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`item`),
  KEY `gid` (`gid`),
  KEY `pid` (`pid`),
  KEY `author` (`author`),
  KEY `key_status` (`status`),
  CONSTRAINT `ustc_todolist_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `ustc_org` (`gid`),
  CONSTRAINT `ustc_todolist_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `ustc_project` (`pid`),
  CONSTRAINT `ustc_todolist_ibfk_3` FOREIGN KEY (`author`) REFERENCES `ustc_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ustc_todolist` */

/*Table structure for table `ustc_todolist_history` */

DROP TABLE IF EXISTS `ustc_todolist_history`;

CREATE TABLE `ustc_todolist_history` (
  `item` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `operation` enum('create','delete','update','complete','incomplete') NOT NULL,
  `new_content` text NOT NULL,
  KEY `key_item` (`item`),
  KEY `uid` (`uid`),
  KEY `key_operation` (`operation`),
  CONSTRAINT `ustc_todolist_history_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `ustc_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ustc_todolist_history` */

/*Table structure for table `ustc_user` */

DROP TABLE IF EXISTS `ustc_user`;

CREATE TABLE `ustc_user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `realname` varchar(50) NOT NULL,
  `login_type` tinyint(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` char(32) NOT NULL,
  `salt` char(10) NOT NULL,
  `status` enum('active','locked','inactivated') DEFAULT NULL,
  `isadmin` tinyint(1) NOT NULL,
  `sid` int(10) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `key_realname` (`realname`),
  KEY `key_sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `ustc_user` */

insert  into `ustc_user`(`uid`,`realname`,`login_type`,`email`,`password`,`salt`,`status`,`isadmin`,`sid`) values (1,'chero',1,'807991555@qq.com','huanhuan','huan','active',0,1),(2,'hh',1,'hh','hh','hh','active',0,1),(3,'kk',1,'kk','kk','kk','active',0,1),(4,'ll',1,'ll','ll','ll','active',0,1),(5,'ww',1,'ww','11','11','active',0,1);

/*Table structure for table `ustc_user_org` */

DROP TABLE IF EXISTS `ustc_user_org`;

CREATE TABLE `ustc_user_org` (
  `uid` int(10) NOT NULL,
  `gid` int(10) NOT NULL,
  `priv` enum('admin','manager','member') NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `key_uid` (`uid`),
  KEY `key_gid` (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `ustc_user_org` */

insert  into `ustc_user_org`(`uid`,`gid`,`priv`,`title`,`id`) values (1,1,'admin','社长',1),(2,1,'member','会员',2),(3,1,'member','会员',3),(4,1,'member',NULL,4),(5,1,'member',NULL,5);

/*Table structure for table `ustc_user_profile` */

DROP TABLE IF EXISTS `ustc_user_profile`;

CREATE TABLE `ustc_user_profile` (
  `uid` int(10) NOT NULL,
  `student_no` varchar(15) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `major` int(4) NOT NULL,
  `grade` int(4) NOT NULL,
  `class` int(4) NOT NULL,
  `register_time` int(10) NOT NULL,
  `last_login_time` int(10) NOT NULL,
  `login_count` int(10) NOT NULL DEFAULT '0',
  `hobby` text NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `key_student_no` (`student_no`),
  KEY `key_major` (`major`),
  KEY `key_grade` (`grade`),
  KEY `key_register_time` (`register_time`),
  KEY `key_last_login_time` (`last_login_time`),
  KEY `ustc_user_profile_user` (`uid`),
  KEY `ustc_profile_user` (`uid`),
  CONSTRAINT `ustc_profile_user` FOREIGN KEY (`uid`) REFERENCES `ustc_user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ustc_user_profile` */

insert  into `ustc_user_profile`(`uid`,`student_no`,`gender`,`major`,`grade`,`class`,`register_time`,`last_login_time`,`login_count`,`hobby`) values (1,'SA11010083',0,1,1,1,1,1,1,'1111');

/*Table structure for table `ustc_user_project` */

DROP TABLE IF EXISTS `ustc_user_project`;

CREATE TABLE `ustc_user_project` (
  `uid` int(10) NOT NULL,
  `pid` int(10) NOT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `pid` (`pid`),
  CONSTRAINT `ustc_user_project_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `ustc_user` (`uid`),
  CONSTRAINT `ustc_user_project_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `ustc_project` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `ustc_user_project` */

insert  into `ustc_user_project`(`uid`,`pid`,`id`) values (1,1,1),(2,1,2),(3,2,3),(4,2,4),(5,4,5);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
