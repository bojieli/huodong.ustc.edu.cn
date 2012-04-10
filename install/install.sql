-- Gewu INSTALL SQL DUMP
-- 2011-08-06(v2)
-- 2011-07-25(v1)
DROP TABLE IF EXISTS common_object;
CREATE TABLE common_object (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`deleted` tinyint(1) NOT NULL DEFAULT '0',
	-- common attributes
	`name` varchar(255) NOT NULL DEFAULT '',
	`path` varchar(255) NOT NULL DEFAULT '',
	`parent` varchar(255) NOT NULL DEFAULT '',
	`grandparent` varchar(255) NOT NULL DEFAULT '',
	`grandgrandparent` varchar(255) NOT NULL DEFAULT '',
	`author` int(10) NOT NULL DEFAULT '0',
	`author_name` varchar(255) NOT NULL DEFAULT '',
	`class` varchar(255) NOT NULL DEFAULT '',
	`inherit_class` varchar(255) NOT NULL DEFAULT '',
	`default_child_class` varchar(255) NOT NULL DEFAULT '',
	`referer` varchar(255) NOT NULL DEFAULT '',
	
	-- statistics
	`select_count` int(10) unsigned NOT NULL DEFAULT '0',
	`read_count` int(10) unsigned NOT NULL DEFAULT '0',
	`update_count` int(10) unsigned NOT NULL DEFAULT '0',
	`child_count` int(10) unsigned NOT NULL DEFAULT '0',
	`sub_object_count` int(10) unsigned NOT NULL DEFAULT '0',
	`next_child_id` int(10) unsigned NOT NULL DEFAULT '1',
	`create_time` int(10) unsigned NOT NULL DEFAULT '0',
	`modify_time` int(10) unsigned NOT NULL DEFAULT '0',
	`insert_time` int(10) unsigned NOT NULL DEFAULT '0',
	`access_time` int(10) unsigned NOT NULL DEFAULT '0',
	
	-- privilege
	`priv` smallint(3) NOT NULL DEFAULT '755',
	`priv_group` smallint(3) NOT NULL DEFAULT '755',
	`admin` text NOT NULL,
	`member` text NOT NULL,
	`whitelist` text NOT NULL,
	`blacklist` text NOT NULL,
	
	-- group relationship
	`agent` text NOT NULL,
	`friend` text NOT NULL,
	`listen` text NOT NULL,
	`listener` text NOT NULL,
	`include` text NOT NULL,
	`profile` text NOT NULL,
	
	-- common attributes
	`event_handlers` text NOT NULL,
	`template` text NOT NULL,
	`javascript` text NOT NULL,
	`css` text NOT NULL,
	`script` text NOT NULL,
	`credit` text NOT NULL,
	`siteroot` text NOT NULL,
	`note` text NOT NULL,
	`draft` text NOT NULL,
	`inbox` text NOT NULL,
	`title` text NOT NULL,
	`abstract` text NOT NULL,
	`content` text NOT NULL,
	`order` int(5) unsigned NOT NULL DEFAULT '0',
	`rate` int(10) unsigned NOT NULL DEFAULT '0',
	`digest` tinyint(1) NOT NULL DEFAULT '0',
	`listener_inherit` tinyint(1) NOT NULL DEFAULT '0',
	`settings` text NOT NULL,
	`tag` text NOT NULL,

	PRIMARY KEY (`id`),
	UNIQUE KEY (`path`)
);

DROP TABLE IF EXISTS common_object_tag;
CREATE TABLE common_object_tag (
	`path` varchar(255) NOT NULL DEFAULT '',
	`tag` varchar(50) NOT NULL DEFAULT '',
	PRIMARY KEY (`path`, `tag`)
);

DROP TABLE IF EXISTS common_attribute;
CREATE TABLE common_attribute (
	`path` varchar(255) NOT NULL DEFAULT '',
	`name` varchar(255) NOT NULL DEFAULT '',
	`value` text NOT NULL,
	PRIMARY KEY (`path`, `name`)
);

DROP TABLE IF EXISTS common_object_default;
CREATE TABLE common_object_default (
	-- common attributes
	`class` varchar(255) NOT NULL DEFAULT '',
	`inherit_class` varchar(255) NOT NULL DEFAULT '',
	`default_child_class` varchar(255) NOT NULL DEFAULT '',
	
	-- privilege
	`priv` smallint(3) unsigned NOT NULL DEFAULT '755',
	`priv_group` smallint(3) unsigned NOT NULL DEFAULT '755',
	`admin` text NOT NULL,
	`member` text NOT NULL,
	`whitelist` text NOT NULL,
	`blacklist` text NOT NULL,
	
	-- group relationship
	`agent` text NOT NULL,
	`friend` text NOT NULL,
	`listen` text NOT NULL,
	`listener` text NOT NULL,
	`include` text NOT NULL,
	`profile` text NOT NULL,
	
	-- common attributes
	`event_handlers` text NOT NULL,
	`template` text NOT NULL,
	`javascript` text NOT NULL,
	`css` text NOT NULL,
	`script` text NOT NULL,
	`credit` text NOT NULL,
	`note` text NOT NULL,
	`draft` text NOT NULL,
	`inbox` text NOT NULL,
	`title` text NOT NULL,
	`abstract` text NOT NULL,
	`content` text NOT NULL,
	`order` int(5) unsigned NOT NULL DEFAULT '0',
	`settings` text NOT NULL,
	`tag` text NOT NULL,
	`rate` int(10) unsigned NOT NULL DEFAULT '0',
	`listener_inherit` tinyint(1) unsigned NOT NULL DEFAULT '0',

	PRIMARY KEY (`class`)
);

