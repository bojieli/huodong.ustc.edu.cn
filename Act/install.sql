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

INSERT INTO ustc_user SET `username` = 'boj', `password` = '', `salt` = '', `status` = 'active', `student_no` = 'PB10000603', `dept` = '000', `dorm` = '221#328', `phone` = '', `email` = 'boj@mail.ustc.edu.cn', `bbs_id` = 'boj', `register_time` = UNIX_TIMESTAMP();

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
	`is_public` TINYINT(1) NOT NULL DEFAULT 0,
	`act_date` INT(10),
	`start_time` INT(10),
	`end_time` INT(10),
	`apply_place` TINYINT(1) NOT NULL DEFAULT 0,
	`place_diyname` VARCHAR(255),
	`placeid` INT(10),
	`leader` VARCHAR(30),
	`rate` INT(10) NOT NULL DEFAULT 0,
	`poster` VARCHAR(255),
	`description` TEXT,
	`content` TEXT,
	`summary` TEXT,
	PRIMARY KEY(`aid`),
	INDEX key_pid(`pid`),
	INDEX key_starttime(`start_time`),
	INDEX key_endtime(`end_time`),
	INDEX key_placeid(`placeid`),
	INDEX key_rate(`rate`)
);

INSERT INTO ustc_act SET pid = 1, name = '物理爱好者周末', is_public = 1, apply_place = 1, start_time = '1335242497', end_time = '1336000000', placeid = 1, rate = 5, description = '让我们见证光与电的威力。若是校外活动，则需在活动出发3个工作日前提交《中国科学技术大学学生校外活动组织单位安全承诺书》和《中国科学技术大学学生校外活动个人安全承诺书》；否则，活动不予举办。';
INSERT INTO ustc_act SET pid = 1, name = '五月风科技文化节开幕式', is_public = 1, apply_place = 1, start_time = '1335242497', end_time = '1336000000', placeid = 2, rate = 0, description = '让我们见证光与电的威力。若是校外活动，则需在活动出发3个工作日前提交《中国科学技术大学学生校外活动组织单位安全承诺书》和《中国科学技术大学学生校外活动个人安全承诺书》；否则，活动不予举办。';
INSERT INTO ustc_act SET pid = 2, name = 'LUG每周小聚', is_public = 1, apply_place = 1, start_time = '1335242497', end_time = '1336000000', placeid = 3, rate = 5, description = '让我们见证光与电的威力。若是校外活动，则需在活动出发3个工作日前提交《中国科学技术大学学生校外活动组织单位安全承诺书》和《中国科学技术大学学生校外活动个人安全承诺书》；否则，活动不予举办。', content = '<h2>Linux用户协会</h2>
中国科学技术大学Linux用户协会（Linux User Group，简称“LUG”）是由中国科学技术大学在校的GNU/Linux爱好者发起并组成的一个全校性群众团体。成立LUG的目的在于联合科大的GNU/Linux使用者，搭建信息交流共享的平台，宣传自由软件的价值，提高自由软件社区文化氛围, 推广自由软件在科大校园乃至合肥地区的应用。
<p>
LUG成立于2003年，至今已经走过了8个年头，是安徽省高校中唯一一个以推广自由软件社区文化、宣传自由软件价值的协会组织。在各届LUG成员和志愿者的共同努力下，LUG开展了许多有意义的活动，如Linux网络技术讲座、“GNU/Linux Install Party”、PMP中的嵌入式Linux技术讲座、Oracle和开源技术报告、“合肥地区开源软件竞赛”、自由软件日技术沙龙和多次GNU/Linux系统使用和编程讲座。
<p>
自2003年开始，LUG开始维护国内知名的Debian镜像服务器http://debian.ustc.edu.cn，目前，在中国科大对服务器硬件和带宽的支持下，该镜像已经成为Debian在中国的主力镜像。在中科龙梦的帮助下，LUG使用龙芯盒子建立起了freeshell服务器，为科大校友提供尝试GNU/Linux和龙芯服务的机会。在网络信息中心的帮助下，协会建立了PXE网络启动系统，使得在校内可以很快的试用和安装系统。并维护图书馆的无盘查询系统。
<p>
为了表彰其在2010-2011学年的出色表现，LUG于2011年5月被评为中国科学技术大学优秀学生社团协会主页。
<p>
<h2>Linux User Group @USTC</h2>
USTC LUG is abbreviation for Linux User Group (LUG) of University of Science and Technology of China (USTC). USTC LUG is a technology-leading association which consists of the GNU/Linux enthusiasts in USTC. The aim of USTC LUG is to unite the GNU/Linux users in USTC, to build a platform for information sharing, to share the value of free software, and to promote the using of free software in USTC and Hefei City.
<p>
Founded in 2003, USTC LUG has been gone through eight years. At present it is the only university association in Anhui province to promote the free software culture and value. Due to the combined efforts of its members and volunteers, USTC LUG has organized a number of meaningful activities, such as: Linux network technology seminar, GNU / Linux Install Party, PMP Embedded Linux technical seminars, Oracle and open source technologies seminars, Open Source Software Competition in Hefei, Software Freedom Day, A series of systems using and programming lectures.
<p>
USTC LUG started maintaining the well known Debian archive mirror debian.ustc.edu.cn in 2003, and now, with better hardware and bandwidth sponsored by USTC, it is finally becoming the official mirror of China. In addition, USTC LUG has established a freeshell server running on Loongson CPU, serving the whole campus to provide online experience on GNU/Linux. With the assistance of USTC Network Information Center, USTC LUG has set up a PXE network booting system, enabling the whole campus to perform convenient installs or quickly experience the system.
<p>
In recognition of its excellent performance between 2010 and 2011, USTC LUG was awarded the Outstanding Association of USTC in May 2011. Homepage of LUG@USTC';


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

