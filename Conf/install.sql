-- MySQL commands here to automatically create tables

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- BEGIN Club Management Platform

/**
 * Notes on table structure
 * 1. All columns which might appear in condition of a query with a result
 *    set larger than 100 rows, should be indexed.
 * 2. All columns should be NOT NULL for performance.
 * 3. Most tables should be subject to Boyce-Codd Normal Form, while
 *    some redundancy can be used to improve performance (e.g. the number of
 *    posts in a thread which is to be displayed in the forum page).
 * 4. All nouns should be in single form.
 * 5. All words should be in lower case and separated by an underscore.
 * 6. All primary keys (IDs) should be different. Here are some of them:
	uid		user
	gid		club (group)
	sid		school
	pid		project
	aid		poster (activity)
	attachid	attachment
 */
/**
 * Notes on queries
 * 1. All column names should be quoted by `, all data should be quoted by '.
 * 2. All input should be sanitized before forming the query string.
 * 3. When retrieving data, objects should be used instead of associasive arrays.
 */

DROP DATABASE campus;
CREATE DATABASE IF NOT EXISTS campus;
GRANT ALL PRIVILEGES ON campus.* TO 'campus-web'@'localhost' IDENTIFIED BY 'cc78c1fe' WITH GRANT OPTION;

USE campus;

-- BEGIN school info
CREATE TABLE IF NOT EXISTS ustc_school (
	`sid` INT(10) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`sid`),
	INDEX key_name(`name`)
);

INSERT INTO ustc_school SET `name`='中国科学技术大学';
-- END school info

-- BEGIN user info

CREATE TABLE IF NOT EXISTS ustc_session (
	`uid` INT(10) unsigned NOT NULL,
	`email` VARCHAR(100) NOT NULL,
	`password` CHAR(32) NOT NULL,
	`lastactivity` INT(10) unsigned NOT NULL,
	`ip` INT(10) unsigned NOT NULL,
	PRIMARY KEY (`uid`),
	KEY `key_lastactivity` (`lastactivity`),
	KEY `key_ip` (`ip`)
);

CREATE TABLE IF NOT EXISTS ustc_user (
	`uid` INT(10) NOT NULL AUTO_INCREMENT,
	`sid` INT(10) NOT NULL, -- school id
	`realname` VARCHAR(50) NOT NULL,
	`login_type` TINYINT(1) NOT NULL DEFAULT 0, -- 0 for local, 1 for Renren.com
	`email` VARCHAR(100) NOT NULL,
	`password` CHAR(32) NOT NULL, -- password = md5(concat(md5(input),salt))
	`salt` CHAR(10) NOT NULL, -- random salt for password
	`status` ENUM('active', 'locked', 'inactive') NOT NULL,
	`isonline` tinyint(1) NOT NULL DEFAULT 0,
	`isdeveloper` tinyint(1) NOT NULL DEFAULT 0, -- all privileges
	`isschooladm` tinyint(1) NOT NULL DEFAULT 0, -- school admin
	`register_time` INT(10) NOT NULL, -- unix timestamp
	`last_login_time` INT(10) default NULL, -- unix timestamp
	`login_count` INT(10) NOT NULL DEFAULT 0,
	`gender` tinyint(1) default NULL, -- 0 for girl, 1 for boy
	`grade` INT(4) default NULL, -- year of admission
	`education` VARCHAR(10) default NULL,
	`student_no` VARCHAR(15) default NULL,
	`dept` VARCHAR(100) default NULL,
	`telephone` VARCHAR(20) DEFAULT NULL,
	`major` VARCHAR(100) default NULL,
	`homepage` VARCHAR(100) default NULL,
	`notify_email` VARCHAR(100) NOT NULL,
	`avatar` VARCHAR(100) default NULL, -- /upload/avatar/filename
	`hobby` TEXT,
	PRIMARY KEY (`uid`),
	FOREIGN KEY (`sid`) REFERENCES ustc_school(`sid`),
	INDEX key_realname(`realname`),
	INDEX key_student_no(`student_no`),
	INDEX key_major(`sid`,`major`),
	INDEX key_dept(`sid`,`dept`),
	INDEX key_grade(`sid`,`grade`)
);

CREATE TABLE IF NOT EXISTS ustc_login_log (
	`ip` INT(10) NOT NULL,
	`time` INT(10) NOT NULL, -- unix timestamp
	`method` TINYINT(1) NOT NULL DEFAULT 0, -- 0 for local, 1 for Renren
	`login_name` VARCHAR(255) NOT NULL,
	`result` ENUM('success', 'failed') NOT NULL,
	INDEX key_ip(`ip`),
	INDEX key_time(`time`),
	INDEX key_login_name(`login_name`)
);
-- END user info

