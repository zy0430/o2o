/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : o2o

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-11-05 23:34:08
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
-- Table structure for tb_head_line
-- ----------------------------
DROP TABLE IF EXISTS `tb_head_line`;
CREATE TABLE `tb_head_line` (
  `line_id` int(10) NOT NULL AUTO_INCREMENT,
  `line_name` varchar(1000) NOT NULL,
  `line_link` varchar(2000) NOT NULL,
  `line_pic` varchar(2000) NOT NULL,
  `priority` int(2) DEFAULT 0,
  `enable_status` int(2) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_head_line
-- ----------------------------

-- ----------------------------
-- Table structure for tb_local_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_local_auth`;
CREATE TABLE `tb_local_auth` (
  `local_auth_id` int(10) NOT NULL,
  `user_name` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `user_id` int(10) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`local_auth_id`),
  UNIQUE KEY `uk_local_profile` (`user_name`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tb_local_auth_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_local_auth
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

-- ----------------------------
-- Table structure for tb_product
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(2000) DEFAULT NULL,
  `product_desc` varchar(2000) DEFAULT NULL,
  `img_addr` varchar(2000) NOT NULL,
  `normal_price` varchar(255) DEFAULT NULL,
  `promotion_price` varchar(255) DEFAULT NULL,
  `priority` int(2) DEFAULT 0,
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(10) NOT NULL DEFAULT 0,
  `point` int(10) NOT NULL,
  PRIMARY KEY (`product_id`,`point`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product
-- ----------------------------

-- ----------------------------
-- Table structure for tb_product_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_category`;
CREATE TABLE `tb_product_category` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `product_category_name` varchar(1000) DEFAULT NULL,
  `productCategoryDesc` varchar(2000) DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT 0,
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`product_category_id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `tb_product_category_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product_category
-- ----------------------------

-- ----------------------------
-- Table structure for tb_product_img
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_img`;
CREATE TABLE `tb_product_img` (
  `product_img_id` int(20) NOT NULL AUTO_INCREMENT,
  `img_addr` varchar(2000) NOT NULL,
  `img_desc` varchar(2000) DEFAULT NULL,
  `priority` int(2) DEFAULT 0,
  `create_time` datetime DEFAULT NULL,
  `product_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`product_img_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `tb_product_img_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product_img
-- ----------------------------

-- ----------------------------
-- Table structure for tb_shop
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop`;
CREATE TABLE `tb_shop` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `owner_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `shop_category_id` int(11) NOT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `shop_desc` varchar(2000) DEFAULT NULL,
  `shop_addr` varchar(2000) DEFAULT NULL,
  `phone` varchar(128) DEFAULT NULL,
  `shop_img` varchar(2000) DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT 0,
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT 0,
  `advice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shop_id`),
  KEY `area_id` (`area_id`),
  KEY `shop_category_id` (`shop_category_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `tb_shop_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `tb_area` (`area_id`),
  CONSTRAINT `tb_shop_ibfk_2` FOREIGN KEY (`shop_category_id`) REFERENCES `tb_shop_category` (`shop_category_id`),
  CONSTRAINT `tb_shop_ibfk_3` FOREIGN KEY (`owner_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shop
-- ----------------------------

-- ----------------------------
-- Table structure for tb_shop_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_category`;
CREATE TABLE `tb_shop_category` (
  `shop_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `shop_category_name` varchar(255) NOT NULL,
  `shop_category_desc` varchar(1000) DEFAULT NULL,
  `shop_category_img` varchar(2000) NOT NULL,
  `priority` int(2) NOT NULL DEFAULT 0,
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `parent_id` int(2) NOT NULL,
  PRIMARY KEY (`shop_category_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `tb_shop_category_ibfk_1` FOREIGN KEY (`shop_category_id`) REFERENCES `tb_shop_category` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shop_category
-- ----------------------------

-- ----------------------------
-- Table structure for tb_wechat_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_wechat_auth`;
CREATE TABLE `tb_wechat_auth` (
  `wechat_auth_id` int(10) NOT NULL COMMENT '微信号',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `open_id` varchar(1024) NOT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`wechat_auth_id`),
  UNIQUE KEY `open_id` (`open_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tb_wechat_auth_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wechat_auth
-- ----------------------------
