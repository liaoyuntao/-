/*
Navicat MySQL Data Transfer

Source Server         : 蹦迪
Source Server Version : 50528
Source Host           : 127.0.0.1:3306
Source Database       : wjxcx

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-08-18 23:11:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for generator_bus_config
-- ----------------------------
DROP TABLE IF EXISTS `generator_bus_config`;
CREATE TABLE `generator_bus_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `conf_name` varchar(50) NOT NULL COMMENT '参数名称',
  `conf_code` varchar(100) NOT NULL COMMENT '参数代码',
  `conf_vue` varchar(200) NOT NULL COMMENT '参数值',
  `version_no` int(5) NOT NULL COMMENT '版本号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) NOT NULL COMMENT '状态@0-显示,1-隐藏,2-删除',
  `sort` int(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2293 DEFAULT CHARSET=utf8 COMMENT='系统业务参数';

-- ----------------------------
-- Records of generator_bus_config
-- ----------------------------
INSERT INTO `generator_bus_config` VALUES ('1166', '存在', 'delete_flag', '0', '1', '1', '2018-06-14 21:26:54', '1', '2018-06-14 21:26:54', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1167', '隐藏', 'delete_flag', '1', '1', '1', '2018-06-14 21:26:54', '1', '2018-06-14 21:26:54', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1168', '删除', 'delete_flag', '2', '1', '1', '2018-06-14 21:26:54', '1', '2018-06-14 21:26:54', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1169', '停用', 'delete_flag', '3', '1', '1', '2018-06-14 21:26:54', '1', '2018-06-14 21:26:54', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1249', '可以空', 'generator_table_field_is_null', '0', '1', null, '2018-06-18 04:35:10', null, '2018-06-18 04:35:10', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1250', '非空', 'generator_table_field_is_null', '1', '1', null, '2018-06-18 04:35:11', null, '2018-06-18 04:35:11', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1251', '搜索', 'generator_table_field_is_seek', '0', '1', null, '2018-06-18 04:35:11', null, '2018-06-18 04:35:11', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1252', '非搜索', 'generator_table_field_is_seek', '1', '1', null, '2018-06-18 04:35:11', null, '2018-06-18 04:35:11', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1253', '手机号', 'generator_table_field_checkout', '0', '1', null, '2018-06-18 04:35:12', null, '2018-06-18 04:35:12', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1254', '非空', 'generator_table_field_checkout', '1', '1', null, '2018-06-18 04:35:12', null, '2018-06-18 04:35:12', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1255', '身份证', 'generator_table_field_checkout', '2', '1', null, '2018-06-18 04:35:12', null, '2018-06-18 04:35:12', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1256', '邮箱', 'generator_table_field_checkout', '3', '1', null, '2018-06-18 04:35:12', null, '2018-06-18 04:35:12', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1257', '数字', 'generator_table_field_checkout', '4', '1', null, '2018-06-18 04:35:13', null, '2018-06-18 04:35:13', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1258', '小数', 'generator_table_field_checkout', '5', '1', null, '2018-06-18 04:35:13', null, '2018-06-18 04:35:13', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1259', '导出', 'generator_table_field_is_export', '0', '1', null, '2018-06-18 04:35:13', null, '2018-06-18 04:35:13', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1260', '非导出', 'generator_table_field_is_export', '1', '1', null, '2018-06-18 04:35:13', null, '2018-06-18 04:35:13', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1261', '是', 'generator_table_field_table_set', '0', '1', null, '2018-06-18 04:35:14', null, '2018-06-18 04:35:14', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1262', '否', 'generator_table_field_table_set', '1', '1', null, '2018-06-18 04:35:15', null, '2018-06-18 04:35:15', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1263', '是', 'generator_table_field_is_data_base', '0', '1', null, '2018-06-18 04:35:15', null, '2018-06-18 04:35:15', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1264', '否', 'generator_table_field_is_data_base', '1', '1', null, '2018-06-18 04:35:15', null, '2018-06-18 04:35:15', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1265', '是', 'generator_table_field_is_set', '0', '1', null, '2018-06-18 04:35:16', null, '2018-06-18 04:35:16', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1266', '否', 'generator_table_field_is_set', '1', '1', null, '2018-06-18 04:35:16', null, '2018-06-18 04:35:16', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1267', '普通文本', 'generator_table_field_input_type', '0', '1', null, '2018-06-18 04:35:16', null, '2018-06-18 04:35:16', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1268', '数字框', 'generator_table_field_input_type', '1', '1', null, '2018-06-18 04:35:17', null, '2018-06-18 04:35:17', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1269', '日期', 'generator_table_field_input_type', '2', '1', null, '2018-06-18 04:35:17', null, '2018-06-18 04:35:17', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1270', '时间', 'generator_table_field_input_type', '3', '1', null, '2018-06-18 04:35:17', null, '2018-06-18 04:35:17', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1271', '下拉框', 'generator_table_field_input_type', '4', '1', null, '2018-06-18 04:35:17', null, '2018-06-18 04:35:17', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1272', '复选框', 'generator_table_field_input_type', '5', '1', null, '2018-06-18 04:35:17', null, '2018-06-18 04:35:17', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1273', '富文本', 'generator_table_field_input_type', '6', '1', null, '2018-06-18 04:35:18', null, '2018-06-18 04:35:18', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1274', '文本域', 'generator_table_field_input_type', '7', '1', null, '2018-06-18 04:35:18', null, '2018-06-18 04:35:18', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1275', '是', 'generator_table_field_column_key', '0', '1', null, '2018-06-18 04:35:19', null, '2018-06-18 04:35:19', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1276', '否', 'generator_table_field_column_key', '1', '1', null, '2018-06-18 04:35:19', null, '2018-06-18 04:35:19', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1277', '存在', 'generator_table_field_delete_flag', '0', '1', null, '2018-06-18 04:35:21', null, '2018-06-18 04:35:21', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1278', '隐藏', 'generator_table_field_delete_flag', '1', '1', null, '2018-06-18 04:35:21', null, '2018-06-18 04:35:21', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1279', '删除', 'generator_table_field_delete_flag', '2', '1', null, '2018-06-18 04:35:21', null, '2018-06-18 04:35:21', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1280', '停用', 'generator_table_field_delete_flag', '3', '1', null, '2018-06-18 04:35:22', null, '2018-06-18 04:35:22', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1281', '存在', 'generator_table_delete_flag', '0', '1', null, '2018-06-18 04:35:58', null, '2018-06-18 04:35:58', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1282', '隐藏', 'generator_table_delete_flag', '1', '1', null, '2018-06-18 04:35:58', null, '2018-06-18 04:35:58', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1283', '删除', 'generator_table_delete_flag', '2', '1', null, '2018-06-18 04:35:58', null, '2018-06-18 04:35:58', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1284', '停用', 'generator_table_delete_flag', '3', '1', null, '2018-06-18 04:35:59', null, '2018-06-18 04:35:59', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1285', '存在', 'generator_modules_back_delete_flag', '0', '1', null, '2018-06-18 04:36:12', null, '2018-06-18 04:36:12', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1286', '隐藏', 'generator_modules_back_delete_flag', '1', '1', null, '2018-06-18 04:36:12', null, '2018-06-18 04:36:12', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1287', '删除', 'generator_modules_back_delete_flag', '2', '1', null, '2018-06-18 04:36:12', null, '2018-06-18 04:36:12', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1288', '停用', 'generator_modules_back_delete_flag', '3', '1', null, '2018-06-18 04:36:12', null, '2018-06-18 04:36:12', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1289', '显示', 'generator_modules_delete_flag', '0', '1', null, '2018-06-18 04:36:23', null, '2018-06-18 04:36:23', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1290', '隐藏', 'generator_modules_delete_flag', '1', '1', null, '2018-06-18 04:36:23', null, '2018-06-18 04:36:23', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1291', '删除', 'generator_modules_delete_flag', '2', '1', null, '2018-06-18 04:36:23', null, '2018-06-18 04:36:23', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1292', '显示', 'generator_template_config_delete_flag', '0', '1', null, '2018-06-18 04:36:33', null, '2018-06-18 04:36:33', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1293', '隐藏', 'generator_template_config_delete_flag', '1', '1', null, '2018-06-18 04:36:33', null, '2018-06-18 04:36:33', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1294', '删除', 'generator_template_config_delete_flag', '2', '1', null, '2018-06-18 04:36:34', null, '2018-06-18 04:36:34', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1295', 'mysql', 'generator_database_type', '0', '1', null, '2018-06-18 04:36:52', null, '2018-06-18 04:36:52', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1296', 'order', 'generator_database_type', '1', '1', null, '2018-06-18 04:36:52', null, '2018-06-18 04:36:52', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1297', 'sqlService', 'generator_database_type', '2', '1', null, '2018-06-18 04:36:53', null, '2018-06-18 04:36:53', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1298', '存在', 'generator_database_delete_flag', '0', '1', null, '2018-06-18 04:36:54', null, '2018-06-18 04:36:54', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1299', '隐藏', 'generator_database_delete_flag', '1', '1', null, '2018-06-18 04:36:54', null, '2018-06-18 04:36:54', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1300', '删除', 'generator_database_delete_flag', '2', '1', null, '2018-06-18 04:36:54', null, '2018-06-18 04:36:54', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1301', '停用', 'generator_database_delete_flag', '3', '1', null, '2018-06-18 04:36:54', null, '2018-06-18 04:36:54', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1302', '隐藏', 'sys_config_status', '0', '1', null, '2018-06-18 04:42:59', null, '2018-06-18 04:42:59', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1303', '显示', 'sys_config_status', '1', '1', null, '2018-06-18 04:42:59', null, '2018-06-18 04:42:59', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1304', '存在', 'sys_config_delete_flag', '0', '1', null, '2018-06-18 04:43:00', null, '2018-06-18 04:43:00', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1305', '隐藏', 'sys_config_delete_flag', '1', '1', null, '2018-06-18 04:43:01', null, '2018-06-18 04:43:01', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1306', '删除', 'sys_config_delete_flag', '2', '1', null, '2018-06-18 04:43:01', null, '2018-06-18 04:43:01', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1307', '停用', 'sys_config_delete_flag', '3', '1', null, '2018-06-18 04:43:01', null, '2018-06-18 04:43:01', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1308', '显示', 'generator_bus_config_delete_flag', '0', '1', null, '2018-06-18 04:43:11', null, '2018-06-18 04:43:11', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1309', '隐藏', 'generator_bus_config_delete_flag', '1', '1', null, '2018-06-18 04:43:12', null, '2018-06-18 04:43:12', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1310', '删除', 'generator_bus_config_delete_flag', '2', '1', null, '2018-06-18 04:43:12', null, '2018-06-18 04:43:12', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1311', '存在', 'sys_role_delete_flag', '0', '1', null, '2018-06-18 04:43:22', null, '2018-06-18 04:43:22', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1312', '隐藏', 'sys_role_delete_flag', '1', '1', null, '2018-06-18 04:43:22', null, '2018-06-18 04:43:22', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1313', '删除', 'sys_role_delete_flag', '2', '1', null, '2018-06-18 04:43:22', null, '2018-06-18 04:43:22', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1314', '停用', 'sys_role_delete_flag', '3', '1', null, '2018-06-18 04:43:23', null, '2018-06-18 04:43:23', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1342', '上传单图像', 'generator_table_field_input_type', '8', '1', null, '2018-06-18 05:53:37', null, '2018-06-18 05:53:37', '0', '1');
INSERT INTO `generator_bus_config` VALUES ('1343', '上传多图片', 'generator_table_field_input_type', '9', '1', null, '2018-06-19 10:44:30', null, '2018-06-19 10:44:33', '0', '1');
INSERT INTO `generator_bus_config` VALUES ('1344', '正常', 'schedule_job_status', '0', '1', null, '2018-06-19 15:00:45', null, '2018-06-19 15:00:45', '0', '1');
INSERT INTO `generator_bus_config` VALUES ('1345', '暂停', 'schedule_job_status', '1', '1', null, '2018-06-19 15:00:45', null, '2018-06-19 15:00:45', '0', '1');
INSERT INTO `generator_bus_config` VALUES ('1346', '存在', 'schedule_job_delete_flag', '0', '1', null, '2018-06-19 15:00:45', null, '2018-06-19 15:00:45', '0', '1');
INSERT INTO `generator_bus_config` VALUES ('1347', '隐藏', 'schedule_job_delete_flag', '1', '1', null, '2018-06-19 15:00:45', null, '2018-06-19 15:00:45', '0', '1');
INSERT INTO `generator_bus_config` VALUES ('1348', '删除', 'schedule_job_delete_flag', '2', '1', null, '2018-06-19 15:00:45', null, '2018-06-19 15:00:45', '0', '1');
INSERT INTO `generator_bus_config` VALUES ('1349', '停用', 'schedule_job_delete_flag', '3', '1', null, '2018-06-19 15:00:45', null, '2018-06-19 15:00:45', '0', '1');
INSERT INTO `generator_bus_config` VALUES ('1350', '显示', 'generator_bus_config_delete_flag', '0', '1', null, '2018-06-19 15:13:09', null, '2018-06-19 15:13:09', '0', '1');
INSERT INTO `generator_bus_config` VALUES ('1351', '隐藏', 'generator_bus_config_delete_flag', '1', '1', null, '2018-06-19 15:13:09', null, '2018-06-19 15:13:09', '0', '1');
INSERT INTO `generator_bus_config` VALUES ('1352', '删除', 'generator_bus_config_delete_flag', '2', '1', null, '2018-06-19 15:13:09', null, '2018-06-19 15:13:09', '0', '1');
INSERT INTO `generator_bus_config` VALUES ('1354', '存在', 'schedule_job_log_delete_flag', '0', '1', null, '2018-06-19 18:13:44', null, '2018-06-19 18:13:44', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1355', '隐藏', 'schedule_job_log_delete_flag', '1', '1', null, '2018-06-19 18:13:44', null, '2018-06-19 18:13:44', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1356', '删除', 'schedule_job_log_delete_flag', '2', '1', null, '2018-06-19 18:13:44', null, '2018-06-19 18:13:44', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1357', '停用', 'schedule_job_log_delete_flag', '3', '1', null, '2018-06-19 18:13:44', null, '2018-06-19 18:13:44', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1358', '成功', 'schedule_job_log_status', '0', '1', null, '2018-06-19 18:54:38', null, '2018-06-19 18:54:38', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1359', '失败', 'schedule_job_log_status', '1', '1', null, '2018-06-19 18:54:38', null, '2018-06-19 18:54:38', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1361', '存在', 'sys_log_delete_flag', '0', '1', null, '2018-06-19 20:11:06', null, '2018-06-19 20:11:06', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1362', '隐藏', 'sys_log_delete_flag', '1', '1', null, '2018-06-19 20:11:06', null, '2018-06-19 20:11:06', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1363', '删除', 'sys_log_delete_flag', '2', '1', null, '2018-06-19 20:11:06', null, '2018-06-19 20:11:06', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1364', '停用', 'sys_log_delete_flag', '3', '1', null, '2018-06-19 20:11:06', null, '2018-06-19 20:11:06', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1365', '存在', 'sys_oss_delete_flag', '0', '1', null, '2018-06-19 22:29:43', null, '2018-06-19 22:29:43', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1366', '隐藏', 'sys_oss_delete_flag', '1', '1', null, '2018-06-19 22:29:43', null, '2018-06-19 22:29:43', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1367', '删除', 'sys_oss_delete_flag', '2', '1', null, '2018-06-19 22:29:43', null, '2018-06-19 22:29:43', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1368', '停用', 'sys_oss_delete_flag', '3', '1', null, '2018-06-19 22:29:43', null, '2018-06-19 22:29:43', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1369', '显示', 'generator_template_delete_flag', '0', '1', null, '2018-06-20 06:30:25', null, '2018-06-20 06:30:25', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1370', '隐藏', 'generator_template_delete_flag', '1', '1', null, '2018-06-20 06:30:25', null, '2018-06-20 06:30:25', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('1371', '删除', 'generator_template_delete_flag', '2', '1', null, '2018-06-20 06:30:25', null, '2018-06-20 06:30:25', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2259', '是', 'generator_table_is_business', '0', '1', null, '2018-08-15 21:25:32', null, '2018-08-15 21:25:32', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2260', '否', 'generator_table_is_business', '1', '1', null, '2018-08-15 21:25:32', null, '2018-08-15 21:25:32', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2261', 'varchar', 'generator_table_field_field_type', '0', '1', null, '2018-08-17 00:35:49', null, '2018-08-17 00:35:49', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2262', 'bigint', 'generator_table_field_field_type', '1', '1', null, '2018-08-17 00:35:49', null, '2018-08-17 00:35:49', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2263', 'datetime', 'generator_table_field_field_type', '2', '1', null, '2018-08-17 00:35:49', null, '2018-08-17 00:35:49', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2264', 'date', 'generator_table_field_field_type', '3', '1', null, '2018-08-17 00:35:49', null, '2018-08-17 00:35:49', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2265', 'int', 'generator_table_field_field_type', '4', '1', null, '2018-08-17 00:35:49', null, '2018-08-17 00:35:49', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2266', 'decimal', 'generator_table_field_field_type', '5', '1', null, '2018-08-17 00:35:49', null, '2018-08-17 00:35:49', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2271', '存在', 'wjadmin_vending_machine_delete_flag', '0', '1', null, '2018-08-18 10:40:50', null, '2018-08-18 10:40:50', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2272', '隐藏', 'wjadmin_vending_machine_delete_flag', '1', '1', null, '2018-08-18 10:40:50', null, '2018-08-18 10:40:50', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2273', '删除', 'wjadmin_vending_machine_delete_flag', '2', '1', null, '2018-08-18 10:40:50', null, '2018-08-18 10:40:50', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2274', '停用', 'wjadmin_vending_machine_delete_flag', '3', '1', null, '2018-08-18 10:40:50', null, '2018-08-18 10:40:50', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2275', '存在', 'wjadmin_shop_goods_delete_flag', '0', '1', null, '2018-08-18 10:40:50', null, '2018-08-18 10:40:50', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2276', '隐藏', 'wjadmin_shop_goods_delete_flag', '1', '1', null, '2018-08-18 10:40:50', null, '2018-08-18 10:40:50', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2277', '删除', 'wjadmin_shop_goods_delete_flag', '2', '1', null, '2018-08-18 10:40:50', null, '2018-08-18 10:40:50', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2278', '停用', 'wjadmin_shop_goods_delete_flag', '3', '1', null, '2018-08-18 10:40:50', null, '2018-08-18 10:40:50', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2279', '存在', 'wjadmin_shop_user_delete_flag', '0', '1', null, '2018-08-18 10:40:50', null, '2018-08-18 10:40:50', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2280', '隐藏', 'wjadmin_shop_user_delete_flag', '1', '1', null, '2018-08-18 10:40:50', null, '2018-08-18 10:40:50', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2281', '删除', 'wjadmin_shop_user_delete_flag', '2', '1', null, '2018-08-18 10:40:50', null, '2018-08-18 10:40:50', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2282', '停用', 'wjadmin_shop_user_delete_flag', '3', '1', null, '2018-08-18 10:40:51', null, '2018-08-18 10:40:51', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2283', '存在', 'wjadmin_goods category_delete_flag', '0', '1', null, '2018-08-18 10:40:51', null, '2018-08-18 10:40:51', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2284', '隐藏', 'wjadmin_goods category_delete_flag', '1', '1', null, '2018-08-18 10:40:51', null, '2018-08-18 10:40:51', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2285', '删除', 'wjadmin_goods category_delete_flag', '2', '1', null, '2018-08-18 10:40:51', null, '2018-08-18 10:40:51', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2286', '停用', 'wjadmin_goods category_delete_flag', '3', '1', null, '2018-08-18 10:40:51', null, '2018-08-18 10:40:51', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2287', '存在', 'wjadmin_goods_category_delete_flag', '0', '1', null, '2018-08-18 20:17:47', null, '2018-08-18 20:17:47', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2288', '隐藏', 'wjadmin_goods_category_delete_flag', '1', '1', null, '2018-08-18 20:17:47', null, '2018-08-18 20:17:47', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2289', '删除', 'wjadmin_goods_category_delete_flag', '2', '1', null, '2018-08-18 20:17:47', null, '2018-08-18 20:17:47', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2290', '停用', 'wjadmin_goods_category_delete_flag', '3', '1', null, '2018-08-18 20:17:47', null, '2018-08-18 20:17:47', '0', '0');
INSERT INTO `generator_bus_config` VALUES ('2291', 'text', 'generator_table_field_field_type', '6', '1', null, '2018-08-18 20:46:13', null, '2018-08-18 20:46:13', '0', '1');
INSERT INTO `generator_bus_config` VALUES ('2292', '搜索输入框', 'generator_table_field_input_type', '10', '1', null, '2018-08-18 21:24:44', null, '2018-08-18 21:24:44', '0', '1');

-- ----------------------------
-- Table structure for generator_database
-- ----------------------------
DROP TABLE IF EXISTS `generator_database`;
CREATE TABLE `generator_database` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ip` varchar(30) NOT NULL COMMENT 'id地址',
  `name` varchar(64) NOT NULL COMMENT '数据库名称',
  `port` varchar(64) NOT NULL COMMENT 'port端口号',
  `user_name` varchar(64) NOT NULL COMMENT '账号',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `encoding` varchar(64) NOT NULL COMMENT '编码',
  `type` varchar(64) NOT NULL COMMENT '数据库类型@0-mysql,1-order,2-sqlService',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `version_no` int(5) NOT NULL COMMENT '版本号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) NOT NULL COMMENT '逻辑删除@0-存在,1-隐藏,2-删除,3-停用',
  `sort` int(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据库管理';

-- ----------------------------
-- Records of generator_database
-- ----------------------------

-- ----------------------------
-- Table structure for generator_modules
-- ----------------------------
DROP TABLE IF EXISTS `generator_modules`;
CREATE TABLE `generator_modules` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `theme` varchar(64) NOT NULL COMMENT '模块主题',
  `name` varchar(64) NOT NULL COMMENT '模块名称',
  `describes` text NOT NULL COMMENT '模块描述',
  `version_no` int(5) NOT NULL COMMENT '版本号',
  `create_by` bigint(20) NOT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '修改人id',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) NOT NULL COMMENT '状态@0-显示,1-隐藏,2-删除',
  `sort` int(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='模块管理';

-- ----------------------------
-- Records of generator_modules
-- ----------------------------
INSERT INTO `generator_modules` VALUES ('2', '自动生成器', 'generator', '自动生成java,mapper,vue后台系统', '1', '1', '2018-05-27 00:00:00', '1', '2018-08-18 20:11:19', '0', '2');
INSERT INTO `generator_modules` VALUES ('4', '系统模块', 'sys', '系统模块', '1', '1', '2018-06-16 17:50:52', '1', '2018-06-19 20:12:36', '0', '1');
INSERT INTO `generator_modules` VALUES ('6', '定时任务', 'job', '分布式任务管理', '1', '1', '2018-06-19 15:00:33', '1', '2018-06-19 15:02:17', '0', '1');
INSERT INTO `generator_modules` VALUES ('7', '图片上传', 'oss', '图片上传', '1', '1', '2018-06-19 22:31:48', '1', '2018-06-19 22:31:48', '0', '1');
INSERT INTO `generator_modules` VALUES ('15', '协调办公', 'oa', '协调办公', '1', '1', '2018-06-28 11:15:26', '1', '2018-06-28 11:15:26', '0', '1');
INSERT INTO `generator_modules` VALUES ('16', '客户管理', 'crm', '客户管理', '1', '1', '2018-06-28 21:14:59', '1', '2018-06-28 21:14:59', '0', '1');
INSERT INTO `generator_modules` VALUES ('17', '人力资源', 'hr', '人力资源', '1', '1', '2018-06-28 21:38:05', '1', '2018-06-28 21:38:05', '0', '1');
INSERT INTO `generator_modules` VALUES ('18', '基础信息管理', 'bdm', '基础信息管理', '1', '17', '2018-07-03 09:51:21', '17', '2018-07-03 09:51:21', '0', '1');
INSERT INTO `generator_modules` VALUES ('19', '生产模块', 'pm', '生产模块', '1', '1', '2018-07-04 15:44:49', '1', '2018-07-04 15:44:49', '0', '1');
INSERT INTO `generator_modules` VALUES ('20', '财务管理', 'fin', '财务管理', '1', '1', '2018-07-07 10:46:02', '1', '2018-07-07 10:46:02', '0', '1');
INSERT INTO `generator_modules` VALUES ('21', '进销存', 'ivs', '进销存', '1', '1', '2018-07-07 14:22:16', '1', '2018-07-07 14:22:16', '0', '1');
INSERT INTO `generator_modules` VALUES ('22', '工作流', 'workflow', '工作流', '1', '12', '2018-07-13 15:09:33', '12', '2018-07-13 15:09:33', '0', '1');
INSERT INTO `generator_modules` VALUES ('23', '吾家小程序', 'wjxcx', '一款物联网小程序', '1', '1', '2018-08-17 15:41:10', '1', '2018-08-17 15:41:10', '0', '1');
INSERT INTO `generator_modules` VALUES ('24', '吾家管理系统', 'wjadmin', '吾家管理系统', '1', '1', '2018-08-18 09:34:59', '1', '2018-08-18 09:34:59', '0', '1');

-- ----------------------------
-- Table structure for generator_modules_back
-- ----------------------------
DROP TABLE IF EXISTS `generator_modules_back`;
CREATE TABLE `generator_modules_back` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `modules_id` bigint(20) NOT NULL COMMENT '模块id',
  `url` varchar(200) NOT NULL COMMENT '版本下载地址',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `version_no` int(5) NOT NULL COMMENT '版本号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) NOT NULL COMMENT '逻辑删除@0-存在,1-隐藏,2-删除,3-停用',
  `sort` int(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块版本管理';

-- ----------------------------
-- Records of generator_modules_back
-- ----------------------------

-- ----------------------------
-- Table structure for generator_table
-- ----------------------------
DROP TABLE IF EXISTS `generator_table`;
CREATE TABLE `generator_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `table_name` varchar(120) NOT NULL COMMENT '表名',
  `modules_id` bigint(20) NOT NULL COMMENT '模块id',
  `table_comment` varchar(300) NOT NULL COMMENT '表注释',
  `business_value` varchar(300) DEFAULT NULL COMMENT '业务取值',
  `business_key` varchar(300) DEFAULT NULL COMMENT '业务key',
  `is_business` varchar(6) DEFAULT NULL COMMENT '是否为业务表@0-是,1-否',
  `remarks` text COMMENT '备注',
  `version_no` int(5) NOT NULL COMMENT '版本号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) NOT NULL COMMENT '逻辑删除@0-存在,1-隐藏,2-删除,3-停用',
  `sort` int(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_name` (`table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COMMENT='数据表管理';

-- ----------------------------
-- Records of generator_table
-- ----------------------------
INSERT INTO `generator_table` VALUES ('127', 'generator_table', '2', '数据表管理', 'id', 'table_name', '0', '[{\"uid\":1533912093672,\"urd\":888,\"name\":\"remarks\",\"url\":\"http://p1kqsiha2.bkt.clouddn.com/upload/20180810/fa560c640f7b49f9963a9cea9deda481.jpg?imageslim\",\"status\":\"success\"}]', '1', null, '2018-06-18 04:40:58', null, '2018-08-18 09:42:00', '0', '1');
INSERT INTO `generator_table` VALUES ('128', 'generator_modules_back', '2', '模块版本管理', null, null, '', '<span style=\"color:#e8bf6a;\">&lt;!DOCTYPE </span><span style=\"color:#bababa;\">html</span><span style=\"color:#e8bf6a;\">&gt; </span><span style=\"color:#e8bf6a;\">&lt;html&gt; </span><span style=\"color:#e8bf6a;\">&lt;head&gt; </span><span style=\"color:#e8bf6a;\"> &lt;title&gt;</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">${</span><span style=\"color:#d0d0ff;background-color:#303030;\">comments</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">}</span><span style=\"color:#e8bf6a;\">&lt;/title&gt; </span><span style=\"color:#e8bf6a;\"> &lt;meta </span><span style=\"color:#bababa;\">charset=</span><span style=\"color:#a5c261;\">\"UTF-8\"</span><span style=\"color:#e8bf6a;\">&gt; </span><span style=\"color:#e8bf6a;\"> &lt;meta </span><span style=\"color:#bababa;\">http-equiv=</span><span style=\"color:#a5c261;\">\"X-UA-Compatible\" </span><span style=\"color:#bababa;\">content=</span><span style=\"color:#a5c261;\">\"IE=edge\"</span><span style=\"color:#e8bf6a;\">&gt; </span><span style=\"color:#e8bf6a;\"> &lt;meta </span><span style=\"color:#bababa;\">content=</span><span style=\"color:#a5c261;\">\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\" </span><span style=\"color:#bababa;\">name=</span><span style=\"color:#a5c261;\">\"viewport\"</span><span style=\"color:#e8bf6a;\">&gt; </span><span style=\"color:#e8bf6a;\"> &lt;link </span><span style=\"color:#bababa;\">rel=</span><span style=\"color:#a5c261;\">\"stylesheet\" </span><span style=\"color:#bababa;\">href=</span><span style=\"color:#a5c261;\">\"../../css/bootstrap.min.css\"</span><span style=\"color:#e8bf6a;\">&gt; </span><span style=\"color:#e8bf6a;\"> &lt;link </span><span style=\"color:#bababa;\">rel=</span><span style=\"color:#a5c261;\">\"stylesheet\" </span><span style=\"color:#bababa;\">href=</span><span style=\"color:#a5c261;\">\"../../css/font-awesome.min.css\"</span><span style=\"color:#e8bf6a;\">&gt; </span><span style=\"color:#e8bf6a;\"> &lt;link </span><span style=\"color:#bababa;\">rel=</span><span style=\"color:#a5c261;\">\"stylesheet\" </span><span style=\"color:#bababa;\">href=</span><span style=\"color:#a5c261;\">\"../../plugins/jqgrid/ui.jqgrid-bootstrap.css\"</span><span style=\"color:#e8bf6a;\">&gt; </span><span style=\"color:#e8bf6a;\"> &lt;link </span><span style=\"color:#bababa;\">rel=</span><span style=\"color:#a5c261;\">\"stylesheet\" </span><span style=\"color:#bababa;\">href=</span><span style=\"color:#a5c261;\">\"../../plugins/ztree/css/metroStyle/metroStyle.css\"</span><span style=\"color:#e8bf6a;\">&gt; </span><span style=\"color:#e8bf6a;\"> &lt;link </span><span style=\"color:#bababa;\">rel=</span><span style=\"color:#a5c261;\">\"stylesheet\" </span><span style=\"color:#bababa;\">href=</span><span style=\"color:#a5c261;\">\"../../css/main.css\"</span><span style=\"color:#e8bf6a;\">&gt; </span><span style=\"color:#e8bf6a;\"> &lt;script </span><span style=\"color:#bababa;\">src=</span><span style=\"color:#a5c261;\">\"../../libs/jquery.min.js\"</span><span style=\"color:#e8bf6a;\">&gt;&lt;/script&gt; </span><span style=\"color:#e8bf6a;\"> &lt;script </span><span style=\"color:#bababa;\">src=</span><span style=\"color:#a5c261;\">\"../../plugins/layer/layer.js\"</span><span style=\"color:#e8bf6a;\">&gt;&lt;/script&gt; </span><span style=\"color:#e8bf6a;\"> &lt;script </span><span style=\"color:#bababa;\">src=</span><span style=\"color:#a5c261;\">\"../../libs/bootstrap.min.js\"</span><span style=\"color:#e8bf6a;\">&gt;&lt;/script&gt; </span><span style=\"color:#e8bf6a;\"> &lt;script </span><span style=\"color:#bababa;\">src=</span><span style=\"color:#a5c261;\">\"../../libs/vue.min.js\"</span><span style=\"color:#e8bf6a;\">&gt;&lt;/script&gt; </span><span style=\"color:#e8bf6a;\"> &lt;script </span><span style=\"color:#bababa;\">src=</span><span style=\"color:#a5c261;\">\"../../plugins/jqgrid/grid.locale-cn.js\"</span><span style=\"color:#e8bf6a;\">&gt;&lt;/script&gt; </span><span style=\"color:#e8bf6a;\"> &lt;script </span><span style=\"color:#bababa;\">src=</span><span style=\"color:#a5c261;\">\"../../plugins/jqgrid/jquery.jqGrid.min.js\"</span><span style=\"color:#e8bf6a;\">&gt;&lt;/script&gt; </span><span style=\"color:#e8bf6a;\"> &lt;script </span><span style=\"color:#bababa;\">src=</span><span style=\"color:#a5c261;\">\"../../plugins/ztree/jquery.ztree.all.min.js\"</span><span style=\"color:#e8bf6a;\">&gt;&lt;/script&gt; </span><span style=\"color:#e8bf6a;\"> &lt;script </span><span style=\"color:#bababa;\">src=</span><span style=\"color:#a5c261;\">\"../../js/common.js\"</span><span style=\"color:#e8bf6a;\">&gt;&lt;/script&gt; </span><span style=\"color:#e8bf6a;\">&lt;/head&gt; </span><span style=\"color:#e8bf6a;\">&lt;body&gt; </span><span style=\"color:#e8bf6a;\">&lt;div </span><span style=\"color:#bababa;\">id=</span><span style=\"color:#a5c261;\">\"rrapp\" </span><span style=\"color:#bababa;\">v-cloak</span><span style=\"color:#e8bf6a;\">&gt; </span><span style=\"color:#e8bf6a;\"> &lt;div </span><span style=\"color:#bababa;\">v-show=</span><span style=\"color:#a5c261;\">\"showList\"</span><span style=\"color:#e8bf6a;\">&gt; </span><span style=\"color:#e8bf6a;\"> &lt;div </span><span style=\"color:#bababa;\">class=</span><span style=\"color:#a5c261;\">\"grid-btn\"</span><span style=\"color:#e8bf6a;\">&gt; </span><span style=\"color:#e8bf6a;\"> &lt;a </span><span style=\"color:#bababa;\">v-if=</span><span style=\"color:#a5c261;\">\"hasPermission(\'</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">${</span><span style=\"color:#d0d0ff;background-color:#303030;\">moduleName</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">}</span><span style=\"color:#a5c261;\">:</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">${</span><span style=\"color:#d0d0ff;background-color:#303030;\">pathName</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">}</span><span style=\"color:#a5c261;\">:save\')\" </span><span style=\"color:#bababa;\">class=</span><span style=\"color:#a5c261;\">\"btn btn-primary\" </span><span style=\"color:#bababa;\">@click=</span><span style=\"color:#a5c261;\">\"add\"</span><span style=\"color:#e8bf6a;\">&gt;&lt;i </span><span style=\"color:#bababa;\">class=</span><span style=\"color:#a5c261;\">\"fa fa-plus\"</span><span style=\"color:#e8bf6a;\">&gt;&lt;/i&gt;</span><span style=\"color:#6d9cbe;\">&amp;nbsp;</span>新增<span style=\"color:#e8bf6a;\">&lt;/a&gt; </span><span style=\"color:#e8bf6a;\"> &lt;a </span><span style=\"color:#bababa;\">v-if=</span><span style=\"color:#a5c261;\">\"hasPermission(\'</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">${</span><span style=\"color:#d0d0ff;background-color:#303030;\">moduleName</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">}</span><span style=\"color:#a5c261;\">:</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">${</span><span style=\"color:#d0d0ff;background-color:#303030;\">pathName</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">}</span><span style=\"color:#a5c261;\">:update\')\" </span><span style=\"color:#bababa;\">class=</span><span style=\"color:#a5c261;\">\"btn btn-primary\" </span><span style=\"color:#bababa;\">@click=</span><span style=\"color:#a5c261;\">\"update\"</span><span style=\"color:#e8bf6a;\">&gt;&lt;i </span><span style=\"color:#bababa;\">class=</span><span style=\"color:#a5c261;\">\"fa fa-pencil-square-o\"</span><span style=\"color:#e8bf6a;\">&gt;&lt;/i&gt;</span><span style=\"color:#6d9cbe;\">&amp;nbsp;</span>修改<span style=\"color:#e8bf6a;\">&lt;/a&gt; </span><span style=\"color:#e8bf6a;\"> &lt;a </span><span style=\"color:#bababa;\">v-if=</span><span style=\"color:#a5c261;\">\"hasPermission(\'</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">${</span><span style=\"color:#d0d0ff;background-color:#303030;\">moduleName</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">}</span><span style=\"color:#a5c261;\">:</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">${</span><span style=\"color:#d0d0ff;background-color:#303030;\">pathName</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">}</span><span style=\"color:#a5c261;\">:delete\')\" </span><span style=\"color:#bababa;\">class=</span><span style=\"color:#a5c261;\">\"btn btn-primary\" </span><span style=\"color:#bababa;\">@click=</span><span style=\"color:#a5c261;\">\"del\"</span><span style=\"color:#e8bf6a;\">&gt;&lt;i </span><span style=\"color:#bababa;\">class=</span><span style=\"color:#a5c261;\">\"fa fa-trash-o\"</span><span style=\"color:#e8bf6a;\">&gt;&lt;/i&gt;</span><span style=\"color:#6d9cbe;\">&amp;nbsp;</span>删除<span style=\"color:#e8bf6a;\">&lt;/a&gt; </span><span style=\"color:#e8bf6a;\"> &lt;/div&gt; </span><span style=\"color:#e8bf6a;\"> &lt;table </span><span style=\"color:#bababa;\">id=</span><span style=\"color:#a5c261;\">\"jqGrid\"</span><span style=\"color:#e8bf6a;\">&gt;&lt;/table&gt; </span><span style=\"color:#e8bf6a;\"> &lt;div </span><span style=\"color:#bababa;\">id=</span><span style=\"color:#a5c261;\">\"jqGridPager\"</span><span style=\"color:#e8bf6a;\">&gt;&lt;/div&gt; </span><span style=\"color:#e8bf6a;\"> &lt;/div&gt; </span><span style=\"color:#e8bf6a;\"> </span><span style=\"color:#e8bf6a;\"> &lt;div </span><span style=\"color:#bababa;\">v-show=</span><span style=\"color:#a5c261;\">\"!showList\" </span><span style=\"color:#bababa;\">class=</span><span style=\"color:#a5c261;\">\"panel panel-default\"</span><span style=\"color:#e8bf6a;\">&gt; </span><span style=\"color:#e8bf6a;\"> &lt;div </span><span style=\"color:#bababa;\">class=</span><span style=\"color:#a5c261;\">\"panel-heading\"</span><span style=\"color:#e8bf6a;\">&gt;</span>{{title}}<span style=\"color:#e8bf6a;\">&lt;/div&gt; </span><span style=\"color:#e8bf6a;\"> &lt;form </span><span style=\"color:#bababa;\">class=</span><span style=\"color:#a5c261;\">\"form-horizontal\"</span><span style=\"color:#e8bf6a;\">&gt; </span><span style=\"color:#e8bf6a;\"> </span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">#foreach</span><span style=\"background-color:#303030;\">(</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">$</span><span style=\"color:#d0d0ff;background-color:#303030;\">column </span><span style=\"color:#cc7832;background-color:#303030;font-weight:bold;\">in </span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">$</span><span style=\"color:#d0d0ff;background-color:#303030;\">columns</span><span style=\"background-color:#303030;\">)</span> <span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">#if</span><span style=\"background-color:#303030;\">(</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">$</span><span style=\"color:#d0d0ff;background-color:#303030;\">column</span><span style=\"background-color:#303030;\">.</span><span style=\"color:#d0d0ff;background-color:#303030;\">columnName </span><span style=\"background-color:#303030;\">!= </span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">$</span><span style=\"color:#d0d0ff;background-color:#303030;\">pk</span><span style=\"background-color:#303030;\">.</span><span style=\"color:#d0d0ff;background-color:#303030;\">columnName</span><span style=\"background-color:#303030;\">)</span> <span style=\"color:#e8bf6a;\">&lt;div </span><span style=\"color:#bababa;\">class=</span><span style=\"color:#a5c261;\">\"form-group\"</span><span style=\"color:#e8bf6a;\">&gt; </span><span style=\"color:#e8bf6a;\"> &lt;div </span><span style=\"color:#bababa;\">class=</span><span style=\"color:#a5c261;\">\"col-sm-2 control-label\"</span><span style=\"color:#e8bf6a;\">&gt;</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">${</span><span style=\"color:#d0d0ff;background-color:#303030;\">column</span><span style=\"background-color:#303030;\">.</span><span style=\"color:#d0d0ff;background-color:#303030;\">comments</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">}</span><span style=\"color:#e8bf6a;\">&lt;/div&gt; </span><span style=\"color:#e8bf6a;\"> &lt;div </span><span style=\"color:#bababa;\">class=</span><span style=\"color:#a5c261;\">\"col-sm-10\"</span><span style=\"color:#e8bf6a;\">&gt; </span><span style=\"color:#e8bf6a;\"> &lt;input </span><span style=\"color:#bababa;\">type=</span><span style=\"color:#a5c261;\">\"text\" </span><span style=\"color:#bababa;\">class=</span><span style=\"color:#a5c261;\">\"form-control\" </span><span style=\"color:#bababa;\">v-model=</span><span style=\"color:#a5c261;\">\"</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">${</span><span style=\"color:#d0d0ff;background-color:#303030;\">classname</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">}</span><span style=\"color:#a5c261;\">.</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">${</span><span style=\"color:#d0d0ff;background-color:#303030;\">column</span><span style=\"background-color:#303030;\">.</span><span style=\"color:#d0d0ff;background-color:#303030;\">attrname</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">}</span><span style=\"color:#a5c261;\">\" </span><span style=\"color:#bababa;\">placeholder=</span><span style=\"color:#a5c261;\">\"</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">${</span><span style=\"color:#d0d0ff;background-color:#303030;\">column</span><span style=\"background-color:#303030;\">.</span><span style=\"color:#d0d0ff;background-color:#303030;\">comments</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">}</span><span style=\"color:#a5c261;\">\"</span><span style=\"color:#e8bf6a;\">/&gt; </span><span style=\"color:#e8bf6a;\"> &lt;/div&gt; </span><span style=\"color:#e8bf6a;\"> &lt;/div&gt; </span><span style=\"color:#e8bf6a;\"> </span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">#end</span><span style=\"color:#e8bf6a;font-weight:bold;\"> </span><span style=\"color:#e8bf6a;font-weight:bold;\"> </span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">#end</span><span style=\"color:#e8bf6a;font-weight:bold;\"> </span><span style=\"color:#e8bf6a;font-weight:bold;\"> </span><span style=\"color:#e8bf6a;\">&lt;div </span><span style=\"color:#bababa;\">class=</span><span style=\"color:#a5c261;\">\"form-group\"</span><span style=\"color:#e8bf6a;\">&gt; </span><span style=\"color:#e8bf6a;\"> &lt;div </span><span style=\"color:#bababa;\">class=</span><span style=\"color:#a5c261;\">\"col-sm-2 control-label\"</span><span style=\"color:#e8bf6a;\">&gt;&lt;/div&gt; </span><span style=\"color:#e8bf6a;\"> &lt;input </span><span style=\"color:#bababa;\">type=</span><span style=\"color:#a5c261;\">\"button\" </span><span style=\"color:#bababa;\">class=</span><span style=\"color:#a5c261;\">\"btn btn-primary\" </span><span style=\"color:#bababa;\">@click=</span><span style=\"color:#a5c261;\">\"saveOrUpdate\" </span><span style=\"color:#bababa;\">value=</span><span style=\"color:#a5c261;\">\"确定\"</span><span style=\"color:#e8bf6a;\">/&gt; </span><span style=\"color:#e8bf6a;\"> </span><span style=\"color:#6d9cbe;\">&amp;nbsp;&amp;nbsp;</span><span style=\"color:#e8bf6a;\">&lt;input </span><span style=\"color:#bababa;\">type=</span><span style=\"color:#a5c261;\">\"button\" </span><span style=\"color:#bababa;\">class=</span><span style=\"color:#a5c261;\">\"btn btn-warning\" </span><span style=\"color:#bababa;\">@click=</span><span style=\"color:#a5c261;\">\"reload\" </span><span style=\"color:#bababa;\">value=</span><span style=\"color:#a5c261;\">\"返回\"</span><span style=\"color:#e8bf6a;\">/&gt; </span><span style=\"color:#e8bf6a;\"> &lt;/div&gt; </span><span style=\"color:#e8bf6a;\"> &lt;/form&gt; </span><span style=\"color:#e8bf6a;\"> &lt;/div&gt; </span><span style=\"color:#e8bf6a;\">&lt;/div&gt; </span><span style=\"color:#e8bf6a;\"> </span><span style=\"color:#e8bf6a;\">&lt;script </span><span style=\"color:#bababa;\">src=</span><span style=\"color:#a5c261;\">\"../../js/modules/</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">${</span><span style=\"color:#d0d0ff;background-color:#303030;\">moduleName</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">}</span><span style=\"color:#a5c261;\">/</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">${</span><span style=\"color:#d0d0ff;background-color:#303030;\">pathName</span><span style=\"color:#e8bf6a;background-color:#303030;font-weight:bold;\">}</span><span style=\"color:#a5c261;\">.js\"</span><span style=\"color:#e8bf6a;\">&gt;&lt;/script&gt; </span><span style=\"color:#e8bf6a;\">&lt;/body&gt; </span><span style=\"color:#e8bf6a;\">&lt;/html&gt;</span>', '1', null, '2018-06-18 04:41:09', null, '2018-06-20 11:17:00', '0', '1');
INSERT INTO `generator_table` VALUES ('129', 'generator_modules', '2', '模块管理', 'id', 'theme', '0', '[]', '1', null, '2018-06-18 04:41:20', null, '2018-08-15 23:45:22', '0', '1');
INSERT INTO `generator_table` VALUES ('130', 'generator_template_config', '2', '模板系统参数', null, null, '', null, '1', null, '2018-06-18 04:41:33', null, '2018-06-18 04:41:33', '0', '0');
INSERT INTO `generator_table` VALUES ('132', 'generator_database', '2', '数据库管理', null, null, '', null, '1', null, '2018-06-18 04:41:54', null, '2018-06-18 04:41:54', '0', '0');
INSERT INTO `generator_table` VALUES ('150', 'schedule_job_log', '6', '定时任务日志管理', null, null, '', null, '1', null, '2018-06-19 18:54:38', null, '2018-06-19 18:54:38', '0', '1');
INSERT INTO `generator_table` VALUES ('151', 'schedule_job', '6', '定时任务管理', null, null, '', null, '1', null, '2018-06-19 18:57:52', null, '2018-06-19 18:57:52', '0', '1');
INSERT INTO `generator_table` VALUES ('155', 'sys_log', '4', '系统日志管理', null, null, '', null, '1', null, '2018-06-19 20:13:33', null, '2018-06-19 20:13:33', '0', '1');
INSERT INTO `generator_table` VALUES ('156', 'sys_config', '4', '系统字典管理', null, null, '', null, '1', null, '2018-06-19 20:36:25', null, '2018-06-19 20:36:25', '0', '1');
INSERT INTO `generator_table` VALUES ('157', 'generator_bus_config', '2', '自动生成参数管理', 'conf_vue', 'conf_code', '0', '[]', '1', null, '2018-06-19 20:56:42', null, '2018-08-18 21:06:20', '0', '1');
INSERT INTO `generator_table` VALUES ('160', 'sys_oss', '7', '上传图片管理', null, null, '', null, '1', null, '2018-06-19 22:33:09', null, '2018-06-19 22:33:09', '0', '0');
INSERT INTO `generator_table` VALUES ('161', 'generator_template', '2', '模板配置', null, null, '', null, '1', null, '2018-06-20 06:30:25', null, '2018-06-20 06:30:25', '0', '0');
INSERT INTO `generator_table` VALUES ('164', 'generator_table_field', '2', '字段管理', null, null, null, null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '0');

-- ----------------------------
-- Table structure for generator_table_field
-- ----------------------------
DROP TABLE IF EXISTS `generator_table_field`;
CREATE TABLE `generator_table_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `table_id` bigint(20) NOT NULL COMMENT '表id',
  `field_name` varchar(200) NOT NULL COMMENT '字段名称',
  `field_type` varchar(32) NOT NULL COMMENT '字段类型@0-varchar,1-bigint,2-datetime,3-date,4-int,5-decimal',
  `is_null` varchar(6) NOT NULL COMMENT '是否为空@0-可以空,1-非空',
  `is_seek` varchar(6) NOT NULL COMMENT '是否搜索@0-搜索,1-非搜索',
  `data_length` varchar(200) DEFAULT NULL COMMENT '数据长度',
  `width_length` varchar(200) DEFAULT NULL COMMENT '宽度',
  `dictionary_index` varchar(100) DEFAULT NULL COMMENT '字典索引',
  `checkout` varchar(500) NOT NULL COMMENT '正则校验&0-手机号,1-非空,2-身份证,3-邮箱,4-数字,5-小数',
  `is_export` varchar(6) NOT NULL COMMENT '是否导出@0-导出,1-非导出',
  `page_comment` varchar(500) DEFAULT NULL COMMENT '页面注释',
  `comment` varchar(200) DEFAULT NULL COMMENT '字段注释',
  `table_set` varchar(6) NOT NULL COMMENT '表格中字段是否显示@0-是,1-否',
  `is_data_base` varchar(6) NOT NULL COMMENT '是否数据库字段@0-是,1-否',
  `is_set` varchar(6) NOT NULL COMMENT '修改时是否显示@0-是,1-否',
  `input_type` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '输入框类型@0-普通文本,1-数字框,2-日期,3-时间,4-下拉选,5-复选框,6-富文本,7-文本域,8-上传单图像',
  `data_default` varchar(300) DEFAULT NULL COMMENT '数据默认值',
  `column_key` varchar(6) DEFAULT NULL COMMENT '是否主键@0-是,1-否',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `version_no` int(5) NOT NULL COMMENT '版本号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) NOT NULL COMMENT '逻辑删除@0-存在,1-隐藏,2-删除,3-停用',
  `sort` int(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8226 DEFAULT CHARSET=utf8 COMMENT='字段管理';

-- ----------------------------
-- Records of generator_table_field
-- ----------------------------
INSERT INTO `generator_table_field` VALUES ('1262', '127', 'id', '1', '1', '1', '', '', 'generator_table_id', '[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\"]', '0', '主键', '主键', '1', '0', '1', '0', null, '0', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180622/4a69b18242064049bd465a3cd8c6ace7.png?imageslim', '1', null, '2018-06-18 04:40:58', null, '2018-08-18 18:26:48', '0', '1');
INSERT INTO `generator_table_field` VALUES ('1263', '127', 'table_name', 'varchar', '1', '0', '', '', 'generator_table_table_name', '[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\"]', '1', '表名', '表名', '0', '0', '0', '0', null, '1', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180625/0725ba5edcb548749a74b160259e8cd4.png?imageslim', '1', null, '2018-06-18 04:40:58', null, '2018-06-25 22:17:37', '0', '1');
INSERT INTO `generator_table_field` VALUES ('1264', '127', 'modules_id', 'bigint', '1', '1', '', '', 'generator_modules', '[\"0\"]', '1', '模块主题', '模块id', '0', '0', '0', '4', null, '1', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180619/3253b1357a824a6795586648d8311a36.png?imageslim', '1', null, '2018-06-18 04:40:58', null, '2018-08-18 22:24:09', '0', '1');
INSERT INTO `generator_table_field` VALUES ('1265', '127', 'table_comment', 'varchar', '1', '0', '', '', 'generator_table_table_comment', '[\"0\"]', '1', '表注释', '表注释', '0', '0', '0', '0', null, '1', '[{\"uid\":1529385905390,\"name\":\"food.jpg\",\"url\":\"http://p1kqsiha2.bkt.clouddn.com/upload/20180619/2bd83ed713084e39a5e61ff29c9e1964.png?imageslim\",\"status\":\"success\"}]', '1', null, '2018-06-18 04:40:58', null, '2018-06-19 13:25:09', '0', '1');
INSERT INTO `generator_table_field` VALUES ('1266', '127', 'remarks', 'varchar', '0', '0', '', '', 'generator_table_remarks', '[\"0\"]', '1', '备注', '备注', '1', '0', '0', '8', null, '1', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180619/f7a761ba58e74e628b531f8a16dd479b.png?imageslim', '1', null, '2018-06-18 04:40:58', null, '2018-08-17 00:30:06', '0', '1');
INSERT INTO `generator_table_field` VALUES ('1267', '127', 'version_no', 'int', '1', '1', '', '', 'generator_table_version_no', '0', '1', '版本号', '版本号', '1', '0', '1', '1', null, '1', null, '1', null, '2018-06-18 04:40:59', null, '2018-06-18 04:40:59', '0', '6');
INSERT INTO `generator_table_field` VALUES ('1268', '127', 'create_by', 'bigint', '0', '1', '', '', 'generator_table_create_by', '0', '1', '创建人id', '创建人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-18 04:40:59', null, '2018-06-18 04:40:59', '0', '7');
INSERT INTO `generator_table_field` VALUES ('1269', '127', 'create_time', 'datetime', '1', '0', '', '', 'generator_table_create_time', '0', '1', '创建时间', '创建时间', '0', '0', '1', '2', null, '1', null, '1', null, '2018-06-18 04:40:59', null, '2018-06-18 04:40:59', '0', '8');
INSERT INTO `generator_table_field` VALUES ('1270', '127', 'update_by', 'bigint', '0', '1', '', '', 'generator_table_update_by', '0', '1', '修改人id', '修改人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-18 04:41:00', null, '2018-06-18 04:41:00', '0', '9');
INSERT INTO `generator_table_field` VALUES ('1271', '127', 'update_time', 'datetime', '1', '1', '', '', 'generator_table_update_time', '0', '1', '修改时间', '修改时间', '1', '0', '1', '2', null, '1', null, '1', null, '2018-06-18 04:41:00', null, '2018-06-18 04:41:00', '0', '10');
INSERT INTO `generator_table_field` VALUES ('1272', '127', 'delete_flag', 'varchar', '1', '1', '', '', 'generator_table_delete_flag', '0', '1', '逻辑删除', '逻辑删除@0-存在,1-隐藏,2-删除,3-停用', '0', '0', '0', '4', null, '1', null, '1', null, '2018-06-18 04:41:00', null, '2018-06-18 04:41:00', '0', '11');
INSERT INTO `generator_table_field` VALUES ('1273', '127', 'sort', 'int', '1', '1', '', '', 'generator_table_sort', '0', '1', '排序', '排序', '0', '0', '0', '1', null, '1', null, '1', null, '2018-06-18 04:41:00', null, '2018-06-18 04:41:00', '0', '12');
INSERT INTO `generator_table_field` VALUES ('1274', '128', 'id', 'bigint', '1', '1', '', '', 'generator_modules_back_id', '0', '1', '主键', '主键', '0', '0', '0', '0', null, '0', null, '1', null, '2018-06-18 04:41:09', null, '2018-06-18 04:41:09', '0', '1');
INSERT INTO `generator_table_field` VALUES ('1275', '128', 'modules_id', 'bigint', '1', '1', '', '', 'generator_modules_back_modules_id', '0', '1', '模块id', '模块id', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:10', null, '2018-06-18 04:41:10', '0', '2');
INSERT INTO `generator_table_field` VALUES ('1276', '128', 'url', 'varchar', '1', '1', '', '', 'generator_modules_back_url', '0', '1', '版本下载地址', '版本下载地址', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:10', null, '2018-06-18 04:41:10', '0', '3');
INSERT INTO `generator_table_field` VALUES ('1277', '128', 'remarks', 'varchar', '0', '1', '', '', 'generator_modules_back_remarks', '0', '1', '备注', '备注', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:10', null, '2018-06-18 04:41:10', '0', '4');
INSERT INTO `generator_table_field` VALUES ('1278', '128', 'version_no', 'int', '1', '1', '', '', 'generator_modules_back_version_no', '0', '1', '版本号', '版本号', '0', '0', '0', '1', null, '1', null, '1', null, '2018-06-18 04:41:10', null, '2018-06-18 04:41:10', '0', '5');
INSERT INTO `generator_table_field` VALUES ('1279', '128', 'create_by', 'bigint', '0', '1', '', '', 'generator_modules_back_create_by', '0', '1', '创建人id', '创建人id', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:10', null, '2018-06-18 04:41:10', '0', '6');
INSERT INTO `generator_table_field` VALUES ('1280', '128', 'create_time', 'datetime', '1', '1', '', '', 'generator_modules_back_create_time', '0', '1', '创建时间', '创建时间', '0', '0', '0', '2', null, '1', null, '1', null, '2018-06-18 04:41:10', null, '2018-06-18 04:41:10', '0', '7');
INSERT INTO `generator_table_field` VALUES ('1281', '128', 'update_by', 'bigint', '0', '1', '', '', 'generator_modules_back_update_by', '0', '1', '修改人id', '修改人id', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:10', null, '2018-06-18 04:41:10', '0', '8');
INSERT INTO `generator_table_field` VALUES ('1282', '128', 'update_time', 'datetime', '1', '1', '', '', 'generator_modules_back_update_time', '0', '1', '修改时间', '修改时间', '0', '0', '0', '2', null, '1', null, '1', null, '2018-06-18 04:41:11', null, '2018-06-18 04:41:11', '0', '9');
INSERT INTO `generator_table_field` VALUES ('1283', '128', 'delete_flag', 'varchar', '1', '1', '', '', 'generator_modules_back_delete_flag', '0', '1', '逻辑删除', '逻辑删除@0-存在,1-隐藏,2-删除,3-停用', '0', '0', '0', '4', null, '1', null, '1', null, '2018-06-18 04:41:11', null, '2018-06-18 04:41:11', '0', '10');
INSERT INTO `generator_table_field` VALUES ('1284', '128', 'sort', 'int', '1', '1', '', '', 'generator_modules_back_sort', '0', '1', '排序', '排序', '0', '0', '0', '1', null, '1', null, '1', null, '2018-06-18 04:41:11', null, '2018-06-18 04:41:11', '0', '11');
INSERT INTO `generator_table_field` VALUES ('1285', '129', 'id', 'bigint', '1', '1', '', '', 'generator_modules_id', '0', '1', 'ID', 'ID', '1', '0', '1', '0', null, '0', null, '1', null, '2018-06-18 04:41:20', null, '2018-06-18 04:41:20', '0', '1');
INSERT INTO `generator_table_field` VALUES ('1286', '129', 'theme', 'varchar', '1', '0', '', '', 'generator_modules_theme', '0', '1', '模块主题', '模块主题', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:20', null, '2018-06-18 04:41:20', '0', '2');
INSERT INTO `generator_table_field` VALUES ('1287', '129', 'name', 'varchar', '1', '0', '', '', 'generator_modules_name', '0', '1', '模块名称', '模块名称', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:20', null, '2018-06-18 04:41:20', '0', '3');
INSERT INTO `generator_table_field` VALUES ('1288', '129', 'describes', 'text', '1', '1', '', '', 'generator_modules_describes', '0', '1', '模块描述', '模块描述', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:21', null, '2018-06-18 04:41:21', '0', '4');
INSERT INTO `generator_table_field` VALUES ('1289', '129', 'version_no', 'int', '1', '1', '', '', 'generator_modules_version_no', '0', '1', '版本号', '版本号', '1', '0', '1', '1', null, '1', null, '1', null, '2018-06-18 04:41:22', null, '2018-06-18 04:41:22', '0', '5');
INSERT INTO `generator_table_field` VALUES ('1290', '129', 'create_by', 'bigint', '1', '1', '', '', 'generator_modules_create_by', '0', '1', '创建人id', '创建人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-18 04:41:22', null, '2018-06-18 04:41:22', '0', '6');
INSERT INTO `generator_table_field` VALUES ('1291', '129', 'create_time', 'datetime', '1', '1', '', '', 'generator_modules_create_time', '0', '1', '创建时间', '创建时间', '0', '0', '1', '2', null, '1', null, '1', null, '2018-06-18 04:41:22', null, '2018-06-18 04:41:22', '0', '7');
INSERT INTO `generator_table_field` VALUES ('1292', '129', 'update_by', 'bigint', '1', '1', '', '', 'generator_modules_update_by', '0', '1', '修改人id', '修改人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-18 04:41:22', null, '2018-06-18 04:41:22', '0', '8');
INSERT INTO `generator_table_field` VALUES ('1293', '129', 'update_time', 'datetime', '1', '1', '', '', 'generator_modules_update_time', '0', '1', '修改时间', '修改时间', '1', '0', '1', '2', null, '1', null, '1', null, '2018-06-18 04:41:22', null, '2018-06-18 04:41:22', '0', '9');
INSERT INTO `generator_table_field` VALUES ('1294', '129', 'delete_flag', 'varchar', '1', '1', '', '', 'generator_modules_delete_flag', '0', '1', '状态', '状态@0-显示,1-隐藏,2-删除', '0', '0', '0', '4', null, '1', null, '1', null, '2018-06-18 04:41:23', null, '2018-06-18 04:41:23', '0', '10');
INSERT INTO `generator_table_field` VALUES ('1295', '129', 'sort', 'int', '1', '1', '', '', 'generator_modules_sort', '0', '1', '排序', '排序', '0', '0', '0', '1', null, '1', null, '1', null, '2018-06-18 04:41:23', null, '2018-06-18 04:41:23', '0', '11');
INSERT INTO `generator_table_field` VALUES ('1296', '130', 'id', 'bigint', '1', '1', '', '', 'generator_template_config_id', '0', '1', 'ID', 'ID', '1', '0', '1', '0', null, '0', null, '1', null, '2018-06-18 04:41:34', null, '2018-06-18 04:41:34', '0', '1');
INSERT INTO `generator_table_field` VALUES ('1297', '130', 'model_key', 'varchar', '1', '0', '', '', 'generator_template_config_model_key', '0', '1', '模板key', '模板key', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:34', null, '2018-06-18 04:41:34', '0', '2');
INSERT INTO `generator_table_field` VALUES ('1298', '130', 'model_val', 'varchar', '1', '0', '', '', 'generator_template_config_model_val', '0', '1', '模板val', '模板val', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:34', null, '2018-06-18 04:41:34', '0', '3');
INSERT INTO `generator_table_field` VALUES ('1299', '130', 'version_no', 'int', '1', '1', '', '', 'generator_template_config_version_no', '0', '1', '版本号', '版本号', '1', '0', '1', '1', null, '1', null, '1', null, '2018-06-18 04:41:34', null, '2018-06-18 04:41:34', '0', '4');
INSERT INTO `generator_table_field` VALUES ('1300', '130', 'create_by', 'bigint', '1', '1', '', '', 'generator_template_config_create_by', '0', '1', '创建人id', '创建人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-18 04:41:34', null, '2018-06-18 04:41:34', '0', '5');
INSERT INTO `generator_table_field` VALUES ('1301', '130', 'create_time', 'datetime', '1', '1', '', '', 'generator_template_config_create_time', '0', '1', '创建时间', '创建时间', '0', '0', '1', '2', null, '1', null, '1', null, '2018-06-18 04:41:34', null, '2018-06-18 04:41:34', '0', '6');
INSERT INTO `generator_table_field` VALUES ('1302', '130', 'update_by', 'bigint', '1', '1', '', '', 'generator_template_config_update_by', '0', '1', '修改人id', '修改人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-18 04:41:35', null, '2018-06-18 04:41:35', '0', '7');
INSERT INTO `generator_table_field` VALUES ('1303', '130', 'update_time', 'datetime', '1', '1', '', '', 'generator_template_config_update_time', '0', '1', '修改时间', '修改时间', '1', '0', '1', '2', null, '1', null, '1', null, '2018-06-18 04:41:35', null, '2018-06-18 04:41:35', '0', '8');
INSERT INTO `generator_table_field` VALUES ('1304', '130', 'delete_flag', 'varchar', '1', '1', '', '', 'generator_template_config_delete_flag', '0', '1', '状态', '状态@0-显示,1-隐藏,2-删除', '0', '0', '0', '4', null, '1', null, '1', null, '2018-06-18 04:41:35', null, '2018-06-18 04:41:35', '0', '9');
INSERT INTO `generator_table_field` VALUES ('1305', '130', 'sort', 'int', '1', '1', '', '', 'generator_template_config_sort', '0', '1', '排序', '排序', '0', '0', '0', '1', null, '1', null, '1', null, '2018-06-18 04:41:35', null, '2018-06-18 04:41:35', '0', '10');
INSERT INTO `generator_table_field` VALUES ('1318', '132', 'id', 'bigint', '1', '1', '', '', 'generator_database_id', '0', '1', '主键', '主键', '0', '0', '0', '0', null, '0', null, '1', null, '2018-06-18 04:41:55', null, '2018-06-18 04:41:55', '0', '1');
INSERT INTO `generator_table_field` VALUES ('1319', '132', 'ip', 'varchar', '1', '1', '', '', 'generator_database_ip', '0', '1', 'id地址', 'id地址', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:55', null, '2018-06-18 04:41:55', '0', '2');
INSERT INTO `generator_table_field` VALUES ('1320', '132', 'name', 'varchar', '1', '1', '', '', 'generator_database_name', '0', '1', '数据库名称', '数据库名称', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:55', null, '2018-06-18 04:41:55', '0', '3');
INSERT INTO `generator_table_field` VALUES ('1321', '132', 'port', 'varchar', '1', '1', '', '', 'generator_database_port', '0', '1', 'port端口号', 'port端口号', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:55', null, '2018-06-18 04:41:55', '0', '4');
INSERT INTO `generator_table_field` VALUES ('1322', '132', 'user_name', 'varchar', '1', '1', '', '', 'generator_database_user_name', '0', '1', '账号', '账号', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:55', null, '2018-06-18 04:41:55', '0', '5');
INSERT INTO `generator_table_field` VALUES ('1323', '132', 'password', 'varchar', '1', '1', '', '', 'generator_database_password', '0', '1', '密码', '密码', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:55', null, '2018-06-18 04:41:55', '0', '6');
INSERT INTO `generator_table_field` VALUES ('1324', '132', 'encoding', 'varchar', '1', '1', '', '', 'generator_database_encoding', '0', '1', '编码', '编码', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:56', null, '2018-06-18 04:41:56', '0', '7');
INSERT INTO `generator_table_field` VALUES ('1325', '132', 'type', 'varchar', '1', '1', '', '', 'generator_database_type', '0', '1', '数据库类型', '数据库类型@0-mysql,1-order,2-sqlService', '0', '0', '0', '4', null, '1', null, '1', null, '2018-06-18 04:41:56', null, '2018-06-18 04:41:56', '0', '8');
INSERT INTO `generator_table_field` VALUES ('1326', '132', 'remarks', 'varchar', '0', '1', '', '', 'generator_database_remarks', '0', '1', '备注', '备注', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:56', null, '2018-06-18 04:41:56', '0', '9');
INSERT INTO `generator_table_field` VALUES ('1327', '132', 'version_no', 'int', '1', '1', '', '', 'generator_database_version_no', '0', '1', '版本号', '版本号', '0', '0', '0', '1', null, '1', null, '1', null, '2018-06-18 04:41:56', null, '2018-06-18 04:41:56', '0', '10');
INSERT INTO `generator_table_field` VALUES ('1328', '132', 'create_by', 'bigint', '0', '1', '', '', 'generator_database_create_by', '0', '1', '创建人id', '创建人id', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:56', null, '2018-06-18 04:41:56', '0', '11');
INSERT INTO `generator_table_field` VALUES ('1329', '132', 'create_time', 'datetime', '1', '1', '', '', 'generator_database_create_time', '0', '1', '创建时间', '创建时间', '0', '0', '0', '2', null, '1', null, '1', null, '2018-06-18 04:41:57', null, '2018-06-18 04:41:57', '0', '12');
INSERT INTO `generator_table_field` VALUES ('1330', '132', 'update_by', 'bigint', '0', '1', '', '', 'generator_database_update_by', '0', '1', '修改人id', '修改人id', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-18 04:41:57', null, '2018-06-18 04:41:57', '0', '13');
INSERT INTO `generator_table_field` VALUES ('1331', '132', 'update_time', 'datetime', '1', '1', '', '', 'generator_database_update_time', '0', '1', '修改时间', '修改时间', '0', '0', '0', '2', null, '1', null, '1', null, '2018-06-18 04:41:57', null, '2018-06-18 04:41:57', '0', '14');
INSERT INTO `generator_table_field` VALUES ('1332', '132', 'delete_flag', 'varchar', '1', '1', '', '', 'generator_database_delete_flag', '0', '1', '逻辑删除', '逻辑删除@0-存在,1-隐藏,2-删除,3-停用', '0', '0', '0', '4', null, '1', null, '1', null, '2018-06-18 04:41:57', null, '2018-06-18 04:41:57', '0', '15');
INSERT INTO `generator_table_field` VALUES ('1333', '132', 'sort', 'int', '1', '1', '', '', 'generator_database_sort', '0', '1', '排序', '排序', '0', '0', '0', '1', null, '1', null, '1', null, '2018-06-18 04:41:58', null, '2018-06-18 04:41:58', '0', '16');
INSERT INTO `generator_table_field` VALUES ('1583', '150', 'id', 'bigint', '1', '1', '', '', 'schedule_job_log_id', '0', '1', '主键', '主键', '1', '0', '1', '0', null, '0', null, '1', null, '2018-06-19 18:54:38', null, '2018-06-19 18:54:38', '0', '1');
INSERT INTO `generator_table_field` VALUES ('1584', '150', 'job_id', 'bigint', '1', '1', '', '', 'schedule_job_log_job_id', '0', '1', '任务id', '任务id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-19 18:54:38', null, '2018-06-19 18:54:38', '0', '2');
INSERT INTO `generator_table_field` VALUES ('1585', '150', 'bean_name', 'varchar', '0', '0', '', '', 'schedule_job_log_bean_name', '0', '1', 'spring bean名称', 'spring bean名称', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 18:54:38', null, '2018-06-19 18:54:38', '0', '3');
INSERT INTO `generator_table_field` VALUES ('1586', '150', 'method_name', 'varchar', '0', '0', '', '', 'schedule_job_log_method_name', '0', '1', '方法名', '方法名', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 18:54:38', null, '2018-06-19 18:54:38', '0', '4');
INSERT INTO `generator_table_field` VALUES ('1587', '150', 'params', 'varchar', '0', '1', '', '', 'schedule_job_log_params', '0', '1', '参数', '参数', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 18:54:38', null, '2018-06-19 18:54:38', '0', '5');
INSERT INTO `generator_table_field` VALUES ('1588', '150', 'status', 'tinyint', '1', '0', '', '', 'schedule_job_log_status', '0', '1', '任务状态', '任务状态@0-成功,1-失败', '0', '0', '0', '1', null, '1', null, '1', null, '2018-06-19 18:54:38', null, '2018-06-19 18:54:38', '0', '6');
INSERT INTO `generator_table_field` VALUES ('1589', '150', 'error', 'varchar', '0', '1', '', '', 'schedule_job_log_error', '0', '1', '失败信息', '失败信息', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 18:54:38', null, '2018-06-19 18:54:38', '0', '7');
INSERT INTO `generator_table_field` VALUES ('1590', '150', 'times', 'int', '1', '1', '', '', 'schedule_job_log_times', '0', '1', '耗时(单位：毫秒)', '耗时(单位：毫秒)', '0', '0', '0', '1', null, '1', null, '1', null, '2018-06-19 18:54:38', null, '2018-06-19 18:54:38', '0', '8');
INSERT INTO `generator_table_field` VALUES ('1591', '150', 'remarks', 'varchar', '0', '1', '', '', 'schedule_job_log_remarks', '0', '1', '备注', '备注', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-19 18:54:38', null, '2018-06-19 18:54:38', '0', '9');
INSERT INTO `generator_table_field` VALUES ('1592', '150', 'version_no', 'int', '1', '1', '', '', 'schedule_job_log_version_no', '0', '1', '版本号', '版本号', '1', '0', '1', '1', null, '1', null, '1', null, '2018-06-19 18:54:38', null, '2018-06-19 18:54:38', '0', '10');
INSERT INTO `generator_table_field` VALUES ('1593', '150', 'create_by', 'bigint', '0', '1', '', '', 'schedule_job_log_create_by', '0', '1', '创建人id', '创建人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-19 18:54:38', null, '2018-06-19 18:54:38', '0', '11');
INSERT INTO `generator_table_field` VALUES ('1594', '150', 'create_time', 'datetime', '1', '0', '', '', 'schedule_job_log_create_time', '[\"0\"]', '1', '创建时间', '创建时间', '0', '0', '0', '3', null, '1', null, '1', null, '2018-06-19 18:54:38', null, '2018-06-20 00:40:35', '0', '12');
INSERT INTO `generator_table_field` VALUES ('1595', '150', 'update_by', 'bigint', '0', '1', '', '', 'schedule_job_log_update_by', '0', '1', '修改人id', '修改人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-19 18:54:38', null, '2018-06-19 18:54:38', '0', '13');
INSERT INTO `generator_table_field` VALUES ('1596', '150', 'update_time', 'datetime', '1', '1', '', '', 'schedule_job_log_update_time', '0', '1', '修改时间', '修改时间', '1', '0', '1', '2', null, '1', null, '1', null, '2018-06-19 18:54:38', null, '2018-06-19 18:54:38', '0', '14');
INSERT INTO `generator_table_field` VALUES ('1597', '150', 'delete_flag', 'varchar', '1', '1', '', '', 'schedule_job_log_delete_flag', '0', '1', '逻辑删除', '逻辑删除@0-存在,1-隐藏,2-删除,3-停用', '0', '0', '0', '4', null, '1', null, '1', null, '2018-06-19 18:54:38', null, '2018-06-19 18:54:38', '0', '15');
INSERT INTO `generator_table_field` VALUES ('1598', '150', 'sort', 'int', '1', '1', '', '', 'schedule_job_log_sort', '0', '1', '排序', '排序', '0', '0', '0', '1', null, '1', null, '1', null, '2018-06-19 18:54:38', null, '2018-06-19 18:54:38', '0', '16');
INSERT INTO `generator_table_field` VALUES ('1599', '151', 'id', 'bigint', '1', '1', '', '', 'schedule_job_id', '0', '1', '主键', '主键', '1', '0', '1', '0', null, '0', null, '1', null, '2018-06-19 18:57:52', null, '2018-06-19 18:57:52', '0', '1');
INSERT INTO `generator_table_field` VALUES ('1600', '151', 'bean_name', 'varchar', '0', '0', '', '', 'schedule_job_bean_name', '0', '1', 'spring bean名称', 'spring bean名称', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 18:57:52', null, '2018-06-19 18:57:52', '0', '2');
INSERT INTO `generator_table_field` VALUES ('1601', '151', 'method_name', 'varchar', '0', '0', '', '', 'schedule_job_method_name', '0', '1', '方法名', '方法名', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 18:57:52', null, '2018-06-19 18:57:52', '0', '3');
INSERT INTO `generator_table_field` VALUES ('1602', '151', 'params', 'varchar', '0', '1', '', '', 'schedule_job_params', '0', '1', '参数', '参数', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 18:57:52', null, '2018-06-19 18:57:52', '0', '4');
INSERT INTO `generator_table_field` VALUES ('1603', '151', 'cron_expression', 'varchar', '0', '1', '', '', 'schedule_job_cron_expression', '0', '1', 'cron表达式', 'cron表达式', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 18:57:52', null, '2018-06-19 18:57:52', '0', '5');
INSERT INTO `generator_table_field` VALUES ('1604', '151', 'status', 'tinyint', '0', '1', '', '', 'schedule_job_status', '[\"0\"]', '1', '任务状态', '任务状态@0-正常,1-暂停', '0', '0', '0', '4', null, '1', null, '1', null, '2018-06-19 18:57:52', null, '2018-06-19 19:28:36', '0', '6');
INSERT INTO `generator_table_field` VALUES ('1605', '151', 'remarks', 'varchar', '0', '1', '', '', 'schedule_job_remarks', '0', '1', '备注', '备注', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 18:57:52', null, '2018-06-19 18:57:52', '0', '7');
INSERT INTO `generator_table_field` VALUES ('1606', '151', 'version_no', 'int', '1', '1', '', '', 'schedule_job_version_no', '0', '1', '版本号', '版本号', '1', '0', '1', '1', null, '1', null, '1', null, '2018-06-19 18:57:52', null, '2018-06-19 18:57:52', '0', '8');
INSERT INTO `generator_table_field` VALUES ('1607', '151', 'create_by', 'bigint', '0', '1', '', '', 'schedule_job_create_by', '0', '1', '创建人id', '创建人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-19 18:57:52', null, '2018-06-19 18:57:52', '0', '9');
INSERT INTO `generator_table_field` VALUES ('1608', '151', 'create_time', 'datetime', '1', '1', '', '', 'schedule_job_create_time', '0', '1', '创建时间', '创建时间', '0', '0', '1', '2', null, '1', null, '1', null, '2018-06-19 18:57:52', null, '2018-06-19 18:57:52', '0', '10');
INSERT INTO `generator_table_field` VALUES ('1609', '151', 'update_by', 'bigint', '0', '1', '', '', 'schedule_job_update_by', '0', '1', '修改人id', '修改人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-19 18:57:52', null, '2018-06-19 18:57:52', '0', '11');
INSERT INTO `generator_table_field` VALUES ('1610', '151', 'update_time', 'datetime', '1', '1', '', '', 'schedule_job_update_time', '0', '1', '修改时间', '修改时间', '1', '0', '1', '2', null, '1', null, '1', null, '2018-06-19 18:57:52', null, '2018-06-19 18:57:52', '0', '12');
INSERT INTO `generator_table_field` VALUES ('1611', '151', 'delete_flag', 'varchar', '1', '1', '', '', 'schedule_job_delete_flag', '[\"0\"]', '1', '逻辑删除', '逻辑删除@0-存在,1-隐藏,2-删除,3-停用', '0', '0', '0', '4', null, '1', null, '1', null, '2018-06-19 18:57:52', null, '2018-06-19 19:37:41', '0', '13');
INSERT INTO `generator_table_field` VALUES ('1612', '151', 'sort', 'int', '1', '1', '', '', 'schedule_job_sort', '0', '1', '排序', '排序', '0', '0', '0', '1', null, '1', null, '1', null, '2018-06-19 18:57:52', null, '2018-06-19 18:57:52', '0', '14');
INSERT INTO `generator_table_field` VALUES ('1643', '155', 'id', 'bigint', '1', '1', '', '', 'sys_log_id', '0', '1', '主键', '主键', '1', '0', '1', '0', null, '0', null, '1', null, '2018-06-19 20:13:33', null, '2018-06-19 20:13:33', '0', '1');
INSERT INTO `generator_table_field` VALUES ('1644', '155', 'username', 'varchar', '0', '1', '', '', 'sys_log_username', '0', '1', '用户名', '用户名', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 20:13:33', null, '2018-06-19 20:13:33', '0', '2');
INSERT INTO `generator_table_field` VALUES ('1645', '155', 'operation', 'varchar', '0', '1', '', '', 'sys_log_operation', '0', '1', '用户操作', '用户操作', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 20:13:33', null, '2018-06-19 20:13:33', '0', '3');
INSERT INTO `generator_table_field` VALUES ('1646', '155', 'method', 'text', '0', '0', '', '', 'sys_log_method', '0', '1', '请求方法', '请求方法', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 20:13:33', null, '2018-06-19 20:13:33', '0', '4');
INSERT INTO `generator_table_field` VALUES ('1647', '155', 'params', 'text', '0', '1', '', '', 'sys_log_params', '0', '1', '请求参数', '请求参数', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 20:13:33', null, '2018-06-19 20:13:33', '0', '5');
INSERT INTO `generator_table_field` VALUES ('1648', '155', 'time', 'bigint', '1', '1', '', '', 'sys_log_time', '0', '1', '执行时长(毫秒)', '执行时长(毫秒)', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 20:13:33', null, '2018-06-19 20:13:33', '0', '6');
INSERT INTO `generator_table_field` VALUES ('1649', '155', 'ip', 'varchar', '0', '1', '', '', 'sys_log_ip', '0', '1', 'IP地址', 'IP地址', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 20:13:33', null, '2018-06-19 20:13:33', '0', '7');
INSERT INTO `generator_table_field` VALUES ('1650', '155', 'remarks', 'varchar', '0', '0', '', '', 'sys_log_remarks', '0', '1', '备注', '备注', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 20:13:33', null, '2018-06-19 20:13:33', '0', '8');
INSERT INTO `generator_table_field` VALUES ('1651', '155', 'version_no', 'int', '1', '1', '', '', 'sys_log_version_no', '0', '1', '版本号', '版本号', '1', '0', '1', '1', null, '1', null, '1', null, '2018-06-19 20:13:33', null, '2018-06-19 20:13:33', '0', '9');
INSERT INTO `generator_table_field` VALUES ('1652', '155', 'create_by', 'bigint', '0', '1', '', '', 'sys_log_create_by', '0', '1', '创建人id', '创建人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-19 20:13:33', null, '2018-06-19 20:13:33', '0', '10');
INSERT INTO `generator_table_field` VALUES ('1653', '155', 'create_time', 'datetime', '1', '1', '', '', 'sys_log_create_time', '0', '1', '创建时间', '创建时间', '0', '0', '0', '2', null, '1', null, '1', null, '2018-06-19 20:13:33', null, '2018-06-19 20:13:33', '0', '11');
INSERT INTO `generator_table_field` VALUES ('1654', '155', 'update_by', 'bigint', '0', '1', '', '', 'sys_log_update_by', '0', '1', '修改人id', '修改人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-19 20:13:33', null, '2018-06-19 20:13:33', '0', '12');
INSERT INTO `generator_table_field` VALUES ('1655', '155', 'update_time', 'datetime', '1', '1', '', '', 'sys_log_update_time', '0', '1', '修改时间', '修改时间', '1', '0', '1', '2', null, '1', null, '1', null, '2018-06-19 20:13:33', null, '2018-06-19 20:13:33', '0', '13');
INSERT INTO `generator_table_field` VALUES ('1656', '155', 'delete_flag', 'varchar', '1', '1', '', '', 'sys_log_delete_flag', '0', '1', '逻辑删除', '逻辑删除@0-存在,1-隐藏,2-删除,3-停用', '0', '0', '0', '4', null, '1', null, '1', null, '2018-06-19 20:13:33', null, '2018-06-19 20:13:33', '0', '14');
INSERT INTO `generator_table_field` VALUES ('1657', '155', 'sort', 'int', '1', '1', '', '', 'sys_log_sort', '0', '1', '排序', '排序', '0', '0', '0', '1', null, '1', null, '1', null, '2018-06-19 20:13:33', null, '2018-06-19 20:13:33', '0', '15');
INSERT INTO `generator_table_field` VALUES ('1658', '156', 'id', 'bigint', '1', '1', '', '', 'sys_config_id', '0', '1', '主键', '主键', '1', '0', '1', '0', null, '0', null, '1', null, '2018-06-19 20:36:25', null, '2018-06-19 20:36:25', '0', '1');
INSERT INTO `generator_table_field` VALUES ('1659', '156', 'data_key', 'varchar', '0', '0', '', '', 'sys_config_data_key', '0', '1', '外部key', '外部key', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 20:36:25', null, '2018-06-19 20:36:25', '0', '2');
INSERT INTO `generator_table_field` VALUES ('1660', '156', 'value', 'varchar', '0', '0', '', '', 'sys_config_value', '0', '1', 'value', 'value', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 20:36:25', null, '2018-06-19 20:36:25', '0', '3');
INSERT INTO `generator_table_field` VALUES ('1661', '156', 'status', 'varchar', '1', '0', '', '', 'sys_config_status', '0', '1', '状态', '状态@0-隐藏,1-显示', '0', '0', '0', '4', null, '1', null, '1', null, '2018-06-19 20:36:25', null, '2018-06-19 20:36:25', '0', '4');
INSERT INTO `generator_table_field` VALUES ('1662', '156', 'remarks', 'varchar', '0', '1', '', '', 'sys_config_remarks', '0', '1', '备注', '备注', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 20:36:25', null, '2018-06-19 20:36:25', '0', '5');
INSERT INTO `generator_table_field` VALUES ('1663', '156', 'version_no', 'int', '1', '1', '', '', 'sys_config_version_no', '0', '1', '版本号', '版本号', '1', '0', '1', '1', null, '1', null, '1', null, '2018-06-19 20:36:25', null, '2018-06-19 20:36:25', '0', '6');
INSERT INTO `generator_table_field` VALUES ('1664', '156', 'create_by', 'bigint', '0', '1', '', '', 'sys_config_create_by', '0', '1', '创建人id', '创建人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-19 20:36:25', null, '2018-06-19 20:36:25', '0', '7');
INSERT INTO `generator_table_field` VALUES ('1665', '156', 'create_time', 'datetime', '1', '1', '', '', 'sys_config_create_time', '0', '1', '创建时间', '创建时间', '0', '0', '1', '2', null, '1', null, '1', null, '2018-06-19 20:36:25', null, '2018-06-19 20:36:25', '0', '8');
INSERT INTO `generator_table_field` VALUES ('1666', '156', 'update_by', 'bigint', '0', '1', '', '', 'sys_config_update_by', '0', '1', '修改人id', '修改人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-19 20:36:25', null, '2018-06-19 20:36:25', '0', '9');
INSERT INTO `generator_table_field` VALUES ('1667', '156', 'update_time', 'datetime', '1', '1', '', '', 'sys_config_update_time', '0', '1', '修改时间', '修改时间', '1', '0', '1', '2', null, '1', null, '1', null, '2018-06-19 20:36:25', null, '2018-06-19 20:36:25', '0', '10');
INSERT INTO `generator_table_field` VALUES ('1668', '156', 'delete_flag', 'varchar', '1', '1', '', '', 'sys_config_delete_flag', '0', '1', '逻辑删除', '逻辑删除@0-存在,1-隐藏,2-删除,3-停用', '0', '0', '0', '4', null, '1', null, '1', null, '2018-06-19 20:36:25', null, '2018-06-19 20:36:25', '0', '11');
INSERT INTO `generator_table_field` VALUES ('1669', '156', 'sort', 'int', '1', '1', '', '', 'sys_config_sort', '0', '1', '排序', '排序', '0', '0', '0', '1', null, '1', null, '1', null, '2018-06-19 20:36:25', null, '2018-06-19 20:36:25', '0', '12');
INSERT INTO `generator_table_field` VALUES ('1670', '157', 'id', 'bigint', '1', '1', '', '', 'generator_bus_config_id', '0', '1', 'ID', 'ID', '1', '0', '1', '0', null, '0', null, '1', null, '2018-06-19 20:56:42', null, '2018-06-19 20:56:42', '0', '1');
INSERT INTO `generator_table_field` VALUES ('1671', '157', 'conf_name', 'varchar', '1', '0', '', '', 'generator_bus_config_conf_name', '0', '1', '参数名称', '参数名称', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 20:56:42', null, '2018-06-19 20:56:42', '0', '2');
INSERT INTO `generator_table_field` VALUES ('1672', '157', 'conf_code', 'varchar', '1', '0', '', '', 'generator_bus_config_conf_code', '0', '1', '参数代码', '参数代码', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 20:56:42', null, '2018-06-19 20:56:42', '0', '3');
INSERT INTO `generator_table_field` VALUES ('1673', '157', 'conf_vue', 'varchar', '1', '0', '', '', 'generator_bus_config_conf_vue', '0', '1', '参数值', '参数值', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 20:56:42', null, '2018-06-19 20:56:42', '0', '4');
INSERT INTO `generator_table_field` VALUES ('1674', '157', 'version_no', 'int', '1', '1', '', '', 'generator_bus_config_version_no', '0', '1', '版本号', '版本号', '1', '0', '1', '1', null, '1', null, '1', null, '2018-06-19 20:56:42', null, '2018-06-19 20:56:42', '0', '5');
INSERT INTO `generator_table_field` VALUES ('1675', '157', 'create_by', 'bigint', '0', '1', '', '', 'generator_bus_config_create_by', '0', '1', '创建人id', '创建人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-19 20:56:42', null, '2018-06-19 20:56:42', '0', '6');
INSERT INTO `generator_table_field` VALUES ('1676', '157', 'create_time', 'datetime', '1', '1', '', '', 'generator_bus_config_create_time', '0', '1', '创建时间', '创建时间', '0', '0', '1', '2', null, '1', null, '1', null, '2018-06-19 20:56:42', null, '2018-06-19 20:56:42', '0', '7');
INSERT INTO `generator_table_field` VALUES ('1677', '157', 'update_by', 'bigint', '0', '1', '', '', 'generator_bus_config_update_by', '0', '1', '修改人id', '修改人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-19 20:56:42', null, '2018-06-19 20:56:42', '0', '8');
INSERT INTO `generator_table_field` VALUES ('1678', '157', 'update_time', 'datetime', '1', '1', '', '', 'generator_bus_config_update_time', '0', '1', '修改时间', '修改时间', '1', '0', '1', '2', null, '1', null, '1', null, '2018-06-19 20:56:42', null, '2018-06-19 20:56:42', '0', '9');
INSERT INTO `generator_table_field` VALUES ('1679', '157', 'delete_flag', 'varchar', '1', '1', '', '', 'generator_bus_config_delete_flag', '0', '1', '状态', '状态@0-显示,1-隐藏,2-删除', '0', '0', '0', '4', null, '1', null, '1', null, '2018-06-19 20:56:42', null, '2018-06-19 20:56:42', '0', '10');
INSERT INTO `generator_table_field` VALUES ('1680', '157', 'sort', 'int', '1', '1', '', '', 'generator_bus_config_sort', '0', '1', '排序', '排序', '0', '0', '0', '1', null, '1', null, '1', null, '2018-06-19 20:56:42', null, '2018-06-19 20:56:42', '0', '11');
INSERT INTO `generator_table_field` VALUES ('1701', '160', 'id', 'bigint', '1', '1', '', '', 'sys_oss_id', '0', '1', '主键', '主键', '1', '0', '1', '0', null, '0', null, '1', null, '2018-06-19 22:33:09', null, '2018-06-19 22:33:09', '0', '1');
INSERT INTO `generator_table_field` VALUES ('1702', '160', 'url', 'varchar', '0', '0', '', '', 'sys_oss_url', '[\"0\"]', '1', 'URL地址', 'URL地址', '0', '0', '0', '8', null, '1', null, '1', null, '2018-06-19 22:33:09', null, '2018-06-19 23:20:19', '0', '2');
INSERT INTO `generator_table_field` VALUES ('1703', '160', 'remarks', 'varchar', '0', '1', '', '', 'sys_oss_remarks', '0', '1', '备注', '备注', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-19 22:33:09', null, '2018-06-19 22:33:09', '0', '3');
INSERT INTO `generator_table_field` VALUES ('1704', '160', 'version_no', 'int', '1', '1', '', '', 'sys_oss_version_no', '0', '1', '版本号', '版本号', '1', '0', '1', '1', null, '1', null, '1', null, '2018-06-19 22:33:09', null, '2018-06-19 22:33:09', '0', '4');
INSERT INTO `generator_table_field` VALUES ('1705', '160', 'create_by', 'bigint', '0', '1', '', '', 'sys_oss_create_by', '0', '1', '创建人id', '创建人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-19 22:33:09', null, '2018-06-19 22:33:09', '0', '5');
INSERT INTO `generator_table_field` VALUES ('1706', '160', 'create_time', 'datetime', '1', '1', '', '', 'sys_oss_create_time', '0', '1', '创建时间', '创建时间', '0', '0', '1', '2', null, '1', null, '1', null, '2018-06-19 22:33:09', null, '2018-06-19 22:33:09', '0', '6');
INSERT INTO `generator_table_field` VALUES ('1707', '160', 'update_by', 'bigint', '0', '1', '', '', 'sys_oss_update_by', '0', '1', '修改人id', '修改人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-19 22:33:09', null, '2018-06-19 22:33:09', '0', '7');
INSERT INTO `generator_table_field` VALUES ('1708', '160', 'update_time', 'datetime', '1', '1', '', '', 'sys_oss_update_time', '0', '1', '修改时间', '修改时间', '1', '0', '1', '2', null, '1', null, '1', null, '2018-06-19 22:33:09', null, '2018-06-19 22:33:09', '0', '8');
INSERT INTO `generator_table_field` VALUES ('1709', '160', 'delete_flag', 'varchar', '1', '1', '', '', 'sys_oss_delete_flag', '0', '1', '逻辑删除', '逻辑删除@0-存在,1-隐藏,2-删除,3-停用', '1', '0', '0', '4', null, '1', null, '1', null, '2018-06-19 22:33:09', null, '2018-06-19 22:33:09', '0', '9');
INSERT INTO `generator_table_field` VALUES ('1710', '160', 'sort', 'int', '1', '1', '', '', 'sys_oss_sort', '0', '1', '排序', '排序', '0', '0', '0', '1', null, '1', null, '1', null, '2018-06-19 22:33:09', null, '2018-06-19 22:33:09', '0', '10');
INSERT INTO `generator_table_field` VALUES ('1711', '161', 'id', 'bigint', '1', '1', '', '', 'generator_template_id', '0', '1', 'ID', 'ID', '1', '0', '1', '0', null, '0', null, '1', null, '2018-06-20 06:30:25', null, '2018-06-20 06:30:25', '0', '1');
INSERT INTO `generator_table_field` VALUES ('1712', '161', 'text', 'text', '1', '1', '', '', 'generator_template_text', '[\"0\"]', '1', '模板内容', '模板内容', '1', '0', '0', '7', null, '1', null, '1', null, '2018-06-20 06:30:25', null, '2018-06-20 11:30:16', '0', '2');
INSERT INTO `generator_table_field` VALUES ('1713', '161', 'remark', 'varchar', '1', '0', '', '', 'generator_template_remark', '0', '1', '模板备注', '模板备注', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-20 06:30:25', null, '2018-06-20 06:30:25', '0', '3');
INSERT INTO `generator_table_field` VALUES ('1714', '161', 'url', 'varchar', '1', '1', '', '', 'generator_template_url', '0', '1', '模板路径', '模板路径', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-20 06:30:25', null, '2018-06-20 06:30:25', '0', '4');
INSERT INTO `generator_table_field` VALUES ('1715', '161', 'file_name', 'varchar', '1', '1', '', '', 'generator_template_file_name', '0', '1', '文件名', '文件名', '0', '0', '0', '0', null, '1', null, '1', null, '2018-06-20 06:30:25', null, '2018-06-20 06:30:25', '0', '5');
INSERT INTO `generator_table_field` VALUES ('1716', '161', 'version_no', 'int', '1', '1', '', '', 'generator_template_version_no', '0', '1', '版本号', '版本号', '1', '0', '1', '1', null, '1', null, '1', null, '2018-06-20 06:30:25', null, '2018-06-20 06:30:25', '0', '6');
INSERT INTO `generator_table_field` VALUES ('1717', '161', 'create_by', 'bigint', '1', '1', '', '', 'generator_template_create_by', '0', '1', '创建人id', '创建人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-20 06:30:25', null, '2018-06-20 06:30:25', '0', '7');
INSERT INTO `generator_table_field` VALUES ('1718', '161', 'create_time', 'datetime', '1', '1', '', '', 'generator_template_create_time', '0', '1', '创建时间', '创建时间', '1', '0', '1', '2', null, '1', null, '1', null, '2018-06-20 06:30:25', null, '2018-06-20 06:30:25', '0', '8');
INSERT INTO `generator_table_field` VALUES ('1719', '161', 'update_by', 'bigint', '1', '1', '', '', 'generator_template_update_by', '0', '1', '修改人id', '修改人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-06-20 06:30:25', null, '2018-06-20 06:30:25', '0', '9');
INSERT INTO `generator_table_field` VALUES ('1720', '161', 'update_time', 'datetime', '1', '1', '', '', 'generator_template_update_time', '0', '1', '修改时间', '修改时间', '1', '0', '1', '2', null, '1', null, '1', null, '2018-06-20 06:30:25', null, '2018-06-20 06:30:25', '0', '10');
INSERT INTO `generator_table_field` VALUES ('1721', '161', 'delete_flag', 'varchar', '1', '1', '', '', 'generator_template_delete_flag', '0', '1', '状态', '状态@0-显示,1-隐藏,2-删除', '0', '0', '0', '4', null, '1', null, '1', null, '2018-06-20 06:30:25', null, '2018-06-20 06:30:25', '0', '11');
INSERT INTO `generator_table_field` VALUES ('1722', '161', 'sort', 'int', '1', '1', '', '', 'generator_template_sort', '0', '1', '排序', '排序', '0', '0', '0', '1', null, '1', null, '1', null, '2018-06-20 06:30:25', null, '2018-06-20 06:30:25', '0', '12');
INSERT INTO `generator_table_field` VALUES ('7962', '127', 'business_key', 'varchar', '0', '1', null, null, 'generator_table_business_key', '0', '1', '业务key', '业务key', '0', '0', '0', '0', null, '1', null, '1', null, '2018-08-15 21:25:32', null, '2018-08-15 21:25:32', '0', '15');
INSERT INTO `generator_table_field` VALUES ('7963', '127', 'is_business', 'varchar', '1', '1', null, null, 'generator_table_is_business', '0', '1', '是否为业务表', '是否为业务表@0-是,1-否', '0', '0', '0', '4', null, '1', null, '1', null, '2018-08-15 21:25:32', null, '2018-08-15 21:25:32', '0', '16');
INSERT INTO `generator_table_field` VALUES ('7964', '127', 'business_value', 'varchar', '0', '1', null, null, 'generator_table_business_value', '0', '1', '业务取值', '业务取值', '0', '0', '0', '0', null, '1', null, '1', null, '2018-08-15 22:58:50', null, '2018-08-15 22:58:50', '0', '16');
INSERT INTO `generator_table_field` VALUES ('8019', '164', 'id', 'bigint', '1', '1', null, null, 'generator_table_field_id', '0', '1', '主键', '主键', '1', '0', '1', '0', null, '0', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8020', '164', 'table_id', 'bigint', '1', '0', null, null, 'generator_table', '[\"0\"]', '1', '表名', '表id', '0', '0', '0', '4', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-18 22:26:23', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8021', '164', 'field_name', 'varchar', '1', '0', null, null, 'generator_table_field_field_name', '0', '1', '字段名称', '字段名称', '0', '0', '0', '0', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8022', '164', 'field_type', 'varchar', '1', '0', null, null, 'generator_table_field_field_type', '0', '1', '字段类型', '字段类型@0-varchar,1-bigint,2-datetime,3-date,4-int,5-decimal', '0', '0', '0', '4', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8023', '164', 'is_null', 'varchar', '1', '1', null, null, 'generator_table_field_is_null', '0', '1', '是否为空', '是否为空@0-可以空,1-非空', '0', '0', '0', '4', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8024', '164', 'is_seek', 'varchar', '1', '1', null, null, 'generator_table_field_is_seek', '0', '1', '是否搜索', '是否搜索@0-搜索,1-非搜索', '0', '0', '0', '4', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8025', '164', 'data_length', 'varchar', '0', '1', null, null, 'generator_table_field_data_length', '0', '1', '数据长度', '数据长度', '0', '0', '0', '0', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8026', '164', 'width_length', 'varchar', '0', '1', null, null, 'generator_table_field_width_length', '0', '1', '宽度', '宽度', '0', '0', '0', '0', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8027', '164', 'dictionary_index', 'varchar', '0', '1', null, null, 'generator_bus_config', '[\"0\"]', '1', '字典索引', '字典索引', '0', '0', '0', '10', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-18 22:28:10', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8028', '164', 'checkout', 'varchar', '1', '1', null, null, 'generator_table_field_checkout', '0', '1', '正则校验', '正则校验&0-手机号,1-非空,2-身份证,3-邮箱,4-数字,5-小数', '0', '0', '0', '5', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8029', '164', 'is_export', 'varchar', '1', '1', null, null, 'generator_table_field_is_export', '0', '1', '是否导出', '是否导出@0-导出,1-非导出', '0', '0', '0', '4', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8030', '164', 'page_comment', 'varchar', '0', '1', null, null, 'generator_table_field_page_comment', '0', '1', '页面注释', '页面注释', '1', '0', '0', '0', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8031', '164', 'comment', 'varchar', '0', '1', null, null, 'generator_table_field_comment', '0', '1', '字段注释', '字段注释', '1', '0', '0', '0', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8032', '164', 'table_set', 'varchar', '1', '1', null, null, 'generator_table_field_table_set', '0', '1', '表格中字段是否显示', '表格中字段是否显示@0-是,1-否', '1', '0', '0', '4', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8033', '164', 'is_data_base', 'varchar', '1', '1', null, null, 'generator_table_field_is_data_base', '0', '1', '是否数据库字段', '是否数据库字段@0-是,1-否', '1', '0', '0', '4', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8034', '164', 'is_set', 'varchar', '1', '1', null, null, 'generator_table_field_is_set', '0', '1', '修改时是否显示', '修改时是否显示@0-是,1-否', '1', '0', '0', '4', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8035', '164', 'input_type', 'varchar', '1', '1', null, null, 'generator_table_field_input_type', '0', '1', '输入框类型', '输入框类型@0-普通文本,1-数字框,2-日期,3-时间,4-下拉选,5-复选框,6-富文本,7-文本域,8-上传单图像', '0', '0', '0', '4', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8036', '164', 'data_default', 'varchar', '0', '1', null, null, 'generator_table_field_data_default', '0', '1', '数据默认值', '数据默认值', '1', '0', '0', '0', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8037', '164', 'column_key', 'varchar', '0', '1', null, null, 'generator_table_field_column_key', '0', '1', '是否主键', '是否主键@0-是,1-否', '1', '0', '0', '4', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8038', '164', 'remarks', 'varchar', '0', '1', null, null, 'generator_table_field_remarks', '[\"0\"]', '1', '备注', '备注', '1', '0', '0', '8', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 01:06:53', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8039', '164', 'version_no', 'int', '1', '1', null, null, 'generator_table_field_version_no', '0', '1', '版本号', '版本号', '1', '0', '1', '1', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8040', '164', 'create_by', 'bigint', '0', '1', null, null, 'generator_table_field_create_by', '0', '1', '创建人id', '创建人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8041', '164', 'create_time', 'datetime', '1', '1', null, null, 'generator_table_field_create_time', '0', '1', '创建时间', '创建时间', '0', '0', '1', '2', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8042', '164', 'update_by', 'bigint', '0', '1', null, null, 'generator_table_field_update_by', '0', '1', '修改人id', '修改人id', '1', '0', '1', '0', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8043', '164', 'update_time', 'datetime', '1', '1', null, null, 'generator_table_field_update_time', '0', '1', '修改时间', '修改时间', '1', '0', '1', '2', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8044', '164', 'delete_flag', 'varchar', '1', '1', null, null, 'generator_table_field_delete_flag', '0', '1', '逻辑删除', '逻辑删除@0-存在,1-隐藏,2-删除,3-停用', '0', '0', '0', '4', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');
INSERT INTO `generator_table_field` VALUES ('8045', '164', 'sort', 'int', '1', '1', null, null, 'generator_table_field_sort', '0', '1', '排序', '排序', '0', '0', '0', '1', null, '1', null, '1', null, '2018-08-17 00:52:26', null, '2018-08-17 00:52:26', '0', '1');

-- ----------------------------
-- Table structure for generator_template
-- ----------------------------
DROP TABLE IF EXISTS `generator_template`;
CREATE TABLE `generator_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `text` text NOT NULL COMMENT '模板内容',
  `remark` varchar(32) NOT NULL COMMENT '模板备注',
  `url` varchar(200) NOT NULL COMMENT '模板路径',
  `file_name` varchar(200) NOT NULL COMMENT '文件名',
  `version_no` int(5) NOT NULL COMMENT '版本号',
  `create_by` bigint(20) NOT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '修改人id',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) NOT NULL COMMENT '状态@0-显示,1-隐藏,2-删除',
  `sort` int(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_name` (`file_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='模板配置';

-- ----------------------------
-- Records of generator_template
-- ----------------------------
INSERT INTO `generator_template` VALUES ('7', '<template>\n    <el-dialog\n            :title=\"!dataForm.id ? \'新增\' : \'修改\'\" :modal-append-to-body=\"false\"\n            :close-on-click-modal=\"false\"\n            :visible.sync=\"visible\">\n        <el-form :model=\"dataForm\" :rules=\"dataRule\" ref=\"dataForm\" @keyup.enter.native=\"dataFormSubmit()\" label-width=\"80px\">\n            <el-form-item :label=\"item.pageComment\" :prop=\"item.fieldName\" v-for=\"(item,indexs) in tableFieldMap[pathUrl].isSetList\">\n                <!--数字number-->\n                <el-input-number v-model=\"dataForm[item.fieldName]\" :placeholder=\"item.pageComment\" v-if=\"item.inputType===\'1\'\" :min=\"1\" ></el-input-number>\n                <!--日期date-->\n                <el-date-picker v-model=\"dataForm[item.fieldName]\"  v-else-if=\"item.inputType===\'2\'\" type=\"date\" style=\"width:100%;\" value-format=\"yyyy-MM-dd\"  :placeholder=\"item.pageComment\" format=\"yyyy-MM-dd\"> </el-date-picker>\n                <!--时间datetime-->\n                <el-date-picker v-model=\"dataForm[item.fieldName]\"  value-format=\"yyyy-MM-dd HH:mm:ss\"  format=\"yyyy-MM-dd HH:mm:ss\" :placeholder=\"item.pageComment\" type=\"datetime\" style=\"width:100%;\"  v-else-if=\"item.inputType===\'3\'\"></el-date-picker>\n                <!--下拉选select-->\n                <el-select v-model=\"dataForm[item.fieldName]\" :placeholder=\"item.pageComment\" style=\"width:100%;\" v-else-if=\"item.inputType==\'4\'\">\n                    <el-option\n                            v-for=\"itemss in busConfig[pathUrl+item.fieldnames].list\"\n                            :key=\"itemss.confName\"\n                            :label=\"itemss.confName\"\n                            :value=\"itemss.confVue\">\n                    </el-option>\n                </el-select>\n                <!--复选框-->\n                <el-select v-else-if=\"item.inputType==\'5\'\" style=\"width:100%\"\n                           v-model=\"dataForm[item.fieldName]\"  multiple  filterable allow-create default-first-option\n                           :placeholder=\"item.pageComment\">\n                    <el-option\n                            v-for=\"itemss in busConfig[pathUrl+item.fieldnames].list\"\n                            :key=\"itemss.confVue\"\n                            :label=\"itemss.confName\"\n                            :value=\"itemss.confVue\">\n                    </el-option>\n                </el-select>\n                <!--富文本框-->\n                <div class=\"editor-container\"  v-else-if=\"item.inputType==\'6\'\">\n                    <editor id=\"editor_id\"\n                            height=\"400px\"\n                            width=\"100%\"\n                            style=\"width:100%\"\n                            :fieldName=\"item.fieldName\"\n                            :content=\"dataForm[item.fieldName]\"\n                            :pluginsPath=\"\'/static/kindeditor/plugins/\'\"\n                            :uploadJson=\"sysurl+\'api/uploadFile\'\"\n                            :loadStyleMode=\"false\"\n                            @update-content=\"onEditorChange\"\n                            :allowFileManager=\"false\"\n                            :allowImageRemote=\"false\"\n                    ></editor>\n                </div>\n                <!--文本域-->\n                <el-input :autosize=\"{ minRows: 10, maxRows: 4}\" v-else-if=\"item.inputType==\'7\'\"\n                          type=\"textarea\"\n                          :rows=\"2\"\n                          :placeholder=\"item.pageComment\"\n                          v-model=\"dataForm[item.fieldName]\">\n                </el-input>\n                <!--上传图片-->\n                <el-upload v-else-if=\"item.inputType==\'8\'\"\n                           class=\"avatar-uploader\"\n                           :action=\"imgUrl\"\n                           list-type=\"picture-card\"\n                           :show-file-list=\"false\"\n                           :data=\"item\"\n                           :on-success=\"handleAvatarSuccess\"\n                           :before-upload=\"beforeAvatarUpload\" :on-preview=\"handlePictureCardPreview\">\n                    <img  style=\"width:100%;height:100%;\" v-if=\"dataForm[item.fieldName]\" :src=\"dataForm[item.fieldName]\" class=\"avatar\">\n                    <i v-else class=\"el-icon-plus avatar-uploader-icon\"></i>\n                </el-upload>\n                <!--多图片上传-->\n                <el-upload v-else-if=\"item.inputType==\'9\'\" :action=\"imgUrl\"  :on-remove=\"handleRemove\" :data=\"item\" list-type=\"picture-card\" :file-list=\"dataForm[item.fieldName]\"  :on-success=\"handleAvatarSuccess\" :before-upload=\"beforeAvatarUpload\"  :on-preview=\"handlePictureCardPreview\">\n                    <i class=\"el-icon-plus\"></i>\n                </el-upload>\n                <el-input v-model=\"dataForm[item.fieldName]\" :placeholder=\"item.pageComment\" v-else></el-input>\n            </el-form-item>\n        </el-form>\n        <el-dialog :visible.sync=\"prewImgLoad\" :modal=\"false\">\n            <img width=\"100%\" :src=\"prewImg\" alt=\"\">\n        </el-dialog>\n        <span slot=\"footer\" class=\"dialog-footer\">\n      <el-button @click=\"visible = false\">取消</el-button>\n      <el-button type=\"primary\" @click=\"dataFormSubmit()\">确定</el-button>\n    </span>\n    </el-dialog>\n</template>\n\n<script>\n    import API from \'@/api\'\n    export default {\n        data () {\n            return {\n                config: {\n                    initialFrameWidth: null,\n                    initialFrameHeight: 350\n                },\n                prewImgLoad: false,\n                prewImg: null,\n                imgUrl: API.sysoss.upload(this.$cookie.get(\'token\')),\n                pathUrl:\'${pathUrl}\',\n                busConfig: this.busConfig,\n                tableFieldMap:this.tableFieldMap,\n                sysurl: window.SITE_CONFIG.baseUrl,\n                visible: false,\n                dataForm: {\n			#foreach($column in $columns)\n				#if($column.fieldName== $pk.fieldName)\n					${column.attrname}: 0,\n				#else\n					${column.attrname}: \'\'#if($velocityCount != $columns.size()),#end\n\n				#end\n			#end\n        },\n            dataRule: {\n\n            }\n        }\n        },\n        methods: {\n            onEditorChange: function (text, fielName) {\n                console.log(text)\n\n                this.dataForm[fielName] = text\n            },\n            init (id) {\n                this.dataForm.id = id || 0\n                this.visible = true\n                for (var i = 0; i < this.tableFieldMap[this.pathUrl].isSetList.length; i++) {\n                    var cou = this.tableFieldMap[this.pathUrl].isSetList[i]\n                    if (cou.isNull === \'1\') {\n                        this.dataRule[cou.fieldName] = [\n                            { required: true, message: cou.pageComment + \'不能为空\', trigger: \'blur\' }\n                        ]\n                    }\n                }\n                this.$nextTick(() => {\n                    this.$refs[\'dataForm\'].resetFields()\n                    if (id) {\n                        API.${pathName}.info(id).then(({data}) => {\n                            if (data && data.code === 0) {\n                                for (var i = 0; i < this.tableFieldMap[this.pathUrl].columns.length; i++) {\n                                    var cou = this.tableFieldMap[this.pathUrl].columns[i]\n                                    // 初始化字段\n                                    if (cou.inputType === \'5\') {\n                                        if (!data.data[cou.fieldName]) {\n                                            this.dataForm[cou.fieldName] = []\n                                        } else {\n                                            var arr = JSON.parse(data.data[cou.fieldName])\n                                            if (arr instanceof Array) {\n                                                this.dataForm[cou.fieldName] = arr\n                                            } else {\n                                                arr += \'\'\n                                                this.dataForm[cou.fieldName] = [arr]\n                                            }\n                                        }\n                                    } else if (cou.inputType === \'9\') {\n                                        if (!data.data[cou.fieldName]) {\n                                            this.dataForm[cou.fieldName] = []\n                                        } else {\n                                            var arrayImg = JSON.parse(data.data[cou.fieldName])\n                                            if (arrayImg instanceof Array) {\n                                                this.dataForm[cou.fieldName] = arrayImg\n                                            } else {\n                                                this.dataForm[cou.fieldName] = [{uid: 999, name: cou.fieldName, url: arrayImg}]\n                                            }\n                                        }\n                                    } else {\n                                        this.dataForm[cou.fieldName] = data.data[cou.fieldName]\n                                    }\n                                }\n                            }\n                        })\n                    }\n                })\n            },\n            // 多图片上传删除事件\n            handleRemove (file, fileList) {\n                this.dataForm[file.name] = fileList\n            },\n            // 预览多图片事件\n            handlePictureCardPreview: function (file) {\n                this.prewImgLoad = true\n                this.prewImg = file.url\n            },\n            // 添加多图片上传事件\n            handleAvatarSuccess (res, file) {\n                if (this.dataForm[res.fieldName] instanceof Array) {\n                    this.dataForm[res.fieldName].push({name: res.fieldName, url: res.url})\n                } else {\n                    this.dataForm[res.fieldName] = res.url\n                }\n            },\n            // 图片上传格式验证\n            beforeAvatarUpload (file) {\n                const isJPG = file.type === \'image/jpeg\'\n                const isLt2M = file.size / 1024 / 1024 < 2\n                return true\n            },\n            // 表单提交\n            dataFormSubmit () {\n                #[[this.$refs[\'dataForm\'].validate((valid) => {]]#\n                        if (valid) {\n                    var params = {\n                    #foreach($column in $columns)\n                    #if($column.fieldName== $pk.columnName)\n                    \'${column.attrname}\': this.dataForm.${column.attrname} || undefined,\n                            #else\n\n                    \'${column.attrname}\': this.dataForm.${column.attrname}#if($velocityCount != $columns.size()),#end\n                    #end\n                    #end\n                }\n                    var tick = !this.dataForm.${pk.attrname} ? API.${pathName}.add(params) : API.${pathName}.update(params)\n                    tick.then(({data}) => {\n                        if (data && data.code === 0) {\n                            #[[this.$message({]]#\n                                    message: \'操作成功\',\n                                    type: \'success\',\n                                    duration: 1500,\n                                    onClose: () => {\n                                this.visible = false\n                                #[[this.$emit(\'refreshDataList\')]]#\n                            }\n                        })\n                        } else {\n                            #[[this.$message.error(data.msg)]]#\n                        }\n                    })\n                }\n                })\n            }\n        }\n    }\n</script>\n', 'vue新增修改模板', 'src/views/$[moduleName]/$[className.toLowerCase()]/add-or-update.vue', 'elementui\\add-or-update.vue.vm', '1', '1', '2018-05-29 04:31:23', '1', '2018-06-20 11:30:36', '0', '1');
INSERT INTO `generator_template` VALUES ('8', 'import request from \'../../request\'\nimport requestUrl from \'../../requestUrl\'\nimport requestParam from \'../../requestParam\'\nimport isInteger from \'lodash/isInteger\'\n\n// 获取列表\nexport function list (params) {\n  return request({\n    url: requestUrl(\'/${moduleName}/${pathName}/list\'),\n    method: \'get\',\n    params: requestParam(params, \'get\')\n  })\n}\n\n// 获取信息\nexport function info (id) {\n  return request({\n    url: requestUrl(\'/${moduleName}/${pathName}/info\' + (isInteger(id) ? `/${id}` : \'\')),\n    method: \'get\',\n    params: requestParam({}, \'get\')\n  })\n}\n\n// 添加\nexport function add (params) {\n  return request({\n    url: requestUrl(\'/${moduleName}/${pathName}/save\'),\n    method: \'post\',\n    data: requestParam(params)\n  })\n}\n// 批量添加\nexport function addAll (params) {\n    return request({\n        url: requestUrl(\'/${moduleName}/${pathName}/addAll\'),\n        method: \'post\',\n        data: requestParam(params)\n    })\n}\n// 修改\nexport function update (params) {\n  return request({\n    url: requestUrl(\'/${moduleName}/${pathName}/update\'),\n    method: \'post\',\n    data: requestParam(params)\n  })\n}\n\n// 删除\nexport function del (params) {\n  return request({\n    url: requestUrl(\'/${moduleName}/${pathName}/delete\'),\n    method: \'post\',\n    data: requestParam(params, \'post\', false)\n  })\n}\n', 'vue的js模板', 'src/api/modules/$[moduleName]/$[className.toLowerCase()].js', 'elementui\\index.js.vm', '1', '1', '2018-05-29 04:32:35', '11', '2018-08-17 13:11:39', '0', '1');
INSERT INTO `generator_template` VALUES ('9', '<template>\n    <div class=\"mod-config\">\n        <el-form :inline=\"true\" :model=\"dataForm\" @keyup.enter.native=\"getDataList()\" style=\"margin-bottom:60px;\">\n            <seek ref=\"seek\" :dataForm.sync=\"dataForm\" :pathUrl=\"pathUrl\"></seek>\n            <div style=\"float:right\">\n                <el-button @click=\"getDataList()\">查询</el-button>\n                <el-button v-if=\"isAuth(model+\':\'+pathUrl+\':save\')\" type=\"primary\" @click=\"addOrUpdateHandle()\">新增</el-button>\n                <el-button v-if=\"isAuth(model+\':\'+pathUrl+\':save\')\" type=\"primary\" @click=\"addAllOrUpdateHandle()\">批量新增</el-button>\n                <el-button v-if=\"isAuth(model+\':\'+pathUrl+\':delete\')\" type=\"danger\" @click=\"deleteHandle()\" :disabled=\"dataListSelections.length <= 0\">批量删除</el-button>\n            </div>\n        </el-form>\n        <tablefield :pathUrl=\"pathUrl\" ref=\"tablefield\" :dataForm.sync=\"dataForm\"  :setListSelections=\"setListSelections\" :saveForm=\"saveForm\" :model=\"model\" :operation.sync=\"operation\"></tablefield>\n    </div>\n</template>\n\n<script>\n    import seek from \'@/components/generator/seek.vue\'\n    import tablefield from \'@/components/generator/tablefield.vue\'\n    export default {\n        components: {\n            seek,\n            tablefield\n        },\n        data () {\n            return {\n                model: \'${moduleName}\',\n                pathUrl: \'${pathUrl}\',\n                busConfig: this.busConfig,\n                tableFieldMap: this.tableFieldMap,\n                sysurl: window.SITE_CONFIG.baseUrl,\n                dataForm: {},\n                dataListSelections: [],\n                // 操作按钮\n                operation: [\n                    // {\'scope\': \'delete\', fun: this.hideTableField, name: \'显示所有字段\'}\n                ],\n                saveForm: {\n            #foreach($column in $columns)\n                #if($column.fieldName== $pk.fieldName)\n                    ${column.attrname}: 0,\n                #else\n                    ${column.attrname}: \'\'#if($velocityCount != $columns.size()),#end\n\n                #end\n            #end\n        }\n        }\n        },\n        activated () {\n            this.getDataList()\n        },\n        methods: {\n            addAllOrUpdateHandle () {\n                #[[      this.$nextTick(() => {]]#\n                    #[[             this.$refs.tablefield.addAllOrUpdateHandle()]]#\n                })\n            },\n            addOrUpdateHandle () {\n                #[[      this.$nextTick(() => {]]#\n                    #[[             this.$refs.tablefield.addOrUpdateHandle()]]#\n                })\n            },\n            deleteHandle () {\n                #[[           this.$nextTick(() => {]]#\n                    #[[        this.$refs.tablefield.deleteHandle()]]#\n                })\n            },\n            setListSelections (val) {\n                this.dataListSelections = val\n            },\n            getDataList () {\n                #[[          this.$nextTick(() => {]]#\n                    #[[              this.$refs.tablefield.getDataList()]]#\n                })\n            }\n        }\n    }\n</script>\n', 'vue表格模板', 'src/views/$[moduleName]/$[className.toLowerCase()]/index.vue', 'elementui\\index.vue.vm', '1', '1', '2018-05-29 04:33:18', '1', '2018-08-17 13:00:55', '0', '1');
INSERT INTO `generator_template` VALUES ('10', 'package ${package}.${moduleName}.constant;\n\n/**\n * ${comments}常量\n *\n * @author ${author}\n * @email ${email}\n * @date ${datetime}\n */\npublic interface  ${className}Constant{\n    #foreach ($column in $columns)\n        #if($column.list.size()>0)\n    /**\n     * ${column.comment} - ${column.selectKey}\n     */\n    #foreach ($list in $column.list)\n    //${list.MapValue}\n    String ${column.selectKey.toUpperCase()}_${list.MapKey} = \"${list.MapKey}\";\n    #end\n        #end\n    #end\n}\n', 'java常量模板', 'main/java/$[packagePath]/$[moduleName]/constant/$[className]Constant.java', 'Constant.java.vm', '1', '1', '2018-05-29 04:34:01', '1', '2018-06-14 21:48:15', '0', '1');
INSERT INTO `generator_template` VALUES ('11', 'package ${package}.${moduleName}.controller;\n\nimport java.util.Arrays;\nimport java.util.Map;\nimport java.util.List;\nimport com.szt.common.validator.ValidatorUtils;\nimport org.apache.shiro.authz.annotation.RequiresPermissions;\nimport org.springframework.beans.factory.annotation.Autowired;\nimport org.springframework.web.bind.annotation.PathVariable;\nimport org.springframework.web.bind.annotation.RequestBody;\nimport org.springframework.web.bind.annotation.RequestMapping;\nimport org.springframework.web.bind.annotation.RequestParam;\nimport org.springframework.web.bind.annotation.RestController;\nimport org.springframework.web.bind.annotation.GetMapping;\nimport org.springframework.web.bind.annotation.PostMapping;\nimport io.swagger.annotations.Api;\nimport io.swagger.annotations.ApiOperation;\nimport ${package}.${moduleName}.entity.${className}Entity;\nimport ${package}.${moduleName}.service.${className}Service;\nimport ${mainPath}.common.utils.PageUtils;\nimport ${mainPath}.common.utils.R;\nimport com.szt.common.annotation.SysLog;\nimport lombok.extern.slf4j.Slf4j;\nimport org.springframework.stereotype.Controller;\n/**\n * ${comments}\n *\n * @author ${author}\n * @email ${email}\n * @date ${datetime}\n */\n@Slf4j\n@Api(value = \"${comments}接口\", tags = \"${comments}接口\")\n@RestController\n@RequestMapping(\"${moduleName}/${pathName}\")\n@Controller(\"${moduleName}${pathName}\")\npublic class ${className}Controller {\n    @Autowired\n    private ${className}Service ${classname}Service;\n\n    /**\n     * 列表\n     */\n    @ApiOperation(\"列表\")\n    @GetMapping(\"/list\")\n    @RequiresPermissions(\"${moduleName}:${pathName}:list\")\n    public R list(@RequestParam Map<String, Object> params) {\n        PageUtils page = ${classname}Service.queryPage(params);\n\n        return R.ok().put(\"data\", page);\n    }\n\n\n    /**\n     * 信息\n     */\n    @ApiOperation(\"信息\")\n    @GetMapping(\"/info/{${pk.attrname}}\")\n    @RequiresPermissions(\"${moduleName}:${pathName}:info\")\n    public R info(@PathVariable(\"${pk.attrname}\") ${pk.attrType} ${pk.attrname}) {\n            ${className}Entity ${classname} = ${classname}Service.selectById(${pk.attrname});\n\n        return R.ok().put(\"data\", ${classname});\n    }\n\n    /**\n     * 保存\n     */\n    @SysLog(\"保存信息\")\n    @ApiOperation(\"保存\")\n    @PostMapping(\"/save\")\n    @RequiresPermissions(\"${moduleName}:${pathName}:save\")\n    public R save(@RequestBody ${className}Entity ${classname}) {\n            ${classname}Service.insertEntity(${classname});\n        return R.ok();\n    }\n    /**\n     * 批量保存\n     */\n    @SysLog(\"批量保存信息\")\n    @ApiOperation(\"批量保存\")\n    @PostMapping(\"/saveAll\")\n    @RequiresPermissions(\"${moduleName}:${pathName}:save\")\n    public R save(@RequestBody List<${className}Entity> ${classname}) {\n            ${classname}Service.saveAll(${classname});\n        return R.ok();\n    }\n    /**\n     * 修改\n     */\n    @SysLog(\"修改信息\")\n    @ApiOperation(\"修改\")\n    @PostMapping(\"/update\")\n    @RequiresPermissions(\"${moduleName}:${pathName}:update\")\n    public R update(@RequestBody ${className}Entity ${classname}) {\n            ${classname}.update();\n            //校验类型\n             ValidatorUtils.validateEntity(${classname});\n            ${classname}Service.updateById(${classname});\n\n        return R.ok();\n    }\n\n    /**\n     * 删除\n     */\n    @SysLog(\"删除信息\")\n    @ApiOperation(\"删除\")\n    @PostMapping(\"/delete\")\n    @RequiresPermissions(\"${moduleName}:${pathName}:delete\")\n    public R delete(@RequestBody ${pk.attrType}[]${pk.attrname}s) {\n            ${classname}Service.deleteBatchIds(Arrays.asList(${pk.attrname}s));\n        return R.ok();\n    }\n\n}\n', 'java控制层模板', 'main/java/$[packagePath]/$[moduleName]/controller/$[className]Controller.java', 'Controller.java.vm', '1', '1', '2018-05-29 04:34:39', '1', '2018-08-17 13:48:55', '0', '1');
INSERT INTO `generator_template` VALUES ('12', 'package ${package}.${moduleName}.dao;\n\nimport ${package}.${moduleName}.entity.${className}Entity;\nimport com.baomidou.mybatisplus.mapper.BaseMapper;\nimport org.apache.ibatis.annotations.Mapper;\n\n/**\n * ${comments}\n * \n * @author ${author}\n * @email ${email}\n * @date ${datetime}\n */\n@Mapper\npublic interface ${className}Dao extends BaseMapper<${className}Entity> {\n\n\n}\n', 'java持久层模板', 'main/java/$[packagePath]/$[moduleName]/dao/$[className]Dao.java', 'Dao.java.vm', '1', '1', '2018-05-29 04:35:12', '1', '2018-05-31 16:47:59', '0', '1');
INSERT INTO `generator_template` VALUES ('13', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE mapper PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\" \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\n\n<mapper namespace=\"${package}.${moduleName}.dao.${className}Dao\">\n\n##	<!-- 可根据自己的需求，是否要使用 -->\n##    <resultMap type=\"${package}.${moduleName}.entity.${className}Entity\" id=\"${classname}Map\">\n###foreach($column in $columns)\n##        <result property=\"${column.attrname}\" column=\"${column.columnName}\"/>\n###end\n##    </resultMap>\n\n\n</mapper>', 'java持久层xml模板', 'main/resources/mapper/$[moduleName]/$[className]Dao.xml', 'Dao.xml.vm', '1', '1', '2018-05-29 04:35:57', '1', '2018-05-30 00:55:41', '0', '1');
INSERT INTO `generator_template` VALUES ('14', 'package ${package}.${moduleName}.entity;\nimport com.szt.common.CommonConstant;\nimport com.baomidou.mybatisplus.annotations.TableId;\nimport com.baomidou.mybatisplus.annotations.TableName;\nimport io.swagger.annotations.ApiModel;\nimport io.swagger.annotations.ApiModelProperty;\nimport org.hibernate.validator.constraints.NotBlank;\nimport com.fasterxml.jackson.annotation.JsonFormat;\nimport org.springframework.format.annotation.DateTimeFormat;\nimport org.apache.shiro.SecurityUtils;\nimport com.szt.modules.sys.entity.SysUserEntity;\nimport com.szt.modules.sys.entity.SysCommcomFieldEntity;\nimport javax.validation.constraints.NotNull;\nimport org.springframework.stereotype.Controller;\n	#if(${hasBigDecimal})\n    import java.math.BigDecimal;\n	#end\nimport java.io.Serializable;\nimport java.util.Date;\n\n/**\n * ${comments}\n *\n * @author ${author}\n * @email ${email}\n * @date ${datetime}\n */\n@TableName(\"${tableName}\")\npublic class ${className}Entity implements Serializable {\n    private static final long serialVersionUID = 1L;\n\n	#foreach ($column in $columns)\n        /**\n         * $column.comment\n         */\n		#if($column.fieldName== $pk.fieldName)\n        @TableId\n		#end\n		#if($column.nullable==false && $column.fieldName!= $pk.fieldName)\n			#if( $column.attrType == \"String\")\n            @NotBlank(message=\"${column.pageComment}不能为空\")\n			#else\n            @NotNull(message=\"${column.pageComment}不能为空\")\n			#end\n		#end\n        @ApiModelProperty(value = \"${column.comment}\",required = ${column.nullable})\n		#if($column.attrType == \"Date\")\n        @DateTimeFormat(pattern=\"yyyy-MM-dd HH:mm:ss\")\n        @JsonFormat(pattern=\"yyyy-MM-dd\",timezone = \"GMT+8\")\n		#end\n    private $column.attrType $column.attrname;\n	#end\n\n	#foreach ($column in $columns)\n        /**\n         * 设置：${column.comment}\n         */\n        public void set${column.attrName}($column.attrType $column.attrname) {\n            this.$column.attrname = $column.attrname;\n        }\n        /**\n         * 获取：${column.comment}\n         */\n        public $column.attrType get${column.attrName}() {\n            return $column.attrname;\n        }\n	#end\n\n    public void insert(){\n        this.createTime = new Date();\n        this.updateTime = new Date();\n        this.sort = this.sort == null ? 0 : this.sort;\n        if(this.deleteFlag == null || this.deleteFlag.length()==0){\n            this.deleteFlag = \"0\";\n        }\n        this.versionNo=1;\n    }\n    public void update(){\n        this.updateTime = new Date();\n    }\n}\n', 'java实体模板', 'main/java/$[packagePath]/$[moduleName]/entity/$[className]Entity.java', 'Entity.java.vm', '1', '1', '2018-05-29 04:36:33', '1', '2018-06-26 09:37:20', '0', '1');
INSERT INTO `generator_template` VALUES ('17', 'package ${package}.${moduleName}.service;\n\nimport com.szt.common.CommonService;\nimport ${package}.${moduleName}.entity.${className}Entity;\n\nimport java.util.Map;\n\n/**\n * ${comments}\n *\n * @author ${author}\n * @email ${email}\n * @date ${datetime}\n */\npublic interface ${className}Service extends CommonService<${className}Entity> {\n\n\n}', 'java业务层接口模板', 'main/java/$[packagePath]/$[moduleName]/service/$[className]Service.java', 'Service.java.vm', '1', '1', '2018-05-29 04:38:53', '1', '2018-05-30 00:59:05', '0', '12');
INSERT INTO `generator_template` VALUES ('18', 'package ${package}.${moduleName}.service.impl;\n\nimport org.springframework.stereotype.Service;\nimport com.baomidou.mybatisplus.service.impl.ServiceImpl;\nimport com.szt.common.CommonServiceImpl;\nimport ${package}.${moduleName}.dao.${className}Dao;\nimport ${package}.${moduleName}.entity.${className}Entity;\nimport ${package}.${moduleName}.service.${className}Service;\nimport lombok.extern.slf4j.Slf4j;\nimport com.szt.common.utils.PageUtils;\nimport com.szt.common.utils.Query;\nimport java.util.Map;\n/**\n * ${comments}\n *\n * @author ${author}\n * @email ${email}\n * @date ${datetime}\n */\n@Service(\"${moduleName}${classname}Service\")\npublic class ${className}ServiceImpl extends CommonServiceImpl<${className}Dao, ${className}Entity> implements ${className}Service {\n\n\n\n}\n', 'java业务层实现模板', 'main/java/$[packagePath]/$[moduleName]/service/impl/$[className]ServiceImpl.java', 'ServiceImpl.java.vm', '1', '1', '2018-05-29 04:39:34', '1', '2018-06-17 18:01:08', '0', '1');
INSERT INTO `generator_template` VALUES ('19', '<template>\n    <div >\n        <div v-show=\"visible\">\n            <el-form :inline=\"true\" :model=\"dataForm\" @keyup.enter.native=\"getDataList()\" style=\"margin-bottom:60px;\">\n                <seek ref=\"seek\" :dataForm.sync=\"dataForm\" :pathUrl=\"pathUrl\"></seek>\n                <div style=\"float:right\">\n                    <el-button @click=\"getDataList()\">查询</el-button>\n                    <el-button v-if=\"isAuth(model+\':\'+pathUrl+\':save\')\" type=\"primary\" @click=\"addOrUpdateHandle()\">新增</el-button>\n                    <el-button v-if=\"isAuth(model+\':\'+pathUrl+\':delete\')\" type=\"danger\" @click=\"deleteHandle()\" :disabled=\"dataListSelections.length <= 0\">批量删除</el-button>\n                </div>\n            </el-form>\n            <el-table\n                    :default-sort=\"{prop: \'id\', order: \'ascending\'}\"\n                    @sort-change=\"sort\"\n                    :data=\"dataList\"\n                    border height=\"500\"\n                    v-loading=\"dataListLoading\"\n                    @selection-change=\"selectionChangeHandle\"\n                    style=\"width: 100%;\">\n                <el-table-column\n                        srtable=\"custom\"\n                        type=\"selection\"\n                        header-align=\"center\"\n                        align=\"center\"\n                        width=\"50\">\n                </el-table-column>\n                <el-table-column v-for=\"item in tableFieldMap[pathUrl].tableSetList\"\n                                 sortable=\"custom\"\n                                 :prop=\"item.fieldName\"\n                                 header-align=\"center\"\n                                 align=\"center\" :label=\"item.pageComment\">\n                    <template slot-scope=\"scope\">\n                        <!--日期date-->\n                        <span v-if=\"item.inputType===\'2\'\" v-text=\"scope.row[item.fieldName]\"></span>\n                        <!-- 时间datetime-->\n                        <span v-else-if=\"item.inputType===\'3\'\" v-text=\"scope.row[item.fieldName]\"></span>\n                        <!--上传图片-->\n                        <span v-else-if=\"item.inputType===\'8\'\">\n                      <img :src=\"scope.row[item.fieldName]\" style=\"width:50px;height:50px;\">\n        </span>\n                        <!--下拉选selec-->\n                        <!-- <span  v-else-if=\"item.inputType==\'5\' \"  v-text=\"jsonStr(busConfig[pathUrl+item.fieldnames].map,scope.row[item.fieldName])\" >  </span>-->\n                        <span  v-else-if=\"item.inputType==\'4\' || item.inputType==\'5\'\"  v-text=\"busConfig[pathUrl+item.fieldnames].map[scope.row[item.fieldName]]\" >  </span>\n                        <span v-else v-text=\"scope.row[item.fieldName]\"></span>\n                    </template>\n                </el-table-column>\n                <el-table-column\n                        fixed=\"right\"\n                        header-align=\"center\"\n                        align=\"center\"\n                        width=\"150\"\n                        label=\"操作\" >\n                    <template slot-scope=\"scope\">\n                        <el-button type=\"text\"  v-if=\"isAuth(model+\':\'+pathUrl+\':save\')\"  size=\"small\" @click=\"addOrUpdateHandle(scope.row.id)\">修改\n                        </el-button>\n                        <el-button  v-if=\"isAuth(model+\':\'+pathUrl+\':delete\')\"  type=\"text\" size=\"small\" @click=\"deleteHandle(scope.row.id)\">删除</el-button>\n                        <el-button  v-for=\"items in operation\"   v-if=\"isAuth(model+\':\'+pathUrl+\':\'+items.scope)\"  @click=\"items.fun(scope.row)\" type=\"text\" size=\"small\" v-text=\"items.name\"></el-button>\n                    </template>\n                </el-table-column>\n            </el-table>\n            <el-pagination\n                    @size-change=\"sizeChangeHandle\"\n                    @current-change=\"currentChangeHandle\"\n                    :current-page=\"pageIndex\"\n                    :page-sizes=\"[10, 20, 50, 100]\"\n                    :page-size=\"pageSize\"\n                    :total=\"totalPage\"\n                    layout=\"total, sizes, prev, pager, next, jumper\">\n            </el-pagination>\n        </div>\n        <!-- 跳转修改 -->\n        <div v-show=\"!visible\"  id=\"save\"  >\n            <div class=\"save\">\n                <el-tabs v-model=\"activeName\" @tab-click=\"handleClick\" tab-position=\"top\"  >\n                    <el-tab-pane :label=\"!saveForm.id ? \'新增\' : \'修改\'\" name=\"save\"  key=\"save\">\n                        <el-form :model=\"saveForm\" :rules=\"dataRule\" ref=\"saveForm\" @keyup.enter.native=\"dataFormSubmit()\" label-width=\"80px\">\n                            <el-form-item :label=\"item.pageComment\" :prop=\"item.fieldName\" v-for=\"item in tableFieldMap[pathUrl].isSetList\">\n                                <!--数字number-->\n                                <el-input-number v-model=\"saveForm[item.fieldName]\" :placeholder=\"item.pageComment\" v-if=\"item.inputType===\'1\'\" :min=\"1\" ></el-input-number>\n                                <!--日期date-->\n                                <el-date-picker v-model=\"saveForm[item.fieldName]\"  v-else-if=\"item.inputType===\'2\'\" type=\"date\" style=\"width:100%;\" value-format=\"yyyy-MM-dd\"  :placeholder=\"item.pageComment\" format=\"yyyy-MM-dd\"><template slot=\"prepend\">{{item.pageComment}}</template> </el-date-picker>\n                                <!--时间datetime-->\n                                <el-date-picker v-model=\"saveForm[item.fieldName]\"  value-format=\"yyyy-MM-dd HH:mm:ss\"  format=\"yyyy-MM-dd HH:mm:ss\" :placeholder=\"item.pageComment\" type=\"datetime\" style=\"width:100%;\"  v-else-if=\"item.inputType===\'3\'\"><template slot=\"prepend\">{{item.pageComment}}</template></el-date-picker>\n                                <!--下拉选select-->\n                                <el-select v-model=\"saveForm[item.fieldName]\" :placeholder=\"item.pageComment\" style=\"width:100%;\" v-else-if=\"item.inputType==\'4\'\">\n                                    <el-option\n                                            v-for=\"itemss in busConfig[pathUrl+item.fieldnames].list\"\n                                            :key=\"itemss.confName\"\n                                            :label=\"itemss.confName\"\n                                            :value=\"itemss.confVue\"><template slot=\"prepend\">{{item.pageComment}}</template>\n                                    </el-option>\n                                </el-select>\n                                <!--复选框-->\n                                <el-select v-else-if=\"item.inputType==\'5\'\" style=\"width:100%\"\n                                           v-model=\"saveForm[item.fieldName]\"  multiple  filterable allow-create default-first-option\n                                           :placeholder=\"item.pageComment\">\n                                    <el-option\n                                            v-for=\"itemss in busConfig[pathUrl+item.fieldnames].list\"\n                                            :key=\"itemss.confVue\"\n                                            :label=\"itemss.confName\"\n                                            :value=\"itemss.confVue\"><template slot=\"prepend\">{{item.pageComment}}</template>\n                                    </el-option>\n                                </el-select>\n                                <!--富文本框-->\n                                <div class=\"editor-container\"  v-else-if=\"item.inputType==\'6\'\">\n                                    <editor id=\"editor_id\"\n                                            height=\"400px\"\n                                            width=\"100%\"\n                                            style=\"width:100%\"\n                                            :fieldName=\"item.fieldName\"\n                                            :content=\"saveForm[item.fieldName]\"\n                                            :pluginsPath=\"\'/static/kindeditor/plugins/\'\"\n                                            :uploadJson=\"sysurl+\'api/uploadFile\'\"\n                                            :loadStyleMode=\"false\"\n                                            @update-content=\"onEditorChange\"\n                                            :allowFileManager=\"false\"\n                                            :allowImageRemote=\"false\"\n                                    ></editor>\n                                </div>\n                                <!--文本域-->\n                                <el-input :autosize=\"{ minRows: 10, maxRows: 4}\" v-else-if=\"item.inputType==\'7\'\"\n                                          type=\"textarea\"\n                                          :rows=\"2\"\n                                          :placeholder=\"item.pageComment\"\n                                          v-model=\"saveForm[item.fieldName]\"><template slot=\"prepend\">{{item.pageComment}}</template>\n                                </el-input>\n                                <!--上传图片-->\n                                <el-upload v-else-if=\"item.inputType==\'8\'\"\n                                           class=\"avatar-uploader\"\n                                           :action=\"imgUrl\"\n                                           list-type=\"picture-card\"\n                                           :show-file-list=\"false\"\n                                           :data=\"item\"\n                                           :on-success=\"handleAvatarSuccess\"\n                                           :before-upload=\"beforeAvatarUpload\" :on-preview=\"handlePictureCardPreview\">\n                                    <img  style=\"width:100%;height:100%;\" v-if=\"saveForm[item.fieldName]\" :src=\"saveForm[item.fieldName]\" class=\"avatar\">\n                                    <i v-else class=\"el-icon-plus avatar-uploader-icon\"></i>\n                                </el-upload>\n                                <!--多图片上传-->\n                                <el-upload v-else-if=\"item.inputType==\'9\'\" :action=\"imgUrl\"  :on-remove=\"handleRemove\" :data=\"item\" list-type=\"picture-card\" :file-list=\"saveForm[item.fieldName]\"  :on-success=\"handleAvatarSuccess\" :before-upload=\"beforeAvatarUpload\"  :on-preview=\"handlePictureCardPreview\">\n                                    <i class=\"el-icon-plus\"></i><template slot=\"prepend\">{{item.pageComment}}</template>\n                                </el-upload>\n                                <el-input v-model=\"saveForm[item.fieldName]\" :placeholder=\"item.pageComment\" v-else></el-input>\n                            </el-form-item>\n                        </el-form>\n                        <el-dialog :visible.sync=\"prewImgLoad\" :modal=\"false\">\n                            <img width=\"100%\" :src=\"prewImg\" alt=\"\">\n                        </el-dialog>\n                        <span  class=\"dialog-footer\" style=\"display: flex;justify-content:center;width:100%;\">\n                          <el-button @click=\"visible = true\" >返回</el-button>\n                            <el-button type=\"primary\" @click=\"dataFormSubmit()\">确定</el-button>\n                        </span>\n                    </el-tab-pane>\n                    <el-tab-pane label=\"配置管理\"  name=\"second\"  key=\"second\">配置管理</el-tab-pane>\n                    <el-tab-pane label=\"角色管理\"  name=\"third\"  key=\"third\">角色管理</el-tab-pane>\n                    <el-tab-pane label=\"定时任务补偿\" name=\"fourth\" key=\"fourth\">定时任务补偿</el-tab-pane>\n                </el-tabs>\n\n            </div>\n        </div>\n    </div>\n</template>\n\n<script>\n    import seek from \'@/components/generator/seek.vue\'\n    import API from \'@/api\'\n    export default {\n        components: {\n            seek,\n        },\n        data () {\n            return {\n                activeName: \'save\',\n                visible:true,\n                model: \'${moduleName}\',\n                pathUrl: \'${pathUrl}\',\n                busConfig: this.busConfig,\n                tableFieldMap: this.tableFieldMap,\n                sysurl: window.SITE_CONFIG.baseUrl,\n                dataForm: {},\n                sortData: {\n                    order: null,\n                    sidx: null\n                },\n                dataList: [],\n                pageIndex: 1,\n                pageSize: 20,\n                totalPage: 0,\n                dataListLoading: false,\n                addOrUpdateVisible: false,\n                dataListSelections: [],\n                // 操作按钮\n                operation: [\n                    // {\'scope\': \'delete\', fun: this.hideTableField, name: \'显示所有字段\'}\n                ],\n                saveForm: {\n          #foreach($column in $columns)\n            #if($column.fieldName== $pk.fieldName)\n              ${column.attrname}: 0,\n            #else\n              ${column.attrname}: \'\'#if($velocityCount != $columns.size()),#end\n\n            #end\n          #end\n              },\n              config: {\n                  initialFrameWidth: null,\n                  initialFrameHeight: 350\n              },\n              prewImgLoad: false,\n              prewImg: null,\n            #[[  imgUrl: API.sysoss.upload(this.$cookie.get(\'token\')),]]#\n              dataRule: {}\n            }\n        },\n        activated () {\n            this.getDataList()\n        },\n        methods: {\n            handleClick(tab, event) {\n                console.log(tab, event);\n            },\n            sort (value) {\n                this.sortData.sidx = value.prop\n                this.sortData.order = value.order === \'descending\' ? \'desc\' : \'asc\'\n                this.getDataList()\n            },\n            setListSelections (val) {\n                this.dataListSelections = val\n            },\n            getDataList () {\n                this.dataListLoading = true\n                var params = {\n                    page: this.pageIndex,\n                    limit: this.pageSize,\n                    sidx: this.sortData.sidx,\n                    order: this.sortData.order\n                }\n                for (var key in this.dataForm) {\n                    if (this.dataForm[key]) {\n                        if (this.dataForm[key] instanceof Array) {\n                            params[key] = JSON.stringify(this.dataForm[key])\n                        } else {\n                            params[key] = this.dataForm[key]\n                        }\n                    }\n                }\n                API[this.pathUrl].list(params).then(({data}) => {\n                    if (data && data.code === 0) {\n                        this.dataList = data.data.list\n                        this.totalPage = data.data.totalCount\n                        if (data.data.totalPage < this.pageIndex && data.data.totalPage !== 0) {\n                            this.pageIndex = 1\n                            this.getDataList()\n                        }\n                    } else {\n                        this.dataList = []\n                        this.totalPage = 0\n                    }\n                    this.dataListLoading = false\n                })\n            },\n            // 每页数\n            sizeChangeHandle (val) {\n                this.pageSize = val\n                this.pageIndex = 1\n                this.getDataList()\n            },\n            // 当前页\n            currentChangeHandle (val) {\n                this.pageIndex = val\n                this.getDataList()\n            },\n            // 多选\n            selectionChangeHandle (val) {\n                this.dataListSelections = val\n            },\n            // 删除\n            deleteHandle (id) {\n                var ids = id ? [id] : this.dataListSelections.map(item => {\n                    return item.id\n                })\n                #[[        this.$confirm(`确定对[id=${ids.join(\',\')}]进行[${id ? \'删除\' : \'批量删除\'}]操作?`, \'提示\', {]]#\n                    confirmButtonText: \'确定\',\n                    cancelButtonText: \'取消\',\n                    type: \'warning\'\n                }).then(() => {\n                    API[this.pathUrl].del(ids).then(({data}) => {\n                        if (data && data.code === 0) {\n                            #[[             this.$message({]]#\n                                message: \'操作成功\',\n                                type: \'success\',\n                                duration: 1500,\n                                onClose: () => {\n                                    this.getDataList()\n                                }\n                            })\n                        } else {\n                            #[[     this.$message.error(data.msg)]]#\n                        }\n                    })\n                })\n            },\n            onEditorChange: function (text, fielName) {\n                this.saveForm[fielName] = text\n            },\n            // 多图片上传删除事件\n            handleRemove (file, fileList) {\n                this.saveForm[file.name] = fileList\n            },\n            // 预览多图片事件\n            handlePictureCardPreview: function (file) {\n                this.prewImgLoad = true\n                this.prewImg = file.url\n            },\n            // 添加多图片上传事件\n            handleAvatarSuccess: function (res, file) {\n                console.log(this.saveForm[res.fieldName] instanceof Array)\n                if (this.saveForm[res.fieldName] instanceof Array) {\n                    this.saveForm[res.fieldName].push({urd: 888, name: res.fieldName, url: res.url})\n                } else {\n                    this.saveForm[res.fieldName] = res.url\n                }\n            },\n            // 图片上传格式验证\n            beforeAvatarUpload (file) {\n                const isJPG = file.type === \'image/jpeg\'\n                const isLt2M = file.size / 1024 / 1024 < 2\n                return true\n            },\n            // 新增 / 修改\n            addOrUpdateHandle (id) {\n                #[[         this.$nextTick(() => {]]#\n                    this.visible=false;\n                    this.init(id)\n                })\n            },\n            // 初始化方法\n            init: function (id) {\n                this.saveForm.id = id || 0\n                for (var i = 0; i < this.tableFieldMap[this.pathUrl].columns.length; i++) {\n                    var cou = this.tableFieldMap[this.pathUrl].columns[i]\n                    if (cou.isNull === \'1\') {\n                        this.dataRule[cou.fieldName] = [\n                            { required: true, message: cou.pageComment + \'不能为空\', trigger: \'blur\' }\n                        ]\n                    }\n                }\n                #[[  this.$nextTick(() => {]]#\n                    #[[    this.$refs[\'saveForm\'].resetFields()]]#\n                    if (id) {\n                        API[this.pathUrl].info(id).then(({data}) => {\n                            if (data && data.code === 0) {\n                                for (var i = 0; i < this.tableFieldMap[this.pathUrl].columns.length; i++) {\n                                    var cou = this.tableFieldMap[this.pathUrl].columns[i]\n                                    // 多选框兼容\n                                    if (cou.inputType === \'5\') {\n                                        if (!data.data[cou.fieldName]) {\n                                            this.saveForm[cou.fieldName] = []\n                                        } else {\n                                            console.log(data.data[cou.fieldName])\n                                            var arr = null\n                                            try {\n                                                arr = JSON.parse(data.data[cou.fieldName])\n                                            } catch (e) {\n                                                arr = data.data[cou.fieldName]\n                                            }\n                                            if (arr instanceof Array) {\n                                                this.saveForm[cou.fieldName] = arr\n                                            } else {\n                                                arr += \'\'\n                                                this.saveForm[cou.fieldName] = [arr]\n                                            }\n                                        }\n                                    }\n                                    // 多图像上传兼容\n                                    else if (cou.inputType === \'9\') {\n                                        if (!data.data[cou.fieldName]) {\n                                            this.saveForm[cou.fieldName] = []\n                                        } else {\n                                            var arrayImg = null\n                                            try {\n                                                arrayImg = JSON.parse(data.data[cou.fieldName])\n                                            } catch (e) {\n                                                arrayImg = data.data[cou.fieldName]\n                                            }\n                                            if (arrayImg instanceof Array) {\n                                                this.saveForm[cou.fieldName] = arrayImg\n                                            } else {\n                                                this.saveForm[cou.fieldName] = [{uid: 999, name: cou.fieldName, url: arrayImg}]\n                                            }\n                                        }\n                                    } else {\n                                        this.saveForm[cou.fieldName] = data.data[cou.fieldName]\n                                    }\n                                }\n                            }\n                        })\n                    }\n                })\n            },\n            // 表单提交\n            dataFormSubmit () {\n                #[[         this.$refs[\'saveForm\'].validate((valid) => {  ]]#\n            if (valid) {\n            var params = {}\n            Object.assign(params, this.saveForm)\n            console.log(params)\n           #[[ var tick = !this.saveForm.id ? API[this.pathUrl].add(params) : API[this.pathUrl].update(params) ]]#\n            tick.then(({data}) => {\n            if (data && data.code === 0) {\n                #[[  this.$message({ ]]#\n            message: \'操作成功\',\n            type: \'success\',\n            duration: 1500,\n            onClose: () => {\n            this.visible = true\n                    #[[    this.$emit(\'refreshDataList\') ]]#\n            }\n            })\n            } else {\n                #[[   this.$message.error(data.msg) ]]#\n            }\n            })\n            }\n            })\n            }\n        }\n    }\n</script>\n<style>\n    #save .el-tabs__header{\n        top:100px;\n        margin-bottom: 100px;\n    }\n    #pane-${pathUrl} .el-card {\n        margin-top: 50px;\n    }\n</style>\n', 'vue灵活的表格模板', 'src/views/$[moduleName]/$[className.toLowerCase()]/tab.vue', 'elementui/tab.html.vm', '1', '12', '2018-07-02 14:55:32', '12', '2018-07-02 17:59:03', '0', '1');
INSERT INTO `generator_template` VALUES ('20', '<template>\n    <div class=\"mod-config\">\n        <el-form :inline=\"true\" :model=\"dataForm\" @keyup.enter.native=\"getDataList()\">\n            <el-form-item>\n                <el-input v-model=\"dataForm.key\" placeholder=\"参数名\" clearable></el-input>\n            </el-form-item>\n            <el-form-item>\n                <el-button @click=\"getDataList()\">查询</el-button>\n                <el-button v-if=\"isAuth(\'${moduleName}:${pathName}:save\')\" type=\"primary\" @click=\"addOrUpdateHandle()\">新增</el-button>\n                <el-button v-if=\"isAuth(\'${moduleName}:${pathName}:delete\')\" type=\"danger\" @click=\"deleteHandle()\" :disabled=\"dataListSelections.length <= 0\">批量删除</el-button>\n            </el-form-item>\n        </el-form>\n        <el-table\n                :data=\"dataList\"\n                border\n                v-loading=\"dataListLoading\"\n                @selection-change=\"selectionChangeHandle\"\n                style=\"width: 100%;\">\n            <el-table-column\n                    type=\"selection\"\n                    header-align=\"center\"\n                    align=\"center\"\n                    width=\"50\">\n            </el-table-column>\n            #foreach($column in $columns)\n                <el-table-column\n                        prop=\"${column.attrname}\"\n                        header-align=\"center\"\n                        align=\"center\"\n                        label=\"${column.comment}\">\n                </el-table-column>\n            #end\n            <el-table-column\n                    fixed=\"right\"\n                    header-align=\"center\"\n                    align=\"center\"\n                    width=\"150\"\n                    label=\"操作\">\n                <template slot-scope=\"scope\">\n                    <el-button type=\"text\" size=\"small\" @click=\"addOrUpdateHandle(scope.row.${pk.attrname})\">修改</el-button>\n                    <el-button type=\"text\" size=\"small\" @click=\"deleteHandle(scope.row.${pk.attrname})\">删除</el-button>\n                </template>\n            </el-table-column>\n        </el-table>\n        <el-pagination\n                @size-change=\"sizeChangeHandle\"\n                @current-change=\"currentChangeHandle\"\n                :current-page=\"pageIndex\"\n                :page-sizes=\"[10, 20, 50, 100]\"\n                :page-size=\"pageSize\"\n                :total=\"totalPage\"\n                layout=\"total, sizes, prev, pager, next, jumper\">\n        </el-pagination>\n        <!-- 弹窗, 新增 / 修改 -->\n        <add-or-update v-if=\"addOrUpdateVisible\" ref=\"addOrUpdate\" @refreshDataList=\"getDataList\"></add-or-update>\n    </div>\n</template>\n\n<script>\n    import API from \'@/api\'\n    import AddOrUpdate from \'./add-or-update\'\n    export default {\n        data () {\n            return {\n                dataForm: {\n                    key: \'\'\n                },\n                dataList: [],\n                pageIndex: 1,\n                pageSize: 10,\n                totalPage: 0,\n                dataListLoading: false,\n                dataListSelections: [],\n                addOrUpdateVisible: false\n            }\n        },\n        components: {\n            AddOrUpdate\n        },\n        activated () {\n            this.getDataList()\n        },\n        methods: {\n            // 获取数据列表\n            getDataList () {\n                this.dataListLoading = true\n                var params = {\n                    page: this.pageIndex,\n                    limit: this.pageSize,\n                    key: this.dataForm.key\n                }\n                API.${pathName}.list(params).then(({data}) => {\n                     if (data && data.code === 0) {\n            this.dataList = data.data.list\n            this.totalPage = data.data.totalCount\n            if (data.data.totalPage < this.pageIndex && data.data.totalPage !== 0) {\n              this.pageIndex = 1\n              this.getDataList()\n            }\n          } else {\n            this.dataList = []\n            this.totalPage = 0\n          }\n          this.dataListLoading = false\n                    this.dataListLoading = false\n                })\n            },\n            // 每页数\n            sizeChangeHandle (val) {\n                this.pageSize = val\n                this.pageIndex = 1\n                this.getDataList()\n            },\n            // 当前页\n            currentChangeHandle (val) {\n                this.pageIndex = val\n                this.getDataList()\n            },\n            // 多选\n            selectionChangeHandle (val) {\n                this.dataListSelections = val\n            },\n            // 新增 / 修改\n            addOrUpdateHandle (id) {\n                this.addOrUpdateVisible = true\n                this.$nextTick(() => {\n                    this.$refs.addOrUpdate.init(id)\n                })\n            },\n            // 删除\n            deleteHandle (id) {\n                var ids = id ? [id] : this.dataListSelections.map(item => {\n                    return item.${pk.attrname}\n                })\n                #[[this.$confirm(`确定对[id=${ids.join(\',\')}]进行[${id ? \'删除\' : \'批量删除\'}]操作?`, \'提示\', {]]#\n                        confirmButtonText: \'确定\',\n                        cancelButtonText: \'取消\',\n                        type: \'warning\'\n            }).then(() => {\n                    API.${pathName}.del(ids).then(({data}) => {\n                        if (data && data.code === 0) {\n                            this.$message({\n                                message: \'操作成功\',\n                                type: \'success\',\n                                duration: 1500,\n                                onClose: () => {\n                                    this.getDataList()\n                                }\n                            })\n                        } else {\n                            #[[this.$message.error(data.msg)]]#\n                        }\n                    })\n                })\n            }\n        }\n    }\n</script>\n', '普通模板', 'src/views/$[moduleName]/$[className.toLowerCase()]/index1.vue ', 'elementui/index1.html.vm', '1', '1', '2018-07-12 23:25:17', '1', '2018-07-12 23:45:18', '0', '1');
INSERT INTO `generator_template` VALUES ('21', '<template>\n    <el-dialog\n            :title=\"!dataForm.id ? \'新增\' : \'修改\'\"\n            :close-on-click-modal=\"false\"\n            :visible.sync=\"visible\">\n        <el-form :model=\"dataForm\" :rules=\"dataRule\" ref=\"dataForm\" @keyup.enter.native=\"dataFormSubmit()\" label-width=\"80px\">\n            #foreach($column in $columns)\n                #if($column.fieldName != $pk.fieldName)\n                    <el-form-item label=\"${column.comment}\" prop=\"${column.attrname}\">\n##                        #if($column.list.size() >0)\n##                            <el-select v-model=\"dataForm.${column.attrname}\" placeholder=\"请选择\" style=\"width:100%;\">\n##                                <el-option\n##                                        v-for=\"item in busConfig.${column.selectKey}.list\"\n##                                        :key=\"item.confName\"\n##                                        :label=\"item.confName\"\n##                                        :value=\"item.confVue\">\n##                                </el-option>\n##                            </el-select>\n##                        #else\n                            #if($column.attrType == \"Date\")\n                                <el-date-picker v-model=\"dataForm.${column.attrname}\"  placeholder=\"${column.comment}\" type=\"date\" style=\"width:100%;\"></el-date-picker>\n                            #else\n                                <el-input v-model=\"dataForm.${column.attrname}\" placeholder=\"${column.comment}\"></el-input>\n                            #end\n##                        #end\n\n                    </el-form-item>\n                #end\n            #end\n        </el-form>\n        <span slot=\"footer\" class=\"dialog-footer\">\n      <el-button @click=\"visible = false\">取消</el-button>\n      <el-button type=\"primary\" @click=\"dataFormSubmit()\">确定</el-button>\n    </span>\n    </el-dialog>\n</template>\n\n<script>\n    import API from \'@/api\'\n    export default {\n        data () {\n            return {\n                busConfig: this.busConfig,\n                sysurl: window.SITE_CONFIG.baseUrl,\n                visible: false,\n                dataForm: {\n            #foreach($column in $columns)\n                #if($column.fieldName == $pk.fieldName)\n                    ${column.attrname}: 0,\n                #else\n                    ${column.attrname}: \'\'#if($velocityCount != $columns.size()),#end\n\n                #end\n            #end\n        },\n            dataRule: {\n                #foreach($column in $columns)\n                    #if($column.fieldName != $pk.fieldName)\n                        ${column.attrname}: [\n                        { required: true, message: \'${column.comment}不能为空\', trigger: \'blur\' }\n                    ]#if($velocityCount != $columns.size()),#end\n\n                    #end\n                #end\n            }\n        }\n        },\n        methods: {\n            init (id) {\n                this.dataForm.${pk.attrname} = id || 0\n                this.visible = true\n                this.$nextTick(() => {\n                    this.$refs[\'dataForm\'].resetFields()\n                    if (this.dataForm.${pk.attrname}) {\n                        API.${pathName}.info(this.dataForm.${pk.attrname}).then(({data}) => {\n                            if (data && data.code === 0) {\n                                #foreach($column in $columns)\n                                    #if($column.fieldName != $pk.fieldName)\n                                        this.dataForm.${column.attrname} = data.data.${column.attrname}\n                                    #end\n                                #end\n                            }\n                        })\n                    }\n                })\n            },\n            // 表单提交\n            dataFormSubmit () {\n                #[[this.$refs[\'dataForm\'].validate((valid) => {]]#\n                        if (valid) {\n                    var params = {\n                    #foreach($column in $columns)\n                    #if($column.fieldName == $pk.fieldName)\n                    \'${column.attrname}\': this.dataForm.${column.attrname} || undefined,\n                            #else\n                    \'${column.attrname}\': this.dataForm.${column.attrname}#if($velocityCount != $columns.size()),#end\n\n                    #end\n                    #end\n                }\n                    var tick = !this.dataForm.${pk.attrname} ? API.${pathName}.add(params) : API.${pathName}.update(params)\n                    tick.then(({data}) => {\n                        if (data && data.code === 0) {\n                            #[[this.$message({]]#\n                                    message: \'操作成功\',\n                                    type: \'success\',\n                                    duration: 1500,\n                                    onClose: () => {\n                                this.visible = false\n                                #[[this.$emit(\'refreshDataList\')]]#\n                            }\n                        })\n                        } else {\n                            #[[this.$message.error(data.msg)]]#\n                        }\n                    })\n                }\n                })\n            }\n        }\n    }\n</script>', '表单', 'src/views/$[moduleName]/$[className.toLowerCase()]/info.vue', 'elementui\\info.vue.vm', '1', '1', '2018-07-13 10:18:35', '1', '2018-07-13 10:41:57', '0', '6');

-- ----------------------------
-- Table structure for generator_template_config
-- ----------------------------
DROP TABLE IF EXISTS `generator_template_config`;
CREATE TABLE `generator_template_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `model_key` varchar(64) NOT NULL COMMENT '模板key',
  `model_val` varchar(64) NOT NULL COMMENT '模板val',
  `version_no` int(5) NOT NULL COMMENT '版本号',
  `create_by` bigint(20) NOT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '修改人id',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) NOT NULL COMMENT '状态@0-显示,1-隐藏,2-删除',
  `sort` int(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `model_key` (`model_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='模板系统参数';

-- ----------------------------
-- Records of generator_template_config
-- ----------------------------
INSERT INTO `generator_template_config` VALUES ('1', 'mainPath', 'com.szt', '1', '1', '2018-05-27 22:39:28', '12', '2018-07-02 17:59:37', '0', '1');
INSERT INTO `generator_template_config` VALUES ('2', 'package', 'com.szt.modules', '1', '1', '2018-05-27 00:00:00', '1', '2018-05-27 23:17:24', '0', '1');
INSERT INTO `generator_template_config` VALUES ('3', 'moduleName', 'ivs', '1', '1', '2018-05-27 00:00:00', '1', '2018-07-07 14:22:35', '0', '1');
INSERT INTO `generator_template_config` VALUES ('4', 'author', 'liao', '1', '1', '2018-05-27 00:00:00', '1', '2018-05-27 23:19:25', '0', '1');
INSERT INTO `generator_template_config` VALUES ('5', 'tinyint', 'Integer', '1', '1', '2018-05-27 22:41:23', '1', '2018-05-27 22:41:23', '0', '1');
INSERT INTO `generator_template_config` VALUES ('6', 'smallint', 'Integer', '1', '1', '2018-05-27 22:41:36', '1', '2018-05-27 22:41:36', '0', '1');
INSERT INTO `generator_template_config` VALUES ('7', 'mediumint', 'Integer', '1', '1', '2018-05-27 22:41:52', '1', '2018-05-27 22:41:52', '0', '1');
INSERT INTO `generator_template_config` VALUES ('8', 'int', 'Integer', '1', '1', '2018-05-27 22:42:05', '1', '2018-05-27 22:42:05', '0', '1');
INSERT INTO `generator_template_config` VALUES ('9', 'integer', 'Integer', '1', '1', '2018-05-27 22:42:21', '1', '2018-05-27 22:42:21', '0', '1');
INSERT INTO `generator_template_config` VALUES ('10', 'bigint', 'Long', '1', '1', '2018-05-27 00:00:00', '1', '2018-05-28 01:00:28', '0', '1');
INSERT INTO `generator_template_config` VALUES ('11', 'float', 'Float', '1', '1', '2018-05-27 22:42:50', '1', '2018-05-27 22:42:50', '0', '1');
INSERT INTO `generator_template_config` VALUES ('12', 'double', 'Double', '1', '1', '2018-05-27 22:43:03', '1', '2018-05-27 22:43:03', '0', '1');
INSERT INTO `generator_template_config` VALUES ('13', 'decimal', 'BigDecimal', '1', '1', '2018-05-27 22:43:19', '1', '2018-05-27 22:43:19', '0', '1');
INSERT INTO `generator_template_config` VALUES ('14', 'bit', 'Boolean', '1', '1', '2018-05-27 22:43:31', '1', '2018-05-27 22:43:31', '0', '1');
INSERT INTO `generator_template_config` VALUES ('15', 'char', 'String', '1', '1', '2018-05-27 22:43:45', '1', '2018-05-27 22:43:45', '0', '1');
INSERT INTO `generator_template_config` VALUES ('16', 'varchar', 'String', '1', '1', '2018-05-27 22:43:57', '1', '2018-05-27 22:43:57', '0', '1');
INSERT INTO `generator_template_config` VALUES ('17', 'tinytext', 'String', '1', '1', '2018-05-27 22:44:09', '1', '2018-05-27 22:44:09', '0', '1');
INSERT INTO `generator_template_config` VALUES ('18', 'text', 'String', '1', '1', '2018-05-27 22:44:22', '1', '2018-05-27 22:44:22', '0', '1');
INSERT INTO `generator_template_config` VALUES ('19', 'mediumtext', 'String', '1', '1', '2018-05-27 22:44:40', '1', '2018-05-27 22:44:40', '0', '1');
INSERT INTO `generator_template_config` VALUES ('20', 'longtext', 'String', '1', '1', '2018-05-27 22:44:52', '1', '2018-05-27 22:44:52', '0', '1');
INSERT INTO `generator_template_config` VALUES ('21', 'date', 'Date', '1', '1', '2018-05-27 22:45:04', '1', '2018-05-27 22:45:04', '0', '1');
INSERT INTO `generator_template_config` VALUES ('22', 'datetime', 'Date', '1', '1', '2018-05-27 22:45:17', '1', '2018-05-27 22:45:17', '0', '1');
INSERT INTO `generator_template_config` VALUES ('23', 'timestamp', 'Date', '1', '1', '2018-05-27 22:45:30', '1', '2018-05-27 22:45:30', '0', '1');
INSERT INTO `generator_template_config` VALUES ('25', 'tablePrefix', '_tb', '1', '1', '2018-05-27 23:12:36', '1', '2018-05-27 23:12:36', '0', '1');
INSERT INTO `generator_template_config` VALUES ('27', 'email', '1171964050@qq.com', '1', '1', '2018-05-27 23:18:51', '1', '2018-05-27 23:18:51', '0', '1');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'MACHENI-SRIS8DD1534603543150', '1534605064060', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` varchar(6) NOT NULL COMMENT '任务状态@0-正常,1-暂停',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `version_no` int(5) NOT NULL COMMENT '版本号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) NOT NULL COMMENT '逻辑删除@0-存在,1-隐藏,2-删除,3-停用',
  `sort` int(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='定时任务管理';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态@0-成功,1-失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `version_no` int(5) NOT NULL COMMENT '版本号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) NOT NULL COMMENT '逻辑删除@0-存在,1-隐藏,2-删除,3-停用',
  `sort` int(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2446 DEFAULT CHARSET=utf8 COMMENT='定时任务日志管理';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `data_key` varchar(50) DEFAULT NULL COMMENT '外部key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` varchar(6) NOT NULL DEFAULT '1' COMMENT '状态@0-隐藏,1-显示',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `version_no` int(5) NOT NULL COMMENT '版本号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) NOT NULL COMMENT '逻辑删除@0-存在,1-隐藏,2-删除,3-停用',
  `sort` int(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_key` (`data_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统字典管理';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"type\":1,\"qiniuDomain\":\"http://p1kqsiha2.bkt.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuAccessKey\":\"upLFKoItxvsAC8ZXqLX1pmcqlcVvkaItx2tD8jOG\",\"qiniuSecretKey\":\"xqRMucFx-HEIBVhA3l08Ik9vgoZqnjBek__y-HSw\",\"qiniuBucketName\":\"test\",\"aliyunDomain\":\"\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"\",\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qcloudBucketName\":\"\"}', '1', '1', '1', '1', '2018-06-15 00:45:57', '1', '2018-06-15 00:45:38', '0', '1');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` text COMMENT '请求方法',
  `params` text COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `version_no` int(5) NOT NULL COMMENT '版本号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) NOT NULL COMMENT '逻辑删除@0-存在,1-隐藏,2-删除,3-停用',
  `sort` int(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7464 DEFAULT CHARSET=utf8 COMMENT='系统日志管理';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `version_no` int(5) DEFAULT NULL COMMENT '版本号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) DEFAULT NULL COMMENT '逻辑删除@0-存在,1-隐藏,2-删除,3-停用',
  `sort` int(6) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'modules/sys/user.html', null, '1', 'fa fa-user', '1', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '2', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '3', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('32', '1', '代码生成器', null, null, '0', 'fa fa-file-code-o', '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('33', '32', '代码生成', 'modules/generator/generator.html', null, '1', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('64', '32', '模板系统参数', 'modules/generator/generatortemplateconfig.html', null, '1', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('65', '64', '查看', null, 'generator:generatortemplateconfig:list,generator:generatortemplateconfig:info', '2', null, '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('66', '64', '新增', null, 'generator:generatortemplateconfig:save', '2', null, '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('67', '64', '修改', null, 'generator:generatortemplateconfig:update', '2', null, '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('68', '64', '删除', null, 'generator:generatortemplateconfig:delete', '2', null, '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('69', '32', '模块管理', 'modules/generator/generatormodules.html', null, '1', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('70', '69', '查看', null, 'generator:generatormodules:list,generator:generatormodules:info', '2', null, '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('71', '69', '新增', null, 'generator:generatormodules:save', '2', null, '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('72', '69', '修改', null, 'generator:generatormodules:update', '2', null, '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('73', '69', '删除', null, 'generator:generatormodules:delete', '2', null, '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('74', '32', '模板配置', 'modules/generator/generatortemplate.html', null, '1', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('75', '74', '查看', null, 'generator:generatortemplate:list,generator:generatortemplate:info', '2', null, '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('76', '74', '新增', null, 'generator:generatortemplate:save', '2', null, '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('77', '74', '修改', null, 'generator:generatortemplate:update', '2', null, '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('78', '74', '删除', null, 'generator:generatortemplate:delete', '2', null, '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('79', '32', '数据库表管理', 'modules/generator/generatortable.html', null, '1', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('80', '79', '查看', null, 'generator:generatortable:list,generator:generatortable:info', '2', null, '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('81', '79', '新增', null, 'generator:generatortable:save', '2', null, '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('82', '79', '修改', null, 'generator:generatortable:update', '2', null, '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('83', '79', '删除', null, 'generator:generatortable:delete', '2', null, '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('95', '79', '模板预览', null, 'generator:generatortable:preview,generator:generatortemplate:queryGeneratorTemplateList', '2', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('228', '261', '定时任务管理', 'modules/job/schedulejob.html', null, '1', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('229', '228', '查看', null, 'job:schedulejob:list,job:schedulejob:info', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('230', '228', '新增', null, 'job:schedulejob:save', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('231', '228', '修改', null, 'job:schedulejob:update', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('232', '228', '删除', null, 'job:schedulejob:delete', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('233', '261', '定时任务日志管理', 'modules/job/schedulejoblog.html', null, '1', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('234', '233', '查看', null, 'job:schedulejoblog:list,job:schedulejoblog:info', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('235', '233', '新增', null, 'job:schedulejoblog:save', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('236', '233', '修改', null, 'job:schedulejoblog:update', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('237', '233', '删除', null, 'job:schedulejoblog:delete', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('238', '228', '立即执行', null, 'job:schedulejob:run', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('239', '228', '暂停任务', null, 'job:schedulejob:pause', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('240', '228', '恢复定时任务', null, 'job:schedulejob:resume', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('246', '1', '系统日志管理', 'modules/sys/syslog.html', null, '1', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('247', '246', '查看', null, 'sys:syslog:list,sys:syslog:info', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('248', '246', '新增', null, 'sys:syslog:save', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('249', '246', '修改', null, 'sys:syslog:update', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('250', '246', '删除', null, 'sys:syslog:delete', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('251', '1', '系统字典管理', 'modules/sys/sysconfig.html', null, '1', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('252', '251', '查看', null, 'sys:sysconfig:list,sys:sysconfig:info', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('253', '251', '新增', null, 'sys:sysconfig:save', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('254', '251', '修改', null, 'sys:sysconfig:update', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('255', '251', '删除', null, 'sys:sysconfig:delete', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('256', '32', '自动生成参数管理', 'modules/generator/generatorbusconfig.html', null, '1', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('257', '256', '查看', null, 'generator:generatorbusconfig:list,generator:generatorbusconfig:info', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('258', '256', '新增', null, 'generator:generatorbusconfig:save', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('259', '256', '修改', null, 'generator:generatorbusconfig:update', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('260', '256', '删除', null, 'generator:generatorbusconfig:delete', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('261', '1', '定时任务', null, null, '0', 'fa fa-file-code-o', '2', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('272', '1', '上传图片管理', 'modules/oss/sysoss.html', null, '1', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('273', '272', '查看', null, 'oss:sysoss:list,oss:sysoss:info', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('274', '272', '新增', null, 'oss:sysoss:save', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('275', '272', '修改', null, 'oss:sysoss:update', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('276', '272', '删除', null, 'oss:sysoss:delete', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('277', '272', '修改环境', null, 'oss:sysoss:config', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('278', '272', '保存云存储配置信息', null, 'oss:sysoss:saveconfig', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('279', '1', '字段管理', 'modules/generator/generatortablefield.html', null, '1', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('280', '279', '查看', null, 'generator:generatortablefield:list,generator:generatortablefield:info', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('281', '279', '新增', null, 'generator:generatortablefield:save', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('282', '279', '修改', null, 'generator:generatortablefield:update', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('283', '279', '删除', null, 'generator:generatortablefield:delete', '2', 'fa fa-file-code-o', '6', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `version_no` int(5) NOT NULL COMMENT '版本号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) NOT NULL COMMENT '逻辑删除@0-存在,1-隐藏,2-删除,3-停用',
  `sort` int(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8 COMMENT='上传图片管理';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
INSERT INTO `sys_oss` VALUES ('116', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180619/b86f726a345e40f2b3d0243f0d79d903.png?imageslim', null, '1', null, '2018-06-19 22:28:37', null, '2018-06-19 23:22:29', '0', '1');
INSERT INTO `sys_oss` VALUES ('117', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180619/3ad726597c7b4636b8a4d672b50508b5.png?imageslim', null, '1', null, '2018-06-19 22:28:42', null, '2018-06-19 22:28:42', '0', '1');
INSERT INTO `sys_oss` VALUES ('118', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180619/85dfb62f14af4c64a2d738d852245326.png?imageslim', null, '1', null, '2018-06-19 23:17:54', null, '2018-06-19 23:17:54', '0', '0');
INSERT INTO `sys_oss` VALUES ('119', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180619/ef2a7047409e4701832076c8afc3e2f5.png?imageslim', null, '1', null, '2018-06-19 23:19:00', null, '2018-06-19 23:19:00', '0', '0');
INSERT INTO `sys_oss` VALUES ('120', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180619/bb9d8c75bc5143bf86c187b3ea0a4a95.png?imageslim', null, '1', null, '2018-06-19 23:21:42', null, '2018-06-19 23:21:42', '0', '0');
INSERT INTO `sys_oss` VALUES ('121', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180619/976f6d5e3b8d464ca2fccaae0462c7c0.png?imageslim', null, '1', null, '2018-06-19 23:21:57', null, '2018-06-19 23:21:57', '0', '0');
INSERT INTO `sys_oss` VALUES ('122', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180619/05906aab3a694994bfd1c0913e9125c8.png?imageslim', null, '1', null, '2018-06-19 23:22:04', null, '2018-06-19 23:22:04', '0', '0');
INSERT INTO `sys_oss` VALUES ('123', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180619/b86f726a345e40f2b3d0243f0d79d903.png?imageslim', null, '1', null, '2018-06-19 23:22:24', null, '2018-06-19 23:22:24', '0', '0');
INSERT INTO `sys_oss` VALUES ('124', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180620/29c93182811b473590cbb299f0dea90a.png', null, '1', null, '2018-06-20 05:28:01', null, '2018-06-20 05:28:01', '0', '0');
INSERT INTO `sys_oss` VALUES ('125', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180620/277981def59c4730b4a05cc0e52775e4.png', null, '1', null, '2018-06-20 11:08:11', null, '2018-06-20 11:08:11', '0', '0');
INSERT INTO `sys_oss` VALUES ('126', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180621/8c9e1bc649104024b4c6f1cddc86a752.png?imageslim', null, '1', null, '2018-06-21 21:25:37', null, '2018-06-21 21:25:37', '0', '0');
INSERT INTO `sys_oss` VALUES ('127', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180621/f6f32482e68d4c38babebd7081407550.png?imageslim', null, '1', null, '2018-06-21 21:25:55', null, '2018-06-21 21:25:55', '0', '0');
INSERT INTO `sys_oss` VALUES ('128', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180621/b7811fb6d37146e29ef5b324998c03d6.png?imageslim', null, '1', null, '2018-06-21 21:27:02', null, '2018-06-21 21:27:02', '0', '0');
INSERT INTO `sys_oss` VALUES ('129', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180621/ea1fe15d017a431a9aad2e70e1cd55ac.png?imageslim', null, '1', null, '2018-06-21 21:44:56', null, '2018-06-21 21:44:56', '0', '0');
INSERT INTO `sys_oss` VALUES ('130', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180621/ed481cf292de49659faafcb1a5e4a534.png?imageslim', null, '1', null, '2018-06-21 21:44:57', null, '2018-06-21 21:44:57', '0', '0');
INSERT INTO `sys_oss` VALUES ('131', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180621/59ae94911d4c4bd4924e18a267a0a8fd.png?imageslim', null, '1', null, '2018-06-21 21:45:00', null, '2018-06-21 21:45:00', '0', '0');
INSERT INTO `sys_oss` VALUES ('132', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180621/f6f41ba24dfe402baf23e02959afaa11.png?imageslim', null, '1', null, '2018-06-21 21:45:03', null, '2018-06-21 21:45:03', '0', '0');
INSERT INTO `sys_oss` VALUES ('133', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180621/2da4907c26f14c03a1a375a3c7b119f2.png?imageslim', null, '1', null, '2018-06-21 21:45:06', null, '2018-06-21 21:45:06', '0', '0');
INSERT INTO `sys_oss` VALUES ('134', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180621/3465a80e418a4f8dbf4520876ca02314.png?imageslim', null, '1', null, '2018-06-21 21:45:08', null, '2018-06-21 21:45:08', '0', '0');
INSERT INTO `sys_oss` VALUES ('135', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180621/4bbd0f4601b541a1b9d85813753f4a30.png?imageslim', null, '1', null, '2018-06-21 21:45:09', null, '2018-06-21 21:45:09', '0', '0');
INSERT INTO `sys_oss` VALUES ('136', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180621/db129a335d634001b8d77ac3a41f71d1.png?imageslim', null, '1', null, '2018-06-21 21:56:02', null, '2018-06-21 21:56:02', '0', '0');
INSERT INTO `sys_oss` VALUES ('137', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180621/d7d20c45eb5641eab4c3b24a79e87c5d.png?imageslim', null, '1', null, '2018-06-21 21:56:53', null, '2018-06-21 21:56:53', '0', '0');
INSERT INTO `sys_oss` VALUES ('138', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180621/7c4d5777a2494de08d358eeaa8c9892e.png?imageslim', null, '1', null, '2018-06-21 21:56:55', null, '2018-06-21 21:56:55', '0', '0');
INSERT INTO `sys_oss` VALUES ('139', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180622/55ad0581c3d445d6bcffa6947e27a07a.png?imageslim', null, '1', null, '2018-06-22 11:53:04', null, '2018-06-22 11:53:04', '0', '0');
INSERT INTO `sys_oss` VALUES ('140', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180622/3e24992683c24c6ab0c20b547e147905.png?imageslim', null, '1', null, '2018-06-22 12:32:28', null, '2018-06-22 12:32:28', '0', '0');
INSERT INTO `sys_oss` VALUES ('141', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180622/5a3cbebdc1754a8f87f388509968df67.png?imageslim', null, '1', null, '2018-06-22 13:22:07', null, '2018-06-22 13:22:07', '0', '0');
INSERT INTO `sys_oss` VALUES ('142', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180622/7628900a73cd4c0688fccb575ffee27a.png?imageslim', null, '1', null, '2018-06-22 13:22:23', null, '2018-06-22 13:22:23', '0', '0');
INSERT INTO `sys_oss` VALUES ('143', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180622/4a69b18242064049bd465a3cd8c6ace7.png?imageslim', null, '1', null, '2018-06-22 13:23:50', null, '2018-06-22 13:23:50', '0', '0');
INSERT INTO `sys_oss` VALUES ('144', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180622/22e02f6581ee4699a77635826e46b79d.png?imageslim', null, '1', null, '2018-06-22 14:52:13', null, '2018-06-22 14:52:13', '0', '0');
INSERT INTO `sys_oss` VALUES ('145', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180622/2da0743165f447aeb01e3201968b9f8d.png?imageslim', null, '1', null, '2018-06-22 14:52:23', null, '2018-06-22 14:52:23', '0', '0');
INSERT INTO `sys_oss` VALUES ('146', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180622/e58abc87165d4b33a92d9bf98291b2ce.png?imageslim', null, '1', null, '2018-06-22 14:52:50', null, '2018-06-22 14:52:50', '0', '0');
INSERT INTO `sys_oss` VALUES ('147', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180622/c00fa6be265c42eb9236c0e143f3d71d.png?imageslim', null, '1', null, '2018-06-22 14:54:29', null, '2018-06-22 14:54:29', '0', '0');
INSERT INTO `sys_oss` VALUES ('148', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180622/cad6cc46575e4871b9abcb0577e5a337.png?imageslim', null, '1', null, '2018-06-22 14:57:23', null, '2018-06-22 14:57:23', '0', '0');
INSERT INTO `sys_oss` VALUES ('149', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180623/708ad7b00085464cb725d02c5a47af7c.jpg?imageslim', null, '1', null, '2018-06-23 17:20:53', null, '2018-06-23 17:20:53', '0', '0');
INSERT INTO `sys_oss` VALUES ('150', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180625/0725ba5edcb548749a74b160259e8cd4.png?imageslim', null, '1', null, '2018-06-25 22:17:31', null, '2018-06-25 22:17:31', '0', '0');
INSERT INTO `sys_oss` VALUES ('151', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180626/98a93ab556bb48e4b97bacddcce4f63c.png?imageslim', null, '1', null, '2018-06-26 02:00:26', null, '2018-06-26 02:00:26', '0', '0');
INSERT INTO `sys_oss` VALUES ('154', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180704/ce598959cc6c4b2c8af71e3d1a16adf7.jpg?imageslim', null, '1', null, '2018-07-04 16:37:29', null, '2018-07-04 16:37:29', '0', '0');
INSERT INTO `sys_oss` VALUES ('155', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180704/81e162791c6e4b30836b6d4a30f5e254.jpg?imageslim', null, '1', null, '2018-07-04 21:21:28', null, '2018-07-04 21:21:28', '0', '0');
INSERT INTO `sys_oss` VALUES ('156', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180705/309cab07dba34d62ab5c73561fe137d1.jpg?imageslim', null, '1', null, '2018-07-05 14:37:16', null, '2018-07-05 14:37:16', '0', '0');
INSERT INTO `sys_oss` VALUES ('157', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180705/d6163ce106c6429e9f91f90b6a63ca15.jpg?imageslim', null, '1', null, '2018-07-05 14:41:31', null, '2018-07-05 14:41:31', '0', '0');
INSERT INTO `sys_oss` VALUES ('158', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180705/ac5d55846f77440c8b54c66cb925a287.jpg?imageslim', null, '1', null, '2018-07-05 15:29:44', null, '2018-07-05 15:29:44', '0', '0');
INSERT INTO `sys_oss` VALUES ('159', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180705/28bf2ef1bd854c31a975e89321df3c40.jpg?imageslim', null, '1', null, '2018-07-05 15:31:46', null, '2018-07-05 15:31:46', '0', '0');
INSERT INTO `sys_oss` VALUES ('160', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180707/46c4d4e2770c499fa3fd74d0bec685f0.jpg?imageslim', null, '1', null, '2018-07-07 18:00:54', null, '2018-07-07 18:00:54', '0', '0');
INSERT INTO `sys_oss` VALUES ('161', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/6645e34a8f5d4b948727e4c4b79ea562.jpg?imageslim', null, '1', null, '2018-07-11 13:57:43', null, '2018-07-11 13:57:43', '0', '0');
INSERT INTO `sys_oss` VALUES ('162', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/a420334ec9314f548b9e28a34eb469d0.jpg?imageslim', null, '1', null, '2018-07-11 13:58:27', null, '2018-07-11 13:58:27', '0', '0');
INSERT INTO `sys_oss` VALUES ('163', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/1f9a1075795c4f8b93f2ac31dc80a0e2.exe?imageslim', null, '1', null, '2018-07-11 13:58:32', null, '2018-07-11 13:58:32', '0', '0');
INSERT INTO `sys_oss` VALUES ('164', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/cb6ea4523fe34368840fea3432f6d422.jpg?imageslim', null, '1', null, '2018-07-11 13:58:42', null, '2018-07-11 13:58:42', '0', '0');
INSERT INTO `sys_oss` VALUES ('165', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/8b27354f336b4c33b51406d3c697008f.jpg?imageslim', null, '1', null, '2018-07-11 14:00:49', null, '2018-07-11 14:00:49', '0', '0');
INSERT INTO `sys_oss` VALUES ('166', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/7055c3a3f2a14ca897d501403c5c8342.jpg?imageslim', null, '1', null, '2018-07-11 14:04:24', null, '2018-07-11 14:04:24', '0', '0');
INSERT INTO `sys_oss` VALUES ('167', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/2b490d83aad5435791add1dcb346e3d5.jpg?imageslim', null, '1', null, '2018-07-11 14:10:36', null, '2018-07-11 14:10:36', '0', '0');
INSERT INTO `sys_oss` VALUES ('168', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/10ae93e43b0e445a89a810512c1a0a99.jpg?imageslim', null, '1', null, '2018-07-11 14:17:07', null, '2018-07-11 14:17:07', '0', '0');
INSERT INTO `sys_oss` VALUES ('169', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/f348176c118a4078bb6bffba441bc034.jpg?imageslim', null, '1', null, '2018-07-11 14:18:47', null, '2018-07-11 14:18:47', '0', '0');
INSERT INTO `sys_oss` VALUES ('170', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/79082c43667048769a03f1854fb4b5b8.jpg?imageslim', null, '1', null, '2018-07-11 14:21:44', null, '2018-07-11 14:21:44', '0', '0');
INSERT INTO `sys_oss` VALUES ('171', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/11836f2260994cad9d24d231795da2ad.jpg?imageslim', null, '1', null, '2018-07-11 14:23:15', null, '2018-07-11 14:23:15', '0', '0');
INSERT INTO `sys_oss` VALUES ('172', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/4744d021943142649b70cdcba98b8e34.jpg?imageslim', null, '1', null, '2018-07-11 14:23:19', null, '2018-07-11 14:23:19', '0', '0');
INSERT INTO `sys_oss` VALUES ('173', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/c4793a82eefa46728a2c78bcb19d549e.jpg?imageslim', null, '1', null, '2018-07-11 14:23:26', null, '2018-07-11 14:23:26', '0', '0');
INSERT INTO `sys_oss` VALUES ('174', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/06fd7ecc849345be81991d71ec59f61e.jpg?imageslim', null, '1', null, '2018-07-11 14:23:43', null, '2018-07-11 14:23:43', '0', '0');
INSERT INTO `sys_oss` VALUES ('175', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/b64d24f54a86403e9001e9aa9e89944e.jpg?imageslim', null, '1', null, '2018-07-11 14:24:00', null, '2018-07-11 14:24:00', '0', '0');
INSERT INTO `sys_oss` VALUES ('176', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/d9d980a68cdb449ca7f68ec4973425bf.jpg?imageslim', null, '1', null, '2018-07-11 14:24:40', null, '2018-07-11 14:24:40', '0', '0');
INSERT INTO `sys_oss` VALUES ('179', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/3c61ffa5ff774f27a46e2a3d6d50f039.jpg?imageslim', null, '1', null, '2018-07-11 14:25:25', null, '2018-07-11 14:25:25', '0', '0');
INSERT INTO `sys_oss` VALUES ('180', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/79d9be844d144a52816acd055b6b8a7e.jpg?imageslim', null, '1', null, '2018-07-11 14:25:41', null, '2018-07-11 14:25:41', '0', '0');
INSERT INTO `sys_oss` VALUES ('181', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/42657efa72404e93b55f902f69216ac2.jpg?imageslim', null, '1', null, '2018-07-11 14:25:46', null, '2018-07-11 14:25:46', '0', '0');
INSERT INTO `sys_oss` VALUES ('182', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/cbe4dbd927d641dda96fcdde070d0474.jpg?imageslim', null, '1', null, '2018-07-11 14:25:58', null, '2018-07-11 14:25:58', '0', '0');
INSERT INTO `sys_oss` VALUES ('183', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/854c894b57664bd0b150c111a6c58961.jpg?imageslim', null, '1', null, '2018-07-11 14:26:10', null, '2018-07-11 14:26:10', '0', '0');
INSERT INTO `sys_oss` VALUES ('184', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/e9662109be1e443886eec7683505fadd.jpg?imageslim', null, '1', null, '2018-07-11 14:26:19', null, '2018-07-11 14:26:19', '0', '0');
INSERT INTO `sys_oss` VALUES ('185', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/b84408c396044175830505a60fdbff44.jpg?imageslim', null, '1', null, '2018-07-11 14:26:32', null, '2018-07-11 14:26:32', '0', '0');
INSERT INTO `sys_oss` VALUES ('187', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/8e55c4be277e4e4797f950745d32f95f.jpg?imageslim', null, '1', null, '2018-07-11 14:28:04', null, '2018-07-11 14:28:04', '0', '0');
INSERT INTO `sys_oss` VALUES ('188', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/786b8f12d2404cbaaa40fbe176fb61bc.jpg?imageslim', null, '1', null, '2018-07-11 14:30:49', null, '2018-07-11 14:30:49', '0', '0');
INSERT INTO `sys_oss` VALUES ('189', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/32669256bba2490c9a288852638d636c.jpg?imageslim', null, '1', null, '2018-07-11 14:35:29', null, '2018-07-11 14:35:29', '0', '0');
INSERT INTO `sys_oss` VALUES ('190', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/e5613c667c384592bd37de13a4023ff8.jpg?imageslim', null, '1', null, '2018-07-11 14:45:29', null, '2018-07-11 14:45:29', '0', '0');
INSERT INTO `sys_oss` VALUES ('191', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/8851b2fceac34e948a75bc991d7e8ae7.jpg?imageslim', null, '1', null, '2018-07-11 14:47:12', null, '2018-07-11 14:47:12', '0', '0');
INSERT INTO `sys_oss` VALUES ('192', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/53efdff1001646839405d6ef8b298acb.jpg?imageslim', null, '1', null, '2018-07-11 14:52:27', null, '2018-07-11 14:52:27', '0', '0');
INSERT INTO `sys_oss` VALUES ('193', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/04cac931a3d0409baebbe773f891851e.jpg?imageslim', null, '1', null, '2018-07-11 14:56:30', null, '2018-07-11 14:56:30', '0', '0');
INSERT INTO `sys_oss` VALUES ('194', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/057d599d94c740a3ac0ce427d300675f.jpg?imageslim', null, '1', null, '2018-07-11 15:08:43', null, '2018-07-11 15:08:43', '0', '0');
INSERT INTO `sys_oss` VALUES ('195', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/37b47ecf137144a3be0804d7708bb1e4.jpg?imageslim', null, '1', null, '2018-07-11 15:09:37', null, '2018-07-11 15:09:37', '0', '0');
INSERT INTO `sys_oss` VALUES ('196', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/807d11ef963c4472a0015daf8b087d26.jpg?imageslim', null, '1', null, '2018-07-11 15:12:35', null, '2018-07-11 15:12:35', '0', '0');
INSERT INTO `sys_oss` VALUES ('197', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/3c5d08fb98554761b762411ba57db0e7.jpg?imageslim', null, '1', null, '2018-07-11 15:13:48', null, '2018-07-11 15:13:48', '0', '0');
INSERT INTO `sys_oss` VALUES ('198', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/b3f660a1cb89494188a334224fb18e1f.jpg?imageslim', null, '1', null, '2018-07-11 15:13:54', null, '2018-07-11 15:13:54', '0', '0');
INSERT INTO `sys_oss` VALUES ('199', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/89fbe42c110c4c1e80f14e3568692879.jpg?imageslim', null, '1', null, '2018-07-11 15:24:08', null, '2018-07-11 15:24:08', '0', '0');
INSERT INTO `sys_oss` VALUES ('200', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/78dbcf30392e40e8879a10176f427be4.jpg?imageslim', null, '1', null, '2018-07-11 15:34:34', null, '2018-07-11 15:34:34', '0', '0');
INSERT INTO `sys_oss` VALUES ('201', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/975c0816214a41e9bfe02ac824206586.jpg?imageslim', null, '1', null, '2018-07-11 15:34:50', null, '2018-07-11 15:34:50', '0', '0');
INSERT INTO `sys_oss` VALUES ('202', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/048dc9c8133145249c1ad987be29fd3e.jpg?imageslim', null, '1', null, '2018-07-11 15:39:57', null, '2018-07-11 15:39:57', '0', '0');
INSERT INTO `sys_oss` VALUES ('203', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/99ed88f5f7224d51a065829cca94cdaa.jpg?imageslim', null, '1', null, '2018-07-11 15:48:09', null, '2018-07-11 15:48:09', '0', '0');
INSERT INTO `sys_oss` VALUES ('204', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/93ff5c5557ac4be097dd4b3f75f3dee5.jpg?imageslim', null, '1', null, '2018-07-11 15:48:19', null, '2018-07-11 15:48:19', '0', '0');
INSERT INTO `sys_oss` VALUES ('205', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/464abb3167b84ae49470c0d8b85795e5.jpg?imageslim', null, '1', null, '2018-07-11 16:28:34', null, '2018-07-11 16:28:34', '0', '0');
INSERT INTO `sys_oss` VALUES ('206', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/936c5bf53db84fe5bcc01431e9c90848.jpg?imageslim', null, '1', null, '2018-07-11 16:38:08', null, '2018-07-11 16:38:08', '0', '0');
INSERT INTO `sys_oss` VALUES ('207', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/437752b52c9141e4b43cee32ca3f62f2.jpg?imageslim', null, '1', null, '2018-07-11 16:56:04', null, '2018-07-11 16:56:04', '0', '0');
INSERT INTO `sys_oss` VALUES ('208', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/b1f7a1c2a83349709cb8fe6faa35423c.jpg?imageslim', null, '1', null, '2018-07-11 17:04:28', null, '2018-07-11 17:04:28', '0', '0');
INSERT INTO `sys_oss` VALUES ('209', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/1c8bbaef56404352949efb2c13a450bc.png?imageslim', null, '1', null, '2018-07-11 17:06:09', null, '2018-07-11 17:06:09', '0', '0');
INSERT INTO `sys_oss` VALUES ('210', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/9c4c39573728481bada9b6ef49da62dc.png?imageslim', null, '1', null, '2018-07-11 17:07:29', null, '2018-07-11 17:07:29', '0', '0');
INSERT INTO `sys_oss` VALUES ('211', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/fff4775bc88c4ada9d7c706c6237d5e3.png?imageslim', null, '1', null, '2018-07-11 17:08:22', null, '2018-07-11 17:08:22', '0', '0');
INSERT INTO `sys_oss` VALUES ('212', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/5e881d0d82294eaf8f3b850f9d244261.jpg?imageslim', null, '1', null, '2018-07-11 17:08:38', null, '2018-07-11 17:08:38', '0', '0');
INSERT INTO `sys_oss` VALUES ('213', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/390452ee048e4e8b8426d0c13711d387.jpg?imageslim', null, '1', null, '2018-07-11 17:10:55', null, '2018-07-11 17:10:55', '0', '0');
INSERT INTO `sys_oss` VALUES ('214', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/5634a8b584894747bb1d98cd981b3600.jpg?imageslim', null, '1', null, '2018-07-11 17:11:36', null, '2018-07-11 17:11:36', '0', '0');
INSERT INTO `sys_oss` VALUES ('215', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/0baba50cfb8e4a20aaa832cd22c31573.jpg?imageslim', null, '1', null, '2018-07-11 17:13:17', null, '2018-07-11 17:13:17', '0', '0');
INSERT INTO `sys_oss` VALUES ('216', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/d7d144fb54cb464598a66c64ed864796.jpg?imageslim', null, '1', null, '2018-07-11 17:14:30', null, '2018-07-11 17:14:30', '0', '0');
INSERT INTO `sys_oss` VALUES ('217', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/16a4b534fc55460795d944c3b69b15d8.jpg?imageslim', null, '1', null, '2018-07-11 17:16:04', null, '2018-07-11 17:16:04', '0', '0');
INSERT INTO `sys_oss` VALUES ('218', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/442c390e0bee4e46a6ce786e85f59e30.jpg?imageslim', null, '1', null, '2018-07-11 17:16:59', null, '2018-07-11 17:16:59', '0', '0');
INSERT INTO `sys_oss` VALUES ('219', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/f73c97edb3154176bbac20b2c689c64d.jpg?imageslim', null, '1', null, '2018-07-11 17:18:02', null, '2018-07-11 17:18:02', '0', '0');
INSERT INTO `sys_oss` VALUES ('220', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/c9e6263cfb654ae3bcc83d552afcb45d.png?imageslim', null, '1', null, '2018-07-11 17:20:53', null, '2018-07-11 17:20:53', '0', '0');
INSERT INTO `sys_oss` VALUES ('221', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/f4e759a8d3dc46ba967aa5446875693a.png?imageslim', null, '1', null, '2018-07-11 17:22:43', null, '2018-07-11 17:22:43', '0', '0');
INSERT INTO `sys_oss` VALUES ('222', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/71ac5ec4f96a44e5afa64753530e400c.png?imageslim', null, '1', null, '2018-07-11 17:23:32', null, '2018-07-11 17:23:32', '0', '0');
INSERT INTO `sys_oss` VALUES ('223', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/e6ea7257cf294a819a376c8be6dda09e.png?imageslim', null, '1', null, '2018-07-11 17:24:31', null, '2018-07-11 17:24:31', '0', '0');
INSERT INTO `sys_oss` VALUES ('224', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/0776784d9f894284919495c735f9cbfa.png?imageslim', null, '1', null, '2018-07-11 17:25:35', null, '2018-07-11 17:25:35', '0', '0');
INSERT INTO `sys_oss` VALUES ('225', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/603da9d98231422aba98508639be953e.png?imageslim', null, '1', null, '2018-07-11 17:26:52', null, '2018-07-11 17:26:52', '0', '0');
INSERT INTO `sys_oss` VALUES ('226', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/d2593c41c00746d780d8ad2cac11300f.png?imageslim', null, '1', null, '2018-07-11 17:27:22', null, '2018-07-11 17:27:22', '0', '0');
INSERT INTO `sys_oss` VALUES ('227', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/89a6c0f7fcd1465aa57bdf12faad1da4.jpg?imageslim', null, '1', null, '2018-07-11 17:28:47', null, '2018-07-11 17:28:47', '0', '0');
INSERT INTO `sys_oss` VALUES ('228', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/34aa51534102443585f946fa316a57b0.jpg?imageslim', null, '1', null, '2018-07-11 17:33:13', null, '2018-07-11 17:33:13', '0', '0');
INSERT INTO `sys_oss` VALUES ('229', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/e2297724f1c04fe285acbe6d0f7b958e.jpg?imageslim', null, '1', null, '2018-07-11 17:41:46', null, '2018-07-11 17:41:46', '0', '0');
INSERT INTO `sys_oss` VALUES ('230', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180711/86d9e6f063494cb491a27770680642bb.jpg?imageslim', null, '1', null, '2018-07-11 17:59:09', null, '2018-07-11 17:59:09', '0', '0');
INSERT INTO `sys_oss` VALUES ('231', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/d8c489378fbf45e5b114f170ad9239d1.jpg?imageslim', null, '1', null, '2018-07-12 09:33:06', null, '2018-07-12 09:33:06', '0', '0');
INSERT INTO `sys_oss` VALUES ('232', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/c5da5edce16240d1bb70c0e97b1caafc.jpg?imageslim', null, '1', null, '2018-07-12 09:33:20', null, '2018-07-12 09:33:20', '0', '0');
INSERT INTO `sys_oss` VALUES ('233', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/fa940dc215444e1389c789bef712ccc1.jpg?imageslim', null, '1', null, '2018-07-12 09:34:24', null, '2018-07-12 09:34:24', '0', '0');
INSERT INTO `sys_oss` VALUES ('234', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/d3b86c300458464e9a01d090240aa78f.jpg?imageslim', null, '1', null, '2018-07-12 09:35:28', null, '2018-07-12 09:35:28', '0', '0');
INSERT INTO `sys_oss` VALUES ('235', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/8a3c7990d1f04ab8907f9d3f7d974582.jpg?imageslim', null, '1', null, '2018-07-12 09:35:53', null, '2018-07-12 09:35:53', '0', '0');
INSERT INTO `sys_oss` VALUES ('236', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/8f729c351a6642ae8790e5a7bd4693af.jpg?imageslim', null, '1', null, '2018-07-12 09:44:11', null, '2018-07-12 09:44:11', '0', '0');
INSERT INTO `sys_oss` VALUES ('237', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/bc063a7114f848098566e993e3ebc015.jpg?imageslim', null, '1', null, '2018-07-12 14:55:46', null, '2018-07-12 14:55:46', '0', '0');
INSERT INTO `sys_oss` VALUES ('238', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/f1a1af93d25d4c3b8562ac9225f007b4.jpg?imageslim', null, '1', null, '2018-07-12 15:03:01', null, '2018-07-12 15:03:01', '0', '0');
INSERT INTO `sys_oss` VALUES ('239', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/43a6a7bbc98541758c4cba89a311856b.jpg?imageslim', null, '1', null, '2018-07-12 15:04:32', null, '2018-07-12 15:04:32', '0', '0');
INSERT INTO `sys_oss` VALUES ('240', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/a35c1f3c18a44816a66b6184778d147b.jpg?imageslim', null, '1', null, '2018-07-12 15:04:43', null, '2018-07-12 15:04:43', '0', '0');
INSERT INTO `sys_oss` VALUES ('241', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/9f468acf8c8d4546bb6ef0150d8e918a.jpg?imageslim', null, '1', null, '2018-07-12 15:32:51', null, '2018-07-12 15:32:51', '0', '0');
INSERT INTO `sys_oss` VALUES ('242', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/7bb781fcbed84d71b9d801a0f2db8066.jpg?imageslim', null, '1', null, '2018-07-12 15:38:41', null, '2018-07-12 15:38:41', '0', '0');
INSERT INTO `sys_oss` VALUES ('243', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/33f6ef11e8294555aa02260a2bf0db33.jpg?imageslim', null, '1', null, '2018-07-12 16:09:05', null, '2018-07-12 16:09:05', '0', '0');
INSERT INTO `sys_oss` VALUES ('244', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/831964064c0c47c2af6cf4595a97f3da.jpg?imageslim', null, '1', null, '2018-07-12 16:13:05', null, '2018-07-12 16:13:05', '0', '0');
INSERT INTO `sys_oss` VALUES ('245', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/18d35acf9cd746809ce4f3ba724486c3.jpg?imageslim', null, '1', null, '2018-07-12 16:23:57', null, '2018-07-12 16:23:57', '0', '0');
INSERT INTO `sys_oss` VALUES ('246', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/5e2731d0516947be851922f53d8b0e91.jpg?imageslim', null, '1', null, '2018-07-12 16:25:39', null, '2018-07-12 16:25:39', '0', '0');
INSERT INTO `sys_oss` VALUES ('247', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/29db37e157544675aab9daa4afee4008.jpg?imageslim', null, '1', null, '2018-07-12 16:26:15', null, '2018-07-12 16:26:15', '0', '0');
INSERT INTO `sys_oss` VALUES ('248', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/9bfc30ca63ac4e82a22be37737b7863e.jpg?imageslim', null, '1', null, '2018-07-12 16:26:29', null, '2018-07-12 16:26:29', '0', '0');
INSERT INTO `sys_oss` VALUES ('249', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/c6418e79b15540b894525f007082b97b.jpg?imageslim', null, '1', null, '2018-07-12 16:28:12', null, '2018-07-12 16:28:12', '0', '0');
INSERT INTO `sys_oss` VALUES ('250', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/9a5c9ab5c8694792bacd17a813baf752.jpg?imageslim', null, '1', null, '2018-07-12 16:32:31', null, '2018-07-12 16:32:31', '0', '0');
INSERT INTO `sys_oss` VALUES ('251', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/9e4772600e2142409cb1569f480ee9bf.exe?imageslim', null, '1', null, '2018-07-12 16:33:48', null, '2018-07-12 16:33:48', '0', '0');
INSERT INTO `sys_oss` VALUES ('252', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/cda9f06f1c3b4e908e710e2eb1d434dc.jpg?imageslim', null, '1', null, '2018-07-12 16:52:15', null, '2018-07-12 16:52:15', '0', '0');
INSERT INTO `sys_oss` VALUES ('253', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/32a5ae2bd1e44540911783001284e860.jpg?imageslim', null, '1', null, '2018-07-12 16:53:49', null, '2018-07-12 16:53:49', '0', '0');
INSERT INTO `sys_oss` VALUES ('254', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/324e275c2ba54c72b1a0d33301bcb9a4.jpg?imageslim', null, '1', null, '2018-07-12 16:57:40', null, '2018-07-12 16:57:40', '0', '0');
INSERT INTO `sys_oss` VALUES ('255', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/3ebc17ddd0f44245a25dfbae125217d5.jpg?imageslim', null, '1', null, '2018-07-12 16:59:31', null, '2018-07-12 16:59:31', '0', '0');
INSERT INTO `sys_oss` VALUES ('256', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/f3d1c416281b44e1987ea02ed08ab39f.jpg?imageslim', null, '1', null, '2018-07-12 17:12:18', null, '2018-07-12 17:12:18', '0', '0');
INSERT INTO `sys_oss` VALUES ('257', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/9a1c3ffdf39b4728a6f465d315c59814.jpg?imageslim', null, '1', null, '2018-07-12 17:13:36', null, '2018-07-12 17:13:36', '0', '0');
INSERT INTO `sys_oss` VALUES ('258', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/afd1edd540774b1a8fb8968666231004.jpg?imageslim', null, '1', null, '2018-07-12 17:15:06', null, '2018-07-12 17:15:06', '0', '0');
INSERT INTO `sys_oss` VALUES ('259', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/1d82729e863d49e8b762388474eedf49.jpg?imageslim', null, '1', null, '2018-07-12 17:15:08', null, '2018-07-12 17:15:08', '0', '0');
INSERT INTO `sys_oss` VALUES ('260', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/5f35e74d073d41e693ef043638eadf51.jpg?imageslim', null, '1', null, '2018-07-12 17:22:11', null, '2018-07-12 17:22:11', '0', '0');
INSERT INTO `sys_oss` VALUES ('261', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/1dc4c80bc6bb4bcfadd11643ad55b710.jpg?imageslim', null, '1', null, '2018-07-12 17:22:25', null, '2018-07-12 17:22:25', '0', '0');
INSERT INTO `sys_oss` VALUES ('262', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/a8123af9e4d841a18d59084c83a50252.jpg?imageslim', null, '1', null, '2018-07-12 17:31:57', null, '2018-07-12 17:31:57', '0', '0');
INSERT INTO `sys_oss` VALUES ('263', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/c0858c2540a542f2a797081a1c45ee1b.jpg?imageslim', null, '1', null, '2018-07-12 17:33:44', null, '2018-07-12 17:33:44', '0', '0');
INSERT INTO `sys_oss` VALUES ('264', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/7dbb32c095744d979b41162666351bd9.jpg?imageslim', null, '1', null, '2018-07-12 17:34:40', null, '2018-07-12 17:34:40', '0', '0');
INSERT INTO `sys_oss` VALUES ('265', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/09210858b7214992b87626bd26618bb2.jpg?imageslim', null, '1', null, '2018-07-12 17:35:07', null, '2018-07-12 17:35:07', '0', '0');
INSERT INTO `sys_oss` VALUES ('266', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/1bdf0fca1b724a7a84a57110856580b8.jpg?imageslim', null, '1', null, '2018-07-12 17:35:33', null, '2018-07-12 17:35:33', '0', '0');
INSERT INTO `sys_oss` VALUES ('267', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/575bd53fa2474e2da9079121f79ebd90.jpg?imageslim', null, '1', null, '2018-07-12 17:35:40', null, '2018-07-12 17:35:40', '0', '0');
INSERT INTO `sys_oss` VALUES ('268', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/b6218057725347af84a4e4208aea50ad.jpg?imageslim', null, '1', null, '2018-07-12 17:46:40', null, '2018-07-12 17:46:40', '0', '0');
INSERT INTO `sys_oss` VALUES ('269', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/90c3a7b5bd554ab6a3bec1b26d3aa6d3.jpg?imageslim', null, '1', null, '2018-07-12 20:26:08', null, '2018-07-12 20:26:08', '0', '0');
INSERT INTO `sys_oss` VALUES ('270', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180712/c9253e57cf094a318fb46543e9c16700.jpg?imageslim', null, '1', null, '2018-07-12 21:03:16', null, '2018-07-12 21:03:16', '0', '0');
INSERT INTO `sys_oss` VALUES ('271', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180713/06f3e288601d40649764b97ee0d2899b.jpg?imageslim', null, '1', null, '2018-07-13 16:12:29', null, '2018-07-13 16:12:29', '0', '0');
INSERT INTO `sys_oss` VALUES ('272', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180713/31dd045538044f60b52def5f1d1527e5.jpg?imageslim', null, '1', null, '2018-07-13 16:13:55', null, '2018-07-13 16:13:55', '0', '0');
INSERT INTO `sys_oss` VALUES ('273', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180713/3530dedaac184b1794eb137a190155e4.jpg?imageslim', null, '1', null, '2018-07-13 16:18:14', null, '2018-07-13 16:18:14', '0', '0');
INSERT INTO `sys_oss` VALUES ('274', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180713/fa23a758747f4b6a895112e010e276de.jpg?imageslim', null, '1', null, '2018-07-13 16:20:01', null, '2018-07-13 16:20:01', '0', '0');
INSERT INTO `sys_oss` VALUES ('275', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180713/c3dc7f3bad904bce80ce151b920856f0.jpg?imageslim', null, '1', null, '2018-07-13 16:20:01', null, '2018-07-13 16:20:01', '0', '0');
INSERT INTO `sys_oss` VALUES ('276', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180713/01be51c92f394af2a566d0a0a3184af7.jpg?imageslim', null, '1', null, '2018-07-13 16:20:07', null, '2018-07-13 16:20:07', '0', '0');
INSERT INTO `sys_oss` VALUES ('277', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180713/a018a9424a3d4b8682b4535a56cd6af6.jpg?imageslim', null, '1', null, '2018-07-13 17:14:28', null, '2018-07-13 17:14:28', '0', '0');
INSERT INTO `sys_oss` VALUES ('278', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180713/8924df3f3d484a139417f1d30cc468d1.jpg?imageslim', null, '1', null, '2018-07-13 20:58:25', null, '2018-07-13 20:58:25', '0', '0');
INSERT INTO `sys_oss` VALUES ('279', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180714/3bd6c273cc504111910ecb8eac577b43.jpg?imageslim', null, '1', null, '2018-07-14 10:30:07', null, '2018-07-14 10:30:07', '0', '0');
INSERT INTO `sys_oss` VALUES ('280', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180714/45cf4e03154c490c965a755497c00821.jpg?imageslim', null, '1', null, '2018-07-14 15:40:17', null, '2018-07-14 15:40:17', '0', '0');
INSERT INTO `sys_oss` VALUES ('281', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180714/98c79486788f479581a932f4248f51f2.jpg?imageslim', null, '1', null, '2018-07-14 15:49:56', null, '2018-07-14 15:49:56', '0', '0');
INSERT INTO `sys_oss` VALUES ('282', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180714/52c5b529f1a348928af2e317887b9dd0.jpg?imageslim', null, '1', null, '2018-07-14 15:51:23', null, '2018-07-14 15:51:23', '0', '0');
INSERT INTO `sys_oss` VALUES ('283', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180714/636ef97c99ac4335b4fb9fec5260f922.jpg?imageslim', null, '1', null, '2018-07-14 16:05:06', null, '2018-07-14 16:05:06', '0', '0');
INSERT INTO `sys_oss` VALUES ('284', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180714/b9b4943c6295452ab0463d60d3c71737.jpg?imageslim', null, '1', null, '2018-07-14 16:06:53', null, '2018-07-14 16:06:53', '0', '0');
INSERT INTO `sys_oss` VALUES ('285', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180716/68bb14b2dcdd4a64955eebafdf59fb48.jpg?imageslim', null, '1', null, '2018-07-16 11:23:29', null, '2018-07-16 11:23:29', '0', '0');
INSERT INTO `sys_oss` VALUES ('286', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180716/b88ec0bdce07493683c45e7357abd58f.jpg?imageslim', null, '1', null, '2018-07-16 15:44:51', null, '2018-07-16 15:44:51', '0', '0');
INSERT INTO `sys_oss` VALUES ('287', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180716/7fde3dd8e61c42869d504fbad6b691a7.jpg?imageslim', null, '1', null, '2018-07-16 16:16:40', null, '2018-07-16 16:16:40', '0', '0');
INSERT INTO `sys_oss` VALUES ('288', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180716/4d0e0a59b3444b89b3b4bd94545d9355.jpg?imageslim', null, '1', null, '2018-07-16 16:19:07', null, '2018-07-16 16:19:07', '0', '0');
INSERT INTO `sys_oss` VALUES ('289', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180716/d2fe726445464f58bfb3244f86268704.jpg?imageslim', null, '1', null, '2018-07-16 16:20:58', null, '2018-07-16 16:20:58', '0', '0');
INSERT INTO `sys_oss` VALUES ('290', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180716/1be94bd9aef24692b1070ad3e554890e.jpg?imageslim', null, '1', null, '2018-07-16 16:23:51', null, '2018-07-16 16:23:51', '0', '0');
INSERT INTO `sys_oss` VALUES ('291', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180716/179afb3275834b6eae3109abfe1683d2.jpg?imageslim', null, '1', null, '2018-07-16 16:26:02', null, '2018-07-16 16:26:02', '0', '0');
INSERT INTO `sys_oss` VALUES ('292', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180716/e7fa9638ed5b4b339a78fa4605f4e6a3.jpg?imageslim', null, '1', null, '2018-07-16 16:40:13', null, '2018-07-16 16:40:13', '0', '0');
INSERT INTO `sys_oss` VALUES ('293', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180716/412a6837b02142a29c6826646f68ce6e.jpg?imageslim', null, '1', null, '2018-07-16 16:45:05', null, '2018-07-16 16:45:05', '0', '0');
INSERT INTO `sys_oss` VALUES ('294', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180716/ece5c04135eb41f3b0c4eae1f388cce9.jpg?imageslim', null, '1', null, '2018-07-16 17:04:56', null, '2018-07-16 17:04:56', '0', '0');
INSERT INTO `sys_oss` VALUES ('295', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180716/67d77b7c280b4bcd9ac4946003aa6ecc.jpg?imageslim', null, '1', null, '2018-07-16 17:06:33', null, '2018-07-16 17:06:33', '0', '0');
INSERT INTO `sys_oss` VALUES ('296', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180717/3a0dfd8efdb8482eba69920e407681b4.jpg?imageslim', null, '1', null, '2018-07-17 09:02:51', null, '2018-07-17 09:02:51', '0', '0');
INSERT INTO `sys_oss` VALUES ('297', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180717/03db342aaee746b88be6212a6ad5adb9.jpg?imageslim', null, '1', null, '2018-07-17 09:44:42', null, '2018-07-17 09:44:42', '0', '0');
INSERT INTO `sys_oss` VALUES ('298', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180717/1caf3ca3c0504031a479188be2b5d144.jpg?imageslim', null, '1', null, '2018-07-17 09:59:29', null, '2018-07-17 09:59:29', '0', '0');
INSERT INTO `sys_oss` VALUES ('299', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180717/95cb4cff8d3643d98d9fe499c7053c6b.jpg?imageslim', null, '1', null, '2018-07-17 10:30:05', null, '2018-07-17 10:30:05', '0', '0');
INSERT INTO `sys_oss` VALUES ('300', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180717/23b6ae5e39e34832898fc5c4efb70b78.jpg?imageslim', null, '1', null, '2018-07-17 13:45:11', null, '2018-07-17 13:45:11', '0', '0');
INSERT INTO `sys_oss` VALUES ('301', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180717/df266774040247ceb716d3b6a7d56e02.jpg?imageslim', null, '1', null, '2018-07-17 13:49:23', null, '2018-07-17 13:49:23', '0', '0');
INSERT INTO `sys_oss` VALUES ('302', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180717/922f0ee6ee3e4a01a40e10c1a341e415.jpg?imageslim', null, '1', null, '2018-07-17 15:19:54', null, '2018-07-17 15:19:54', '0', '0');
INSERT INTO `sys_oss` VALUES ('303', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180717/dde422a76802401a9999fb2faf3a5e85.war?imageslim', null, '1', null, '2018-07-17 16:26:56', null, '2018-07-17 16:26:56', '0', '0');
INSERT INTO `sys_oss` VALUES ('304', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180718/527e709a098a4411bfe1f1fcedd69343.jpg?imageslim', null, '1', null, '2018-07-18 09:18:34', null, '2018-07-18 09:18:34', '0', '0');
INSERT INTO `sys_oss` VALUES ('305', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180718/7b84558fd31b4663bf755be7e2870902.jpg?imageslim', null, '1', null, '2018-07-18 11:12:11', null, '2018-07-18 11:12:11', '0', '0');
INSERT INTO `sys_oss` VALUES ('306', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180718/12797d34f9104f6ea68104a9563ea0aa.jpg?imageslim', null, '1', null, '2018-07-18 11:36:49', null, '2018-07-18 11:36:49', '0', '0');
INSERT INTO `sys_oss` VALUES ('307', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180718/255a2136e2ae4e669648dfd1e787a4be.jpg?imageslim', null, '1', null, '2018-07-18 11:36:56', null, '2018-07-18 11:36:56', '0', '0');
INSERT INTO `sys_oss` VALUES ('308', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180718/991766c767b64c709312a2645c5000b5.png?imageslim', null, '1', null, '2018-07-18 11:37:03', null, '2018-07-18 11:37:03', '0', '0');
INSERT INTO `sys_oss` VALUES ('309', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180718/1e05b11a7d2447abb15fde9a5775ab66.png?imageslim', null, '1', null, '2018-07-18 11:37:10', null, '2018-07-18 11:37:10', '0', '0');
INSERT INTO `sys_oss` VALUES ('310', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180718/cccbd2c8764543bfb7aa20050ea8f080.jpg?imageslim', null, '1', null, '2018-07-18 11:37:12', null, '2018-07-18 11:37:12', '0', '0');
INSERT INTO `sys_oss` VALUES ('311', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180810/71bc26bb7f784686909099d954879830.jpeg?imageslim', null, '1', null, '2018-08-10 22:22:11', null, '2018-08-10 22:22:11', '0', '0');
INSERT INTO `sys_oss` VALUES ('312', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180810/fa560c640f7b49f9963a9cea9deda481.jpg?imageslim', null, '1', null, '2018-08-10 22:41:33', null, '2018-08-10 22:41:33', '0', '0');
INSERT INTO `sys_oss` VALUES ('313', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180810/f70801c8e7774e31b7727b73b9365e9f.jpeg?imageslim', null, '1', null, '2018-08-10 22:43:33', null, '2018-08-10 22:43:33', '0', '0');
INSERT INTO `sys_oss` VALUES ('314', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180810/5c63ccecbba8485e9a7feed5ef90a3e9.jpg?imageslim', null, '1', null, '2018-08-10 22:43:38', null, '2018-08-10 22:43:38', '0', '0');
INSERT INTO `sys_oss` VALUES ('315', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180810/207b70332c7947c8bca5a7b9207f3fcb.jpg?imageslim', null, '1', null, '2018-08-10 22:43:43', null, '2018-08-10 22:43:43', '0', '0');
INSERT INTO `sys_oss` VALUES ('316', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180810/e5b80a3663f249b09ff6230a05469f1b.jpg?imageslim', null, '1', null, '2018-08-10 22:43:48', null, '2018-08-10 22:43:48', '0', '0');
INSERT INTO `sys_oss` VALUES ('317', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180810/8b9cb506c1cd4ce09751b3c3870b94e7.jpeg?imageslim', null, '1', null, '2018-08-10 22:44:55', null, '2018-08-10 22:44:55', '0', '0');
INSERT INTO `sys_oss` VALUES ('318', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180810/c0fefa1f2d40417c8fbea5e9d1e97af4.jpg?imageslim', null, '1', null, '2018-08-10 22:45:00', null, '2018-08-10 22:45:00', '0', '0');
INSERT INTO `sys_oss` VALUES ('319', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180810/4c67abf91d524bdcb74e33557774f543.png?imageslim', null, '1', null, '2018-08-10 23:23:25', null, '2018-08-10 23:23:25', '0', '0');
INSERT INTO `sys_oss` VALUES ('320', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180814/7779d0551ee3452c8d7490ed7f1d129b.jpg?imageslim', null, '1', null, '2018-08-14 14:30:13', null, '2018-08-14 14:30:13', '0', '0');
INSERT INTO `sys_oss` VALUES ('321', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180815/3309bc5ae1c04735a0ec7cfc4e84da12.jpg?imageslim', null, '1', null, '2018-08-15 20:14:01', null, '2018-08-15 20:14:01', '0', '0');
INSERT INTO `sys_oss` VALUES ('322', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180815/167ed5f02b2c440eba418d9fedfc88f6.jpg?imageslim', null, '1', null, '2018-08-15 21:07:40', null, '2018-08-15 21:07:40', '0', '0');
INSERT INTO `sys_oss` VALUES ('323', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180815/5e4c92524bae4b62af1f108f4e965af6.jpg?imageslim', null, '1', null, '2018-08-15 21:07:43', null, '2018-08-15 21:07:43', '0', '0');
INSERT INTO `sys_oss` VALUES ('324', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180815/36ee9fa69a4146c8ae50a2ef7d1d6dd9.png?imageslim', null, '1', null, '2018-08-15 21:14:26', null, '2018-08-15 21:14:26', '0', '0');
INSERT INTO `sys_oss` VALUES ('325', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180816/11e4143d8b32495093ddda96f2a6522b.jpg?imageslim', null, '1', null, '2018-08-16 20:50:12', null, '2018-08-16 20:50:12', '0', '0');
INSERT INTO `sys_oss` VALUES ('326', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180816/098f1acda0564a1f9bd66a3f2d621f6c.jpg?imageslim', null, '1', null, '2018-08-16 20:50:46', null, '2018-08-16 20:50:46', '0', '0');
INSERT INTO `sys_oss` VALUES ('327', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180816/74fa16a9cb224f929f57e6f4f7cf2beb.jpg?imageslim', null, '1', null, '2018-08-16 20:58:16', null, '2018-08-16 20:58:16', '0', '0');
INSERT INTO `sys_oss` VALUES ('328', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180816/2a1a78a1c0764f349964068ce165c584.jpg?imageslim', null, '1', null, '2018-08-16 20:58:47', null, '2018-08-16 20:58:47', '0', '0');
INSERT INTO `sys_oss` VALUES ('329', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180816/0f4ba872667d486fa5b4d8414b5cf96e.jpeg?imageslim', null, '1', null, '2018-08-16 20:59:01', null, '2018-08-16 20:59:01', '0', '0');
INSERT INTO `sys_oss` VALUES ('330', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180816/9805b6dd1f6649b0ab1d3a3c5114e26a.jpg?imageslim', null, '1', null, '2018-08-16 21:24:07', null, '2018-08-16 21:24:07', '0', '0');
INSERT INTO `sys_oss` VALUES ('331', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180816/9a0b01531fbb4b7492dccb4fcae20d19.jpg?imageslim', null, '1', null, '2018-08-16 21:24:19', null, '2018-08-16 21:24:19', '0', '0');
INSERT INTO `sys_oss` VALUES ('332', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180816/0e5b10ddae974e01aadcaf13822f59ee.jpg?imageslim', null, '1', null, '2018-08-16 21:28:37', null, '2018-08-16 21:28:37', '0', '0');
INSERT INTO `sys_oss` VALUES ('333', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180816/ebd1f24e4f564ac7a8e9b98cbab02dc8.png?imageslim', null, '1', null, '2018-08-16 21:31:46', null, '2018-08-16 21:31:46', '0', '0');
INSERT INTO `sys_oss` VALUES ('334', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180816/ae08748fc1fc4f6380dba7ad06d9d734.jpg?imageslim', null, '1', null, '2018-08-16 21:33:22', null, '2018-08-16 21:33:22', '0', '0');
INSERT INTO `sys_oss` VALUES ('335', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180816/7ddfc48dba264bf8ae2f36b8dbd95c71.jpg?imageslim', null, '1', null, '2018-08-16 21:34:03', null, '2018-08-16 21:34:03', '0', '0');
INSERT INTO `sys_oss` VALUES ('336', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180816/2bb0665d92764fcbbe91ade612d69586.jpeg?imageslim', null, '1', null, '2018-08-16 21:34:12', null, '2018-08-16 21:34:12', '0', '0');
INSERT INTO `sys_oss` VALUES ('337', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180816/36548559850f4cc5900e791ce124ce8f.jpg?imageslim', null, '1', null, '2018-08-16 21:34:24', null, '2018-08-16 21:34:24', '0', '0');
INSERT INTO `sys_oss` VALUES ('338', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180816/25b0b9feec154f349772839c47525f68.jpg?imageslim', null, '1', null, '2018-08-16 21:34:28', null, '2018-08-16 21:34:28', '0', '0');
INSERT INTO `sys_oss` VALUES ('339', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180817/4b21a0e77e1b44c79707d981010d1abe.jpg?imageslim', null, '1', null, '2018-08-17 14:55:59', null, '2018-08-17 14:55:59', '0', '0');
INSERT INTO `sys_oss` VALUES ('340', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180817/ccb61659b0fa4d71913d662f6df48973.png?imageslim', null, '1', null, '2018-08-17 14:58:34', null, '2018-08-17 14:58:34', '0', '0');
INSERT INTO `sys_oss` VALUES ('341', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180817/c30949b7aedf428892e994582ab89289.jpg?imageslim', null, '1', null, '2018-08-17 15:00:30', null, '2018-08-17 15:00:30', '0', '0');
INSERT INTO `sys_oss` VALUES ('342', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180817/da9bef42cbf04f99a792853225e0a77e.jpg?imageslim', null, '1', null, '2018-08-17 15:03:16', null, '2018-08-17 15:03:16', '0', '0');
INSERT INTO `sys_oss` VALUES ('343', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180817/bb2c26b327f6486fa4b5a02951139685.png?imageslim', null, '1', null, '2018-08-17 15:07:34', null, '2018-08-17 15:07:34', '0', '0');
INSERT INTO `sys_oss` VALUES ('344', 'http://p1kqsiha2.bkt.clouddn.com/upload/20180817/45bdb8f4346149a6a5ff9d9cabdfb319.jpg?imageslim', null, '1', null, '2018-08-17 15:08:10', null, '2018-08-17 15:08:10', '0', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `version_no` int(5) NOT NULL COMMENT '版本号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) NOT NULL COMMENT '逻辑删除@0-存在,1-隐藏,2-删除,3-停用',
  `sort` int(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='角色管理';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('18', '协进地产客户', '协进地产客户', null, '1', '1', '2018-06-18 06:03:44', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role` VALUES ('19', '开发人员', '开发人员', null, '1', '1', '2018-06-18 06:27:05', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role` VALUES ('21', '协进员工', 'create_by', null, '1', '12', '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role` VALUES ('22', 'pm01', '生产模块', null, '1', '1', '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `version_no` int(5) NOT NULL COMMENT '版本号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) NOT NULL COMMENT '逻辑删除@0-存在,1-隐藏,2-删除,3-停用',
  `sort` int(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6626 DEFAULT CHARSET=utf8 COMMENT='角色与菜单关系管理';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1147', '18', '216', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1148', '18', '2', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1149', '18', '15', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1150', '18', '16', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1151', '18', '17', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1152', '18', '18', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1153', '18', '3', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1154', '18', '19', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1155', '18', '20', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1156', '18', '21', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1157', '18', '22', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1158', '18', '251', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1159', '18', '252', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1160', '18', '253', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1161', '18', '254', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1162', '18', '255', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1163', '18', '289', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1164', '18', '290', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1165', '18', '291', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1166', '18', '292', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1167', '18', '293', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1168', '18', '294', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1169', '18', '295', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1170', '18', '296', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1171', '18', '297', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1172', '18', '298', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1183', '18', '309', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1184', '18', '310', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1185', '18', '311', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1186', '18', '312', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1187', '18', '313', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1188', '18', '-666666', null, '1', null, '2018-06-22 14:05:21', null, '2018-06-22 14:05:21', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1231', '21', '216', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1232', '21', '2', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1233', '21', '15', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1234', '21', '16', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1235', '21', '17', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1236', '21', '18', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1237', '21', '3', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1238', '21', '19', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1239', '21', '20', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1240', '21', '21', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1241', '21', '22', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1242', '21', '251', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1243', '21', '252', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1244', '21', '253', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1245', '21', '254', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1246', '21', '255', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1247', '21', '289', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1248', '21', '290', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1249', '21', '291', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1250', '21', '292', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1251', '21', '293', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1252', '21', '294', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1253', '21', '295', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1254', '21', '296', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1255', '21', '297', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1256', '21', '298', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1267', '21', '309', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1268', '21', '310', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1269', '21', '311', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1270', '21', '312', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1271', '21', '313', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('1272', '21', '-666666', null, '1', null, '2018-06-22 14:10:26', null, '2018-06-22 14:10:26', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5294', '22', '1', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5295', '22', '2', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5296', '22', '15', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5297', '22', '16', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5298', '22', '17', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5299', '22', '18', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5300', '22', '3', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5301', '22', '19', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5302', '22', '20', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5303', '22', '21', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5304', '22', '22', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5305', '22', '4', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5306', '22', '23', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5307', '22', '24', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5308', '22', '25', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5309', '22', '26', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5310', '22', '5', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5311', '22', '32', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5312', '22', '33', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5313', '22', '64', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5314', '22', '65', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5315', '22', '66', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5316', '22', '67', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5317', '22', '68', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5318', '22', '69', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5319', '22', '70', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5320', '22', '71', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5321', '22', '72', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5322', '22', '73', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5323', '22', '74', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5324', '22', '75', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5325', '22', '76', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5326', '22', '77', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5327', '22', '78', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5328', '22', '79', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5329', '22', '80', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5330', '22', '81', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5331', '22', '82', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5332', '22', '83', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5333', '22', '95', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5334', '22', '89', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5335', '22', '90', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5336', '22', '91', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5337', '22', '92', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5338', '22', '93', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5339', '22', '256', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5340', '22', '257', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5341', '22', '258', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5342', '22', '259', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5343', '22', '260', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5344', '22', '246', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5345', '22', '247', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5346', '22', '248', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5347', '22', '249', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5348', '22', '250', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5349', '22', '251', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5350', '22', '252', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5351', '22', '253', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5352', '22', '254', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5353', '22', '255', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5354', '22', '261', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5355', '22', '228', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5356', '22', '229', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5357', '22', '230', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5358', '22', '231', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5359', '22', '232', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5360', '22', '238', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5361', '22', '239', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5362', '22', '240', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5363', '22', '233', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5364', '22', '234', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5365', '22', '235', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5366', '22', '236', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5367', '22', '237', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5368', '22', '272', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5369', '22', '273', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5370', '22', '274', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5371', '22', '275', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5372', '22', '276', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5373', '22', '277', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5374', '22', '278', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5375', '22', '289', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5376', '22', '290', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5377', '22', '291', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5378', '22', '292', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5379', '22', '293', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5380', '22', '314', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5381', '22', '315', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5382', '22', '316', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5383', '22', '317', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5384', '22', '318', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5385', '22', '333', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5386', '22', '334', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5387', '22', '335', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5388', '22', '336', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5389', '22', '337', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5390', '22', '404', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5391', '22', '405', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5392', '22', '406', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5393', '22', '407', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5394', '22', '408', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5395', '22', '423', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5396', '22', '424', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5397', '22', '425', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5398', '22', '426', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5399', '22', '427', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5400', '22', '474', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5401', '22', '475', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5402', '22', '476', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5403', '22', '477', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5404', '22', '478', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5405', '22', '705', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5406', '22', '706', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5407', '22', '707', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5408', '22', '708', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5409', '22', '709', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5410', '22', '710', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5411', '22', '711', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5412', '22', '712', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5413', '22', '713', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5414', '22', '714', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5415', '22', '216', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5416', '22', '338', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5417', '22', '339', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5418', '22', '340', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5419', '22', '341', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5420', '22', '342', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5422', '22', '495', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5425', '22', '498', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5426', '22', '499', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5427', '22', '515', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5428', '22', '516', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5429', '22', '517', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5430', '22', '518', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5431', '22', '519', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5432', '22', '522', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5433', '22', '523', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5434', '22', '524', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5435', '22', '525', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5436', '22', '526', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5437', '22', '529', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5438', '22', '530', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5439', '22', '531', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5440', '22', '532', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5441', '22', '533', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5442', '22', '690', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5443', '22', '540', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5444', '22', '541', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5445', '22', '542', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5446', '22', '543', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5447', '22', '544', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5448', '22', '545', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5449', '22', '546', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5450', '22', '547', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5451', '22', '548', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5452', '22', '549', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5453', '22', '550', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5454', '22', '551', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5455', '22', '552', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5456', '22', '553', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5457', '22', '554', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5458', '22', '555', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5459', '22', '556', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5460', '22', '557', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5461', '22', '558', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5462', '22', '559', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5463', '22', '560', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5464', '22', '561', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5465', '22', '562', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5466', '22', '563', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5467', '22', '564', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5468', '22', '692', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5469', '22', '570', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5470', '22', '571', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5471', '22', '572', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5472', '22', '573', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5473', '22', '574', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5474', '22', '575', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5475', '22', '576', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5476', '22', '577', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5477', '22', '578', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5478', '22', '579', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5479', '22', '580', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5480', '22', '581', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5481', '22', '582', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5482', '22', '583', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5483', '22', '584', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5484', '22', '585', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5485', '22', '586', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5486', '22', '587', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5487', '22', '588', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5488', '22', '589', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5489', '22', '590', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5490', '22', '591', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5491', '22', '592', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5492', '22', '593', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5493', '22', '594', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5494', '22', '595', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5495', '22', '596', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5496', '22', '597', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5497', '22', '598', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5498', '22', '599', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5499', '22', '600', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5500', '22', '601', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5501', '22', '602', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5502', '22', '603', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5503', '22', '604', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5504', '22', '605', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5505', '22', '606', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5506', '22', '607', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5507', '22', '608', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5508', '22', '609', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5509', '22', '610', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5510', '22', '611', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5511', '22', '612', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5512', '22', '613', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5513', '22', '614', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5514', '22', '615', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5515', '22', '616', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5516', '22', '617', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5517', '22', '618', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5518', '22', '619', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5519', '22', '620', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5520', '22', '621', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5521', '22', '622', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5522', '22', '623', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5523', '22', '624', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5524', '22', '625', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5525', '22', '626', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5526', '22', '627', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5527', '22', '628', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5528', '22', '629', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5529', '22', '630', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5530', '22', '631', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5531', '22', '632', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5532', '22', '633', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5533', '22', '634', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5534', '22', '635', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5535', '22', '636', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5536', '22', '637', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5537', '22', '638', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5538', '22', '639', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5539', '22', '640', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5540', '22', '641', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5541', '22', '642', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5542', '22', '643', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5543', '22', '644', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5544', '22', '645', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5545', '22', '646', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5546', '22', '647', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5547', '22', '648', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5548', '22', '649', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5549', '22', '650', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5550', '22', '651', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5551', '22', '652', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5552', '22', '653', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5553', '22', '654', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5554', '22', '655', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5555', '22', '656', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5556', '22', '657', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5557', '22', '658', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5558', '22', '659', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5559', '22', '660', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5560', '22', '661', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5561', '22', '662', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5562', '22', '663', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5563', '22', '664', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5564', '22', '665', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5565', '22', '666', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5566', '22', '667', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5567', '22', '668', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5568', '22', '669', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5569', '22', '670', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5570', '22', '671', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5571', '22', '672', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5572', '22', '673', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5573', '22', '674', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5574', '22', '675', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5575', '22', '676', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5576', '22', '677', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5577', '22', '678', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5578', '22', '679', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5579', '22', '680', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5580', '22', '681', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5581', '22', '682', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5582', '22', '683', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5583', '22', '684', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5584', '22', '685', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5585', '22', '686', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5586', '22', '687', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5587', '22', '688', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5588', '22', '689', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5589', '22', '324', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5590', '22', '484', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5591', '22', '500', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5592', '22', '566', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5593', '22', '567', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5594', '22', '568', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5595', '22', '569', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5596', '22', '513', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5597', '22', '537', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5598', '22', '538', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5599', '22', '539', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5600', '22', '565', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5601', '22', '693', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5602', '22', '694', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5603', '22', '695', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5604', '22', '696', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5605', '22', '697', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5606', '22', '698', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5607', '22', '699', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5608', '22', '700', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5609', '22', '701', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5610', '22', '702', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5611', '22', '325', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5612', '22', '326', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5613', '22', '327', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5614', '22', '330', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5616', '22', '328', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5617', '22', '433', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5618', '22', '434', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5619', '22', '435', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5620', '22', '436', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5621', '22', '437', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5622', '22', '438', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5623', '22', '439', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5624', '22', '440', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5625', '22', '441', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5626', '22', '442', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5627', '22', '443', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5628', '22', '444', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5629', '22', '445', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5630', '22', '446', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5631', '22', '447', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5632', '22', '448', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5633', '22', '449', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5634', '22', '450', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5635', '22', '451', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5636', '22', '452', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5637', '22', '453', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5638', '22', '454', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5639', '22', '455', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5640', '22', '456', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5641', '22', '457', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5642', '22', '458', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5648', '22', '469', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5649', '22', '470', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5650', '22', '471', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5651', '22', '472', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5652', '22', '473', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5653', '22', '479', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5654', '22', '480', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5655', '22', '481', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5656', '22', '482', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5657', '22', '483', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5658', '22', '329', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5659', '22', '414', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5660', '22', '348', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5661', '22', '349', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5662', '22', '350', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5663', '22', '351', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5664', '22', '352', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5665', '22', '373', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5666', '22', '374', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5667', '22', '375', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5668', '22', '376', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5669', '22', '377', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5670', '22', '379', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5671', '22', '380', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5672', '22', '381', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5673', '22', '382', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5674', '22', '383', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5675', '22', '394', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5676', '22', '395', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5677', '22', '396', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5678', '22', '397', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5679', '22', '398', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5680', '22', '399', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5681', '22', '400', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5682', '22', '401', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5683', '22', '402', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5684', '22', '403', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5685', '22', '409', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5686', '22', '410', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5687', '22', '411', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5688', '22', '412', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5689', '22', '413', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5690', '22', '421', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5691', '22', '384', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5692', '22', '385', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5693', '22', '386', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5694', '22', '387', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5695', '22', '388', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5696', '22', '389', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5697', '22', '390', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5698', '22', '391', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5699', '22', '392', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5700', '22', '393', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5701', '22', '520', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('5702', '22', '-666666', null, '1', null, '2018-07-04 15:42:52', null, '2018-07-04 15:42:52', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6112', '19', '1', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6113', '19', '2', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6114', '19', '15', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6115', '19', '16', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6116', '19', '17', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6117', '19', '18', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6118', '19', '3', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6119', '19', '19', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6120', '19', '20', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6121', '19', '21', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6122', '19', '22', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6123', '19', '4', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6124', '19', '23', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6125', '19', '24', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6126', '19', '25', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6127', '19', '26', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6128', '19', '5', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6129', '19', '32', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6130', '19', '33', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6131', '19', '64', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6132', '19', '65', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6133', '19', '66', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6134', '19', '67', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6135', '19', '68', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6136', '19', '69', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6137', '19', '70', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6138', '19', '71', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6139', '19', '72', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6140', '19', '73', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6141', '19', '74', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6142', '19', '75', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6143', '19', '76', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6144', '19', '77', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6145', '19', '78', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6146', '19', '79', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6147', '19', '80', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6148', '19', '81', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6149', '19', '82', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6150', '19', '83', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6151', '19', '95', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6152', '19', '89', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6153', '19', '90', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6154', '19', '91', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6155', '19', '92', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6156', '19', '93', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6157', '19', '256', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6158', '19', '257', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6159', '19', '258', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6160', '19', '259', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6161', '19', '260', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6162', '19', '246', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6163', '19', '247', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6164', '19', '248', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6165', '19', '249', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6166', '19', '250', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6167', '19', '251', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6168', '19', '252', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6169', '19', '253', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6170', '19', '254', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6171', '19', '255', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6172', '19', '261', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6173', '19', '228', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6174', '19', '229', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6175', '19', '230', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6176', '19', '231', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6177', '19', '232', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6178', '19', '238', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6179', '19', '239', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6180', '19', '240', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6181', '19', '233', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6182', '19', '234', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6183', '19', '235', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6184', '19', '236', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6185', '19', '237', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6186', '19', '272', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6187', '19', '273', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6188', '19', '274', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6189', '19', '275', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6190', '19', '276', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6191', '19', '277', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6192', '19', '278', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6193', '19', '289', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6194', '19', '290', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6195', '19', '291', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6196', '19', '292', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6197', '19', '293', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6198', '19', '314', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6199', '19', '315', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6200', '19', '316', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6201', '19', '317', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6202', '19', '318', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6203', '19', '333', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6204', '19', '334', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6205', '19', '335', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6206', '19', '336', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6207', '19', '337', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6208', '19', '404', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6209', '19', '405', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6210', '19', '406', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6211', '19', '407', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6212', '19', '408', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6213', '19', '423', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6214', '19', '424', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6215', '19', '425', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6216', '19', '426', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6217', '19', '427', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6218', '19', '474', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6219', '19', '475', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6220', '19', '476', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6221', '19', '477', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6222', '19', '478', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6223', '19', '844', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6224', '19', '845', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6225', '19', '846', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6226', '19', '847', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6227', '19', '848', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6228', '19', '934', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6229', '19', '935', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6230', '19', '936', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6231', '19', '937', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6232', '19', '938', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6233', '19', '939', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6234', '19', '940', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6235', '19', '941', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6236', '19', '942', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6237', '19', '943', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6238', '19', '944', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6239', '19', '945', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6240', '19', '946', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6241', '19', '947', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6242', '19', '948', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6243', '19', '949', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6244', '19', '950', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6245', '19', '951', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6246', '19', '952', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6247', '19', '953', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6248', '19', '959', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6249', '19', '960', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6250', '19', '961', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6251', '19', '962', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6252', '19', '963', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6253', '19', '964', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6254', '19', '965', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6255', '19', '966', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6256', '19', '967', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6257', '19', '968', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6258', '19', '975', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6259', '19', '976', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6260', '19', '977', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6261', '19', '978', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6262', '19', '979', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6263', '19', '985', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6264', '19', '986', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6265', '19', '987', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6266', '19', '988', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6267', '19', '989', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6268', '19', '995', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6269', '19', '996', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6270', '19', '997', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6271', '19', '998', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6272', '19', '999', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6278', '19', '1037', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6279', '19', '1038', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6280', '19', '1039', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6281', '19', '1040', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6282', '19', '1041', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6283', '19', '216', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6284', '19', '925', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6290', '19', '1042', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6295', '19', '926', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6296', '19', '910', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6297', '19', '911', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6298', '19', '912', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6299', '19', '913', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6300', '19', '914', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6301', '19', '915', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6302', '19', '916', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6303', '19', '917', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6304', '19', '918', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6305', '19', '919', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6306', '19', '920', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6307', '19', '921', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6308', '19', '922', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6309', '19', '923', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6310', '19', '924', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6311', '19', '1048', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6312', '19', '1049', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6313', '19', '1050', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6314', '19', '1051', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6315', '19', '1052', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6316', '19', '927', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6317', '19', '324', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6318', '19', '484', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6319', '19', '500', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6320', '19', '566', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6321', '19', '567', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6322', '19', '568', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6323', '19', '569', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6324', '19', '513', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6325', '19', '537', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6326', '19', '538', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6327', '19', '539', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6328', '19', '565', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6329', '19', '693', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6330', '19', '694', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6331', '19', '695', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6332', '19', '696', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6333', '19', '697', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6334', '19', '698', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6335', '19', '699', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6336', '19', '700', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6337', '19', '701', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6338', '19', '702', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6339', '19', '705', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6340', '19', '706', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6341', '19', '707', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6342', '19', '708', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6343', '19', '709', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6344', '19', '710', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6345', '19', '711', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6346', '19', '712', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6347', '19', '713', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6348', '19', '714', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6349', '19', '823', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6350', '19', '824', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6351', '19', '825', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6352', '19', '826', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6353', '19', '827', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6354', '19', '828', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6355', '19', '829', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6356', '19', '830', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6357', '19', '831', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6358', '19', '832', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6359', '19', '850', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6360', '19', '851', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6361', '19', '852', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6362', '19', '853', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6363', '19', '854', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6364', '19', '875', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6365', '19', '876', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6366', '19', '877', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6367', '19', '878', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6368', '19', '879', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6369', '19', '1007', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6370', '19', '1008', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6371', '19', '1009', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6372', '19', '1010', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6373', '19', '1011', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6374', '19', '1012', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6375', '19', '1013', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6376', '19', '1014', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6377', '19', '1015', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6378', '19', '1016', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6379', '19', '1022', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6380', '19', '1023', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6381', '19', '1024', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6382', '19', '1025', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6383', '19', '1026', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6384', '19', '1027', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6385', '19', '1028', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6386', '19', '1029', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6387', '19', '1030', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6388', '19', '1031', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6389', '19', '1006', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6390', '19', '325', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6391', '19', '1000', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6392', '19', '954', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6393', '19', '955', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6394', '19', '956', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6395', '19', '957', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6396', '19', '958', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6397', '19', '326', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6398', '19', '715', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6399', '19', '723', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6400', '19', '724', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6401', '19', '725', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6402', '19', '726', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6403', '19', '727', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6404', '19', '758', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6405', '19', '759', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6406', '19', '760', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6407', '19', '761', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6408', '19', '762', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6409', '19', '833', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6410', '19', '834', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6411', '19', '835', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6412', '19', '836', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6413', '19', '837', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6414', '19', '838', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6415', '19', '839', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6416', '19', '840', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6417', '19', '841', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6418', '19', '842', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6419', '19', '716', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6420', '19', '728', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6421', '19', '729', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6422', '19', '730', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6423', '19', '731', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6424', '19', '732', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6425', '19', '748', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6426', '19', '749', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6427', '19', '750', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6428', '19', '751', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6429', '19', '752', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6430', '19', '753', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6431', '19', '754', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6432', '19', '755', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6433', '19', '756', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6434', '19', '757', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6435', '19', '783', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6436', '19', '784', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6437', '19', '785', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6438', '19', '786', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6439', '19', '787', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6440', '19', '788', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6441', '19', '789', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6442', '19', '790', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6443', '19', '791', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6444', '19', '792', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6445', '19', '798', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6446', '19', '799', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6447', '19', '800', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6448', '19', '801', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6449', '19', '802', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6450', '19', '803', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6451', '19', '804', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6452', '19', '805', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6453', '19', '806', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6454', '19', '807', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6455', '19', '808', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6456', '19', '809', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6457', '19', '810', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6458', '19', '811', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6459', '19', '812', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6460', '19', '813', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6461', '19', '814', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6462', '19', '815', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6463', '19', '816', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6464', '19', '817', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6465', '19', '818', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6466', '19', '819', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6467', '19', '820', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6468', '19', '821', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6469', '19', '822', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6470', '19', '717', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6471', '19', '718', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6472', '19', '719', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6473', '19', '720', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6474', '19', '721', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6475', '19', '722', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6476', '19', '733', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6477', '19', '734', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6478', '19', '735', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6479', '19', '736', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6480', '19', '737', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6481', '19', '738', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6482', '19', '739', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6483', '19', '740', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6484', '19', '741', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6485', '19', '742', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6486', '19', '743', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6487', '19', '744', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6488', '19', '745', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6489', '19', '746', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6490', '19', '747', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6491', '19', '763', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6492', '19', '764', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6493', '19', '765', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6494', '19', '766', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6495', '19', '767', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6496', '19', '768', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6497', '19', '769', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6498', '19', '770', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6499', '19', '771', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6500', '19', '772', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6501', '19', '773', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6502', '19', '774', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6503', '19', '775', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6504', '19', '776', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6505', '19', '777', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6506', '19', '778', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6507', '19', '779', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6508', '19', '780', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6509', '19', '781', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6510', '19', '782', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6511', '19', '793', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6512', '19', '794', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6513', '19', '795', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6514', '19', '796', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6515', '19', '797', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6516', '19', '860', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6517', '19', '861', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6518', '19', '862', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6519', '19', '863', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6520', '19', '864', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6521', '19', '865', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6522', '19', '866', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6523', '19', '867', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6524', '19', '868', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6525', '19', '869', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6526', '19', '327', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6527', '19', '330', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6528', '19', '328', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6529', '19', '433', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6530', '19', '434', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6531', '19', '435', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6532', '19', '436', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6533', '19', '437', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6534', '19', '438', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6535', '19', '439', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6536', '19', '440', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6537', '19', '441', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6538', '19', '442', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6539', '19', '443', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6540', '19', '449', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6541', '19', '450', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6542', '19', '451', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6543', '19', '452', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6544', '19', '453', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6545', '19', '454', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6546', '19', '455', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6547', '19', '456', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6548', '19', '457', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6549', '19', '458', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6550', '19', '469', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6551', '19', '470', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6552', '19', '471', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6553', '19', '472', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6554', '19', '473', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6555', '19', '479', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6556', '19', '480', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6557', '19', '481', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6558', '19', '482', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6559', '19', '483', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6560', '19', '929', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6561', '19', '930', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6562', '19', '931', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6563', '19', '932', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6564', '19', '933', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6565', '19', '969', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6566', '19', '444', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6567', '19', '445', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6568', '19', '446', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6569', '19', '447', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6570', '19', '448', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6571', '19', '870', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6572', '19', '871', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6573', '19', '872', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6574', '19', '873', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6575', '19', '874', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6576', '19', '880', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6577', '19', '881', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6578', '19', '882', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6579', '19', '883', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6580', '19', '884', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6581', '19', '329', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6582', '19', '414', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6583', '19', '348', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6584', '19', '349', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6585', '19', '350', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6586', '19', '351', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6587', '19', '352', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6588', '19', '373', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6589', '19', '374', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6590', '19', '375', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6591', '19', '376', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6592', '19', '377', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6593', '19', '379', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6594', '19', '380', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6595', '19', '381', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6596', '19', '382', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6597', '19', '383', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6598', '19', '394', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6599', '19', '395', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6600', '19', '396', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6601', '19', '397', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6602', '19', '398', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6603', '19', '399', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6604', '19', '400', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6605', '19', '401', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6606', '19', '402', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6607', '19', '403', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6608', '19', '409', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6609', '19', '410', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6610', '19', '411', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6611', '19', '412', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6612', '19', '413', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6613', '19', '421', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6614', '19', '384', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6615', '19', '385', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6616', '19', '386', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6617', '19', '387', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6618', '19', '388', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6619', '19', '389', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6620', '19', '390', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6621', '19', '391', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6622', '19', '392', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6623', '19', '393', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6624', '19', '520', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');
INSERT INTO `sys_role_menu` VALUES ('6625', '19', '-666666', null, '1', null, '2018-07-14 11:01:13', null, '2018-07-14 11:01:13', '0', '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '用户状态@sys_user_state:0-禁用,1-正常',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `version_no` int(5) NOT NULL COMMENT '版本号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) NOT NULL COMMENT '逻辑删除@0-存在,1-隐藏,2-删除,3-停用',
  `sort` int(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='后端用户管理';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'cdac762d0ba79875489f6a8b430fa8b5dfe0cdd81da38b80f02f33328af7fd4a', 'YzcmCZNvbXocrsz9dm8e', '1171964050@qq.com', '15874839393', '1', '系统管理用户', '1', '1', '2018-06-13 10:10:28', '1', '2018-07-02 16:32:30', '0', '1');
INSERT INTO `sys_user` VALUES ('12', 'xjdc', '56b4afe623e836d9f518066c964d1f040ec819c284e6fb61eea0ab7f48e67971', 'Z4tExLGoBhz5oBuKOrwG', '1171964050@qq.com', '15874839393', '1', null, '1', '11', '2018-06-18 07:29:12', '1', '2018-06-19 20:46:13', '0', '1');
INSERT INTO `sys_user` VALUES ('13', '协进员工', '6f32ca7e2fd4052debb7c1001a52633a7e6be431a284ee58d39d1cba9da9e781', '8r9gV428WbNxeztO285w', '1171964050@qq.com', '15874839393', '1', null, '1', '12', '2018-06-22 14:18:01', '12', '2018-06-22 14:18:01', '0', '1');
INSERT INTO `sys_user` VALUES ('14', 'sunbiang', 'cdac762d0ba79875489f6a8b430fa8b5dfe0cdd81da38b80f02f33328af7fd4a', 'YzcmCZNvbXocrsz9dm8e', '1060072418@qq.com', '15294924170', '1', '系统管理用户', '1', '1', '2018-06-28 22:14:04', '1', '2018-07-02 16:33:01', '0', '1');
INSERT INTO `sys_user` VALUES ('15', 'zhaoxuyang', '2809db026d523e7a457bb65c57d641bf5067a780937048a86fbe9b6371b25b5d', 'iS2QjRS7zXBTFMpznkAf', '924455607@qq.com', '18838819569', '1', '系统管理用户', '1', '1', '2018-06-28 22:19:54', '1', '2018-06-28 23:37:26', '0', '1');
INSERT INTO `sys_user` VALUES ('16', 'oa', '100a003792e8cf9805569a5d4ee7d472517ea9bef642837b70551b378257c771', 'YzcmCZNvbXocrsz9dm8e', '系统管理用户', '18838819569', '1', '系统管理用户', '1', '11', '2018-07-03 09:46:08', '1', '2018-07-03 09:46:15', '0', '1');
INSERT INTO `sys_user` VALUES ('17', 'chenchenggui', 'cb0ff291dcdc7ece6399468b198e04921e8d8ca52cdce8bb52b8edcef0c4223e', 'TznyhhsTMeH2GBbocNku', '770429767@qq.com', '18218609776', '1', '系统管理用户', '1', '1', '2018-07-03 09:46:30', '1', '2018-07-14 09:14:55', '0', '1');
INSERT INTO `sys_user` VALUES ('18', 'chenyongcan', '11d730485ff508c24b0990e974677962ca569a9435c7b3f128142283e8f3b0ba', 'LzSnsmSYKZaJkYBF9mjG', '123456789@qq.com', '13514725832', '1', null, '1', '1', '2018-07-03 09:49:14', '1', '2018-07-03 09:49:14', '0', '1');
INSERT INTO `sys_user` VALUES ('19', 'pm01', '11bf432fad99b9b0062962540d0d2c76aa0303b2140406b337229cfdd974b849', 'Bhfo5sNaBNyEmcV6qrSj', '233233@qq.com', '18296796197', '1', null, '1', '1', '2018-07-07 15:24:59', '1', '2018-07-07 15:24:59', '0', '1');
INSERT INTO `sys_user` VALUES ('20', 'cjm', '853bcedef33dd89530c22f1eaeb88900214c91af7c78afb503e154377345113b', '51ZyNbnSB40sNQwqrrUM', '123456789@qq.com', '13643563345', '1', null, '1', '1', '2018-07-07 15:28:45', '1', '2018-07-07 15:28:45', '0', '1');
INSERT INTO `sys_user` VALUES ('21', 'kt', '096780894725b03f79c346057ac8a8524a7190be3d9edad48d338f68995015ac', 'vTvLEHVpDJgg7p0hcaTO', '123542@qq.com', '13554345443', '1', null, '1', '1', '2018-07-13 08:56:35', '1', '2018-07-13 08:56:35', '0', '1');
INSERT INTO `sys_user` VALUES ('22', 'liyu', '89899dec9bcb674d14f9ca838a4d44d0221e8e9e2c21eea1b4c83076c4a12015', 'dHeVzzY5jMuTMtmq8J2K', '1769124304@qq.com', '18948650744', '1', null, '1', '1', '2018-07-13 16:23:16', '1', '2018-07-13 16:23:16', '0', '1');
INSERT INTO `sys_user` VALUES ('23', 'ccg', '1815164296c9e265649055cc7fd747efd440d8ffbca9e07e7fa3fccb7068dcf7', 'yUhl3aPswkY0mZZVWqmY', '770@qq.com', '13546895642', '1', null, '1', '1', '2018-07-14 17:07:57', '1', '2018-07-14 17:07:57', '0', '1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `version_no` int(5) NOT NULL COMMENT '版本号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) NOT NULL COMMENT '逻辑删除@0-存在,1-隐藏,2-删除,3-停用',
  `sort` int(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='用户与角色关系管理';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('6', '11', '18', null, '1', null, '2018-06-18 06:41:41', null, '2018-06-18 06:41:41', '0', '1');
INSERT INTO `sys_user_role` VALUES ('7', '11', '19', null, '1', null, '2018-06-18 06:41:41', null, '2018-06-18 06:41:41', '0', '1');
INSERT INTO `sys_user_role` VALUES ('8', '12', '18', null, '1', null, '2018-06-19 20:46:13', null, '2018-06-19 20:46:13', '0', '1');
INSERT INTO `sys_user_role` VALUES ('9', '13', '21', null, '1', null, '2018-06-22 14:18:01', null, '2018-06-22 14:18:01', '0', '1');
INSERT INTO `sys_user_role` VALUES ('17', '15', '19', null, '1', null, '2018-06-28 23:37:26', null, '2018-06-28 23:37:26', '0', '1');
INSERT INTO `sys_user_role` VALUES ('21', '14', '19', null, '1', null, '2018-07-02 16:33:01', null, '2018-07-02 16:33:01', '0', '1');
INSERT INTO `sys_user_role` VALUES ('23', '18', '19', null, '1', null, '2018-07-03 09:49:14', null, '2018-07-03 09:49:14', '0', '1');
INSERT INTO `sys_user_role` VALUES ('24', '19', '19', null, '1', null, '2018-07-07 15:24:59', null, '2018-07-07 15:24:59', '0', '1');
INSERT INTO `sys_user_role` VALUES ('25', '20', '19', null, '1', null, '2018-07-07 15:28:45', null, '2018-07-07 15:28:45', '0', '1');
INSERT INTO `sys_user_role` VALUES ('26', '21', '19', null, '1', null, '2018-07-13 08:56:35', null, '2018-07-13 08:56:35', '0', '1');
INSERT INTO `sys_user_role` VALUES ('27', '21', '21', null, '1', null, '2018-07-13 08:56:35', null, '2018-07-13 08:56:35', '0', '1');
INSERT INTO `sys_user_role` VALUES ('28', '21', '22', null, '1', null, '2018-07-13 08:56:35', null, '2018-07-13 08:56:35', '0', '1');
INSERT INTO `sys_user_role` VALUES ('29', '21', '18', null, '1', null, '2018-07-13 08:56:35', null, '2018-07-13 08:56:35', '0', '1');
INSERT INTO `sys_user_role` VALUES ('30', '22', '19', null, '1', null, '2018-07-13 16:23:17', null, '2018-07-13 16:23:17', '0', '1');
INSERT INTO `sys_user_role` VALUES ('31', '17', '19', null, '1', null, '2018-07-14 09:14:55', null, '2018-07-14 09:14:55', '0', '1');
INSERT INTO `sys_user_role` VALUES ('32', '17', '18', null, '1', null, '2018-07-14 09:14:55', null, '2018-07-14 09:14:55', '0', '1');
INSERT INTO `sys_user_role` VALUES ('33', '17', '21', null, '1', null, '2018-07-14 09:14:55', null, '2018-07-14 09:14:55', '0', '1');
INSERT INTO `sys_user_role` VALUES ('34', '17', '22', null, '1', null, '2018-07-14 09:14:55', null, '2018-07-14 09:14:55', '0', '1');
INSERT INTO `sys_user_role` VALUES ('35', '23', '19', null, '1', null, '2018-07-14 17:07:57', null, '2018-07-14 17:07:57', '0', '1');
INSERT INTO `sys_user_role` VALUES ('36', '23', '21', null, '1', null, '2018-07-14 17:07:57', null, '2018-07-14 17:07:57', '0', '1');
INSERT INTO `sys_user_role` VALUES ('37', '23', '22', null, '1', null, '2018-07-14 17:07:57', null, '2018-07-14 17:07:57', '0', '1');
INSERT INTO `sys_user_role` VALUES ('38', '23', '18', null, '1', null, '2018-07-14 17:07:57', null, '2018-07-14 17:07:57', '0', '1');

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '后端用户id',
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `version_no` int(5) NOT NULL COMMENT '版本号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `delete_flag` varchar(6) NOT NULL COMMENT '逻辑删除@0-存在,1-隐藏,2-删除,3-停用',
  `sort` int(6) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='登录token管理';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', '1', 'b52dce3126afea9b16a3357876fb6b53', '2018-08-19 09:28:37', null, '1', null, '2018-06-13 10:27:05', null, '2018-08-18 21:28:37', '0', '0');
INSERT INTO `sys_user_token` VALUES ('5', '10', 'e1817e0ff267631e8acb7e20d26c7478', '2018-06-17 23:58:02', null, '1', null, '2018-06-17 11:58:02', null, '2018-06-17 11:58:02', '0', '0');
INSERT INTO `sys_user_token` VALUES ('6', '10', 'c4221858400561ee72abe4696b0ea8a5', '2018-06-17 23:59:08', null, '1', null, '2018-06-17 11:59:08', null, '2018-06-17 11:59:08', '0', '0');
INSERT INTO `sys_user_token` VALUES ('7', '10', '24575cb784b6cadbd3e2c74f45156944', '2018-06-17 23:59:42', null, '1', null, '2018-06-17 11:59:42', null, '2018-06-17 11:59:42', '0', '0');
INSERT INTO `sys_user_token` VALUES ('8', '10', 'eca5d40333a8824d788dc40f69a92d84', '2018-06-18 00:00:33', null, '1', null, '2018-06-17 12:00:33', null, '2018-06-17 12:00:33', '0', '0');
INSERT INTO `sys_user_token` VALUES ('9', '10', 'd625b4c0d7a38583dad32e6947c3039a', '2018-06-18 03:17:22', null, '1', null, '2018-06-17 15:17:22', null, '2018-06-17 15:17:22', '0', '0');
INSERT INTO `sys_user_token` VALUES ('10', '10', 'b2177b38e72e30540fe0e8028c22c54a', '2018-06-18 03:40:23', null, '1', null, '2018-06-17 15:40:23', null, '2018-06-17 15:40:23', '0', '0');
INSERT INTO `sys_user_token` VALUES ('11', '11', '608eae9521446b5500c3050e58582f5f', '2018-06-19 02:07:39', null, '1', null, '2018-06-18 06:13:01', null, '2018-06-18 14:07:39', '0', '1');
INSERT INTO `sys_user_token` VALUES ('12', '12', '1317669adbed73fa194f6c83ff3a777c', '2018-08-11 10:11:58', null, '1', null, '2018-06-19 20:46:21', null, '2018-08-10 22:11:58', '0', '1');
INSERT INTO `sys_user_token` VALUES ('13', '13', 'ff5dc803f7eb8aef620fcc40e454cd88', '2018-06-23 02:18:30', null, '1', null, '2018-06-22 14:18:30', null, '2018-06-22 14:18:30', '0', '1');
INSERT INTO `sys_user_token` VALUES ('14', '14', 'c3da0670470059ed6bc67bc0a8834825', '2018-07-26 05:12:26', null, '1', null, '2018-06-28 22:14:17', null, '2018-07-25 17:12:26', '0', '1');
INSERT INTO `sys_user_token` VALUES ('15', '15', '2425da68254ae5217a70bdfc95f4797f', '2018-07-18 21:02:56', null, '1', null, '2018-06-28 22:20:12', null, '2018-07-18 09:02:56', '0', '1');
INSERT INTO `sys_user_token` VALUES ('16', '16', '348189e9547e7f125bb9f003647b631d', '2018-07-17 21:00:10', null, '1', null, '2018-07-03 09:46:39', null, '2018-07-17 09:00:10', '0', '1');
INSERT INTO `sys_user_token` VALUES ('17', '17', 'a94166b346e57ffa3b4206043dc3e839', '2018-07-17 04:37:26', null, '1', null, '2018-07-03 09:49:28', null, '2018-07-16 16:37:26', '0', '1');
INSERT INTO `sys_user_token` VALUES ('18', '18', '3d116ca2dbc798ec7342fcc39c1cb330', '2018-07-10 20:16:12', null, '1', null, '2018-07-03 09:50:41', null, '2018-07-10 08:16:12', '0', '1');
INSERT INTO `sys_user_token` VALUES ('19', '19', '79336b855f0bbe9644eeaeed71edc027', '2018-07-17 01:39:17', null, '1', null, '2018-07-07 15:25:57', null, '2018-07-16 13:39:17', '0', '1');
INSERT INTO `sys_user_token` VALUES ('20', '20', 'da2cbb858b6c97514aa79e0729e1de79', '2018-07-18 04:55:52', null, '1', null, '2018-07-07 15:29:09', null, '2018-07-17 16:55:52', '0', '1');
INSERT INTO `sys_user_token` VALUES ('21', '21', 'f9bc211e45f1ef65a989b3028f0ac82c', '2018-07-17 02:27:29', null, '1', null, '2018-07-13 08:56:43', null, '2018-07-16 14:27:29', '0', '1');
INSERT INTO `sys_user_token` VALUES ('22', '22', '9ba461b4a2d41fddcf07e5c78ff8ed0b', '2018-07-18 20:48:51', null, '1', null, '2018-07-13 16:23:33', null, '2018-07-18 08:48:51', '0', '1');
INSERT INTO `sys_user_token` VALUES ('23', '23', 'bdaba376fdeef7cc1740531fac47f51f', '2018-07-15 05:08:06', null, '1', null, '2018-07-14 17:08:06', null, '2018-07-14 17:08:06', '0', '1');
