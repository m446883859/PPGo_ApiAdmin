/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Version : 50712
 Source Host           : localhost
 Source Database       : ppgo_api_admin

 Target Server Version : 50712
 File Encoding         : utf-8

 Date: 09/23/2017 09:01:34 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `pp_uc_admin`
-- ----------------------------
DROP TABLE IF EXISTS `pp_uc_admin`;
CREATE TABLE `pp_uc_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `real_name` varchar(32) NOT NULL DEFAULT '0' COMMENT '真实姓名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `role_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '角色id字符串，如：2,3,4',
  `phone` varchar(20) NOT NULL DEFAULT '0' COMMENT '手机号码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `salt` char(10) NOT NULL DEFAULT '' COMMENT '密码盐',
  `last_login` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，1-正常 0禁用',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- ----------------------------
--  Records of `pp_uc_admin`
-- ----------------------------
BEGIN;
INSERT INTO `pp_uc_admin` VALUES ('1', 'admin', '超级管理员', '840fa1e5f049c861c7ed245293afcf8d', '0', '13888888889', 'haodaquan2008@163.com', 'kmcB', '1506128460', '127.0.0.1', '1', '0', '0', '0', '1506128438'), ('2', 'george518', 'georgeHao', 'e5d77ebaffd5e4fe7164b31c6d7f1921', '1,2', '13811558899', '12@11.com', 'ONNy', '1506125048', '127.0.0.1', '1', '0', '0', '0', '1506128425'), ('3', 'haodaquan', '郝大全', 'e9fa9187e7497892c237433aee966cc1', '2,1', '13811559988', 'hao@123.com', '6fWE', '1505960085', '127.0.0.1', '1', '1', '0', '1505919245', '1506128414'), ('4', 'ceshizhanghao', '测试姓名', 'fa3fb5825c2e64bc764f29245dd1ec7a', '2', '13988009988', '232@124.com', 'i8Nf', '0', '', '1', '1', '0', '1506047337', '1506128397');
COMMIT;

