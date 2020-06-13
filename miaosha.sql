/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : miaosha

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 13/06/2020 14:54:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `RID` int(11) NOT NULL,
  `PID` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 1);
INSERT INTO `role_permission` VALUES (1, 2);
INSERT INTO `role_permission` VALUES (1, 3);
INSERT INTO `role_permission` VALUES (2, 1);

-- ----------------------------
-- Table structure for tb_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_address`;
CREATE TABLE `tb_address`  (
  `id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `real_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_detail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_address
-- ----------------------------
INSERT INTO `tb_address` VALUES ('296631014011310081', '1', 'tqh', '秋航', '18579445260', '福建省福州市新海湾35号602');
INSERT INTO `tb_address` VALUES ('296636097188990976', '1', 'tqh', '唐秋航', '18579113150', '湖北省武汉市华中科技大学沁园12号');
INSERT INTO `tb_address` VALUES ('296636097188990977', '2', '18579113150', 'Henry', '0591-24835698', '北京市故宫13C区');
INSERT INTO `tb_address` VALUES ('296636097188990978', '2', '18579113150', '王师傅', '13895478547', '地球村光谷广场A区37号');

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods`  (
  `id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT 0.00,
  `stock` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES ('296048124479819776', 'iPhoneX', '苹果x iphone x Apple/苹果 iPhone X iphonex全网通手机xr中移动官方旗舰店', '/static/img/iphonex.jpg', '黑色\\256G', 6288.00, 10);
INSERT INTO `tb_goods` VALUES ('296048124479819777', 'PANDORA戒指', 'PANDORA潘多拉 翻转式PANDORA的心925银戒指 197404CZ食指戒女', '/static/img/ring.jpg', '银色\\54mm', 998.00, 5);
INSERT INTO `tb_goods` VALUES ('296048124479819778', '休闲帆布包', 'Troop休闲单肩包男简约时尚青年男士斜挎包男背包帆布包横款男包', '/static/img/bag.jpg', '卡其色\\33*50*26', 366.00, 750);

-- ----------------------------
-- Table structure for tb_miaosha_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_miaosha_goods`;
CREATE TABLE `tb_miaosha_goods`  (
  `id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goods_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `miaosha_price` decimal(10, 2) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_miaosha_goods
-- ----------------------------
INSERT INTO `tb_miaosha_goods` VALUES ('296048124479819780', '296048124479819776', 1599.00, NULL, '2017-02-18 19:59:48', '2019-02-21 20:00:10');
INSERT INTO `tb_miaosha_goods` VALUES ('296048124479819783', '296048124479819777', 129.88, NULL, '2019-07-24 18:00:55', '2020-04-24 20:01:11');
INSERT INTO `tb_miaosha_goods` VALUES ('296048124479819784', '296048124479819778', 99.00, NULL, '2019-01-22 20:23:43', '2019-07-22 20:24:03');

-- ----------------------------
-- Table structure for tb_miaosha_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_miaosha_order`;
CREATE TABLE `tb_miaosha_order`  (
  `id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_num` int(11) NULL DEFAULT NULL,
  `good_price` decimal(10, 2) NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL COMMENT '0:未支付 1：待发货 2:已发货 3：已收货 4：已取消 5：已完成',
  `order_time` datetime(0) NULL DEFAULT NULL,
  `pay_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('342383551834099712', '1', '296048124479819778', '296631014011310081', '休闲帆布包', 1, 99.00, 0, '2019-06-29 16:31:06', NULL);
INSERT INTO `tb_order` VALUES ('342736759169355776', '1', '296048124479819778', '296631014011310081', '休闲帆布包', 1, 99.00, 0, '2019-06-30 15:54:37', NULL);
INSERT INTO `tb_order` VALUES ('342736760738025472', '1', '296048124479819778', '296631014011310081', '休闲帆布包', 1, 99.00, 0, '2019-06-30 15:54:37', NULL);
INSERT INTO `tb_order` VALUES ('342736761643995136', '1', '296048124479819778', '296631014011310081', '休闲帆布包', 1, 99.00, 0, '2019-06-30 15:54:37', NULL);
INSERT INTO `tb_order` VALUES ('342737467314671616', '1', '296048124479819778', '296636097188990976', '休闲帆布包', 1, 99.00, 0, '2019-06-30 15:57:26', NULL);
INSERT INTO `tb_order` VALUES ('342737467973177344', '1', '296048124479819778', '296636097188990976', '休闲帆布包', 1, 99.00, 0, '2019-06-30 15:57:26', NULL);
INSERT INTO `tb_order` VALUES ('342737468841398272', '1', '296048124479819778', '296636097188990976', '休闲帆布包', 1, 99.00, 0, '2019-06-30 15:57:26', NULL);
INSERT INTO `tb_order` VALUES ('342738129448472576', '1', '296048124479819778', '296631014011310081', '休闲帆布包', 1, 99.00, 0, '2019-06-30 16:00:03', NULL);
INSERT INTO `tb_order` VALUES ('342738131579179008', '1', '296048124479819778', '296631014011310081', '休闲帆布包', 1, 99.00, 0, '2019-06-30 16:00:04', NULL);
INSERT INTO `tb_order` VALUES ('342738132803915776', '1', '296048124479819778', '296631014011310081', '休闲帆布包', 1, 99.00, 0, '2019-06-30 16:00:04', NULL);
INSERT INTO `tb_order` VALUES ('342738380678893568', '1', '296048124479819778', '296631014011310081', '休闲帆布包', 1, 99.00, 0, '2019-06-30 16:01:03', NULL);
INSERT INTO `tb_order` VALUES ('342742874875629568', '1', '296048124479819778', '296631014011310081', '休闲帆布包', 1, 99.00, 0, '2019-06-30 16:18:55', NULL);
INSERT INTO `tb_order` VALUES ('342801973801783296', '2', '296048124479819778', '296636097188990978', '休闲帆布包', 1, 99.00, 0, '2019-06-30 20:13:45', NULL);
INSERT INTO `tb_order` VALUES ('442699385093099520', '1', '296048124479819777', '296636097188990976', 'PANDORA戒指', 1, 129.88, 0, '2020-04-01 12:10:24', NULL);

-- ----------------------------
-- Table structure for tb_order_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_message`;
CREATE TABLE `tb_order_message`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `exchange_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `routing_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message_body` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `retry_count` int(11) NULL DEFAULT NULL,
  `message_time` datetime(0) NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL COMMENT '-1：发送失败 0：未发送 1:已发送 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order_message
-- ----------------------------
INSERT INTO `tb_order_message` VALUES ('002d75e1-1037-489e-8e69-a583bdf2a6b1', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981820411905', 0, '2019-04-17 10:08:38', 1);
INSERT INTO `tb_order_message` VALUES ('0298a080-6841-4e3e-94be-6a66be3a45f9', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981296123905', 0, '2019-04-17 10:08:38', 1);
INSERT INTO `tb_order_message` VALUES ('18cd08c2-28c4-402e-beba-bc95932a4aa2', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981359038464', 0, '2019-04-17 10:08:38', 1);
INSERT INTO `tb_order_message` VALUES ('1f36b83a-7d71-418a-bfb4-fad826ae4069', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '342742874875629568', 0, '2019-06-30 16:18:55', 0);
INSERT INTO `tb_order_message` VALUES ('24f01799-2467-439f-80d6-40b24d62b04d', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '342738132803915776', 0, '2019-06-30 16:00:04', 1);
INSERT INTO `tb_order_message` VALUES ('2bfe5dbc-62e1-4281-9859-bfe6a15e43b6', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '342738131579179008', 0, '2019-06-30 16:00:04', 1);
INSERT INTO `tb_order_message` VALUES ('3d2252eb-a609-43cd-bff3-1f30274435c2', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981690388480', 0, '2019-04-17 10:08:38', 1);
INSERT INTO `tb_order_message` VALUES ('46cb622c-e3a4-4828-ac14-ba17f9cca7f2', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '329685540184133632', 0, '2019-05-25 15:33:44', 1);
INSERT INTO `tb_order_message` VALUES ('47c79b70-6832-4ffb-a3af-187412d87cae', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981426147328', 0, '2019-04-17 10:08:38', 1);
INSERT INTO `tb_order_message` VALUES ('5320e5c8-218c-4752-860a-ff2efd57ba4c', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '442699385093099520', 0, '2020-04-01 12:10:24', 1);
INSERT INTO `tb_order_message` VALUES ('54327e06-e837-4c95-a13c-dc57e5986879', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '342383551834099712', 0, '2019-06-29 16:31:06', 1);
INSERT INTO `tb_order_message` VALUES ('66c8c74d-c7a6-4467-97c4-5545bfb1546c', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '342737468841398272', 0, '2019-06-30 15:57:26', 1);
INSERT INTO `tb_order_message` VALUES ('711a2b67-027d-439e-8a0e-dfb54d0b0dae', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981556170752', 0, '2019-04-17 10:08:38', 1);
INSERT INTO `tb_order_message` VALUES ('7745e52e-83ce-456f-9e95-d6d692a27bee', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981753303040', 0, '2019-04-17 10:08:38', 1);
INSERT INTO `tb_order_message` VALUES ('8b550836-2a53-43ed-bdd6-94e4516df1a6', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981296123904', 0, '2019-04-17 10:08:37', 1);
INSERT INTO `tb_order_message` VALUES ('8d766779-499f-4993-808b-84902f1610a6', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '342737467973177344', 0, '2019-06-30 15:57:26', 1);
INSERT INTO `tb_order_message` VALUES ('8ed7835a-0c07-4913-bf5d-1524d8c41e62', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981753303045', 0, '2019-04-17 10:08:38', 1);
INSERT INTO `tb_order_message` VALUES ('9129ff9b-f66c-49d9-ac7c-5505e9ba587f', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981753303044', 0, '2019-04-17 10:08:38', 1);
INSERT INTO `tb_order_message` VALUES ('92747933-c257-4ddf-aa01-e943f1d8952f', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981426147329', 0, '2019-04-17 10:08:38', 1);
INSERT INTO `tb_order_message` VALUES ('988a4e3a-a501-4a07-8366-ad7bcc379c85', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '342736761643995136', 0, '2019-06-30 15:54:37', 1);
INSERT INTO `tb_order_message` VALUES ('9d2bfb14-ae82-4fba-b429-607766f625e3', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '342736760738025472', 0, '2019-06-30 15:54:37', 1);
INSERT INTO `tb_order_message` VALUES ('ab5d2350-18d5-41b3-a8c0-b9db25d48019', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '342738380678893568', 0, '2019-06-30 16:01:04', 1);
INSERT INTO `tb_order_message` VALUES ('ac4f60ee-2848-497e-b4d3-e66cdaf0d0f9', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981753303041', 0, '2019-04-17 10:08:38', 1);
INSERT INTO `tb_order_message` VALUES ('b2a1546a-ab8e-47b6-977b-ff4caffa5db2', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981296123906', 0, '2019-04-17 10:08:38', 1);
INSERT INTO `tb_order_message` VALUES ('b498b93a-2359-4125-b335-e4d49799b381', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981753303042', 0, '2019-04-17 10:08:38', 1);
INSERT INTO `tb_order_message` VALUES ('b80b6b94-4a04-40da-af88-42c6a95ead72', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '342737467314671616', 0, '2019-06-30 15:57:26', 1);
INSERT INTO `tb_order_message` VALUES ('b8f13c25-d815-4d29-a9ef-8fc2a24a33e0', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981753303043', 0, '2019-04-17 10:08:38', 1);
INSERT INTO `tb_order_message` VALUES ('c4d3ce77-6062-4ce4-8c1d-24a27a2633ff', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '342738129448472576', 0, '2019-06-30 16:00:04', 1);
INSERT INTO `tb_order_message` VALUES ('ccfe56f2-7a67-44ab-ae84-68d9d95e4bde', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981296123907', 0, '2019-04-17 10:08:38', 1);
INSERT INTO `tb_order_message` VALUES ('d4f01fd3-41a2-47db-8c6d-c85c52712b23', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981556170753', 0, '2019-04-17 10:08:38', 1);
INSERT INTO `tb_order_message` VALUES ('de221629-b511-4f81-8974-614377807d9a', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981820411904', 0, '2019-04-17 10:08:38', 1);
INSERT INTO `tb_order_message` VALUES ('e4d7cfbc-048c-45ce-8498-2c818193b610', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '342736759169355776', 0, '2019-06-30 15:54:37', 1);
INSERT INTO `tb_order_message` VALUES ('e65b4319-a0fa-4e57-a39b-b67f69b24e0f', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981623279616', 0, '2019-04-17 10:08:38', 1);
INSERT INTO `tb_order_message` VALUES ('e75d6ed8-04ee-41db-982c-a72a9f3a0ebb', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '329690076936278016', 0, '2019-05-25 15:51:45', 1);
INSERT INTO `tb_order_message` VALUES ('e98f17c8-b607-44e9-b9ce-63cc92929330', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '315832981098991616', 0, '2019-04-17 10:08:37', 1);
INSERT INTO `tb_order_message` VALUES ('fe18d29b-af15-409f-a921-dc638e4db196', 'DIRECT_EXCHANGE', 'DIRECT_ROUTING_KEY', '342801973801783296', 0, '2019-06-30 20:13:46', 1);

-- ----------------------------
-- Table structure for tb_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_permission`;
CREATE TABLE `tb_permission`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_permission
-- ----------------------------
INSERT INTO `tb_permission` VALUES (1, 'buy');
INSERT INTO `tb_permission` VALUES (2, 'sell');
INSERT INTO `tb_permission` VALUES (3, 'bonus');

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES (1, 'vip');
INSERT INTO `tb_role` VALUES (2, 'normal');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NickName` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '用户名',
  `PassWord` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '密码',
  `LastLoginTime` datetime(0) NULL DEFAULT NULL COMMENT '上次登录',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `tb_User_NickName_uindex`(`NickName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'tqh', 'fa640defaf119b94460a46968087e49c', NULL);
INSERT INTO `tb_user` VALUES (2, '18579113150', 'a413ccc6fd9f0861d3d929319624844d', NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `UID` int(11) NOT NULL,
  `RID` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