-- BEGIN club info
CREATE TABLE IF NOT EXISTS ustc_club (
	`gid` INT(10) NOT NULL AUTO_INCREMENT,
	`sid` INT(10) NOT NULL,
	`owner` INT(10) NOT NULL,
	`status` ENUM('active', 'locked', 'inactivated') NOT NULL,
	`register_time` INT(10) NOT NULL, -- unix timestamp
	`name` VARCHAR(255) NOT NULL,
	`name_en` VARCHAR(255),
	`slogan` VARCHAR(255),
	`qq_group` VARCHAR(255),
	`contact` VARCHAR(255),
	`homepage` VARCHAR(255),
	`found_date` VARCHAR(255),
	`teacher` VARCHAR(255),
	`logo` VARCHAR(100), -- /upload/logo/filename
	`total_rate` INT(10) NOT NULL DEFAULT 0,
	`clicks` INT(10) NOT NULL DEFAULT 0,
	`member_count` INT(10) NOT NULL DEFAULT 0, -- redundant
	`poster_count` INT(10) NOT NULL DEFAULT 0, -- redundant
	`shortdesc` TEXT,
	`description` TEXT,
	PRIMARY KEY (`gid`),
	FOREIGN KEY (`sid`) REFERENCES ustc_school(`sid`),
	FOREIGN KEY (`owner`) REFERENCES ustc_user(`uid`)
);

-- Correlation of users and groups
CREATE TABLE IF NOT EXISTS ustc_user_group (
	`uid` INT(10) NOT NULL,
	`gid` INT(10) NOT NULL,
	`priv` ENUM('admin', 'manager', 'member', 'inactive') NOT NULL,
	`title` VARCHAR(255),
	FOREIGN KEY (`uid`) REFERENCES ustc_user(`uid`),
	FOREIGN KEY (`gid`) REFERENCES ustc_club(`gid`),
	UNIQUE KEY key_uid_gid(`uid`,`gid`)
);

-- If a user is in group, he/she should be in the follow list
CREATE TABLE IF NOT EXISTS ustc_follow_group (
	`uid` INT(10) NOT NULL,
	`gid` INT(10) NOT NULL,
	`start_time` INT(10) NOT NULL, -- unix timestamp
	FOREIGN KEY (`uid`) REFERENCES ustc_user(`uid`),
	FOREIGN KEY (`gid`) REFERENCES ustc_club(`gid`)
);

CREATE TABLE IF NOT EXISTS ustc_project (
	`pid` INT(10) NOT NULL AUTO_INCREMENT,
	`gid` INT(10) NOT NULL,
	`name` VARCHAR(255),
	PRIMARY KEY (`pid`),
	FOREIGN KEY (`gid`) REFERENCES ustc_club(`gid`),
	INDEX key_name(`name`)
);

CREATE TABLE IF NOT EXISTS ustc_user_project (
	`uid` INT(10) NOT NULL,
	`pid` INT(10) NOT NULL,
	FOREIGN KEY (`uid`) REFERENCES ustc_user(`uid`),
	FOREIGN KEY (`pid`) REFERENCES ustc_project(`pid`)
);
-- END group info

-- BEGIN Poster module
CREATE TABLE IF NOT EXISTS ustc_poster (
	`aid` INT(10) NOT NULL AUTO_INCREMENT,
	`gid` INT(10) NOT NULL,
	`author` INT(10) NOT NULL, -- uid
	`name` VARCHAR(255) NOT NULL,
	`publish_time` INT(10) NOT NULL, -- unix timestamp
	`start_time` INT(10) NOT NULL, -- unix timestamp
	`end_time` INT(10) NOT NULL, -- unix timestamp
	`place` VARCHAR(255) NOT NULL,
	`rate_total` INT(10) NOT NULL DEFAULT 0,
	`likes` INT(10) NOT NULL DEFAULT 0,
	`clicks` INT(10) NOT NULL DEFAULT 0,
	`shared` INT(10) NOT NULL DEFAULT 0,
	`comment_count` INT(10) NOT NULL DEFAULT 0, -- redundant to speed up
	`poster` VARCHAR(100), -- /upload/poster/filename
	`description` TEXT,
	PRIMARY KEY(`aid`),
	FOREIGN KEY (`gid`) REFERENCES ustc_club(`gid`),
	FOREIGN KEY (`author`) REFERENCES ustc_user(`uid`),
	INDEX key_starttime(`start_time`),
	INDEX key_endtime(`end_time`),
	INDEX key_place(`place`)
);

/* not used
CREATE TABLE IF NOT EXISTS ustc_act_tag (
	`aid` INT(10) NOT NULL,
	`tag` VARCHAR(255) NOT NULL,
	INDEX key_aid(`aid`),
	INDEX key_tag(`tag`)
);
*/

