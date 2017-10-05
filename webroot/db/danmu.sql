/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : danmu

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-09-30 23:19:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `video` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `tags` varchar(100) DEFAULT NULL,
  `is_valid` tinyint(4) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('1', 'とある科学の超電磁砲', '<p>在面积占据东京都西部的三分之一，居住着230万名人口，其中八成人口是学生的巨大都市“学园都市”中，学园都市和外部隔离，研究最尖端科技。所有学生都接受超能力开发，并大都借由药物、催眠术与通电刺激等方式取得超能力。有各种类型不同能力，以范围和威力分为无能力者、低能力者、异能力者、强能力者、大能力者和超能力者。故事从学园都市最强的电击公主“超电磁炮”御坂美琴，某天认识了和白井黑子一样担任风纪委员的初春饰利开始……<br><br>&nbsp;&emsp;<img src=\"/blog/statics/upload/image/paojie.jpg\" style=\"box-shadow: 0px 0px 10px grey;\" title=\"1491290341042018966.jpg\" alt=\"paojie.jpg\"/></p>', 'shsn.mp4', '1', '81', ',动画,炮姐,', '1', '2017-09-27 21:14:51', '2017-09-27 21:14:51');
INSERT INTO `t_article` VALUES ('2', '響け！ユーフォニアム～北宇治高校吹奏楽部へようこそ～', '<p>作品主要讲述了进入北宇治高中就读的主人公黄前久美子，在同班同学加藤叶月的热烈影响下加入了该校的吹奏部。北宇治高中吹奏部直到5年前还是关西大会的常客，并且过去还是全国大会出场过的强校代表，然而自从顾问换了之后，该吹奏部就再也没有挺进过关西大会。之后以新顾问的赴任为契机，怀揣着高远目标的部员们挥洒着奋斗的青春，过着波澜万丈的每一天。终于，比赛的日子也即将到来……<br><br>&nbsp;&emsp;<img src=\"/blog/statics/upload/image/jingchui.jpg\" title=\"1491291658672046111.jpg\" style=\"box-shadow: 0px 0px 10px grey;\" alt=\"jingchui.jpg\"/></p>', 'jingchui.mp4', '1', '334', ',动画,京吹,', '1', '2017-09-27 21:14:50', '2017-09-27 21:14:50');
INSERT INTO `t_article` VALUES ('18', 'SHIROBAKO', '<p>本作的故事主要围绕追逐梦想的五名女生——宫森葵、安原绘麻、坂木静香、藤堂美沙、今井绿展开，是一部描写以白箱的完成为目标而奋斗的她们，每天遇到的麻烦以及策划工作时碰到的纠葛与挫折，还有制作组在制作作品时的团结和冲突的动画业界的日常的群像剧作品。<br><br>&nbsp;&emsp;<img src=\"/blog/statics/upload/image/baixiang.jpg\" title=\"1491292125229032274.jpg\" style=\"box-shadow: 0px 0px 10px grey;\" alt=\"baixiang.jpg\"/></p>', 'baixiang.mp4', '1', '6', ',动画,白箱,', '1', '2017-09-27 21:14:48', '2017-09-27 21:14:48');
INSERT INTO `t_article` VALUES ('20', '占位', '<p>占位</p>', null, '1', '1', ',动画,', '1', '2017-09-27 21:14:47', '2017-09-27 21:14:47');
INSERT INTO `t_article` VALUES ('21', 'abc', '<p>jhjhkjhkjhjk</p>', null, '1', '1', ',动画,', '1', '2017-09-27 21:14:46', '2017-09-27 21:14:46');
INSERT INTO `t_article` VALUES ('22', '老裴视频', '<p>这是一个很幽默的视频</p>', '1506496662865散落的花瓣视频.mp4', '1', '1', ',动画,JAVA课程,', '1', '2017-09-27 21:14:43', '2017-09-27 21:14:43');
INSERT INTO `t_article` VALUES ('23', 'dd', '<p>ddd</p>', '1506497167845aa.mp4', '1', '9', ',动画,', '1', '2017-09-27 21:14:42', '2017-09-27 21:14:42');

