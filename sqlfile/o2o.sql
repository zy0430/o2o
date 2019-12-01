/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : o2o

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-12-01 16:12:47
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
  UNIQUE KEY `UK_AREA` (`area_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_area
-- ----------------------------
INSERT INTO `tb_area` VALUES ('1', '北京', '2', '2019-11-12 22:35:35', '2019-11-12 22:35:40');
INSERT INTO `tb_area` VALUES ('2', '天津', '0', '2019-12-01 15:52:58', '2019-12-01 15:53:02');

-- ----------------------------
-- Table structure for tb_head_line
-- ----------------------------
DROP TABLE IF EXISTS `tb_head_line`;
CREATE TABLE `tb_head_line` (
  `line_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '头条id',
  `line_name` varchar(1000) NOT NULL COMMENT '头条名称',
  `line_link` varchar(2000) NOT NULL COMMENT '头条链接',
  `line_pic` varchar(2000) NOT NULL COMMENT '头条图片',
  `priority` int(2) DEFAULT NULL COMMENT '权重。',
  `enable_status` int(2) NOT NULL DEFAULT 0 COMMENT '0为不可用，1为可用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_edit_time` datetime DEFAULT NULL COMMENT '更新时间',
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
  `local_auth_id` int(10) NOT NULL COMMENT '本地账号id',
  `user_name` varchar(128) NOT NULL COMMENT '用户名',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `user_id` int(10) NOT NULL COMMENT '用户id，和personinfo 对应',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`local_auth_id`),
  UNIQUE KEY `fk_local_profile` (`user_name`) USING BTREE,
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
  `phone` varchar(12) DEFAULT NULL COMMENT '手机号',
  `email` varchar(1024) DEFAULT NULL COMMENT '邮箱地址',
  `profile_img` varchar(1024) DEFAULT NULL COMMENT '用户头像',
  `customer_flag` int(255) DEFAULT NULL,
  `shop_owner_flag` int(10) DEFAULT NULL,
  `admin_flag` int(10) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `last_edit_time` datetime DEFAULT NULL COMMENT '更新时间',
  `enable_status` int(2) NOT NULL DEFAULT 0 COMMENT '状态，0为禁止，1为允许',
  `gender` varchar(2) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '性别，0为女，1为男',
  `user_type` int(2) NOT NULL DEFAULT 1 COMMENT '用户类型，1为顾客，2为店家，3为超级管理员',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_person_info
-- ----------------------------
INSERT INTO `tb_person_info` VALUES ('1', '测试', null, null, null, null, null, null, null, null, null, '0', '', '1');