DROP TABLE IF EXISTS ustc_act_comment;
CREATE TABLE IF NOT EXISTS ustc_act_comment (
	`id` INT(10) NOT NULL AUTO_INCREMENT,
	`aid` INT(10) NOT NULL,
	`uid` INT(10) NOT NULL,
	`time` INT(10) NOT NULL,
	`rate` INT(10) NOT NULL DEFAULT 0,
	`public` TINYINT(1) NOT NULL DEFAULT 1,
	`content` TEXT,
	PRIMARY KEY(`id`),
	INDEX key_aid(`aid`),
	INDEX key_uid(`uid`)
);

INSERT INTO ustc_act_comment SET aid = '2', `uid` = '1', `public` = 1, time = UNIX_TIMESTAMP(), content = 'Hello World!';
INSERT INTO ustc_act_comment SET aid = '3', `uid` = '1', `public` = 1, time = UNIX_TIMESTAMP(), content = '这是第一条评论。';
INSERT INTO ustc_act_comment SET aid = '3', `uid` = '1', `public` = 0, time = UNIX_TIMESTAMP(), content = '这是第二条评论（不公开）';
INSERT INTO ustc_act_comment SET aid = '3', `uid` = '1', `public` = 1, time = UNIX_TIMESTAMP(), content = '这是第三条评论';

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
	`additional_note` TEXT,
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
	`stage` TINYINT(1) NOT NULL,
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
	`leader` VARCHAR(30) NOT NULL,
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
	`name` VARCHAR(255) NOT NULL,
	`money` VARCHAR(10) NOT NULL,
	`note` VARCHAR(255) NOT NULL,
	INDEX key_pid(`pid`)
);

CREATE TABLE IF NOT EXISTS ustc_plan_account_book (
	`pid` INT(10) NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	`money` VARCHAR(10) NOT NULL,
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
	`page` TINYINT(1) NOT NULL,
	INDEX key_pid(`pid`)
);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