DROP TABLE IF EXISTS common_attribute_default;
CREATE TABLE common_attribute_default (
	`class` varchar(255) NOT NULL DEFAULT '',
	`name` varchar(255) NOT NULL DEFAULT '',
	`value` text NOT NULL,
	PRIMARY KEY (`class`, `name`)
);

DROP TABLE IF EXISTS common_search;
CREATE TABLE common_search (
	`path` varchar(255) NOT NULL DEFAULT '',
	`page_rank` int(10) NOT NULL DEFAULT '0',
	`search_index` text,
	PRIMARY KEY (`path`)
);

DROP TABLE IF EXISTS common_user;
CREATE TABLE common_user (
	`uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`status` tinyint(1) NOT NULL DEFAULT '0',
	`login_name` varchar(255) NOT NULL DEFAULT '',
	`password` varchar(255) NOT NULL DEFAULT '',
	`salt` varchar(255) NOT NULL DEFAULT '',
	`realname` varchar(255) NOT NULL DEFAULT '',
	`nickname` varchar(255) NOT NULL DEFAULT '',
	`register_time` int(10) unsigned NOT NULL DEFAULT '0',
	`register_ip` varchar(30) NOT NULL DEFAULT '',
	`last_login_time` int(10) unsigned NOT NULL DEFAULT '0',
	`last_login_ip` varchar(30) NOT NULL DEFAULT '',
	`login_count` int(10) unsigned NOT NULL DEFAULT '0',
	`online_time` int(10) unsigned NOT NULL DEFAULT '0',
	`student_id` varchar(30) NOT NULL DEFAULT '',
	`school` varchar(255) NOT NULL DEFAULT '',
	`grade` varchar(255) NOT NULL DEFAULT '',
	`dept` varchar(255) NOT NULL DEFAULT '',
	`class` varchar(255) NOT NULL DEFAULT '',
	`role` varchar(255) NOT NULL DEFAULT '',
	`referer` varchar(255) NOT NULL DEFAULT '',
	`avatar` varchar(255) NOT NULL DEFAULT '',
	`friend` text NOT NULL,
	`listen` text NOT NULL,
	`listener` text NOT NULL,
	`include` text NOT NULL,
	`profile` text NOT NULL,
	`settings` text NOT NULL,
	PRIMARY KEY (`uid`)
);

DROP TABLE IF EXISTS common_login_log;
CREATE TABLE common_login_log (
	`uid` int(10) unsigned NOT NULL DEFAULT '0',
	`ip` varchar(30) NOT NULL DEFAULT '',
	`time` int(10) unsigned NOT NULL DEFAULT '0',
	`count` int(10) unsigned NOT NULL DEFAULT '0'
);

DROP TABLE IF EXISTS common_false_login_log;
CREATE TABLE common_false_login_log (
	`ip` varchar(30) NOT NULL DEFAULT '',
	`time` int(10) unsigned NOT NULL DEFAULT '0',
	`login_name` varchar(30) NOT NULL DEFAULT '',
	`password` varchar(30) NOT NULL DEFAULT ''
);

DROP TABLE IF EXISTS common_event_log;
CREATE TABLE common_event_log (
	`uid` int(10) unsigned NOT NULL DEFAULT '0',
	`euid` int(10) unsigned NOT NULL DEFAULT '0',
	`ip` varchar(30) NOT NULL DEFAULT '',
	`time` int(10) unsigned NOT NULL DEFAULT '0',
	`path` varchar(255) NOT NULL DEFAULT '',
	`event` varchar(30) NOT NULL DEFAULT ''
);

DROP TABLE IF EXISTS common_group;
CREATE TABLE common_group (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL DEFAULT '',
	`parent` varchar(255) NOT NULL DEFAULT '',
	`create_time` int(10) unsigned NOT NULL DEFAULT '0',
	`create_user` int(10) unsigned NOT NULL DEFAULT '0',
	`priv` smallint(3) unsigned NOT NULL DEFAULT '744',
	`admin` text NOT NULL,
	`agent` text NOT NULL,
	`member` text NOT NULL,
	`friend` text NOT NULL,
	`listen` text NOT NULL,
	`listener` text NOT NULL,
	`include` text NOT NULL,
	`profile` text NOT NULL,
	`settings` text NOT NULL,
	`public_object` varchar(255) NOT NULL DEFAULT '',
	`private_object` varchar(255) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS common_message;
CREATE TABLE common_message (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`source` varchar(255) NOT NULL DEFAULT '',
	`source_name` varchar(255) NOT NULL DEFAULT '',
	`referer` varchar(255) NOT NULL DEFAULT '',
	`author` int(10) unsigned NOT NULL DEFAULT '0',
	`time` int(10) unsigned NOT NULL DEFAULT '0',
	`content` text NOT NULL,
	PRIMARY KEY(`id`)
);

DROP TABLE IF EXISTS common_inbox;
CREATE TABLE common_inbox (
	`target` varchar(255) NOT NULL DEFAULT '',
	`path` varchar(255) NOT NULL DEFAULT '',
	`sticky` tinyint(1) NOT NULL DEFAULT '0',
	`important` tinyint(1) NOT NULL DEFAULT '0'
);

DROP TABLE IF EXISTS common_session;
CREATE TABLE common_session (
	`sid` char(10) NOT NULL DEFAULT '',
	`ip` char(30) NOT NULL DEFAULT '',
	`uid` int(10) unsigned NOT NULL DEFAULT '0',
	`euid` int(10) unsigned NOT NULL DEFAULT '0',
	`last_activity` int(10) unsigned NOT NULL DEFAULT '0',
	PRIMARY KEY(`sid`, `ip`)
) TYPE=HEAP;