-- ----------------------------
-- Table structure for tb_product
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product` (
  `product_id` int(100) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `product_name` varchar(2000) NOT NULL DEFAULT '' COMMENT '商品名称',
  `product_desc` varchar(2000) DEFAULT '' COMMENT '商品描述',
  `img_addr` varchar(2000) DEFAULT '' COMMENT '商品地址',
  `normal_price` varchar(255) DEFAULT '' COMMENT '原价',
  `promotion_price` varchar(255) DEFAULT '' COMMENT '折扣价',
  `priority` int(2) DEFAULT 0 COMMENT '权重',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_edit_time` datetime DEFAULT NULL COMMENT '更新时间',
  `enable_status` int(10) NOT NULL DEFAULT 0 COMMENT '0为下架，1为前端展示',
  `product_category_id` int(11) DEFAULT NULL COMMENT '所属商品种类id',
  `shop_id` int(20) NOT NULL DEFAULT 0 COMMENT '所属店铺id',
  PRIMARY KEY (`product_id`),
  KEY `product_id` (`product_id`),
  KEY `product_category_id` (`product_category_id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `tb_product_ibfk_1` FOREIGN KEY (`product_category_id`) REFERENCES `tb_shop_category` (`shop_category_id`),
  CONSTRAINT `tb_product_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product
-- ----------------------------

-- ----------------------------
-- Table structure for tb_product_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_category`;
CREATE TABLE `tb_product_category` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `product_category_name` varchar(1000) NOT NULL DEFAULT '' COMMENT '商品名称',
  `productCategoryDesc` varchar(2000) DEFAULT '' COMMENT '商品描述',
  `priority` int(2) NOT NULL DEFAULT 0 COMMENT '权重',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_edit_time` datetime DEFAULT NULL COMMENT '更新时间',
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
  `product_img_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `img_addr` varchar(2000) NOT NULL COMMENT '图片链接地址',
  `img_desc` varchar(2000) DEFAULT '' COMMENT '图片描述',
  `priority` int(2) DEFAULT 0 COMMENT '权重',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `product_id` int(20) DEFAULT NULL COMMENT '商品Id',
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
  `owner_id` int(11) NOT NULL COMMENT '店铺所属人id',
  `area_id` int(11) DEFAULT NULL COMMENT '店铺所属区域id',
  `shop_category_id` int(11) DEFAULT NULL COMMENT '店铺类别',
  `shop_name` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `shop_desc` varchar(2000) DEFAULT '' COMMENT '店铺描述',
  `shop_addr` varchar(2000) DEFAULT '' COMMENT '店铺地址',
  `phone` varchar(128) DEFAULT '' COMMENT '手机号',
  `shop_img` varchar(2000) DEFAULT '' COMMENT '店铺图片',
  `priority` int(2) NOT NULL DEFAULT 0 COMMENT '权重',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_edit_time` datetime DEFAULT NULL COMMENT '更新时间',
  `enable_status` int(2) NOT NULL DEFAULT 0 COMMENT '0为审核中，1为可用',
  `advice` varchar(255) DEFAULT '' COMMENT '建议',
  PRIMARY KEY (`shop_id`),
  KEY `area_id` (`area_id`),
  KEY `shop_category_id` (`shop_category_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `tb_shop_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `tb_area` (`area_id`),
  CONSTRAINT `tb_shop_ibfk_2` FOREIGN KEY (`shop_category_id`) REFERENCES `tb_shop_category` (`shop_category_id`),
  CONSTRAINT `tb_shop_ibfk_3` FOREIGN KEY (`owner_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shop
-- ----------------------------
INSERT INTO `tb_shop` VALUES ('10', '1', '1', '1', '测试店铺更新', '这是一个测试的店铺', '北京', '13111111111', '/imgs', '1', '2019-12-01 15:21:55', '2019-12-01 16:05:41', '1', '审核中');

-- ----------------------------
-- Table structure for tb_shop_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_category`;
CREATE TABLE `tb_shop_category` (
  `shop_category_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '店铺Id',
  `shop_category_name` varchar(255) NOT NULL COMMENT '店铺名称',
  `shop_category_desc` varchar(1000) DEFAULT '' COMMENT '店铺描述',
  `shop_category_img` varchar(2000) NOT NULL COMMENT '店铺图片',
  `priority` int(2) NOT NULL DEFAULT 0 COMMENT '权重',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_edit_time` datetime DEFAULT NULL COMMENT '更新时间',
  `parent_id` int(2) DEFAULT NULL COMMENT '父级id',
  PRIMARY KEY (`shop_category_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `tb_shop_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tb_shop_category` (`shop_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shop_category
-- ----------------------------
INSERT INTO `tb_shop_category` VALUES ('1', '小吃', '辣条', 'u', '0', null, null, null);
INSERT INTO `tb_shop_category` VALUES ('2', '面食', '小面', 'u', '0', null, null, null);

-- ----------------------------
-- Table structure for tb_wechat_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_wechat_auth`;
CREATE TABLE `tb_wechat_auth` (
  `wechat_auth_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '微信号',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `open_id` varchar(1024) NOT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`wechat_auth_id`),
  UNIQUE KEY `open_id` (`open_id`),
  KEY `fk_wechatauth_profile` (`user_id`),
  CONSTRAINT `fk_wechatauth_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wechat_auth
-- ----------------------------
