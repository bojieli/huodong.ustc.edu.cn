-- MySQL commands here to automatically create tables
-- TODO

-- History of an object is stored in column `content` in serialize($object) form.
-- OOP should be used instead of associasive arrays.

-- IDs should be different. Assigned IDs:
--	uid			user
--	gid			group (organization)
--	pid			project, plan (one-one correspondence)
--	aid			act (activity)
--	fid			forum
--	fpid		forum post
--	applyid		place apply
--	attachid	attachment

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

CREATE DATABASE IF NOT EXISTS campus;
GRANT ALL PRIVILEGES ON campus.* TO 'campus-web'@'localhost' IDENTIFIED BY 'cc78c1fe' WITH GRANT OPTION;

USE campus;

CREATE TABLE IF NOT EXISTS ustc_user (
	`uid` INT(10) NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(50) NOT NULL,
	`password` CHAR(32) NOT NULL,
	`salt` CHAR(10) NOT NULL,
	`status` ENUM('active', 'locked', 'initial'),
	`student_no` VARCHAR(15) NOT NULL,
	`dept` INT(5) NOT NULL,
	`dorm` VARCHAR(255) NOT NULL,
	`phone` VARCHAR(20) NOT NULL,
	`email` VARCHAR(100) NOT NULL,
	`bbs_id` VARCHAR(100) NOT NULL,
	`register_time` INT(10) NOT NULL,
	`last_login_time` INT(10) NOT NULL DEFAULT '0',
	`login_count` INT(10) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	INDEX key_username(`username`),
	INDEX key_student_no(`student_no`),
	INDEX key_dept(`dept`)
);

CREATE TABLE IF NOT EXISTS ustc_org (
	`gid` INT(10) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`fid` INT(10) NOT NULL,
	`type` ENUM('young_comm', 'student_union', 'graduate_union', 'club', 'teacher'),
	PRIMARY KEY (`gid`)
);

CREATE TABLE IF NOT EXISTS ustc_user_org (
	`uid` INT(10) NOT NULL,
	`gid` INT(10) NOT NULL,
	`priv` ENUM('root', 'admin', 'member'),
	`title` VARCHAR(255) NOT NULL,
	INDEX key_uid(`uid`),
	INDEX key_gid(`gid`)
);

-- `poster` is attachid of the image
CREATE TABLE IF NOT EXISTS ustc_act (
	`aid` INT(10) NOT NULL AUTO_INCREMENT,
	`pid` INT(10) NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	`start_time` INT(10),
	`end_time` INT(10),
	`place` VARCHAR(255),
	`rate` INT(10),
	`poster` VARCHAR(255),
	`description` TEXT,
	`summary` TEXT,
	PRIMARY KEY(`aid`),
	INDEX key_pid(`pid`),
	INDEX key_starttime(`start_time`),
	INDEX key_endtime(`end_time`),
	INDEX key_place(`place`),
	INDEX key_rate(`rate`)
);

CREATE TABLE IF NOT EXISTS ustc_act_tag (
	`aid` INT(10) NOT NULL,
	`tag` VARCHAR(255) NOT NULL,
	INDEX key_aid(`aid`),
	INDEX key_tag(`tag`)
);

