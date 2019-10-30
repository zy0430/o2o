/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : o2o

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-10-30 23:26:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_area
-- ----------------------------
DROP TABLE IF EXISTS `tb_area`;
CREATE TABLE `tb_area` (
  `area_id` int(2) NOT NULL AUTO_INCREMENT COMMENT '区域id',
  `area_name` varchar(200) NOT NULL COMMENT '区域名称',
  `priority` int(2) NOT NULL DEFAULT 0 COMMENT '权重',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_edit_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `area_name` (`area_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_area
-- ----------------------------

-- ----------------------------
-- Table structure for tb_person_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_person_info`;
CREATE TABLE `tb_person_info` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(32) DEFAULT NULL COMMENT '用户姓名',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(12) DEFAULT NULL,
  `email` varchar(1024) DEFAULT NULL COMMENT '邮箱地址',
  `profile_img` varchar(1024) DEFAULT NULL COMMENT '用户头像',
  `customer_flag` int(255) DEFAULT NULL COMMENT '用户头像',
  `shop_owner_flag` int(10) DEFAULT NULL,
  `admin_flag` int(10) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT 0 COMMENT '状态，0为禁止，1为允许',
  `gender` varchar(2) DEFAULT NULL COMMENT '性别，0为女，1为男',
  `user_type` int(2) NOT NULL COMMENT '用户类型，1为顾客，2为店家，3为超级管理员',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_person_info
-- ----------------------------