/* not used
CREATE TABLE IF NOT EXISTS ustc_act_history (
	`aid` INT(10) NOT NULL,
	`uid` INT(10) NOT NULL,
	`time` INT(10) NOT NULL,
	`content` TEXT NOT NULL
);
*/
CREATE TABLE IF NOT EXISTS ustc_poster_comment (
	`cid` INT(10) NOT NULL AUTO_INCREMENT,
	`aid` INT(10) NOT NULL,
	`author` INT(10) NOT NULL,
	`time` INT(10) NOT NULL,
	`content` TEXT,
	PRIMARY KEY (`cid`),
	FOREIGN KEY (`aid`) REFERENCES ustc_poster(`aid`),
	FOREIGN KEY (`author`) REFERENCES ustc_user(`uid`)
);
-- END Poster module

-- BEGIN TodoList module
CREATE TABLE IF NOT EXISTS ustc_todolist (
	`item` INT(10) NOT NULL AUTO_INCREMENT,
	`gid` INT(10) NOT NULL,
	`pid` INT(10) NOT NULL, -- project id
	`author` INT(10) NOT NULL,
	`status` ENUM('doing', 'complete') NOT NULL,
	`content` TEXT NOT NULL,
	PRIMARY KEY (`item`),
	FOREIGN KEY (`gid`) REFERENCES ustc_club(`gid`),
	FOREIGN KEY (`pid`) REFERENCES ustc_project(`pid`),
	FOREIGN KEY (`author`) REFERENCES ustc_user(`uid`),
	INDEX key_status(`status`)
);

CREATE TABLE IF NOT EXISTS ustc_todolist_history (
	`item` INT(10) NOT NULL,
	`uid` INT(10) NOT NULL, -- operator
	`operation` ENUM('create', 'delete', 'update', 'complete', 'incomplete') NOT NULL,
	`new_content` TEXT NOT NULL, -- empty for delete operation
	INDEX key_item(`item`),
	FOREIGN KEY (`uid`) REFERENCES ustc_user(`uid`),
	INDEX key_operation(`operation`)
);
-- END TodoList module

-- BEGIN Share module
-- Highly depends on Attachment module
CREATE TABLE IF NOT EXISTS ustc_share (
	`attachid` INT(10) NOT NULL,
	`gid` INT(10) NOT NULL,
	`pid` INT(10) NOT NULL, -- if not in any project, pid = 0
	`author` INT(10) NOT NULL,
	`upload_time` INT(10) NOT NULL, -- unix timestamp
	`folder` VARCHAR(100) NOT NULL, -- folder name, null for root
	PRIMARY KEY (`attachid`),
	FOREIGN KEY (`gid`) REFERENCES ustc_club(`gid`),
	INDEX key_pid(`pid`),
	FOREIGN KEY (`author`) REFERENCES ustc_user(`uid`),
	INDEX key_folder(`folder`)
);
-- END Share module

/* not used
-- BEGIN Plansheet module
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
*/
-- END Plansheet module

-- BEGIN Forum module
/*
CREATE TABLE IF NOT EXISTS ustc_forum (
	`fid` INT(10) NOT NULL AUTO_INCREMENT,
	`gid` INT(10) NOT NULL,
	PRIMARY KEY(`fid`),
	FOREIGN KEY (`gid`) REFERENCES ustc_club(`gid`)
);
*/

CREATE TABLE IF NOT EXISTS ustc_forum_post (
	`fpid` INT(10) NOT NULL AUTO_INCREMENT,
	`gid` INT(10) NOT NULL,
	`parent` INT(10) NOT NULL, -- Tree-like posts and replies
	`author` INT(10) NOT NULL,
	`time` INT(10) NOT NULL,
	`pid` INT(10) NOT NULL DEFAULT '0', -- if not in any project, pid = 0
	`content` TEXT,
	PRIMARY KEY(`fpid`),
	FOREIGN KEY (`gid`) REFERENCES ustc_club(`gid`),
	INDEX key_parent(`parent`),
	FOREIGN KEY (`author`) REFERENCES ustc_user(`uid`),
	INDEX key_pid(`pid`)
);
-- END Forum module

-- BEGIN Place Audit module
/* not used
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
*/
-- END Place Audit module

-- BEGIN Email Notify module
CREATE TABLE IF NOT EXISTS ustc_email_notify (
	`source` INT(10) NOT NULL,
	`target` INT(10) NOT NULL,
	`gid` INT(10) NOT NULL, -- in which group
	`time` INT(10) NOT NULL, -- unix timestamp
	`status` ENUM('success', 'failed') NOT NULL,
	`retry_num` INT(5) NOT NULL DEFAULT '0',
	`last_retry` INT(10) NOT NULL, -- unix timestamp
	`title` VARCHAR(80) NOT NULL,
	`content` TEXT,
	FOREIGN KEY (`source`) REFERENCES ustc_user(`uid`),
	FOREIGN KEY (`target`) REFERENCES ustc_user(`uid`),
	FOREIGN KEY (`gid`) REFERENCES ustc_club(`gid`),
	INDEX key_time(`time`)
);
-- END Email Notify module

-- END Club Management Platform

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