CREATE TABLE IF NOT EXISTS ustc_act_history (
	`aid` INT(10) NOT NULL,
	`uid` INT(10) NOT NULL,
	`time` INT(10) NOT NULL,
	`content` TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS ustc_project (
	`pid` INT(10) NOT NULL AUTO_INCREMENT,
	`fid` INT(10) NOT NULL,
	PRIMARY KEY(`pid`)
);

CREATE TABLE IF NOT EXISTS ustc_plan (
	`pid` INT(10) NOT NULL,
	`status` ENUM('not_submitted', 'pending_approval', 'approved1', 'approved2', 'approved3', 'approved4', 'rejected1', 'rejected2', 'rejected3', 'rejected4', 'executing', 'finished', 'archived'),
	`gid` INT(10) NOT NULL,
	`host_org` VARCHAR(255) NOT NULL,
	`undertaker_org` VARCHAR(255) NOT NULL,
	`assistant_org` VARCHAR(255) NOT NULL,
	`version` INT(10) NOT NULL,
	`time` INT(10) NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	`leader_uid` INT(10) NOT NULL,
	`start_time` INT(10) NOT NULL,
	`end_time` INT(10) NOT NULL,
	`predicted_people` INT(10),
	`is_outside` BOOLEAN,
	`orgnization_design` TEXT,
	`experience_and_shortcoming` TEXT,
	`summary` TEXT,
	
	PRIMARY KEY(`pid`),
	INDEX key_status(`status`),
	INDEX key_gid(`gid`),
	INDEX key_time(`time`)
);

CREATE TABLE IF NOT EXISTS ustc_plan_budget (
	`pid` INT(10) NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	`unit_price` INT(10) NOT NULL,
	`number` INT(10) NOT NULL,
	PRIMARY KEY(`pid`)
);

CREATE TABLE IF NOT EXISTS ustc_plan_audit (
	`uid` INT(10) NOT NULL,
	`pid` INT(10) NOT NULL,
	`action` ENUM('approve', 'reject') NOT NULL,
	`message` TEXT NOT NULL,
	`time` INT(10) NOT NULL,
	`approve_budget` INT(10) NOT NULL,
	INDEX key_pid(`pid`),
	INDEX key_time(`time`),
	INDEX key_uid(`uid`)
);

CREATE TABLE IF NOT EXISTS ustc_plan_outside (
	`pid` INT(10) NOT NULL,
	`start_time` INT(10) NOT NULL,
	`end_time` INT(10) NOT NULL,
	`theme` VARCHAR(255) NOT NULL,
	`address` VARCHAR(511) NOT NULL,
	`additional_note` VARCHAR(255) NOT NULL,
	`leader` VARCHAR(255) NOT NULL,
	`report_to` VARCHAR(255) NOT NULL,
	INDEX key_pid(`pid`)
);

CREATE TABLE IF NOT EXISTS ustc_plan_public_relation (
	`pid` INT(10) NOT NULL,
	`target` VARCHAR(255) NOT NULL,
	`purpose` VARCHAR(255) NOT NULL,
	`uid` INT(10) NOT NULL,
	INDEX key_pid(`pid`)
);

CREATE TABLE IF NOT EXISTS ustc_plan_member (
	`pid` INT(10) NOT NULL,
	`uid` INT(10) NOT NULL,
	`task` VARCHAR(255) NOT NULL,
	INDEX key_pid(`pid`),
	INDEX key_uid(`uid`)
);

CREATE TABLE IF NOT EXISTS ustc_plan_participant (
	`pid` INT(10) NOT NULL,
	`uid` INT(10) NOT NULL,
	INDEX key_pid(`pid`),
	INDEX key_uid(`uid`)
);

CREATE TABLE IF NOT EXISTS ustc_plan_outside_participant (
	`pid` INT(10) NOT NULL,
	`uid` INT(10) NOT NULL,
	INDEX key_pid(`pid`)
);

CREATE TABLE IF NOT EXISTS ustc_plan_sponsor (
	`pid` INT(10) NOT NULL,
	`sponsor` VARCHAR(255) NOT NULL,
	`money` VARCHAR(10) NOT NULL,
	`note` VARCHAR(255) NOT NULL,
	INDEX key_pid(`pid`)
);

CREATE TABLE IF NOT EXISTS ustc_plan_account_book (
	`pid` INT(10) NOT NULL,
	`purpose` VARCHAR(255) NOT NULL,
	`note` VARCHAR(255) NOT NULL,
	INDEX key_pid(`pid`)
);

CREATE TABLE IF NOT EXISTS ustc_plan_history (
	`pid` INT(10) NOT NULL,
	`version` INT(10) NOT NULL,
	`uid` INT(10) NOT NULL,
	`time` INT(10) NOT NULL,
	`content` TEXT NOT NULL,
	INDEX key_pid(`pid`),
	INDEX key_version(`version`),
	INDEX key_uid(`uid`),
	INDEX key_time(`time`)
);

CREATE TABLE IF NOT EXISTS ustc_forum (
	`fid` INT(10) NOT NULL AUTO_INCREMENT,
	`gid` INT(10) NOT NULL,
	PRIMARY KEY(`fid`),
	INDEX key_gid(`gid`)
);

CREATE TABLE IF NOT EXISTS ustc_forum_post (
	`fid` INT(10) NOT NULL,
	`fpid` INT(10) NOT NULL AUTO_INCREMENT,
	`parent` INT(10) NOT NULL,
	`uid` INT(10) NOT NULL,
	`time` INT(10) NOT NULL,
	`content` TEXT,
	PRIMARY KEY(`fpid`),
	INDEX key_fid(`fid`),
	INDEX key_parent(`parent`),
	INDEX key_uid(`uid`),
	INDEX key_time(`time`)
);

CREATE TABLE IF NOT EXISTS ustc_audit_priv (
	`uid` INT(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS ustc_audit_place (
	`applyid` INT(10) NOT NULL AUTO_INCREMENT,
	`aid` INT(10) NOT NULL,
	`time` INT(10) NOT NULL,
	`status` ENUM('pending', 'approved', 'rejected'),
	`reason` TEXT,
	PRIMARY KEY(`applyid`)
);

CREATE TABLE IF NOT EXISTS ustc_attachment (
	`attachid` INT(10) NOT NULL AUTO_INCREMENT,
	`uid` INT(10) NOT NULL,
	`time` INT(10) NOT NULL,
	`filename` VARCHAR(255) NOT NULL,
	`filepath` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`attachid`)
);

CREATE TABLE IF NOT EXISTS ustc_act_attachment (
	`aid` INT(10) NOT NULL,
	`attachid` INT(10) NOT NULL,
	INDEX key_aid(`aid`)
);

CREATE TABLE IF NOT EXISTS ustc_plan_attachment (
	`pid` INT(10) NOT NULL,
	`attachid` INT(10) NOT NULL,
	INDEX key_pid(`pid`)
);

-- ThinkPHP
CREATE DATABASE IF NOT EXISTS ThinkPHP;
GRANT ALL PRIVILEGES ON ThinkPHP.* TO 'thinkphp-test'@'localhost' IDENTIFIED BY '8ekzp9ka' WITH GRANT OPTION;

USE ThinkPHP;

-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2012 年 01 月 14 日 08:27
-- 服务器版本: 5.5.16
-- PHP 版本: 5.3.8

--
-- 数据库: `examples`
--

-- --------------------------------------------------------

--
-- 表的结构 `thinik_ser`
--

CREATE TABLE IF NOT EXISTS `thinik_ser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `info` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `think_access`
--

CREATE TABLE IF NOT EXISTS `think_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `pid` smallint(6) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_access`
--

INSERT INTO `think_access` (`role_id`, `node_id`, `level`, `pid`, `module`) VALUES
(2, 1, 1, 0, NULL),
(2, 40, 2, 1, NULL),
(2, 30, 2, 1, NULL),
(3, 1, 1, 0, NULL),
(2, 69, 2, 1, NULL),
(2, 50, 3, 40, NULL),
(3, 50, 3, 40, NULL),
(1, 50, 3, 40, NULL),
(3, 7, 2, 1, NULL),
(3, 39, 3, 30, NULL),
(2, 39, 3, 30, NULL),
(2, 49, 3, 30, NULL),
(4, 1, 1, 0, NULL),
(4, 2, 2, 1, NULL),
(4, 3, 2, 1, NULL),
(4, 4, 2, 1, NULL),
(4, 5, 2, 1, NULL),
(4, 6, 2, 1, NULL),
(4, 7, 2, 1, NULL),
(4, 11, 2, 1, NULL),
(5, 25, 1, 0, NULL),
(5, 51, 2, 25, NULL),
(1, 1, 1, 0, NULL),
(1, 39, 3, 30, NULL),
(1, 69, 2, 1, NULL),
(1, 30, 2, 1, NULL),
(1, 40, 2, 1, NULL),
(1, 49, 3, 30, NULL),
(3, 69, 2, 1, NULL),
(3, 30, 2, 1, NULL),
(3, 40, 2, 1, NULL),
(1, 37, 3, 30, NULL),
(1, 36, 3, 30, NULL),
(1, 35, 3, 30, NULL),
(1, 34, 3, 30, NULL),
(1, 33, 3, 30, NULL),
(1, 32, 3, 30, NULL),
(1, 31, 3, 30, NULL),
(2, 32, 3, 30, NULL),
(2, 31, 3, 30, NULL),
(7, 1, 1, 0, NULL),
(7, 30, 2, 1, NULL),
(7, 40, 2, 1, NULL),
(7, 69, 2, 1, NULL),
(7, 50, 3, 40, NULL),
(7, 39, 3, 30, NULL),
(7, 49, 3, 30, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `think_attach`
--

CREATE TABLE IF NOT EXISTS `think_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` varchar(20) NOT NULL,
  `extension` varchar(20) NOT NULL,
  `savepath` varchar(255) NOT NULL,
  `savename` varchar(255) NOT NULL,
  `module` varchar(100) NOT NULL,
  `recordId` int(11) NOT NULL,
  `userId` int(11) unsigned DEFAULT NULL,
  `uploadTime` int(11) unsigned DEFAULT NULL,
  `downCount` mediumint(9) unsigned DEFAULT '0',
  `hash` varchar(32) NOT NULL,
  `verify` varchar(8) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `version` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `updateTime` int(12) unsigned DEFAULT NULL,
  `downloadTime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `module` (`module`),
  KEY `recordId` (`recordId`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `think_attach`
--

-- --------------------------------------------------------

--
-- 表的结构 `think_blog`
--

CREATE TABLE IF NOT EXISTS `think_blog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL DEFAULT '',
  `userId` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `categoryId` smallint(5) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext,
  `cTime` int(11) unsigned NOT NULL DEFAULT '0',
  `mTime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `readCount` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `commentCount` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `tags` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `think_blog`
--

-- --------------------------------------------------------

--
-- 表的结构 `think_card`
--

CREATE TABLE IF NOT EXISTS `think_card` (
  `id` mediumint(6) NOT NULL AUTO_INCREMENT,
  `member_id` mediumint(6) NOT NULL,
  `card` varchar(25) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- 表的结构 `think_category`
--

CREATE TABLE IF NOT EXISTS `think_category` (
  `id` mediumint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `think_category`
--

INSERT INTO `think_category` (`id`, `name`, `title`, `remark`, `status`) VALUES
(1, '', 'abc', '', 0),
(2, '', 'php', '', 0),
(3, '', 'js', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `think_comment`
--

CREATE TABLE IF NOT EXISTS `think_comment` (
  `id` mediumint(5) unsigned NOT NULL AUTO_INCREMENT,
  `recordId` int(11) unsigned NOT NULL DEFAULT '0',
  `author` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(25) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `cTime` int(11) unsigned NOT NULL DEFAULT '0',
  `agent` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `module` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `think_comment`
--

-- --------------------------------------------------------

--
-- 表的结构 `think_dept`
--

CREATE TABLE IF NOT EXISTS `think_dept` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `think_dept`
--

INSERT INTO `think_dept` (`id`, `name`) VALUES
(1, '开发部'),
(2, '销售部'),
(3, '财务部');

-- --------------------------------------------------------

--
-- 表的结构 `think_form`
--

CREATE TABLE IF NOT EXISTS `think_form` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `think_form`
--

-- --------------------------------------------------------

--
-- 表的结构 `think_group`
--

CREATE TABLE IF NOT EXISTS `think_group` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `title` varchar(50) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `think_group`
--

INSERT INTO `think_group` (`id`, `name`, `title`, `create_time`, `update_time`, `status`, `sort`, `show`) VALUES
(2, 'App', '应用中心', 1222841259, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `think_groups`
--

CREATE TABLE IF NOT EXISTS `think_groups` (
  `id` mediumint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `think_groups`
--

INSERT INTO `think_groups` (`id`, `name`) VALUES
(1, '项目组1'),
(2, '项目组2'),
(3, '项目组3');

-- --------------------------------------------------------

--
-- 表的结构 `think_member`
--

CREATE TABLE IF NOT EXISTS `think_member` (
  `id` mediumint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `dept_id` smallint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- 表的结构 `think_member_groups`
--

CREATE TABLE IF NOT EXISTS `think_member_groups` (
  `id` mediumint(6) NOT NULL AUTO_INCREMENT,
  `groups_id` mediumint(5) NOT NULL,
  `member_id` mediumint(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

-- --------------------------------------------------------

--
-- 表的结构 `think_node`
--

CREATE TABLE IF NOT EXISTS `think_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `group_id` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=83 ;

--
-- 转存表中的数据 `think_node`
--

INSERT INTO `think_node` (`id`, `name`, `title`, `status`, `remark`, `sort`, `pid`, `level`, `type`, `group_id`) VALUES
(49, 'read', '查看', 1, '', NULL, 30, 3, 0, 0),
(40, 'Index', '默认模块', 1, '', 1, 1, 2, 0, 0),
(39, 'index', '列表', 1, '', NULL, 30, 3, 0, 0),
(37, 'resume', '恢复', 1, '', NULL, 30, 3, 0, 0),
(36, 'forbid', '禁用', 1, '', NULL, 30, 3, 0, 0),
(35, 'foreverdelete', '删除', 1, '', NULL, 30, 3, 0, 0),
(34, 'update', '更新', 1, '', NULL, 30, 3, 0, 0),
(33, 'edit', '编辑', 1, '', NULL, 30, 3, 0, 0),
(32, 'insert', '写入', 1, '', NULL, 30, 3, 0, 0),
(31, 'add', '新增', 1, '', NULL, 30, 3, 0, 0),
(30, 'Public', '公共模块', 1, '', 2, 1, 2, 0, 0),
(69, 'Form', '数据管理', 1, '', 1, 1, 2, 0, 2),
(7, 'User', '后台用户', 1, '', 4, 1, 2, 0, 2),
(6, 'Role', '角色管理', 1, '', 3, 1, 2, 0, 2),
(2, 'Node', '节点管理', 1, '', 2, 1, 2, 0, 2),
(1, 'Rbac', 'Rbac后台管理', 1, '', NULL, 0, 1, 0, 0),
(50, 'main', '空白首页', 1, '', NULL, 40, 3, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `think_photo`
--

CREATE TABLE IF NOT EXISTS `think_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(200) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `think_photo`
--


-- --------------------------------------------------------

--
-- 表的结构 `think_profile`
--

CREATE TABLE IF NOT EXISTS `think_profile` (
  `id` mediumint(6) NOT NULL AUTO_INCREMENT,
  `member_id` mediumint(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- 表的结构 `think_role`
--

CREATE TABLE IF NOT EXISTS `think_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `ename` varchar(5) DEFAULT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `ename` (`ename`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `think_role`
--

INSERT INTO `think_role` (`id`, `name`, `pid`, `status`, `remark`, `ename`, `create_time`, `update_time`) VALUES
(1, '领导组', 0, 1, '', '', 1208784792, 1254325558),
(2, '员工组', 0, 1, '', '', 1215496283, 1254325566),
(7, '演示组', 0, 1, '', NULL, 1254325787, 0);

-- --------------------------------------------------------

--
-- 表的结构 `think_role_user`
--

CREATE TABLE IF NOT EXISTS `think_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_role_user`
--

INSERT INTO `think_role_user` (`role_id`, `user_id`) VALUES
(4, '27'),
(4, '26'),
(4, '30'),
(5, '31'),
(3, '22'),
(3, '1'),
(1, '4'),
(2, '3'),
(7, '2');

-- --------------------------------------------------------

--
-- 表的结构 `think_tag`
--

CREATE TABLE IF NOT EXISTS `think_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `count` mediumint(6) unsigned NOT NULL,
  `module` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `module` (`module`),
  KEY `count` (`count`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `think_tag`
--

-- --------------------------------------------------------

--
-- 表的结构 `think_tagged`
--

CREATE TABLE IF NOT EXISTS `think_tagged` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned NOT NULL,
  `recordId` int(11) unsigned NOT NULL,
  `tagId` int(11) NOT NULL,
  `tagTime` int(11) NOT NULL,
  `module` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `module` (`module`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `think_tagged`
--

-- --------------------------------------------------------

--
-- 表的结构 `think_user`
--

CREATE TABLE IF NOT EXISTS `think_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(64) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `bind_account` varchar(50) NOT NULL,
  `last_login_time` int(11) unsigned DEFAULT '0',
  `last_login_ip` varchar(40) DEFAULT NULL,
  `login_count` mediumint(8) unsigned DEFAULT '0',
  `verify` varchar(32) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `type_id` tinyint(2) unsigned DEFAULT '0',
  `info` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- 转存表中的数据 `think_user`
--

INSERT INTO `think_user` (`id`, `account`, `nickname`, `password`, `bind_account`, `last_login_time`, `last_login_ip`, `login_count`, `verify`, `email`, `remark`, `create_time`, `update_time`, `status`, `type_id`, `info`) VALUES
(1, 'admin', '管理员', '21232f297a57a5a743894a0e4a801fc3', '', 1326335612, '127.0.0.1', 888, '8888', 'liu21st@gmail.com', '备注信息', 1222907803, 1326266696, 1, 0, ''),
(2, 'demo', '演示', 'fe01ce2a7fbac8fafaed7c982a04e229', '', 1254326091, '127.0.0.1', 90, '8888', '', '', 1239783735, 1254325770, 1, 0, ''),
(3, 'member', '员工', 'aa08769cdcb26674c6706093503ff0a3', '', 1326266720, '127.0.0.1', 17, '', '', '', 1253514375, 1254325728, 1, 0, ''),
(4, 'leader', '领导', 'c444858e0aaeb727da73d2eae62321ad', '', 1254325906, '127.0.0.1', 15, '', '', '领导', 1253514575, 1254325705, 1, 0, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