-- ----------------------------
--  Table structure for `pp_uc_auth`
-- ----------------------------
DROP TABLE IF EXISTS `pp_uc_auth`;
CREATE TABLE `pp_uc_auth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID，0为顶级',
  `auth_name` varchar(64) NOT NULL DEFAULT '0' COMMENT '权限名称',
  `auth_url` varchar(255) NOT NULL DEFAULT '0' COMMENT 'URL地址',
  `sort` int(1) unsigned NOT NULL DEFAULT '999' COMMENT '排序，越小越前',
  `icon` varchar(255) NOT NULL,
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示，0-隐藏，1-显示',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作者ID',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常，0-删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='权限因子';

-- ----------------------------
--  Records of `pp_uc_auth`
-- ----------------------------
BEGIN;
INSERT INTO `pp_uc_auth` VALUES ('1', '0', '所有权限', '/', '1', '', '0', '1', '1', '1', '1', '1505620970', '1505620970'), ('2', '1', '权限管理', '/', '999', 'fa-id-card', '1', '1', '0', '1', '1', '0', '1505622360'), ('3', '2', '管理员', '/admin/list', '1', 'fa-user-o', '1', '1', '1', '1', '1', '1505621186', '1505621186'), ('4', '2', '角色管理', '/role/list', '2', 'fa-user-circle-o', '1', '1', '0', '1', '1', '0', '1505621852'), ('5', '3', '新增', '/admin/add', '1', '', '0', '1', '0', '1', '1', '0', '1505621685'), ('6', '3', '修改', '/admin/edit', '2', '', '0', '1', '0', '1', '1', '0', '1505621697'), ('7', '3', '删除', '/admin/ajaxdel', '3', '', '0', '1', '1', '1', '1', '1505621756', '1505621756'), ('8', '4', '新增', '/role/add', '1', '', '1', '1', '0', '1', '1', '0', '1505698716'), ('9', '4', '修改', '/role/edit', '2', '', '0', '1', '1', '1', '1', '1505621912', '1505621912'), ('10', '4', '删除', '/role/ajaxdel', '3', '', '0', '1', '1', '1', '1', '1505621951', '1505621951'), ('11', '2', '权限因子', '/auth/list', '3', 'fa-list', '1', '1', '1', '1', '1', '1505621986', '1505621986'), ('12', '11', '新增', '/auth/add', '1', '', '0', '1', '1', '1', '1', '1505622009', '1505622009'), ('13', '11', '修改', '/auth/edit', '2', '', '0', '1', '1', '1', '1', '1505622047', '1505622047'), ('14', '11', '删除', '/auth/ajaxdel', '3', '', '0', '1', '1', '1', '1', '1505622111', '1505622111'), ('15', '1', '个人中心', 'profile/edit', '1001', 'fa-user-circle-o', '1', '1', '0', '1', '1', '0', '1506001114'), ('16', '1', 'API管理', '/', '1', 'fa-cubes', '1', '0', '0', '0', '1', '0', '1506125698'), ('17', '16', 'API接口', '/api/list', '1', 'fa-link', '1', '1', '1', '1', '1', '1505622447', '1505622447'), ('18', '16', 'API文档', '/apidoc/list', '2', 'fa-file-text-o', '1', '1', '1', '1', '1', '1505622507', '1505622507'), ('19', '16', 'API监控', '/apimonitor/list', '3', 'fa-bar-chart', '1', '1', '1', '1', '1', '1505622543', '1505622543'), ('20', '1', '基础设置', '/', '2', 'fa-cogs', '1', '1', '1', '1', '1', '1505622601', '1505622601'), ('21', '20', '分组设置', '/group/list', '1', 'fa-object-ungroup', '1', '1', '1', '1', '1', '1505622645', '1505622645'), ('22', '20', '环境设置', '/env/list', '2', 'fa-tree', '1', '1', '1', '1', '1', '1505622681', '1505622681'), ('23', '20', '状态码设置', '/code/list', '3', 'fa-code', '1', '1', '1', '1', '1', '1505622728', '1505622728'), ('24', '15', '资料修改', '/user/edit', '1', 'fa-edit', '1', '1', '0', '1', '1', '0', '1506057468');
COMMIT;

-- ----------------------------
--  Table structure for `pp_uc_role`
-- ----------------------------
DROP TABLE IF EXISTS `pp_uc_role`;
CREATE TABLE `pp_uc_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_name` varchar(32) NOT NULL DEFAULT '0' COMMENT '角色名称',
  `detail` varchar(255) NOT NULL DEFAULT '0' COMMENT '备注',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改这ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态1-正常，0-删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
--  Records of `pp_uc_role`
-- ----------------------------
BEGIN;
INSERT INTO `pp_uc_role` VALUES ('1', 'API管理员', '拥有API所有权限', '0', '2', '1', '1505874156', '1505874156'), ('2', '系统管理员', '系统管理员', '0', '0', '1', '1506124114', '1506124114');
COMMIT;

-- ----------------------------
--  Table structure for `pp_uc_role_auth`
-- ----------------------------
DROP TABLE IF EXISTS `pp_uc_role_auth`;
CREATE TABLE `pp_uc_role_auth` (
  `role_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `auth_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限ID',
  PRIMARY KEY (`role_id`,`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限和角色关系表';

-- ----------------------------
--  Records of `pp_uc_role_auth`
-- ----------------------------
BEGIN;
INSERT INTO `pp_uc_role_auth` VALUES ('1', '16'), ('1', '17'), ('1', '18'), ('1', '19'), ('2', '0'), ('2', '1'), ('2', '15'), ('2', '20'), ('2', '21'), ('2', '22'), ('2', '23'), ('2', '24');
COMMIT;

-- ----------------------------
--  Table structure for `pp_user`
-- ----------------------------
DROP TABLE IF EXISTS `pp_user`;
CREATE TABLE `pp_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` char(10) NOT NULL DEFAULT '' COMMENT '密码盐',
  `last_login` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，0正常 -1禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `pp_user`
-- ----------------------------
BEGIN;
INSERT INTO `pp_user` VALUES ('1', 'admin', 'haodaquan@shoplinq.cn', 'abfcf6dcedfb4b5b1505d41a8b4c77e8', 'aYk4Q1P83v', '1505439448', '127.0.0.1', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
