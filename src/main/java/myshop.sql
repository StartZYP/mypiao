/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50537
Source Host           : localhost:3306
Source Database       : myshop

Target Server Type    : MYSQL
Target Server Version : 50537
File Encoding         : 65001

Date: 2016-10-23 22:48:01
*/

SET FOREIGN_KEY_CHECKS=0;



-- ----------------------------
-- Table structure for zk_forder
-- ----------------------------
DROP TABLE IF EXISTS `zk_foder`;
CREATE TABLE `zk_foder` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(20) DEFAULT NULL,
  `productname` varchar(30) DEFAULT NULL,
  `addr` varchar(20) DEFAULT NULL,
  `groupname` varchar(30) DEFAULT NULL,
  `types` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `buydate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `price` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zk_forder
-- ----------------------------
INSERT INTO `zk_forder` VALUES ('201407013', 'bb', '123', '备注', '2016-10-23 15:12:24', '200.30', '1000', '广州天河区', '0', '1');

-- ----------------------------
-- Table structure for zk_product
-- ----------------------------
DROP TABLE IF EXISTS `zk_product`;
CREATE TABLE `zk_product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(255) DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `isDelete` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `types` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `dates` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `price` double(10,0) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zk_product
-- ----------------------------
INSERT INTO `zk_product` VALUES ('20', '1', '1000', '1', '20161022162609359.png', '1', '1', null, '100');
INSERT INTO `zk_product` VALUES ('21', '2', '2', '2', '20161022162622619.png', '2', '1', null, '100');


-- ----------------------------
-- Table structure for zk_user
-- ----------------------------
DROP TABLE IF EXISTS `zk_user`;
CREATE TABLE `zk_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zk_user
-- ----------------------------
INSERT INTO `zk_user` VALUES ('1', 'user', 'user', null, null, null, null);
INSERT INTO `zk_user` VALUES ('4', 's', 's', 'sdsf', 'sdfsd@sdf.com', '', '');