-- ----------------------------
-- Table structure for t_danmu
-- ----------------------------
DROP TABLE IF EXISTS `t_danmu`;
CREATE TABLE `t_danmu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `article_id` int(11) DEFAULT NULL,
  `is_valid` tinyint(4) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_danmu
-- ----------------------------
INSERT INTO `t_danmu` VALUES ('1', '{ \"text\":\"dfadf\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":22}', '1', null, null, null);
INSERT INTO `t_danmu` VALUES ('2', '{ \"text\":\"dfadfa\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":42}', '1', null, null, null);
INSERT INTO `t_danmu` VALUES ('3', '{ \"text\":\"dfadfadf\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":37}', '1', null, null, null);
INSERT INTO `t_danmu` VALUES ('4', '{ \"text\":\"text\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":74}', '1', null, null, null);
INSERT INTO `t_danmu` VALUES ('5', '{ \"text\":\"fddf\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":80}', '10', null, null, null);
INSERT INTO `t_danmu` VALUES ('6', '{ \"text\":\"adafd\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":106}', '10', null, null, null);
INSERT INTO `t_danmu` VALUES ('7', '{ \"text\":\"dfddd\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":54}', '12', null, null, null);
INSERT INTO `t_danmu` VALUES ('8', '{ \"text\":\"66666\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":17}', '1', null, null, null);
INSERT INTO `t_danmu` VALUES ('9', '{ \"text\":\"6666\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":27}', '2', null, null, null);
INSERT INTO `t_danmu` VALUES ('10', '{ \"text\":\"666\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":63}', '2', null, null, null);
INSERT INTO `t_danmu` VALUES ('11', '{ \"text\":\"test\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":47}', '18', null, null, null);
INSERT INTO `t_danmu` VALUES ('12', '{ \"text\":\"hahah\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":36}', '1', null, null, null);
INSERT INTO `t_danmu` VALUES ('13', '{ \"text\":\"dsdfs\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":115}', '2', null, null, null);
INSERT INTO `t_danmu` VALUES ('14', '{ \"text\":\"666\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":171}', '2', null, null, null);
INSERT INTO `t_danmu` VALUES ('15', '{ \"text\":\"哈哈哈\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":243}', '2', null, null, null);
INSERT INTO `t_danmu` VALUES ('16', '{ \"text\":\"哈哈\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":88}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('17', '{ \"text\":\"你不会\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":166}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('18', '{ \"text\":\"发放的到\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":205}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('19', '{ \"text\":\"滚滚滚\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":205}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('20', '{ \"text\":\"弱弱\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":81}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('21', '{ \"text\":\"滚滚滚\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":150}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('22', '{ \"text\":\"多对多\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":205}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('23', '{ \"text\":\"广告\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":205}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('24', '{ \"text\":\"版本\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":107}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('25', '{ \"text\":\"滚滚滚\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":78}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('26', '{ \"text\":\"广告\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":115}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('27', '{ \"text\":\"哈哈\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":13}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('28', '{ \"text\":\"多对多\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":31}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('29', '{ \"text\":\"订单\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":48}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('30', '{ \"text\":\"水电费\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":62}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('31', '{ \"text\":\"三范式\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":83}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('32', '{ \"text\":\"十分位\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":103}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('33', '{ \"text\":\"舒服舒服\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":121}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('34', '{ \"text\":\"胜多负少\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":147}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('35', '{ \"text\":\"是否\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":164}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('36', '{ \"text\":\"是否\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":115}', '23', null, null, null);
INSERT INTO `t_danmu` VALUES ('37', '{ \"text\":\"胜多负少\",\"color\":\"#ffffff\",\"size\":\"1\",\"position\":\"0\",\"time\":35}', '23', null, null, null);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `user_pwd` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `header_image` varchar(100) DEFAULT NULL,
  `mood` text,
  `blog_name` varchar(100) DEFAULT NULL,
  `is_valid` tinyint(4) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'sw', 'sw', null, null, '康纳和她的小伙伴', 'カンナ　スタジオ', '1', '2017-09-29 12:38:31', '2017-09-29 12:38:23');
INSERT INTO `t_user` VALUES ('3', 'zyy', 'zyy', null, null, null, null, '1', '2017-09-29 12:38:23', '2017-09-29 12:38:23');
INSERT INTO `t_user` VALUES ('4', 'shsxt', '111111', null, null, '康纳和她的小伙伴', '康纳和她的小伙伴', '1', '2017-09-29 15:17:41', '2017-09-29 15:17:41');
INSERT INTO `t_user` VALUES ('5', 'shsxt1', '111111', null, null, '康纳和她的小伙伴', '康纳和她的小伙伴', '1', '2017-09-29 15:05:48', '2017-09-29 15:05:48');
INSERT INTO `t_user` VALUES ('6', 'shsxt02', '111111', null, null, '康纳和她的小伙伴', '康纳和她的小伙伴', '1', '2017-09-29 15:05:36', '2017-09-29 15:05:36');

-- ----------------------------
-- Table structure for t_wisdom
-- ----------------------------
DROP TABLE IF EXISTS `t_wisdom`;
CREATE TABLE `t_wisdom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(100) NOT NULL,
  `author` varchar(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_valid` tinyint(4) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wisdom
-- ----------------------------
INSERT INTO `t_wisdom` VALUES ('1', '天生我才必有用。', '李白', '4', '1', '2017-09-29 15:08:39', '2017-09-29 15:08:39');
INSERT INTO `t_wisdom` VALUES ('2', '时间是一切财富中最宝贵的财富。', '德奥弗拉斯多', null, null, null, null);
INSERT INTO `t_wisdom` VALUES ('3', '相信谎言的人必将在真理之前毁灭。', '赫尔巴特', null, null, null, null);
INSERT INTO `t_wisdom` VALUES ('4', '友谊是一棵可以庇荫的树。', '柯尔律治', null, null, null, null);
INSERT INTO `t_wisdom` VALUES ('5', '相信谎言的人必将在真理之前毁灭。', '赫尔巴特', null, null, null, null);
