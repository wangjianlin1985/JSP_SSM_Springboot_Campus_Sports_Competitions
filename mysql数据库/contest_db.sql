/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : contest_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2017-12-31 01:34:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_contest`
-- ----------------------------
DROP TABLE IF EXISTS `t_contest`;
CREATE TABLE `t_contest` (
  `contestId` int(11) NOT NULL auto_increment COMMENT '比赛id',
  `schoolObj` int(11) NOT NULL COMMENT '举办学校',
  `projectObj` int(11) NOT NULL COMMENT '比赛项目',
  `contestName` varchar(80) NOT NULL COMMENT '比赛名称',
  `contestDesc` varchar(5000) NOT NULL COMMENT '比赛介绍',
  `contestPlace` varchar(50) NOT NULL COMMENT '比赛地点',
  `personNumber` int(11) NOT NULL COMMENT '人数限制',
  `signUpTime` varchar(20) default NULL COMMENT '报名时间',
  `endTime` varchar(20) default NULL COMMENT '截止时间',
  PRIMARY KEY  (`contestId`),
  KEY `schoolObj` (`schoolObj`),
  KEY `projectObj` (`projectObj`),
  CONSTRAINT `t_contest_ibfk_1` FOREIGN KEY (`schoolObj`) REFERENCES `t_school` (`schoolId`),
  CONSTRAINT `t_contest_ibfk_2` FOREIGN KEY (`projectObj`) REFERENCES `t_project` (`projectId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_contest
-- ----------------------------
INSERT INTO `t_contest` VALUES ('1', '1', '1', '华东理工大学乒乓球比赛', '<p>1月20日在学校先进行校内乒乓球比赛，乒乓球比赛校内冠军将和其他2个学校的冠军进行校园间总决赛！</p>', '学校体院馆', '40', '2017-12-30 22:59:04', '2018-01-15 22:59:16');
INSERT INTO `t_contest` VALUES ('2', '3', '1', '上海师范大学乒乓球比赛', '<p>上海师范大学的乒乓球比赛，冠军最后也是和上海应用技术大学和华东理工大学2个学校决赛！</p>', '上海师范体育场', '40', '2017-12-31 01:21:07', '2018-01-14 01:21:10');
INSERT INTO `t_contest` VALUES ('3', '1', '2', '华东理工大学羽毛球比赛', '<p>羽毛球项目华东理工大学的比赛，大家请尽快报名</p>', '学校羽毛球场', '40', '2017-12-31 01:28:35', '2018-01-09 01:28:36');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL auto_increment COMMENT '公告id',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` varchar(5000) NOT NULL COMMENT '公告内容',
  `publishDate` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '校内总决赛预告', '<p>1月20日比赛的3个学校的冠军将于1月25日在市体育局进行总决赛，大家拭目以待！</p>', '2017-12-30 23:02:02');
INSERT INTO `t_notice` VALUES ('2', '华东理工大学乒乓球比赛第1组第1场比赛结果', '<p>双鱼林 VS 李明文 &nbsp; 3：2 &nbsp;胜出</p>', '2017-12-31 01:26:02');

-- ----------------------------
-- Table structure for `t_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `projectId` int(11) NOT NULL auto_increment COMMENT '项目id',
  `projectName` varchar(20) NOT NULL COMMENT '项目名称',
  `projectDesc` varchar(20) NOT NULL COMMENT '项目介绍',
  PRIMARY KEY  (`projectId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES ('1', '乒乓球', '健身运动项目');
INSERT INTO `t_project` VALUES ('2', '羽毛球', '锻炼身体的项目');
INSERT INTO `t_project` VALUES ('3', '篮球', '锻炼身体的体力战');

-- ----------------------------
-- Table structure for `t_school`
-- ----------------------------
DROP TABLE IF EXISTS `t_school`;
CREATE TABLE `t_school` (
  `schoolId` int(11) NOT NULL auto_increment COMMENT '学校id',
  `schoolName` varchar(20) NOT NULL COMMENT '学校名称',
  PRIMARY KEY  (`schoolId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_school
-- ----------------------------
INSERT INTO `t_school` VALUES ('1', '华东理工大学');
INSERT INTO `t_school` VALUES ('2', '上海应用技术大学');
INSERT INTO `t_school` VALUES ('3', '上海师范大学');

-- ----------------------------
-- Table structure for `t_score`
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score` (
  `scoreId` int(11) NOT NULL auto_increment COMMENT '成绩id',
  `contestObj` int(11) NOT NULL COMMENT '比赛名称',
  `studentObj` varchar(30) NOT NULL COMMENT '学生',
  `contentRound` varchar(20) NOT NULL COMMENT '比赛轮次',
  `scoreValue` float NOT NULL COMMENT '比赛积分',
  PRIMARY KEY  (`scoreId`),
  KEY `contestObj` (`contestObj`),
  KEY `studentObj` (`studentObj`),
  CONSTRAINT `t_score_ibfk_1` FOREIGN KEY (`contestObj`) REFERENCES `t_contest` (`contestId`),
  CONSTRAINT `t_score_ibfk_2` FOREIGN KEY (`studentObj`) REFERENCES `t_student` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_score
-- ----------------------------
INSERT INTO `t_score` VALUES ('1', '1', 'user1', '第1组第1场', '3');
INSERT INTO `t_score` VALUES ('2', '1', 'user1', '第1组第2场', '4');
INSERT INTO `t_score` VALUES ('3', '1', 'user2', '第1组第1场', '2');
INSERT INTO `t_score` VALUES ('4', '1', 'user2', '第1组第2场', '1');

-- ----------------------------
-- Table structure for `t_student`
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `contest` int(11) NOT NULL COMMENT '报名比赛',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `signUpTime` varchar(20) default NULL COMMENT '报名时间',
  PRIMARY KEY  (`user_name`),
  KEY `contest` (`contest`),
  CONSTRAINT `t_student_ibfk_1` FOREIGN KEY (`contest`) REFERENCES `t_contest` (`contestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('user1', '123', '1', '双鱼林', '男', '2017-12-06', 'upload/f503da1b-1ab1-45e0-9c86-fa471087b5e7.jpg', '13598342934', '四川成都红星路', '2017-12-30 23:00:09');
INSERT INTO `t_student` VALUES ('user2', '123', '1', '李明文', '男', '2017-12-06', 'upload/cdd43cc4-6ba9-41df-91fc-09b34aee8de7.jpg', '13958303943', '四川达州', '2017-12-31 01:24:19');
