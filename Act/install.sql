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
--	placeid		place id
--	applyid		place apply
--	attachid	attachment
-- -- 
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40101 SET character_set_server = utf8 */;
/*!40101 SET character_set_client = utf8 */;

DROP DATABASE IF EXISTS campus;
CREATE DATABASE IF NOT EXISTS campus /*!40100 DEFAULT CHARACTER SET utf8 */;
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

DROP TABLE IF EXISTS ustc_org;
CREATE TABLE IF NOT EXISTS ustc_org (
	`gid` INT(10) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`fid` INT(10) NOT NULL,
	`type` ENUM('young_comm', 'student_union', 'graduate_union', 'club', 'teacher'),
	PRIMARY KEY (`gid`)
);

INSERT INTO ustc_org SET name = '格物致知社', fid = 1, `type` = 'club';
INSERT INTO ustc_org SET name = 'Linux用户协会', fid = 2, `type` = 'club';

CREATE TABLE IF NOT EXISTS ustc_user_org (
	`uid` INT(10) NOT NULL,
	`gid` INT(10) NOT NULL,
	`priv` ENUM('root', 'admin', 'member'),
	`title` VARCHAR(255) NOT NULL,
	INDEX key_uid(`uid`),
	INDEX key_gid(`gid`)
);

-- `poster` is attachid of the image
DROP TABLE IF EXISTS ustc_act;
CREATE TABLE IF NOT EXISTS ustc_act (
	`aid` INT(10) NOT NULL AUTO_INCREMENT,
	`pid` INT(10) NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	`start_time` INT(10),
	`end_time` INT(10),
	`placeid` INT(10),
	`rate` INT(10),
	`poster` VARCHAR(255),
	`description` TEXT,
	`summary` TEXT,
	PRIMARY KEY(`aid`),
	INDEX key_pid(`pid`),
	INDEX key_starttime(`start_time`),
	INDEX key_endtime(`end_time`),
	INDEX key_placeid(`placeid`),
	INDEX key_rate(`rate`)
);

INSERT INTO ustc_act SET pid = 1, name = '物理爱好者周末', start_time = '1335242497', end_time = '1336000000', placeid = 1, rate = 5, description = '让我们见证光与电的威力。若是校外活动，则需在活动出发3个工作日前提交《中国科学技术大学学生校外活动组织单位安全承诺书》和《中国科学技术大学学生校外活动个人安全承诺书》；否则，活动不予举办。';
INSERT INTO ustc_act SET pid = 1, name = '五月风科技文化节开幕式', start_time = '1335242497', end_time = '1336000000', placeid = 2, rate = 0, description = '让我们见证光与电的威力。若是校外活动，则需在活动出发3个工作日前提交《中国科学技术大学学生校外活动组织单位安全承诺书》和《中国科学技术大学学生校外活动个人安全承诺书》；否则，活动不予举办。';
INSERT INTO ustc_act SET pid = 2, name = 'LUG每周小聚', start_time = '1335242497', end_time = '1336000000', placeid = 3, rate = 5, description = '让我们见证光与电的威力。若是校外活动，则需在活动出发3个工作日前提交《中国科学技术大学学生校外活动组织单位安全承诺书》和《中国科学技术大学学生校外活动个人安全承诺书》；否则，活动不予举办。';

DROP TABLE IF EXISTS ustc_act_tag;
CREATE TABLE IF NOT EXISTS ustc_act_tag (
	`aid` INT(10) NOT NULL,
	`tag` VARCHAR(255) NOT NULL,
	INDEX key_aid(`aid`),
	INDEX key_tag(`tag`)
);

INSERT INTO ustc_act_tag SET aid = 1, tag = '活动';
INSERT INTO ustc_act_tag SET aid = 1, tag = '比赛';
INSERT INTO ustc_act_tag SET aid = 2, tag = '比赛';
INSERT INTO ustc_act_tag SET aid = 3, tag = '讲座';

DROP TABLE IF EXISTS ustc_place;
CREATE TABLE IF NOT EXISTS ustc_place (
	`placeid` INT(10) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`capacity` INT(10) NOT NULL,
	`building` VARCHAR(255),
	`floor` TINYINT(3),
	PRIMARY KEY (`placeid`),
	INDEX key_building(`building`)
);

INSERT INTO ustc_place SET `name` = '东区学生活动中心广场', `capacity` = 5;
INSERT INTO ustc_place SET `name` = '西区学生活动中心广场', `capacity` = 5;
INSERT INTO ustc_place SET `name` = '西区学生活动中心322', `capacity` = 1, `building` = '西区学生活动中心';

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

DROP TABLE IF EXISTS ustc_plan;
CREATE TABLE IF NOT EXISTS ustc_plan (
	`pid` INT(10) NOT NULL,
	`status` ENUM('not_submitted', 'pending_approval', 'approved1', 'approved2', 'approved3', 'rejected1', 'rejected2', 'rejected3', 'rejected4', 'executing', 'finished', 'archived'),
	`gid` INT(10) NOT NULL,
	`host_org` VARCHAR(255) NOT NULL,
/*	`undertaker_org` VARCHAR(255) NOT NULL, */ /* undertaker org is the org of gid */
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
INSERT INTO ustc_plan SET pid = 1, status = 'executing', gid = 1, host_org = '校团委', assistant_org = '', version = 1, time = '1335242497', name = '物理爱好者周末', leader_uid = '1', start_time = '1335200000', end_time = '1335300000';
INSERT INTO ustc_plan SET pid = 2, status = 'finished', gid = 2, host_org = '校团委', assistant_org = '校学生Linux协会', version = 1, time = '1335242497', name = 'LUG每周小聚', leader_uid = '1', start_time = '1335200000', end_time = '1335300000';

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
