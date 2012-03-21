# MySQL commands here to automatically create tables
# TODO

# History of an object is stored in column `content` in serialize($object) form.
# OOP should be used and associasive arrays should be replaced by objects.

# IDs should be different. Assigned IDs:
#	uid			user
#	gid			group (organization)
#	pid			project, plan (one-one correspondence)
#	aid			act (activity)
#	fid			forum
#	fpid		forum post
#	applyid		place apply
#	attachid	attachment

CREATE TABLE think_users IF NOT EXISTS (
	`uid` INT(10) NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(50) NOT NULL AUTO_INCREMENT,
	`password` CHAR(32) NOT NULL,
	`salt` CHAR(10) NOT NULL,
	`status` ENUM('active', 'locked', 'initial'),
	`student_no` VARCHAR(15) NOT NULL,
	`email` VARCHAR(100) NOT NULL,
	`register_time` INT(10) NOT NULL,
	`last_login_time` INT(10) NOT NULL DEFAULT '0',
	`login_count` INT(10) NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`),
	INDEX key_username(`username`),
);

CREATE TABLE think_org IF NOT EXISTS (
	`gid` INT(10) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`type` ENUM('student', 'teacher'),
	PRIMARY KEY (`gid`)
);

CREATE TABLE think_user_org IF NOT EXISTS (
	`uid` INT(10) NOT NULL,
	`gid` INT(10) NOT NULL,
	`priv` ENUM('root', 'admin', 'member'),
	INDEX key_uid(`uid`),
	INDEX key_gid(`gid`)
);

CREATE TABLE think_act IF NOT EXISTS (
	`aid`
	`name`
	`start`
	`end`
	`place`
	`type`
	`status`
	`rate`
	`poster`
);

CREATE TABLE think_act_history IF NOT EXISTS (
	`aid`
	`uid`
	`time`
	`content`
);

CREATE TABLE think_project IF NOT EXISTS (
	`pid` INT(10) NOT NULL AUTO_INCREMENT,
	`create_time`
);

CREATE TABLE think_plan IF NOT EXISTS (
	`pid`
	`status` ENUM()
);

CREATE TABLE think_plan_history IF NOT EXISTS (
	`pid`
	`uid`
	`time`
	`content`
);

CREATE TABLE think_plan_act IF NOT EXISTS (
	`pid`
	`aid`
);

CREATE TABLE think_forum IF NOT EXISTS (
	`fid`
	`moderator`
);

CREATE TABLE think_forum_post IF NOT EXISTS (
	`fid`
	`fpid`
	`parent`
	`uid`
	`time`
	`content`
);

CREATE TABLE think_plan_forum IF NOT EXISTS (
	`pid`
	`fid`
);

CREATE TABLE think_audit_priv IF NOT EXISTS (
	`uid`
	`priv`
);

CREATE TABLE think_audit_place IF NOT EXISTS (
	`applyid` INT(10) NOT NULL AUTO_INCREMENT,
	`aid`
	`time`
	`status`
	`reason`
);

CREATE TABLE think_attachment IF NOT EXISTS (
	`attachid` INT(10) NOT NULL AUTO_INCREMENT,
	`uid` INT(10) NOT NULL,
	`time` INT(10) NOT NULL,
	`filename` VARCHAR(255) NOT NULL,
	`filepath` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`attachid`)
);

CREATE TABLE think_act_attachment IF NOT EXISTS (
	`aid` INT(10) NOT NULL,
	`attachid` INT(10) NOT NULL,
	INDEX key_aid(`aid`)
);

CREATE TABLE think_plan_attachment IF NOT EXISTS (
	`pid` INT(10) NOT NULL,
	`attachid` INT(10) NOT NULL,
	INDEX key_pid(`pid`)
);