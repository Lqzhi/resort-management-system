/*
 Navicat Premium Data Transfer

 Source Server         : lin
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : resort_man_sys

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 23/04/2023 11:38:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for rms_a_permission
-- ----------------------------
DROP TABLE IF EXISTS `rms_a_permission`;
CREATE TABLE `rms_a_permission`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `permission_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限名称',
  `permission_level` tinyint NOT NULL DEFAULT 1 COMMENT '权限等级',
  `permission_pid` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '权限父id',
  `server_api` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务器端接口',
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限描述',
  `browser_route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器端路由',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_a_permission
-- ----------------------------
INSERT INTO `rms_a_permission` VALUES (1, '管理员用户管理', 1, NULL, 'admin', NULL, 'users');
INSERT INTO `rms_a_permission` VALUES (2, '游客用户管理', 1, NULL, 'tourist', NULL, 'tourists');
INSERT INTO `rms_a_permission` VALUES (3, '角色管理', 1, NULL, 'role', NULL, 'roles');
INSERT INTO `rms_a_permission` VALUES (4, '权限管理', 1, NULL, 'permission', NULL, 'permissions');
INSERT INTO `rms_a_permission` VALUES (5, '房间管理', 1, NULL, 'room', NULL, 'rooms');
INSERT INTO `rms_a_permission` VALUES (6, '景点管理', 1, NULL, 'address', NULL, 'address');
INSERT INTO `rms_a_permission` VALUES (7, '文章管理', 1, NULL, 'article', NULL, 'articles');
INSERT INTO `rms_a_permission` VALUES (8, '订单管理', 1, NULL, 'order', NULL, 'orders');
INSERT INTO `rms_a_permission` VALUES (9, '数据统计', 1, NULL, 'data', NULL, 'charts');
INSERT INTO `rms_a_permission` VALUES (10, '个人中心', 1, NULL, 'my', NULL, 'personal');
INSERT INTO `rms_a_permission` VALUES (11, '管理员列表', 2, 0000000001, NULL, NULL, 'users');
INSERT INTO `rms_a_permission` VALUES (12, '游客列表', 2, 0000000002, NULL, NULL, 'tourists');
INSERT INTO `rms_a_permission` VALUES (13, '角色列表', 2, 0000000003, NULL, NULL, 'roles');
INSERT INTO `rms_a_permission` VALUES (14, '权限列表', 2, 0000000004, NULL, NULL, 'permissions');
INSERT INTO `rms_a_permission` VALUES (15, '房间列表', 2, 0000000005, NULL, NULL, 'rooms');
INSERT INTO `rms_a_permission` VALUES (16, '房间分类', 2, 0000000005, NULL, NULL, 'roomcates');
INSERT INTO `rms_a_permission` VALUES (17, '景点列表', 2, 0000000006, NULL, NULL, 'address');
INSERT INTO `rms_a_permission` VALUES (18, '景点分类', 2, 0000000006, NULL, NULL, 'addresscates');
INSERT INTO `rms_a_permission` VALUES (19, '文章列表', 2, 0000000007, NULL, NULL, 'articles');
INSERT INTO `rms_a_permission` VALUES (20, '文章分类', 2, 0000000007, NULL, NULL, 'articlecates');
INSERT INTO `rms_a_permission` VALUES (21, '订单列表', 2, 0000000008, NULL, NULL, 'orders');
INSERT INTO `rms_a_permission` VALUES (22, '预订单处理', 1, 0000000008, NULL, NULL, NULL);
INSERT INTO `rms_a_permission` VALUES (23, '入住办理', 1, 0000000008, NULL, NULL, NULL);
INSERT INTO `rms_a_permission` VALUES (24, '退房手续', 1, 0000000008, NULL, NULL, NULL);
INSERT INTO `rms_a_permission` VALUES (25, '数据报表', 2, 0000000009, NULL, NULL, 'charts');
INSERT INTO `rms_a_permission` VALUES (26, '基本信息', 2, 0000000010, NULL, NULL, 'personal');

-- ----------------------------
-- Table structure for rms_a_role
-- ----------------------------
DROP TABLE IF EXISTS `rms_a_role`;
CREATE TABLE `rms_a_role`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '普通管理员' COMMENT '角色名称',
  `introduction` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_a_role
-- ----------------------------
INSERT INTO `rms_a_role` VALUES (1, '超级管理员', '系统维护');
INSERT INTO `rms_a_role` VALUES (2, '房间管理者', '主要对房间进行管理');
INSERT INTO `rms_a_role` VALUES (3, '景点管理者', '主要对景点进行管理');
INSERT INTO `rms_a_role` VALUES (4, '文案', '负责章模块管理与发布');
INSERT INTO `rms_a_role` VALUES (5, '市场分析师', '主要根据统计模块进行分析');
INSERT INTO `rms_a_role` VALUES (6, '前台', '进行订单对接与游客的录入');
INSERT INTO `rms_a_role` VALUES (14, '前端开发员', '零零零零');

-- ----------------------------
-- Table structure for rms_add_cate
-- ----------------------------
DROP TABLE IF EXISTS `rms_add_cate`;
CREATE TABLE `rms_add_cate`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地点分类',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_add_cate
-- ----------------------------
INSERT INTO `rms_add_cate` VALUES (1, '历史建筑', 'Historical buildings');
INSERT INTO `rms_add_cate` VALUES (2, '博物馆', 'museum');
INSERT INTO `rms_add_cate` VALUES (3, '美术馆', 'art museum');
INSERT INTO `rms_add_cate` VALUES (4, '公园和花园', 'Parks and Gardens');
INSERT INTO `rms_add_cate` VALUES (5, '娱乐设施', 'entertainment');
INSERT INTO `rms_add_cate` VALUES (6, '田园风光', 'rural scenery');
INSERT INTO `rms_add_cate` VALUES (7, '豪华酒店', 'Luxury hotels');
INSERT INTO `rms_add_cate` VALUES (8, '购物中心', 'Shopping Mall');
INSERT INTO `rms_add_cate` VALUES (9, '温泉洗浴', 'Hot spring bathing');
INSERT INTO `rms_add_cate` VALUES (10, '美食餐厅', 'gourmet restaurant');

-- ----------------------------
-- Table structure for rms_add_picture
-- ----------------------------
DROP TABLE IF EXISTS `rms_add_picture`;
CREATE TABLE `rms_add_picture`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `picture_no` int NULL DEFAULT NULL COMMENT '地点图片编号',
  `picture_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片地址',
  `address_id` int UNSIGNED NULL DEFAULT NULL COMMENT '对应的地点',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `address_id`(`address_id` ASC) USING BTREE,
  CONSTRAINT `rms_add_picture_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `rms_address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_add_picture
-- ----------------------------
INSERT INTO `rms_add_picture` VALUES (1, 1000, 'address/1000.png', 1);
INSERT INTO `rms_add_picture` VALUES (2, 1001, 'address/1001.png', 2);
INSERT INTO `rms_add_picture` VALUES (3, 1002, 'address/1002.png', 3);
INSERT INTO `rms_add_picture` VALUES (4, 1003, 'address/1003.png', 4);

-- ----------------------------
-- Table structure for rms_address
-- ----------------------------
DROP TABLE IF EXISTS `rms_address`;
CREATE TABLE `rms_address`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '地点id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地点名称',
  `lgn` decimal(10, 6) NULL DEFAULT NULL COMMENT '地点经度',
  `lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '地点纬度',
  `man_time` int NULL DEFAULT NULL COMMENT '地点人次',
  `cate_id` int UNSIGNED NULL DEFAULT NULL COMMENT '对应分类',
  `describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景点描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cate_id`(`cate_id` ASC) USING BTREE,
  CONSTRAINT `rms_address_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `rms_add_cate` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_address
-- ----------------------------
INSERT INTO `rms_address` VALUES (1, '亲子温泉中心', NULL, NULL, 231, 9, '拥有多种温泉池和水上乐园设施，适合家庭共度休闲时光。还提供各种美食。去这里可以释放压力，增进亲子关系。快来计划一趟吧！');
INSERT INTO `rms_address` VALUES (2, '情侣主题温泉', NULL, NULL, 2131, 9, '治愈系情侣主题温泉，一定能让您与爱人度过浪漫惬意的时光。这家温泉中心地理位置优越，交通便利。无论白天还是夜晚，这里的泉水都能让您感受到自然的舒适与放松。它精心设计的设施，包括情侣露天温泉和私人按摩房，是他人无法超越的。在这里，您可以享受各种温泉浴法的疗效，更可以尽情享受私密的亲密时光。此外，还有多种特别活动，比如私人直升机游览、烛光晚宴等，让您和爱人度过难忘的时光。一定不要错过这个浪漫的场所，一起创建美好回忆吧。');
INSERT INTO `rms_address` VALUES (3, '豪华商务温泉中心', NULL, NULL, 9067, 9, '如果您正在寻找为商务会议和休闲之旅提供完美场所的地方，商务豪华温泉中心一定是您的不二选择。这家温泉中心装饰豪华，服务完美。提供豪华会议设施和温泉浴，可以舒缓身心，是商务人士完美的选择。此外，还提供各种美食和娱乐设施，为商务旅行者提供最舒适的休闲体验。');
INSERT INTO `rms_address` VALUES (4, '怀集传统美食街', NULL, NULL, 31235, 10, '怀集传统美食街是一个历史悠久、风味独特的美食聚集地。这里的特色烧烤和小吃，尤其是烤羊肉串和烤面筋，是当地的招牌美食，让人流连忘返。除此之外，还有不少的餐馆供应各种精美的菜肴，如清蒸大闸蟹、干煸花菜、红烧鱼等等，让味蕾尝遍各种美味。走在街上，可以看到古老的木屋、石墙和瀑布，仿佛置身于一座小镇中。总之，来到这里，绝对能满足你的后半生。');

-- ----------------------------
-- Table structure for rms_admin
-- ----------------------------
DROP TABLE IF EXISTS `rms_admin`;
CREATE TABLE `rms_admin`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `account_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录账号（3-20）',
  `admin_pwd` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '$2b$10$lACevwrbmWZCA0GzGoUb7Oe19hPr/4islY61xxf96sUWaejabiuGO' COMMENT '密码(采用bcript加密方式60位)',
  `admin_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '管理员账号所属人真实名字（国人之最18个字）',
  `admin_nickname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '管理员' COMMENT '管理员昵称（1-10）',
  `role_id` int UNSIGNED NULL DEFAULT 0 COMMENT '管理员角色（用于权限分配）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '账号创建时间',
  `admin_email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所绑定的邮箱',
  `admin_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所绑定的手机号码',
  `admin_state` tinyint NULL DEFAULT 0 COMMENT '状态是否被禁用0未禁用，1禁用',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_number`(`account_number` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_admin
-- ----------------------------
INSERT INTO `rms_admin` VALUES (1, 'jing', '$2a$10$KgTqtab.O3U7QentqYYvD.tsyvuFritD/xR6wp0YzKCWGbXJxqyVC', '林文京', '管理', 3, '2023-04-09 23:00:05', '11733@qq.com', '', 0, '2023-04-22 09:20:17');
INSERT INTO `rms_admin` VALUES (2, 'wenx', '$2b$10$4vmnLSUI8e/o2ZnnkQw4i.NPTCe/wWswL0.9VJRHh6xq0QQVnwVky', '文熙', '管理员', 1, '2023-04-11 00:27:11', '', NULL, 0, '2023-04-22 00:05:29');
INSERT INTO `rms_admin` VALUES (3, 'admin', '$2b$10$kS8Zv4nI3iShN86HKCmCf.vbes02XVbByBFZFyRPfJ14oBn8cFa5m', '管理员', '管理员', 1, '2023-04-11 00:24:23', NULL, NULL, 0, '2023-04-22 00:17:54');
INSERT INTO `rms_admin` VALUES (4, 'liangqi', '$2b$10$.CcI5hYAdt2.AvcGbKQgfunlbymgnl58bKSGhHElx.jCsVsVcQn9O', '梁其', '管理员', 3, '2023-04-11 00:39:09', NULL, NULL, 0, '2023-04-22 00:02:33');
INSERT INTO `rms_admin` VALUES (5, 'text11', '$2b$10$u4M6lH/sxsWCqTRpuwdRB.Sh/nLTFJKYXy2MNGzkx42qpgSEbhAW.', '林文新', '新歌', 1, '2023-04-15 17:07:05', '11078@qq.com', '15920657787', 0, '2023-04-22 00:02:35');
INSERT INTO `rms_admin` VALUES (6, 'text1', '$2b$10$awWJrqZeDGl.p9ck0SjbvuwIHsZCxMxx8cegMcHtxu586PU/L58KK', '林文新', '新歌', 2, '2023-04-15 19:58:49', '11078@qq.com', '15920657787', 0, '2023-04-22 00:02:37');
INSERT INTO `rms_admin` VALUES (7, 'text15', '$2b$10$88H0d2ihYVB15Zgn1bE8.O4JCBtPXhYJI9PVxHvCWEYMAw4sfc0LC', '林文新', '新歌', 2, '2023-04-15 20:13:14', '11078@qq.com', '15920657787', 0, '2023-04-22 00:02:51');
INSERT INTO `rms_admin` VALUES (40, 'xin', '$2b$10$ypvvqTzElX9jtrInKpjXTeK1PoXwob59C3JG20G/wbssOdbDLhxwK', '林文新', '新歌', 1, '2023-04-22 16:38:01', '11078@qq.com', '15920657787', 0, '2023-04-22 16:38:01');

-- ----------------------------
-- Table structure for rms_art_cate
-- ----------------------------
DROP TABLE IF EXISTS `rms_art_cate`;
CREATE TABLE `rms_art_cate`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名',
  `alias` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类别名',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_art_cate
-- ----------------------------
INSERT INTO `rms_art_cate` VALUES (2, '健康养生', 'Health and wellness', 0);
INSERT INTO `rms_art_cate` VALUES (3, '美食之旅', 'Food Tour', 0);
INSERT INTO `rms_art_cate` VALUES (4, '体验心得', 'Experience', 0);
INSERT INTO `rms_art_cate` VALUES (5, '景点推荐', 'Recommended', 0);

-- ----------------------------
-- Table structure for rms_article
-- ----------------------------
DROP TABLE IF EXISTS `rms_article`;
CREATE TABLE `rms_article`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `content` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章内容',
  `art_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章图片',
  `pub_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `state` tinyint NOT NULL DEFAULT 0 COMMENT '文章状态',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  `cate_id` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '文章分类id',
  `admin_id` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '发布管理员id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cate_id`(`cate_id` ASC) USING BTREE,
  INDEX `admin_id`(`admin_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_article
-- ----------------------------
INSERT INTO `rms_article` VALUES (1, '人生之旅', '美好生活是所有人追求的目标，它不仅仅是收入高、物质条件好，更包括身心健康、幸福满足。一个人的生活质量取决于许多方面，例如工作、家庭、社交、健康等等。\n\n首先，好的工作让人们有成就感和满足感。工作不仅可以挣到钱，还可以锻炼能力、拓展人际关系。如果你的工作是你喜欢的，你就会更有激情，工作量也不会让你感到疲惫。\n\n其次，家庭是一个人最温暖的港湾，一个美满的家庭是每个人心中的梦想。在家庭中要相互尊重、关心、支持和包容，坚持沟通和互动，从而提高家庭和谐度和幸福感。\n\n社交圈也是生活中很重要的一部分。拥有良好的社交能力和朋友关系有益于人们的心理健康，让人们更容易获得工作机会和生活中的支持。\n\n最后，健康是美好生活不可或缺的一环。人们应该注重合理饮食，适当的运动和保持充足的睡眠。养成健康的生活习惯不仅可以提高免疫力，还可以预防许多疾病。\n\n美好生活不是简单的物质富足，而是一个人在物质、精神、社交和身心健康方面全面发展的状态。通过合理的生活规划和积极的心态去追求美好生活，相信每个人都能拥有自己的美好生活！', NULL, '2023-04-19 12:57:18', 0, 0, 1, 1);
INSERT INTO `rms_article` VALUES (2, '我的生活', '\n我是一个普通的人，我的生活也并不特别。每天早上起床，做饭、洗漱、上班。晚上回家，吃饭、看电视、睡觉。这就是我平凡生活的大致轮廓。\n\n然而，我的生活也有一些小小的快乐。喝一杯咖啡，听一首轻音乐，看一本好书，打一局棋，这些简单的事物都能让我感到愉悦和舒适。更重要的是，我有许多好朋友，和他们在一起相处很开心，也很能放松自己。\n\n我的生活虽然平凡，但也不乏挑战。工作的压力和生活的琐事时常令我疲惫不堪，但是我会学习适度的放松和调整，保持身心健康和平衡。\n\n我的生活过得并不太精彩，但它始终是真实的、温馨的。我爱我的生活，它是我存在的基础，也是我前进的动力。我相信，只要用心体验，生活总会有更多美好的意义和价值。', NULL, '2023-04-19 13:02:59', 0, 0, 1, 1);
INSERT INTO `rms_article` VALUES (3, '旅游，让生活更有趣', '\n旅游，是人们在闲暇时最愉快的事情之一。出门在外，感受到不同的文化和风景，体验着异乡的生活，这些都是旅游带给我们的乐趣。\n\n在旅游中，我们可以释放自己的压力，享受自由的感觉，摆脱城市压力的束缚，让自己的生活更有趣。旅游中的风景和人文景观都是非常值得一去的地方，让我们对生活和世界有了更深刻的认识和了解。\n\n旅游也是一种学习，我们可以沉浸在当地的文化中，了解当地的传统，尝试当地的美食，感受当地人的生活方式，这些都是学校无法教授的。\n\n在旅游中，我们还可以结交各地的友人，分享彼此的见解和经验，建立起更深厚的友谊，丰富了自己的人际关系网。\n\n总之，旅游让生活更有趣，充满了无限的可能性。让我们勇敢地踏出家门，开启一段充满惊喜的旅程吧！', NULL, '2023-04-19 13:04:05', 0, 0, 1, 1);
INSERT INTO `rms_article` VALUES (4, '健康饮食，从口开始', '\n健康饮食是维持健康的基石，而从口开始掌握健康饮食的要领是非常关键的。健康的饮食习惯不仅能提高我们的免疫力，预防疾病，更能让我们的整个生活更加清新自由。\n\n首要关注的是食品的品质问题。尽可能选择新鲜、有机的食物，少去冷藏和罐装食物。在蛋白质上，瘦肉、鸡蛋、鱼类都是不错的选择；对于碳水化合物来说，主食中全麦面包和糙米饭含有更多的纤维素；水果和蔬菜是提供身体所需维生素和矿物质的最佳来源。\n\n其次是掌握饮食搭配的技巧。膳食搭配上尽量使用蒸、煮或者烤的方式，而不是油炸;不要吃太多高热量的零食；注意多吃一些含有膳食纤维的食物，不要忽略了饮食中的盐和糖分摄入量。\n\n最后，也是最重要的是要尽量放慢自己的进食速度，每次喝水后，应至少等待10-15分钟，品尝食物，并充分咀嚼食物，这样不仅更有利于消化，也可以避免进食过多。\n\n健康饮食的过程是一种需要持久性和耐性的改变，但是只要从口开始养成健康饮食的习惯，这些改变将带给您明显的生活，充分提高了身体的抵御力、精力和效率。', NULL, '2023-04-19 13:06:46', 0, 0, 2, 1);
INSERT INTO `rms_article` VALUES (5, '养生，从日常生活开始', '\n\n在现代快节奏的生活中，人们往往容易忽略健康养生的重要性。然而，养成良好的生活习惯是维护身体健康的重要基础。以下几点可以作为养生的基本指南。\n\n首先，坚持适量运动。过度劳累容易导致身体疲惫和疾病。适度的运动可以提高免疫力，增强身体抵御疾病的能力。\n\n其次，保持健康的饮食习惯。摄入合理的营养成分可以增强身体免疫力，预防疾病。合理的饮食习惯包括：多食用新鲜蔬菜水果，选择能够提供身体必需营养的瘦肉和全谷类，少食用高脂、高糖的食品。\n\n再次，保持充足的睡眠。睡眠不仅能够消除疲劳，还能够修复身体，帮助身体恢复健康状态。睡眠质量好，身体健康状况自然好。\n\n最后，保持身体健康的心态。快乐、积极的心态能够增强身体免疫力，促进身体健康。保持好情绪状态，从心理上防止发生疾病，保持身体健康是非常重要的。\n\n养成健康的生活习惯不仅仅是今天和明天，而是一生的事。把养生的误区摆脱掉，让家庭在日常生活中养成健康的生活方式，可以有效增强生命力，延缓衰老，促进健康长寿。', NULL, '2023-04-19 13:08:44', 0, 0, 2, 1);
INSERT INTO `rms_article` VALUES (6, '如何养生？', '健康，享受更美好的生活\n\n身体健康是人们生活的基础，而养生的目的就是为了保持健康的身体。在日常生活中，我们应该注重养生，以此来提升我们的身体健康水平，享受更美好的生活。\n\n首先，合理膳食是养生的核心。我们应该选择新鲜、天然的食品，特别是水果和蔬菜。回归自然，保持适当的饮食习惯，可以帮助我们消化、强身健体，增强身体免疫力。\n\n其次，适度的运动也是养生的重要标志。坚持每天的适度运动，可以让身体强壮、精神焕发；同时也可以消除身体疲劳，提高身体免疫功能。\n\n最后，保持心静也是守护身体健康的关键。当你感到压力高涨、情绪低落时，应该尝试放松自己，采取减压方式。推荐可以学习冥想、静坐等，给自己一些时间来调整自己的心态。\n\n总之，养生是一种生活方式，同时也是我们生命中的责任和义务。只有身体健康，才能拥有更美好的生活。所以，对于每一个爱护自己的人来说，正确的养生方式是必不可少的，希望能够坚持下去。', NULL, '2023-04-19 13:10:47', 0, 0, 2, 1);
INSERT INTO `rms_article` VALUES (7, '怀集美食，品味古城的味道', '怀集是一座有着悠久历史的小城，大量的文化和历史遗迹吸引着众多游客前来参观。当然，这里还有着各种美食，让人流连忘返。\n\n首先，怀集的美食之一是砂锅汤。它通常是在大砂锅中熬制而成，配有各种不同的肉类。汤底的味道十分鲜美，还能起到养生保健的作用，让人回味无穷。\n\n风味小吃也是怀集的亮点之一。这里有着各种小吃摊贩，包括传统的鸭脖、烤鱼，还有新兴的川菜、粤菜等。无论你是喜欢辣的还是不喜欢辣的，都能在这些小吃中找到自己喜欢的口味。\n\n其他还有各种面点，如白米粉、乌米粉、煎饺等等。这些面点口感鲜美，加上特殊的配料烹饪方式，让人吃得津津有味。\n\n怀集美食的魅力让人流连忘返，也印证了这座小城不单是历史文化的见证者，更是一组保存纯正传统风味的美食馆。在怀集，探索美食的旅途永远不会结束，每一个角落里都藏着美味的惊喜，等待着您来品尝。', NULL, '2023-04-19 13:13:41', 0, 0, 3, 1);
INSERT INTO `rms_article` VALUES (8, '秀林村——一处远离尘嚣的梦幻天地', '秀林村位于中国西部云南省，是一处远离尘嚣的梦幻天地。这里环境清幽，空气清新，透着一股自然的气息，而且还有着独特的文化风情。\n\n这里有一条古老的石板路，这条路历经百年风雨，沿途有着一些古老的斑驳的建筑，这些建筑都有着各自的历史故事。走在石板路上，听着脚步声回响在山间，仿佛就能穿越到过去的岁月里。\n\n在秀林村，还有着许多美丽的景观，如梦幻的油菜花田、神秘的山谷、古老的寺庙等等。这些景观每年都吸引着大批游客前来观赏。\n\n秀林村的居民大多数是彝族人，他们传承着非常悠久的文化。来这里的游客还可以看到当地人的传统服装、风俗习惯，品尝到彝族口味的美食等。\n\n总之，秀林村是一处能让人放松心情的好去处，它大自然的力量将带给你轻松、平静的感受，让你忘却尘世喧嚣，回归大自然。', NULL, '2023-04-19 13:16:47', 0, 0, 1, 1);
INSERT INTO `rms_article` VALUES (9, '国内有哪些度假村值得一去的？', '2022年10月，广东省农业农村厅认定秀林村为2022年广东省“一村一品、一镇一业”专业村（丝苗米）。 2019年9月，秀林村上榜2018年广东省“民主法治示范村（社区）”创建单位名单。 秀林村委会位于镇东北部，距镇中心6公里，与梁村镇、怀城镇交界，地处省道“粤桂湘”水谷线两旁。全村分11个村民小组，分别是白屋、多贺、山口、杨树、庞眉、下郭、令惠、碧塘、枫林、浪美、竹元。秀林村总面积5.26平方公里，其中耕地面积1055亩，山地4946亩。总人口3280人，均为农业人口。秀林村具有丰富的山塘水库、旱地资源，建有谭再塘综合养殖场。第三产业发达，村民历来有弹棉胎手工习惯，棉胎产品远销各地；同时，是远近闻名的“烂铁回收村”。 秀林村与镇南村、岭岗村、连会村、地厚村、石群村、均义村、富楼村、梁水村、莫屋村、四保村、集义村、大岗村、大钟村、石田村相邻。 秀林村附近有塔山文化公园、怀集燕都国家湿地公园、怀城文阁、燕岩风景区、怀集三岳自然保护区、见龙居等旅游景点，有新岗红茶、桥头石山羊、怀集茶杆竹、岗坪切粉、谭脉西瓜、汶朗蜜柚等特产，有怀集龙鱼舞、怀集贵儿戏、怀集舞壮狮、怀集春牛舞、端砚制作技艺等民俗文化。', NULL, '2023-04-19 13:17:19', 0, 0, 1, 1);
INSERT INTO `rms_article` VALUES (10, '去温泉度假村，放松身心，感受大自然的美妙', '温泉度假村是度假胜地中的一种，它以温泉为主要特色，有着泡温泉、按摩、SPA、泡澡等休闲项目。最近，我和朋友们去了一家温泉度假村度假，这次旅行真是让人感到身心放松，对于现代人来说，定期去度假是必不可少的，尤其是去温泉度假村更是一种享受。\n\n当我们踏进温泉度假村，第一印象就是一片绿树成荫，时而会传来鸟儿的叽叽喳喳声，让人顿时感觉到轻松与舒适。然后，我们来到了室内泳池，水温保持在恒定的27度左右，泳池四周还有舒适的躺椅、沙发，可以无忧地晒晒太阳，享受阳光。之后，我们尝试了泡澡，有按摩浴池和室外泡温泉，觉得身体被温水轻轻包裹着，一股暖流顿时涌上来，感觉到整个人都放松了下来。\n\n在饮食方面，这家温泉度假村在保证健康饮食的同时，还有不少特色美食推荐，口感、营养、色香味俱佳，真心值得一尝。\n\n总的来说，去温泉度假村可以让身心放松，感受大自然的魅力，还可以给压力疲惫的身体一次释放的机会，建议每个人都要时不时地来一次这样的度假体验。', NULL, '2023-04-19 13:19:54', 0, 0, 4, 1);
INSERT INTO `rms_article` VALUES (11, '温泉度假村之旅', '去统景温泉度假村，是一次非常棒的体验。这里的空气清新，景色迷人，有着大片的绿地和壮阔的山脉，让人心旷神怡。在这里，最值得去一探究竟的是温泉。\r\n\r\n温泉是度假村的一大亮点，其水质清澈，色泽晶莹，对皮肤很有保养作用。入温泉前，可以先泡一下脚底，让身体慢慢适应，入泉后挑选合适的水温，然后享受它带来的放松和舒适。泡在温泉中，身心放松，感觉像是悬在天上，真的非常愉悦。\r\n\r\n除了温泉，度假村还有许多其他的娱乐项目，比如游泳、SPA、按摩等等。这里的伙食也非常美味，可以品尝到地道的美食，或者自己动手烹饪。\r\n\r\n总之，去统景温泉度假村是一次非常不错的体验。能够感受到自然、清新的气息，还能享受温泉的美妙，真的是人生中一段美好的经历。', NULL, '2023-04-19 13:22:20', 0, 0, 4, 1);

-- ----------------------------
-- Table structure for rms_car
-- ----------------------------
DROP TABLE IF EXISTS `rms_car`;
CREATE TABLE `rms_car`  (
  `id` int NOT NULL,
  `car_no` int NULL DEFAULT NULL COMMENT '车牌号',
  `car_brand` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态0使用1未使用2报废',
  `line` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '线路以地点（终点）-地点（其它）-地点（终点）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_car
-- ----------------------------

-- ----------------------------
-- Table structure for rms_feedback
-- ----------------------------
DROP TABLE IF EXISTS `rms_feedback`;
CREATE TABLE `rms_feedback`  (
  `id` int NOT NULL,
  `feedback_news` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '反馈信息',
  `questioner_id` int UNSIGNED NULL DEFAULT NULL COMMENT '提出者',
  `Respondent_id` int UNSIGNED NULL DEFAULT NULL COMMENT '回答者',
  `state` tinyint NULL DEFAULT NULL COMMENT '问题状态0未回答1回答未解决2已解决',
  `Satisfaction` tinyint NULL DEFAULT NULL COMMENT '提出者满意度',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questioner_id`(`questioner_id` ASC) USING BTREE,
  INDEX `Respondent_id`(`Respondent_id` ASC) USING BTREE,
  CONSTRAINT `rms_feedback_ibfk_1` FOREIGN KEY (`questioner_id`) REFERENCES `rms_tourist` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `rms_feedback_ibfk_2` FOREIGN KEY (`Respondent_id`) REFERENCES `rms_admin` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for rms_r_goods
-- ----------------------------
DROP TABLE IF EXISTS `rms_r_goods`;
CREATE TABLE `rms_r_goods`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `goods_price` decimal(10, 2) NULL DEFAULT NULL,
  `goods_brand` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `goods_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `goods_cates_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_cates_id`(`goods_cates_id` ASC) USING BTREE,
  CONSTRAINT `rms_r_goods_ibfk_1` FOREIGN KEY (`goods_cates_id`) REFERENCES `rms_rg_cate` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_r_goods
-- ----------------------------

-- ----------------------------
-- Table structure for rms_r_order
-- ----------------------------
DROP TABLE IF EXISTS `rms_r_order`;
CREATE TABLE `rms_r_order`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单编号',
  `order_state` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '订单状态0已预订1已入住2已结账3已取消预订',
  `room_id` int NULL DEFAULT NULL COMMENT '房间id（用于追踪查询）',
  `room_no` int NULL DEFAULT NULL COMMENT '房间号（适当冗余，用于简单查询）',
  `room_type_id` int NULL DEFAULT NULL COMMENT '房间类型id',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `tourist_id` int UNSIGNED NULL DEFAULT NULL COMMENT '游客id（主要个人查询）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tourist_id`(`tourist_id` ASC) USING BTREE,
  CONSTRAINT `rms_r_order_ibfk_1` FOREIGN KEY (`tourist_id`) REFERENCES `rms_tourist` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_r_order
-- ----------------------------
INSERT INTO `rms_r_order` VALUES (13, '1681926616547', 3, NULL, NULL, 1, NULL, 1);
INSERT INTO `rms_r_order` VALUES (14, '1681926715833', 3, NULL, NULL, 1, NULL, 1);
INSERT INTO `rms_r_order` VALUES (15, '1681978575721', 0, NULL, NULL, 1, NULL, 1);
INSERT INTO `rms_r_order` VALUES (16, '1681978593463', 0, NULL, NULL, 1, NULL, 1);
INSERT INTO `rms_r_order` VALUES (17, '1681985292888', 0, NULL, NULL, 1, NULL, 1);
INSERT INTO `rms_r_order` VALUES (18, '1682007308257', 0, NULL, NULL, 1, NULL, 1);
INSERT INTO `rms_r_order` VALUES (19, '1682007315239', 0, NULL, NULL, 1, NULL, 1);
INSERT INTO `rms_r_order` VALUES (20, '1682007323245', 0, NULL, NULL, 1, NULL, 1);
INSERT INTO `rms_r_order` VALUES (21, '1682007330430', 0, NULL, NULL, 1, NULL, 1);
INSERT INTO `rms_r_order` VALUES (22, '1682007336828', 0, NULL, NULL, 1, NULL, 1);
INSERT INTO `rms_r_order` VALUES (23, '1682103553476', 0, NULL, NULL, 1, NULL, 1);
INSERT INTO `rms_r_order` VALUES (24, '1682126547419', 0, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for rms_r_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `rms_r_orderdetail`;
CREATE TABLE `rms_r_orderdetail`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `order_id` int UNSIGNED NULL DEFAULT NULL COMMENT '订单id',
  `book_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '预订时间',
  `occupation_time` timestamp NULL DEFAULT NULL COMMENT '入住时间',
  `check_out_time` timestamp NULL DEFAULT NULL COMMENT '退房时间',
  `room_deposit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当时押金（房间/元）',
  `room_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '当时金额（天/元）',
  `total_days` tinyint NULL DEFAULT NULL COMMENT '总天数',
  `refund` decimal(10, 2) NULL DEFAULT NULL COMMENT '退还押金',
  `ID_card_passport` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证或护照',
  `linkman` varchar(92) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人名字',
  `linkphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `admin_id` int UNSIGNED NULL DEFAULT NULL COMMENT '办理人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id` ASC) USING BTREE,
  INDEX `admin_id`(`admin_id` ASC) USING BTREE,
  CONSTRAINT `rms_r_orderdetail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `rms_r_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rms_r_orderdetail_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `rms_admin` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_r_orderdetail
-- ----------------------------
INSERT INTO `rms_r_orderdetail` VALUES (11, 13, '2023-04-20 01:50:16', '2023-04-23 00:00:00', NULL, NULL, 200.00, NULL, NULL, '131231323', '林子韬', '19831373504', NULL);
INSERT INTO `rms_r_orderdetail` VALUES (12, 14, '2023-04-20 01:51:55', '2023-04-23 00:00:00', NULL, NULL, 400.00, NULL, NULL, '131231323', '林子韬', '19831373504', NULL);
INSERT INTO `rms_r_orderdetail` VALUES (13, 15, '2023-04-20 16:16:15', '2023-04-21 00:00:00', NULL, NULL, 200.00, NULL, NULL, '131231323', '林子韬', '19831373504', NULL);
INSERT INTO `rms_r_orderdetail` VALUES (14, 16, '2023-04-20 16:16:33', '2023-04-21 00:00:00', NULL, NULL, 500.00, NULL, NULL, '131231323', '林子韬', '19831373504', NULL);
INSERT INTO `rms_r_orderdetail` VALUES (15, 17, '2023-04-20 18:08:12', '2023-04-28 00:00:00', NULL, NULL, 2000.00, NULL, NULL, '131231323', '林子韬', '19831373504', NULL);
INSERT INTO `rms_r_orderdetail` VALUES (16, 18, '2023-04-21 00:15:08', '2023-04-27 00:00:00', NULL, NULL, 400.00, NULL, NULL, '131231323', '林子韬', '19831373504', NULL);
INSERT INTO `rms_r_orderdetail` VALUES (17, 19, '2023-04-21 00:15:15', '2023-04-28 00:00:00', NULL, NULL, 500.00, NULL, NULL, '131231323', '林子韬', '19831373504', NULL);
INSERT INTO `rms_r_orderdetail` VALUES (18, 20, '2023-04-21 00:15:23', '2023-04-29 00:00:00', NULL, NULL, 800.00, NULL, NULL, '131231323', '林子韬', '19831373504', NULL);
INSERT INTO `rms_r_orderdetail` VALUES (19, 21, '2023-04-21 00:15:30', '2023-04-28 00:00:00', NULL, NULL, 2200.00, NULL, NULL, '131231323', '林子韬', '19831373504', NULL);
INSERT INTO `rms_r_orderdetail` VALUES (20, 22, '2023-04-21 00:15:36', '2023-04-27 00:00:00', NULL, NULL, 600.00, NULL, NULL, '131231323', '林子韬', '19831373504', NULL);
INSERT INTO `rms_r_orderdetail` VALUES (21, 23, '2023-04-22 02:59:13', '2023-04-26 00:00:00', NULL, NULL, 200.00, NULL, NULL, '131231323', '林子韬', '19831373504', NULL);
INSERT INTO `rms_r_orderdetail` VALUES (22, 24, '2023-04-22 09:22:27', '2023-04-25 00:00:00', NULL, NULL, 200.00, NULL, NULL, '13123132', '林子韬', '19831373504', NULL);

-- ----------------------------
-- Table structure for rms_r_picture
-- ----------------------------
DROP TABLE IF EXISTS `rms_r_picture`;
CREATE TABLE `rms_r_picture`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `picture_no` int NULL DEFAULT NULL COMMENT '图片编号',
  `picture_adress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片地址',
  `type_id` int NULL DEFAULT NULL COMMENT '对应房间类型id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_r_picture
-- ----------------------------
INSERT INTO `rms_r_picture` VALUES (1, 1000, 'room/1000.png', 1);
INSERT INTO `rms_r_picture` VALUES (2, 1001, 'room/1001.png', 2);
INSERT INTO `rms_r_picture` VALUES (3, 1002, 'room/1002.png', 3);
INSERT INTO `rms_r_picture` VALUES (4, 1003, 'room/1003.png', 4);
INSERT INTO `rms_r_picture` VALUES (5, 1004, 'room/1004.png', 5);
INSERT INTO `rms_r_picture` VALUES (6, 1005, 'room/1005.png', 6);
INSERT INTO `rms_r_picture` VALUES (7, 1006, 'room/1006.png', 7);
INSERT INTO `rms_r_picture` VALUES (8, 1007, 'room/1007.png', 8);
INSERT INTO `rms_r_picture` VALUES (9, 1008, 'room/1008.png', 9);
INSERT INTO `rms_r_picture` VALUES (10, 1009, 'room/1009.png', 10);
INSERT INTO `rms_r_picture` VALUES (11, 10010, 'room/10010.png', 11);

-- ----------------------------
-- Table structure for rms_r_type
-- ----------------------------
DROP TABLE IF EXISTS `rms_r_type`;
CREATE TABLE `rms_r_type`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `r_type_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房间类型名',
  `r_type_introduction` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房间类型描述',
  `room_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '房间类型统一价格',
  `room_deposit` decimal(10, 2) NULL DEFAULT NULL COMMENT '房间类型统一押金',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_r_type
-- ----------------------------
INSERT INTO `rms_r_type` VALUES (1, '单人间', '面积一般为16~20平方米的房间，有卫生间和其他附属设备组成。房内设一张单人床。一些酒店推出的经济间或特惠间一般也属于单人间之列。', 200.00, 300.00);
INSERT INTO `rms_r_type` VALUES (2, '标准间', '房内设两张单人床或一张双人床的叫标准间，这样的房间适合住两位客人和夫妻同住，适合旅游团体住用。', 300.00, 400.00);
INSERT INTO `rms_r_type` VALUES (3, '商务间', '房内设两张单人床或一张双人床，一般情况房内都是可以上网的，来满足商务客人的需求。', 400.00, 500.00);
INSERT INTO `rms_r_type` VALUES (4, '豪华间/高级间', '房内也是设两张单人床或一张双人床，只是房间的装修，房内设施比标准间档次高，其价格也比标准间高一些。', 500.00, 500.00);
INSERT INTO `rms_r_type` VALUES (5, '行政间', '一张双人床，此类型房间单独为一楼层，并配有专用的商务中心，咖啡厅。', 500.00, 500.00);
INSERT INTO `rms_r_type` VALUES (6, '组合套间', '是一种根据需要专门设计的房间，每个房间都有卫生间。有的由两个对门的房组成;有的由中间有门有锁的隔壁两个房间组成;也有的由相邻的各有卫生间的三个房间组成。', 800.00, 1000.00);
INSERT INTO `rms_r_type` VALUES (7, '多套间', '由三至五间或更多房间组成，有两个卧室各带卫生间还有会客室、餐厅、办公室及厨房等，卧室内设特大号双人床。', 1000.00, 1000.00);
INSERT INTO `rms_r_type` VALUES (8, '高级套间', '由七至八间房组成的套间，走廊有小酒吧。两个卧室分开，男女卫生间分开，设有客厅、书房、会议室、随员室、警卫室、餐厅厨房设施，有的还有室内花园。', 2000.00, 1000.00);
INSERT INTO `rms_r_type` VALUES (9, '复式套间', '由楼上、楼下两层组成，楼上为卧室，面积较小，设有两张单人床或一张双人床。楼下设有卫生间和会客室，室内有活动沙发，同时可以拉开当床。', 2200.00, 1000.00);
INSERT INTO `rms_r_type` VALUES (10, '江景房', '可以看到西江三条支流汇聚', 600.00, 1000.00);
INSERT INTO `rms_r_type` VALUES (11, '山景房', '可以看到塔山风景', 600.00, 1000.00);

-- ----------------------------
-- Table structure for rms_rg_cate
-- ----------------------------
DROP TABLE IF EXISTS `rms_rg_cate`;
CREATE TABLE `rms_rg_cate`  (
  `id` int NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_rg_cate
-- ----------------------------
INSERT INTO `rms_rg_cate` VALUES (1, NULL, NULL);

-- ----------------------------
-- Table structure for rms_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `rms_role_permission`;
CREATE TABLE `rms_role_permission`  (
  `role_id` int UNSIGNED NOT NULL DEFAULT 1,
  `permission_id` int UNSIGNED NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_role_permission
-- ----------------------------
INSERT INTO `rms_role_permission` VALUES (4, 7);
INSERT INTO `rms_role_permission` VALUES (1, 2);
INSERT INTO `rms_role_permission` VALUES (1, 3);
INSERT INTO `rms_role_permission` VALUES (1, 4);
INSERT INTO `rms_role_permission` VALUES (1, 5);
INSERT INTO `rms_role_permission` VALUES (1, 6);
INSERT INTO `rms_role_permission` VALUES (1, 7);
INSERT INTO `rms_role_permission` VALUES (1, 8);
INSERT INTO `rms_role_permission` VALUES (1, 9);
INSERT INTO `rms_role_permission` VALUES (1, 10);
INSERT INTO `rms_role_permission` VALUES (2, 5);
INSERT INTO `rms_role_permission` VALUES (2, 10);
INSERT INTO `rms_role_permission` VALUES (3, 6);
INSERT INTO `rms_role_permission` VALUES (3, 10);
INSERT INTO `rms_role_permission` VALUES (1, 1);
INSERT INTO `rms_role_permission` VALUES (4, 10);
INSERT INTO `rms_role_permission` VALUES (5, 9);
INSERT INTO `rms_role_permission` VALUES (6, 8);
INSERT INTO `rms_role_permission` VALUES (6, 10);
INSERT INTO `rms_role_permission` VALUES (5, 10);

-- ----------------------------
-- Table structure for rms_room
-- ----------------------------
DROP TABLE IF EXISTS `rms_room`;
CREATE TABLE `rms_room`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '房间id',
  `room_no` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '房间号',
  `room_floor` tinyint NULL DEFAULT NULL COMMENT '所在楼层',
  `introduction` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房间描述',
  `room_state` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '房间状态：0空房间，1已分配',
  `hotel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属酒店',
  `type_id` int UNSIGNED NULL DEFAULT NULL COMMENT '房间类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1013 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_room
-- ----------------------------
INSERT INTO `rms_room` VALUES (2, '578', 2, '2pcTY1A16t', 1, '温馨酒店', 1);
INSERT INTO `rms_room` VALUES (3, '894', 8, 'Osve0MFBze', 2, '温馨酒店', 1);
INSERT INTO `rms_room` VALUES (5, '702', 1, 'lTsYHfiXNX', 2, '温馨酒店', 2);
INSERT INTO `rms_room` VALUES (7, '534', 7, 'qZpdkvge41', 2, '统景酒店', 2);
INSERT INTO `rms_room` VALUES (9, '786', 9, '9XOaYlbZO8', 1, '统景酒店', 2);
INSERT INTO `rms_room` VALUES (10, '103', 9, '8LkUZIxG9T', 0, '统景酒店', 3);
INSERT INTO `rms_room` VALUES (12, '342', 3, NULL, 0, '统景酒店', 1);
INSERT INTO `rms_room` VALUES (13, '171', 8, 'fOlw7Ba6DQ', 0, 'm0QqUGJ6f4', 5);
INSERT INTO `rms_room` VALUES (14, '475', 5, 'u6DFpQAbii', 1, 'CsrvyEasM3', 3);
INSERT INTO `rms_room` VALUES (15, '134', 5, 'CcBfM5A6m4', 0, 'k6BU9Q3ywv', 4);
INSERT INTO `rms_room` VALUES (16, '846', 5, 'VBdpftYbmM', 1, 'dRzkwIPtyk', 8);
INSERT INTO `rms_room` VALUES (17, '218', 4, '5ZqZP2BiRk', 1, 'VkLRWRKtLw', 4);
INSERT INTO `rms_room` VALUES (18, '152', 8, 'q69ovOfcY3', 2, '7Hwv47hMNk', 11);
INSERT INTO `rms_room` VALUES (19, '414', 6, 'svuIiGvDnG', 0, 'viu7PEFA5v', 8);
INSERT INTO `rms_room` VALUES (20, '814', 4, 'fPNIsmJjuS', 2, 'OYJj3OUWxA', 7);
INSERT INTO `rms_room` VALUES (21, '745', 7, 'W2961Ja53X', 1, 'WcaWBWDZRl', 3);
INSERT INTO `rms_room` VALUES (22, '676', 8, 'aYO2UXAVXo', 2, 'F84LgsSH7L', 8);
INSERT INTO `rms_room` VALUES (23, '577', 3, 'c9xjh93Qjs', 1, 'OsTpEA4Nw3', 4);
INSERT INTO `rms_room` VALUES (24, '471', 8, '4YDlG6P76S', 1, 'G1e5Z6jVdT', 8);
INSERT INTO `rms_room` VALUES (25, '189', 6, '9VEpBX3ZUG', 0, 'EtxVxeuXnI', 10);
INSERT INTO `rms_room` VALUES (26, '768', 8, 'FzLfj1v9X4', 1, 'hM8BPmqwzQ', 7);
INSERT INTO `rms_room` VALUES (27, '318', 3, 'rUo9KoSjEa', 1, 'HVkFFtG73M', 7);
INSERT INTO `rms_room` VALUES (28, '347', 8, 'ap2mVVbnT5', 2, 'ZPcrO6cK7X', 7);
INSERT INTO `rms_room` VALUES (29, '512', 9, 'QepzpiZUJH', 0, 'azugrh6Mmx', 2);
INSERT INTO `rms_room` VALUES (30, '664', 6, 'qf8Jx0IkZp', 1, 'AgWVHzayLe', 11);
INSERT INTO `rms_room` VALUES (31, '345', 2, 'HhylESGImF', 0, '9rNWlkU97o', 8);
INSERT INTO `rms_room` VALUES (32, '795', 2, 'puDCrx4AN6', 0, 'mi0h2yX7s3', 4);
INSERT INTO `rms_room` VALUES (33, '431', 4, 'gmbJK8Lzf5', 2, 'Bf9DZyyYKt', 7);
INSERT INTO `rms_room` VALUES (34, '381', 9, 'Rz26pxrPzY', 0, '4xbGk2Mnlw', 6);
INSERT INTO `rms_room` VALUES (35, '262', 5, 'imKctZh4bu', 1, 'ljX8W4K2v7', 5);
INSERT INTO `rms_room` VALUES (36, '766', 4, 'ZHBQeoyVMh', 2, 'zIxETSFe6V', 10);
INSERT INTO `rms_room` VALUES (37, '964', 1, 'krEajogjsT', 1, 'L8uWaXuR4y', 11);
INSERT INTO `rms_room` VALUES (38, '993', 4, 'i2ZOBA0e40', 1, 'PJVO2I73be', 4);
INSERT INTO `rms_room` VALUES (39, '783', 2, 'Di3pPAeTDq', 1, '90h2q2jshZ', 5);
INSERT INTO `rms_room` VALUES (40, '637', 5, 'APN7btfhCV', 1, 'NfHpy1VHIx', 9);
INSERT INTO `rms_room` VALUES (41, '356', 8, 'gotErG3nLO', 1, 'DR6pmwZ0Tw', 10);
INSERT INTO `rms_room` VALUES (42, '595', 1, 'bsM0H2pTOM', 1, 'sZxHq1NAkM', 7);
INSERT INTO `rms_room` VALUES (43, '329', 1, 'daFTCumKpC', 1, 'ylHBVzqgDb', 8);
INSERT INTO `rms_room` VALUES (44, '321', 3, 't1NJfH0VGn', 1, 'nVg6BlEDJ0', 3);
INSERT INTO `rms_room` VALUES (45, '278', 7, 'H5wkBZLQut', 0, 'nk999GHllC', 1);
INSERT INTO `rms_room` VALUES (46, '246', 8, 'TbbADdHysG', 1, 'r1LieAicoc', 6);
INSERT INTO `rms_room` VALUES (47, '717', 6, '1rwlEx9Rvw', 0, 'kfTfwPryyF', 11);
INSERT INTO `rms_room` VALUES (48, '853', 9, 'qDleUJ3myy', 2, 'Wr7S1jfvsi', 4);
INSERT INTO `rms_room` VALUES (49, '464', 3, 'hh3MpuIA7P', 1, 'mBxXODHaze', 7);
INSERT INTO `rms_room` VALUES (50, '991', 9, 'nUeO1wMPLu', 2, 'cF6e2VSeh9', 7);
INSERT INTO `rms_room` VALUES (51, '517', 10, 'z9L31iIfVB', 1, 'o4HGN9Bh9h', 9);
INSERT INTO `rms_room` VALUES (52, '682', 2, 'YHfdOFtfGs', 0, 'nv0WjiyZv9', 8);
INSERT INTO `rms_room` VALUES (53, '126', 3, 'JEPDzxaarV', 0, 'ZjqgJbS5dE', 6);
INSERT INTO `rms_room` VALUES (54, '836', 7, 'dRMxMmGM32', 2, 'hoLWxk3eq7', 10);
INSERT INTO `rms_room` VALUES (55, '349', 3, 'ajVTkVoEX5', 1, 'rXQx0S78Qz', 3);
INSERT INTO `rms_room` VALUES (56, '422', 5, 'QiqFRg7eDF', 1, '6CaA4Leva8', 1);
INSERT INTO `rms_room` VALUES (57, '847', 5, 'dJyHbexnYg', 0, 'fUZvsqVp12', 7);
INSERT INTO `rms_room` VALUES (58, '536', 8, '1UtmjqQixR', 1, 'RWDrKLrZyw', 8);
INSERT INTO `rms_room` VALUES (59, '518', 9, 'QGwPkeIkaY', 1, '2zzg4p8DnC', 6);
INSERT INTO `rms_room` VALUES (60, '737', 6, 'Mu8FUfisnv', 1, '1lbjDFCVgk', 8);
INSERT INTO `rms_room` VALUES (61, '453', 4, '2jtDXisfRy', 1, 'lPIwubAAXD', 9);
INSERT INTO `rms_room` VALUES (62, '912', 5, 'LKIOVdhMHL', 2, 'Eq4qGk6UaY', 6);
INSERT INTO `rms_room` VALUES (63, '948', 10, 'VG6jzKVXbj', 0, 'Ibwm3UNMGm', 10);
INSERT INTO `rms_room` VALUES (64, '877', 8, 'qPsgkoWSsX', 0, 'ViP8s1Yv8n', 3);
INSERT INTO `rms_room` VALUES (65, '314', 2, 'AS6Jc342tK', 1, 'cjNk9FZUJE', 8);
INSERT INTO `rms_room` VALUES (66, '167', 4, 'VqK3GqCI7m', 2, 'eFA73vWY7l', 3);
INSERT INTO `rms_room` VALUES (67, '911', 9, 'A2RLFjHZWE', 0, 'zaeZfIwRXC', 8);
INSERT INTO `rms_room` VALUES (68, '473', 2, 'GkUhi22pHD', 1, 'U7nPfLmeK0', 6);
INSERT INTO `rms_room` VALUES (69, '999', 7, 'Zs54wlEup4', 0, 'ZOQPyempGS', 4);
INSERT INTO `rms_room` VALUES (70, '192', 4, 'VrADVjElvJ', 1, 'LJm9IbKFDk', 9);
INSERT INTO `rms_room` VALUES (71, '785', 7, 'ghTP8BMxcZ', 2, 'BxOoEJ9CN6', 3);
INSERT INTO `rms_room` VALUES (72, '754', 2, 'qiBp0KUuNa', 1, 'zzeXZ8SKIy', 6);
INSERT INTO `rms_room` VALUES (73, '747', 1, 'euleeMK1p6', 1, 'XIahYNwnZb', 7);
INSERT INTO `rms_room` VALUES (74, '992', 9, 'AXcTovhKub', 1, 'XEjQDaybSY', 10);
INSERT INTO `rms_room` VALUES (75, '568', 2, 'COEL5xFqIT', 0, 'H82eO1TZn3', 1);
INSERT INTO `rms_room` VALUES (76, '514', 3, 'Ipjrt3iqUR', 2, 'm0qoFKyig2', 9);
INSERT INTO `rms_room` VALUES (77, '712', 1, 'sKYL4GQ0UR', 1, 'WJ16AuRg1k', 2);
INSERT INTO `rms_room` VALUES (78, '328', 7, 'krX5APq037', 1, '4HdaH6QzK2', 6);
INSERT INTO `rms_room` VALUES (79, '269', 7, 'raNSVZOKTT', 1, 'K68hSqeQBr', 10);
INSERT INTO `rms_room` VALUES (80, '931', 2, 'ACeQzUk3hX', 0, 'UFva0VUhKI', 6);
INSERT INTO `rms_room` VALUES (81, '568', 3, 'n3S9IkSSgG', 1, 'bAJLdrGs7L', 2);
INSERT INTO `rms_room` VALUES (82, '441', 5, 'eqSfMXu9sf', 2, 'Xp1qXAXtHu', 6);
INSERT INTO `rms_room` VALUES (83, '388', 5, 'hALNUqp0Nb', 1, 'c7gW9oDjTp', 3);
INSERT INTO `rms_room` VALUES (84, '717', 4, 'EoWkfFlBkD', 2, '5Pcawe9Omz', 2);
INSERT INTO `rms_room` VALUES (85, '871', 7, 'LWu6oWlb1k', 2, 'FwGvpro7gs', 10);
INSERT INTO `rms_room` VALUES (86, '528', 5, 'HgxnMEwe8d', 1, 'JLGII9M25F', 5);
INSERT INTO `rms_room` VALUES (87, '142', 7, 'N0rI8NOnY2', 0, 'UvSFQWxUp2', 4);
INSERT INTO `rms_room` VALUES (88, '716', 9, 'wg4CK0qyb4', 1, 'J9NPxDJ4u7', 2);
INSERT INTO `rms_room` VALUES (89, '367', 5, 'tYpWqK9BH4', 2, 'uWSeXHGCN0', 8);
INSERT INTO `rms_room` VALUES (90, '166', 2, 'oG2BDLBDwC', 2, 'xbEvg4Dhvv', 3);
INSERT INTO `rms_room` VALUES (91, '587', 2, 'DRxYb9P9PY', 1, 'OKbBuKzTiF', 5);
INSERT INTO `rms_room` VALUES (92, '465', 8, 'G4HEWvpHOz', 1, '0QxNv48xiM', 9);
INSERT INTO `rms_room` VALUES (93, '515', 3, 'aN16dCKvwO', 2, 'CbKf6NrirT', 3);
INSERT INTO `rms_room` VALUES (94, '696', 3, 'rdfPmcflnh', 2, 'JhbOZ4GUg4', 9);
INSERT INTO `rms_room` VALUES (95, '345', 3, 'K3qLFi4BSp', 1, 'IjmihUsVIz', 1);
INSERT INTO `rms_room` VALUES (96, '799', 3, 'M2VTSrzZwk', 1, 'G3I0OuGoC3', 3);
INSERT INTO `rms_room` VALUES (97, '571', 4, 'fKwAZxyVaO', 1, 'OJYRgtzyOs', 6);
INSERT INTO `rms_room` VALUES (98, '672', 4, 'yXXDPOZoli', 1, '78PM30iM4A', 3);
INSERT INTO `rms_room` VALUES (99, '285', 6, 'LCfJv4Hg49', 0, 'P3fdIasAJT', 4);
INSERT INTO `rms_room` VALUES (100, '376', 5, 'z29LtqfgC0', 2, 'Ux9m10pqc5', 10);
INSERT INTO `rms_room` VALUES (101, '988', 7, 'S9mW8rtQOU', 2, 'ZxMEkXE9X4', 9);
INSERT INTO `rms_room` VALUES (102, '547', 9, 'eSiLxn63Cc', 1, 'Uxdw2bSDG6', 10);
INSERT INTO `rms_room` VALUES (103, '425', 9, 'v1bDk9HYbD', 2, 'g0Z5wJVsBN', 6);
INSERT INTO `rms_room` VALUES (104, '639', 2, '3wc43MXMxt', 0, 'bB8iFoXifu', 3);
INSERT INTO `rms_room` VALUES (106, '112', 3, 'RpMrZrvNej', 1, 'lDxBNsSXOu', 2);
INSERT INTO `rms_room` VALUES (107, '585', 5, 'x25NvC5ZUq', 1, 'CBv0ZPBFCX', 10);
INSERT INTO `rms_room` VALUES (108, '484', 3, 'ogN6UVufaT', 1, 'pLKk7jYOEO', 8);
INSERT INTO `rms_room` VALUES (109, '611', 4, 'Q2YVeVOqP1', 0, 'Usjb20ZgMp', 2);
INSERT INTO `rms_room` VALUES (110, '188', 3, 'OtDIep7iCt', 1, 'QDCh8KYzUU', 4);
INSERT INTO `rms_room` VALUES (111, '483', 2, 'B5QiisLs4o', 2, 'ZFKvcVH58l', 6);
INSERT INTO `rms_room` VALUES (112, '313', 6, 'YVPuC2N7bL', 1, 'ykfXYsvgWr', 4);
INSERT INTO `rms_room` VALUES (113, '826', 2, '7okoFM0YKJ', 1, 'LqGHnh9bon', 8);
INSERT INTO `rms_room` VALUES (114, '875', 1, 'Sioia6fjXo', 1, 'mQdCIgnMTI', 8);
INSERT INTO `rms_room` VALUES (115, '644', 3, '9lomNv8Wws', 1, 'SVC4JToLYk', 4);
INSERT INTO `rms_room` VALUES (116, '693', 6, 'Kx5e6wpRTU', 2, 'eHS2EnaZ4G', 1);
INSERT INTO `rms_room` VALUES (117, '761', 2, '9rNMJ9yOvC', 1, 'HYG2gWiA29', 3);
INSERT INTO `rms_room` VALUES (118, '379', 2, 'bfSts0HgDI', 2, 'grkUestJWF', 4);
INSERT INTO `rms_room` VALUES (119, '255', 6, 'tds3glX1m2', 0, 'ShuVwdtQSR', 8);
INSERT INTO `rms_room` VALUES (120, '111', 5, 'ZrT1NKQ4dF', 1, '3x2h2NhH22', 3);
INSERT INTO `rms_room` VALUES (121, '251', 3, 'gFxLTOgWjG', 1, 'wlusZ2UsnZ', 6);
INSERT INTO `rms_room` VALUES (122, '146', 4, 'I0hCfLixR8', 0, 'GBpYmhzB4l', 5);
INSERT INTO `rms_room` VALUES (123, '242', 3, 'u0hKlWYbCZ', 1, 'NT5cK9G7lI', 4);
INSERT INTO `rms_room` VALUES (124, '311', 9, 'qo2z68gj82', 1, 'ebITLRguJs', 6);
INSERT INTO `rms_room` VALUES (125, '847', 2, 'dBsQFNLEjf', 0, 'ZdAB1P8V6L', 7);
INSERT INTO `rms_room` VALUES (126, '843', 4, 'ZNqyuo397O', 1, 'epwrrssRJJ', 4);
INSERT INTO `rms_room` VALUES (127, '172', 8, 'hqv9pT1UFi', 1, 'SMkZzDi1rA', 10);
INSERT INTO `rms_room` VALUES (128, '292', 8, '8RrDv4ICnX', 1, '8q5bgnxFf1', 10);
INSERT INTO `rms_room` VALUES (129, '418', 9, 'V2m6jUaPZL', 1, 'cCn38plBMs', 4);
INSERT INTO `rms_room` VALUES (130, '616', 9, 'iBEt8dTqcP', 1, 'NA3I6gIdhU', 6);
INSERT INTO `rms_room` VALUES (131, '112', 6, '6V3P1wOXtx', 0, 'mn8AoGiuec', 8);
INSERT INTO `rms_room` VALUES (132, '548', 6, 'MSpQcTbfpH', 2, 'tgsRhn3O3W', 7);
INSERT INTO `rms_room` VALUES (133, '817', 8, '9yQHaJsM0n', 2, 'EWputjX6MX', 2);
INSERT INTO `rms_room` VALUES (134, '444', 4, 'ED2GfKqqfR', 1, 'kNMe6Rgrd3', 4);
INSERT INTO `rms_room` VALUES (135, '332', 6, 'CkhKte7nrJ', 1, 'iB8tIxOwfy', 3);
INSERT INTO `rms_room` VALUES (136, '735', 1, 'qwFgzChy0t', 1, 'y2Wtlv1WvZ', 9);
INSERT INTO `rms_room` VALUES (137, '816', 8, '8FVfQxSdlE', 0, 'FwvD9toNNP', 10);
INSERT INTO `rms_room` VALUES (138, '917', 5, 'cwH4qH2bUI', 1, 'K1JBkTF1Fk', 8);
INSERT INTO `rms_room` VALUES (139, '639', 3, 'Oxr5YLNhqs', 1, 'DMOrsaL0ye', 11);
INSERT INTO `rms_room` VALUES (140, '652', 4, 'bB3Jb1vPVQ', 2, 'wuiOC7GMtT', 3);
INSERT INTO `rms_room` VALUES (141, '142', 4, 'xTiqMSzImL', 2, 'LWGqcaI7be', 4);
INSERT INTO `rms_room` VALUES (142, '961', 8, 'IwEabw5LfD', 2, 'ePqBwz5zvX', 5);
INSERT INTO `rms_room` VALUES (143, '391', 3, 'IRDk0tTzM6', 0, 'F89mbt9dR7', 1);
INSERT INTO `rms_room` VALUES (144, '296', 5, 'UlQuPtn4SL', 1, '36DRrkUGVW', 11);
INSERT INTO `rms_room` VALUES (145, '329', 5, 'lKqXarwV7x', 2, 'VxmO6IlGO7', 2);
INSERT INTO `rms_room` VALUES (146, '245', 8, '72HWoaQFpn', 1, 'i5nuLAcaA8', 3);
INSERT INTO `rms_room` VALUES (147, '774', 8, '4ZxZMoVJVz', 1, 'J9lo2acE0l', 4);
INSERT INTO `rms_room` VALUES (148, '417', 5, 'iayf7RQoHe', 2, 'rgKauZTxVK', 4);
INSERT INTO `rms_room` VALUES (149, '659', 9, 'RqvOyHdvzW', 0, 'Oj6MsmR69E', 6);
INSERT INTO `rms_room` VALUES (150, '196', 9, '1gB5HThDlI', 1, '1R0309J55d', 3);
INSERT INTO `rms_room` VALUES (151, '233', 7, 'p5mdikVUw8', 1, 'RfhEzYwVLx', 6);
INSERT INTO `rms_room` VALUES (152, '457', 7, 'IUbzO1F3kr', 0, 'tW1Bvz7R0g', 9);
INSERT INTO `rms_room` VALUES (153, '824', 6, 'tnmi0nv0V1', 1, 'sXFHXYhiwe', 9);
INSERT INTO `rms_room` VALUES (154, '998', 8, 'OSs0K9kYOl', 2, 'EEdCuqy8Ua', 8);
INSERT INTO `rms_room` VALUES (155, '418', 8, 'mJtC0zU9Sb', 1, '86XIkpsIun', 9);
INSERT INTO `rms_room` VALUES (156, '652', 1, '7GTIJbPn6g', 1, 'CyOEU7z3XE', 10);
INSERT INTO `rms_room` VALUES (157, '734', 9, 'a09aXJaFaX', 1, 'T0YGucMrjX', 10);
INSERT INTO `rms_room` VALUES (158, '634', 2, 'otg06ziCZ3', 1, 'UdncC4jVNI', 3);
INSERT INTO `rms_room` VALUES (159, '871', 5, 'gq69hZqIg8', 2, 'ebcnAEnyLV', 10);
INSERT INTO `rms_room` VALUES (160, '874', 4, 'esTDW6sh2W', 0, 'lOVUMjsClo', 4);
INSERT INTO `rms_room` VALUES (161, '148', 7, 'p1m0yix4Jd', 2, '4zq73md5Ac', 8);
INSERT INTO `rms_room` VALUES (162, '784', 2, 'Dz4rs27cfK', 2, 'VbH9ZeQHYN', 9);
INSERT INTO `rms_room` VALUES (163, '197', 2, 'V2Cs56QoyK', 0, 'fMJBcDl4NF', 2);
INSERT INTO `rms_room` VALUES (164, '127', 3, 'dpLW0M8vBT', 1, 'CxkbLmRXvZ', 6);
INSERT INTO `rms_room` VALUES (165, '623', 3, '4eBlt6Hidi', 2, 'NX4XMABEh3', 11);
INSERT INTO `rms_room` VALUES (166, '592', 8, '76I9M0Irws', 1, 'fWdI0J3oqi', 2);
INSERT INTO `rms_room` VALUES (167, '589', 5, 'B377PBpY6h', 1, 'qN8RB4d3T9', 9);
INSERT INTO `rms_room` VALUES (168, '751', 7, 'wEB5CVfZ7D', 1, 'Z1UpLFcMp5', 2);
INSERT INTO `rms_room` VALUES (169, '287', 2, 'UxAZwblhjZ', 1, 'sbRRkeXCeZ', 9);
INSERT INTO `rms_room` VALUES (170, '987', 5, '3mwM3wP4IF', 1, 'gUIrp4k0ol', 10);
INSERT INTO `rms_room` VALUES (171, '464', 9, 'gNy0UNnji3', 0, 'kbhfqvpGC3', 8);
INSERT INTO `rms_room` VALUES (172, '942', 8, 'WgBDyckGuH', 2, 'VVgoN5Tfo5', 4);
INSERT INTO `rms_room` VALUES (173, '919', 6, '3EUcLaDdBj', 1, 'OslvZozqDg', 11);
INSERT INTO `rms_room` VALUES (174, '425', 6, 'YGK3nBfj24', 0, '9Bnl4QETnC', 9);
INSERT INTO `rms_room` VALUES (175, '963', 2, 'tc1gjVfi1v', 2, 'NlbkpcyD8r', 9);
INSERT INTO `rms_room` VALUES (176, '525', 4, 'CFrjQYcrG7', 2, '8VFpZHwwOf', 9);
INSERT INTO `rms_room` VALUES (177, '447', 8, 't8CUczy5DL', 1, 'sry9XVzQCK', 10);
INSERT INTO `rms_room` VALUES (178, '981', 9, 'oNGBL1JMhr', 2, 'wDny8wfuCn', 6);
INSERT INTO `rms_room` VALUES (179, '366', 9, '0gPqVxr2ib', 2, 'e9gpCG2nqd', 3);
INSERT INTO `rms_room` VALUES (180, '542', 7, 'TcY4QKoKN4', 1, 'iQiFMjQU80', 3);
INSERT INTO `rms_room` VALUES (181, '749', 7, 'pJxheg5S7c', 0, 'YM4TRwohdD', 2);
INSERT INTO `rms_room` VALUES (182, '895', 5, 'DEJyccV342', 1, '0qWIM7l2UH', 3);
INSERT INTO `rms_room` VALUES (183, '785', 3, 'Y9ekxXtdJV', 0, 'tuen7sKTe2', 10);
INSERT INTO `rms_room` VALUES (184, '291', 4, 'kqNwqR3IEG', 1, 'POOTTewhSr', 3);
INSERT INTO `rms_room` VALUES (185, '514', 2, '6jh1A77z4I', 0, 'PpPNyrnAJv', 4);
INSERT INTO `rms_room` VALUES (186, '632', 8, 'xnerCjT6OP', 0, 'jCwWFisgx8', 8);
INSERT INTO `rms_room` VALUES (187, '481', 3, '1bISPfDQ4u', 1, 'PE8xvJsu0C', 6);
INSERT INTO `rms_room` VALUES (188, '724', 8, '2sHT6Tuz3S', 2, 'PH4eFbloc9', 1);
INSERT INTO `rms_room` VALUES (189, '511', 6, 'VfiLpStVQT', 1, 'mYeOEyhRsV', 6);
INSERT INTO `rms_room` VALUES (190, '333', 3, 'b0efuU7eOJ', 1, '24ghQ3wdXx', 9);
INSERT INTO `rms_room` VALUES (191, '828', 8, 'kUUcJTIM53', 1, 'mZgnUQWMdD', 4);
INSERT INTO `rms_room` VALUES (192, '594', 2, 'ptILCG6RnR', 2, 'NnlrURtbLz', 1);
INSERT INTO `rms_room` VALUES (193, '792', 8, 'VmTWLVqBD1', 0, 'f1l2Wot2MJ', 2);
INSERT INTO `rms_room` VALUES (194, '243', 6, 'JD8KxoPQEs', 1, 'nLFaud4usj', 7);
INSERT INTO `rms_room` VALUES (195, '586', 4, 'o5JW3zVuNG', 0, 'c4v0Wz6VBP', 4);
INSERT INTO `rms_room` VALUES (196, '379', 4, 'HIJMYseIB6', 1, 'L76u7dPl3L', 1);
INSERT INTO `rms_room` VALUES (197, '642', 3, '3wcd8vNCLW', 0, 'VbF4WIbxFI', 1);
INSERT INTO `rms_room` VALUES (198, '944', 1, 'LlqFOOuJwe', 2, 'MwSiWQL2SA', 10);
INSERT INTO `rms_room` VALUES (199, '443', 6, 'HAbshjDaJk', 0, 'P7oW0wKlU8', 5);
INSERT INTO `rms_room` VALUES (200, '437', 5, 'j6TcYWEm8F', 1, 'VTJ0PRunCW', 3);
INSERT INTO `rms_room` VALUES (201, '332', 2, 'wFIyMuutQs', 2, 'UgDymSsGn7', 11);
INSERT INTO `rms_room` VALUES (202, '457', 7, 'WuNWPLirBa', 1, 'rgTFN8bibg', 7);
INSERT INTO `rms_room` VALUES (203, '646', 5, 'vUYIzK9XtA', 2, 'id7mc8oQ5R', 1);
INSERT INTO `rms_room` VALUES (204, '952', 1, 'KGmML8ASOL', 0, 'GtvIvYok5S', 3);
INSERT INTO `rms_room` VALUES (205, '963', 2, 'vNcbHhwIRp', 0, 'Tn5uXECclQ', 10);
INSERT INTO `rms_room` VALUES (206, '998', 9, 'trb5y4OIBa', 0, 'GC93pXT1GE', 8);
INSERT INTO `rms_room` VALUES (207, '454', 9, 'sAJtFWVajo', 1, 'y81zQCduTo', 7);
INSERT INTO `rms_room` VALUES (208, '529', 6, 'ZCsTKBbyDR', 1, 'wsxGOkKG4i', 9);
INSERT INTO `rms_room` VALUES (209, '236', 4, '72k0VBchgl', 1, 'aqUfY9iNlz', 8);
INSERT INTO `rms_room` VALUES (210, '672', 2, 's33IwLYeiE', 1, 'yVsD2c5gvp', 3);
INSERT INTO `rms_room` VALUES (211, '433', 6, 'rZRP1JfJYi', 0, 'hqzanoap8x', 4);
INSERT INTO `rms_room` VALUES (212, '436', 2, 'YFSPPbhv78', 0, 'G8BUhNNibF', 8);
INSERT INTO `rms_room` VALUES (213, '121', 8, 'XUVKvf46it', 1, '0PBjIPjk7O', 7);
INSERT INTO `rms_room` VALUES (214, '591', 4, 'Oq4lS4m2ku', 2, 'TxDhQrDYTy', 3);
INSERT INTO `rms_room` VALUES (215, '644', 2, 'pfGHkjHTLZ', 0, 'k45GjvHaxQ', 2);
INSERT INTO `rms_room` VALUES (216, '431', 7, 'jHLlB8cF1d', 0, 'eTUhG9ShhW', 5);
INSERT INTO `rms_room` VALUES (217, '695', 4, '5IaRgNeKr6', 1, 'ZZbY2DC4IA', 4);
INSERT INTO `rms_room` VALUES (218, '272', 2, 'xNCxulwpNe', 1, 'CUkpvfsfLw', 7);
INSERT INTO `rms_room` VALUES (219, '649', 2, 'JrXngzOK9g', 1, '1Y3dPk0fUg', 10);
INSERT INTO `rms_room` VALUES (220, '968', 1, 'HPD9oEUHqw', 2, 'WCOWNpgTtH', 7);
INSERT INTO `rms_room` VALUES (221, '723', 6, '4IiTMReDAB', 1, 'qSY7NeTx6b', 7);
INSERT INTO `rms_room` VALUES (222, '259', 3, '210piGH8RK', 0, 'bJjTDGbUNL', 3);
INSERT INTO `rms_room` VALUES (223, '647', 9, 'bQeQEPmM07', 1, '8fV8f5EdHJ', 10);
INSERT INTO `rms_room` VALUES (224, '471', 1, 'POcFQO6dkG', 1, 'ZPKHTmBp33', 4);
INSERT INTO `rms_room` VALUES (225, '579', 9, 'FvzKNi9a2C', 2, '3INFUkTRJ2', 6);
INSERT INTO `rms_room` VALUES (226, '359', 6, 'FXXMC8TSuh', 2, 'xLmPSUpGfK', 7);
INSERT INTO `rms_room` VALUES (227, '471', 4, 'ORtseR4MsU', 1, 'aepmV2FYiX', 8);
INSERT INTO `rms_room` VALUES (228, '511', 2, '1212UG95Dq', 0, 'n6sQCVcJ16', 7);
INSERT INTO `rms_room` VALUES (229, '155', 6, '6bQ1CvI2wP', 2, 'GNsz2uKYIP', 3);
INSERT INTO `rms_room` VALUES (230, '854', 5, '0QugN187zS', 2, 'vvzZSXvaTR', 1);
INSERT INTO `rms_room` VALUES (231, '561', 7, 'eaxEtdbjDl', 1, 'juLoyBouDz', 6);
INSERT INTO `rms_room` VALUES (232, '395', 10, 'iyExP2pb1C', 0, 'yBkHlzu27F', 4);
INSERT INTO `rms_room` VALUES (233, '949', 4, '4i3kmhqtqY', 2, 'WB6EmyjILm', 3);
INSERT INTO `rms_room` VALUES (234, '748', 3, 'RG1lro6hN7', 1, 'eKjK0NMVFB', 6);
INSERT INTO `rms_room` VALUES (235, '212', 7, 'npBmuystPq', 2, 'iuzvv48QEl', 5);
INSERT INTO `rms_room` VALUES (236, '718', 6, 'lAySajEqWI', 1, 'fiFouqblIQ', 1);
INSERT INTO `rms_room` VALUES (237, '951', 5, 'jft8Mi4GiR', 1, 'CkuTFqstyz', 5);
INSERT INTO `rms_room` VALUES (238, '583', 9, 'DDzFZlerHi', 0, 'LbNrZbJau7', 2);
INSERT INTO `rms_room` VALUES (239, '275', 6, '8kwGtdoWgP', 2, 'lyiAXUvy8h', 5);
INSERT INTO `rms_room` VALUES (240, '395', 3, 'D2j2vQQrHU', 1, 'EDCONyRZ74', 3);
INSERT INTO `rms_room` VALUES (241, '323', 7, 'SzwbaNlynS', 1, 'FaG6ov78S7', 9);
INSERT INTO `rms_room` VALUES (242, '853', 8, 'QxeKkj4itL', 1, 'yBzTeGgUGf', 9);
INSERT INTO `rms_room` VALUES (243, '983', 7, 'eAoFiiKZT3', 2, 'cx1aoAG1Os', 3);
INSERT INTO `rms_room` VALUES (244, '244', 6, 'siM6ApGSL0', 2, 'JaHMPa1eAq', 1);
INSERT INTO `rms_room` VALUES (245, '255', 3, 'LZNKupWib4', 1, '4hj3IbmAbP', 8);
INSERT INTO `rms_room` VALUES (246, '339', 8, '6PYen4oMxB', 1, 'xlyiYaX49X', 2);
INSERT INTO `rms_room` VALUES (247, '254', 7, '7W20VCtdwX', 0, 'wo0g1vZitP', 7);
INSERT INTO `rms_room` VALUES (248, '396', 4, 'EPoZABY78U', 2, 'SyM4nA02OA', 10);
INSERT INTO `rms_room` VALUES (249, '181', 4, 'z5dj9S9NG6', 1, 'qfphlKeBr0', 9);
INSERT INTO `rms_room` VALUES (250, '674', 7, '7L71u6OnGe', 2, 'esO0fO3RkN', 4);
INSERT INTO `rms_room` VALUES (251, '343', 4, '7C4bnli80A', 0, 'HVroQd5Y1r', 2);
INSERT INTO `rms_room` VALUES (252, '164', 8, 'ZYA0O0P4wI', 0, '11FGmTkX4w', 10);
INSERT INTO `rms_room` VALUES (253, '688', 1, 'adfsgfymZD', 2, 's8dYcK4SFr', 10);
INSERT INTO `rms_room` VALUES (254, '295', 9, '5QG6XAdPRB', 2, '3WUKFK4liw', 10);
INSERT INTO `rms_room` VALUES (255, '542', 9, 'lLpIG96kVj', 2, 'rkHw6ishuS', 9);
INSERT INTO `rms_room` VALUES (256, '674', 4, 'lj1lUZYzJz', 2, 'nNK1dMAQJu', 7);
INSERT INTO `rms_room` VALUES (257, '423', 4, '81nxsjS4yP', 1, '3SVluSg4p5', 2);
INSERT INTO `rms_room` VALUES (258, '485', 8, 'EtuSaXhlAR', 1, '94bFLuTwxP', 9);
INSERT INTO `rms_room` VALUES (259, '946', 9, 'sKpZqO8GvN', 1, 'x2uUc5FQKx', 6);
INSERT INTO `rms_room` VALUES (260, '646', 5, '3bhkcQOu0Z', 1, 'bFiKIdHinz', 8);
INSERT INTO `rms_room` VALUES (261, '515', 3, 's7KntdMU8Q', 0, 'RVaGnqaRJV', 7);
INSERT INTO `rms_room` VALUES (262, '264', 1, 'G47FAZBnHP', 0, 'h8uAf7xxqZ', 6);
INSERT INTO `rms_room` VALUES (263, '813', 5, '2aMFtKzCC4', 1, '4me0BlOOaW', 5);
INSERT INTO `rms_room` VALUES (264, '731', 6, '48XYTYAFLT', 1, '0Eztuw1RgV', 4);
INSERT INTO `rms_room` VALUES (265, '597', 7, 'Zqswv2FSrD', 1, 'xumQ6zImsw', 4);
INSERT INTO `rms_room` VALUES (266, '834', 5, 'S6sk6LiT0Z', 2, 'eKjqu9h88r', 3);
INSERT INTO `rms_room` VALUES (267, '457', 2, 'g5aPH9cV5Q', 1, 'fcw18NsJ3D', 9);
INSERT INTO `rms_room` VALUES (268, '896', 3, '9YpnWsyPTl', 0, '7vAbbDpWLd', 6);
INSERT INTO `rms_room` VALUES (269, '638', 8, 'Kemi4NwCmx', 1, 'qKF5vQr6PY', 10);
INSERT INTO `rms_room` VALUES (270, '752', 1, 'G5WF2FhK6B', 1, 'UY5sIHwe99', 2);
INSERT INTO `rms_room` VALUES (271, '579', 3, 'lDGwRG90Pd', 2, 'jqnCO4zZRf', 8);
INSERT INTO `rms_room` VALUES (272, '416', 5, '00YLOZxl4M', 2, '3ribYZJQph', 6);
INSERT INTO `rms_room` VALUES (273, '732', 5, 'htA7SvjSQm', 1, 'e74n754rln', 10);
INSERT INTO `rms_room` VALUES (274, '282', 7, '2wlv5v1VTP', 0, 'H3BZwIPe43', 6);
INSERT INTO `rms_room` VALUES (275, '818', 9, '7aEgFMec86', 1, 'n5vkp5iiD0', 4);
INSERT INTO `rms_room` VALUES (276, '574', 6, 'gQq2D5aN8y', 2, 'KKvFBD8Cq6', 3);
INSERT INTO `rms_room` VALUES (277, '122', 4, '8lPPvTJu7N', 0, 'CpDN4Q8s8l', 3);
INSERT INTO `rms_room` VALUES (278, '388', 4, '4bqKaWVTLB', 1, 'QPpaBIGMw8', 2);
INSERT INTO `rms_room` VALUES (279, '866', 8, '5R5jbLVvB4', 1, 'aHpzqbTRO1', 4);
INSERT INTO `rms_room` VALUES (280, '433', 5, 'Scf7aWSZdn', 0, '1ImCOJg4sH', 1);
INSERT INTO `rms_room` VALUES (281, '226', 4, 'DVPSy9xitE', 0, 'O6mSUmYvE6', 7);
INSERT INTO `rms_room` VALUES (282, '524', 5, 'yGDCFAHu9z', 1, 'tH3hBNZViC', 4);
INSERT INTO `rms_room` VALUES (283, '311', 5, 'KCS9wVVgL3', 1, 'DvQHs0Qvsb', 4);
INSERT INTO `rms_room` VALUES (284, '893', 6, '1RCwbt075d', 0, '9NZsituIep', 7);
INSERT INTO `rms_room` VALUES (285, '867', 4, 'm6xggQdKRS', 1, 'PngbXBDMLa', 10);
INSERT INTO `rms_room` VALUES (286, '837', 4, 'Bz93uRmsXU', 0, 'chRhUt7np9', 8);
INSERT INTO `rms_room` VALUES (287, '511', 9, 'TFDp5m9zuR', 0, 'WCWBS7OlGt', 9);
INSERT INTO `rms_room` VALUES (288, '716', 6, 'IMSrL40O8F', 2, 'pCpCNsKdbv', 4);
INSERT INTO `rms_room` VALUES (289, '825', 8, 'FJfwWtMMLK', 0, '21VMdkSKRQ', 4);
INSERT INTO `rms_room` VALUES (290, '799', 4, 'I0ORz4r1eK', 2, 'FvdvKohhK6', 5);
INSERT INTO `rms_room` VALUES (291, '144', 3, 'fqNlPVf1OR', 1, 'Te2lJfz8CC', 6);
INSERT INTO `rms_room` VALUES (292, '858', 4, 'oKfQVtBo8p', 1, 'H0qoYpQugu', 4);
INSERT INTO `rms_room` VALUES (293, '231', 3, 'uTh3ktphg2', 0, '5iW6Z4KCKb', 10);
INSERT INTO `rms_room` VALUES (294, '799', 10, 'ubN70eto1u', 0, 'LCDupmPd29', 4);
INSERT INTO `rms_room` VALUES (295, '427', 3, 'Q7AFdd7GOh', 1, 'U4R93XvoVv', 7);
INSERT INTO `rms_room` VALUES (296, '352', 9, 'JrHGRp1HL3', 1, 'Th64R90Xn2', 2);
INSERT INTO `rms_room` VALUES (297, '327', 3, 'lVSHc2xQgM', 2, 'HqYikPCLWc', 9);
INSERT INTO `rms_room` VALUES (298, '911', 8, 'As9S393Yt4', 1, 'UVXCUkk8Wz', 7);
INSERT INTO `rms_room` VALUES (299, '748', 7, 'YTN7VQZnCE', 1, '6jGom7sBey', 4);
INSERT INTO `rms_room` VALUES (300, '594', 3, '83wxljdg1k', 2, 'ULIoPcUq6F', 5);
INSERT INTO `rms_room` VALUES (301, '439', 7, 'CiIsMZQhIt', 1, 'IjmqZUTRsF', 3);
INSERT INTO `rms_room` VALUES (302, '654', 7, 'lLKtc9xcUK', 1, 'F4p1HlmGg7', 4);
INSERT INTO `rms_room` VALUES (303, '379', 9, 'pUh8OUMOlb', 0, 'txABDI8dpS', 9);
INSERT INTO `rms_room` VALUES (304, '516', 9, 'aIb813G7tA', 0, 'e2baJDqkm2', 3);
INSERT INTO `rms_room` VALUES (305, '198', 7, 'fb2UZL0cOx', 1, 'u6yVEazxlT', 3);
INSERT INTO `rms_room` VALUES (306, '425', 7, '8SgI4bBZyh', 2, '1yCPpUsxDP', 4);
INSERT INTO `rms_room` VALUES (307, '691', 2, 'W7WibkFQoD', 1, '43DBvYiHkV', 6);
INSERT INTO `rms_room` VALUES (308, '888', 5, '1MMFppY471', 2, 'kw5l5BGErr', 11);
INSERT INTO `rms_room` VALUES (309, '578', 5, 's53ACFcDWQ', 1, 'KHexKv3DKW', 4);
INSERT INTO `rms_room` VALUES (310, '934', 3, 'opk1etTOLa', 1, '8EEQcuI4Pi', 4);
INSERT INTO `rms_room` VALUES (311, '678', 2, 'i5zWwgbEbS', 1, 'GsGJDrMgO3', 1);
INSERT INTO `rms_room` VALUES (312, '235', 4, 'AEL4AYeSY5', 0, 'TbmooTZJ4N', 5);
INSERT INTO `rms_room` VALUES (313, '479', 4, 'IkmuSg3wMA', 0, 'Sgx5z7tdet', 7);
INSERT INTO `rms_room` VALUES (314, '295', 7, 'OqL3BHE9Yi', 0, 'IjyZAn898l', 1);
INSERT INTO `rms_room` VALUES (315, '732', 6, 'E2iU8jjTPJ', 1, 'OEoOFph0hr', 11);
INSERT INTO `rms_room` VALUES (316, '949', 2, 'kciT2ome8S', 1, 'LGy6FWBdtF', 7);
INSERT INTO `rms_room` VALUES (317, '324', 8, 'xjVBIRsq1u', 1, 'r5U7h1Kvk4', 10);
INSERT INTO `rms_room` VALUES (318, '188', 5, '7FSOEzKrPP', 1, 'TGV5G1jQ25', 7);
INSERT INTO `rms_room` VALUES (319, '826', 6, 'qNM7kCHCbN', 0, 'ikJoBlewmP', 5);
INSERT INTO `rms_room` VALUES (320, '949', 6, 'Y71w7M7e0G', 2, 'vMHnP4tCng', 3);
INSERT INTO `rms_room` VALUES (321, '236', 4, 'Ovi4ZdnpVq', 0, 'xqdzL01H4I', 8);
INSERT INTO `rms_room` VALUES (322, '642', 5, 'LQhe2QPsqn', 0, 'BoRXBi2L1C', 9);
INSERT INTO `rms_room` VALUES (323, '987', 6, 'rDAj8Jtw5X', 0, 'WXPvMob6Tr', 6);
INSERT INTO `rms_room` VALUES (324, '543', 3, 'cFtgYYwYnS', 1, 'wfCuPcTJ7W', 5);
INSERT INTO `rms_room` VALUES (325, '868', 8, 'zHeB0OZqS0', 1, '4JKgnyvhu1', 5);
INSERT INTO `rms_room` VALUES (326, '827', 5, 'jkAETNpT2J', 2, 'qXG6JNAJaX', 11);
INSERT INTO `rms_room` VALUES (327, '336', 5, 'FIjpex0fmC', 1, 'qAzNzU7lfB', 8);
INSERT INTO `rms_room` VALUES (328, '987', 2, 'AcPgShVmyC', 2, '6ki0SIXzmB', 4);
INSERT INTO `rms_room` VALUES (329, '346', 4, '2PDmYYx1Ff', 1, 'siTpTVHoiz', 8);
INSERT INTO `rms_room` VALUES (330, '932', 5, '74AncroZd7', 2, 'kvpuzQwtDb', 2);
INSERT INTO `rms_room` VALUES (331, '159', 10, 'KieJc5q1zS', 0, 'tHHArzxCae', 4);
INSERT INTO `rms_room` VALUES (332, '859', 2, 'OKNVjgZbrN', 1, 'E2HIX67zcI', 8);
INSERT INTO `rms_room` VALUES (333, '851', 7, 'sJTSlEruFO', 0, 'xfwe2v7mtZ', 5);
INSERT INTO `rms_room` VALUES (334, '138', 7, 'nyPKXI9ELm', 0, 'j4h055KwFL', 9);
INSERT INTO `rms_room` VALUES (335, '271', 9, 'MIZFIGfhWP', 1, '3KTUFTeQ8h', 8);
INSERT INTO `rms_room` VALUES (336, '541', 5, 'buiHjIKsum', 0, '4j0XWl5mEz', 6);
INSERT INTO `rms_room` VALUES (337, '877', 10, 'vCSJycTkFe', 2, 'Wt2RYjoKZi', 2);
INSERT INTO `rms_room` VALUES (338, '783', 6, 'ox5DrSNDgc', 1, 'xWhwbZHloj', 8);
INSERT INTO `rms_room` VALUES (339, '341', 3, '5DleAOYNEA', 0, 'ED2MK5lWs2', 3);
INSERT INTO `rms_room` VALUES (340, '137', 6, 'wXAj5HfEcn', 2, 'MesHsN5OL6', 7);
INSERT INTO `rms_room` VALUES (341, '542', 3, 'yMXTlddZ9Y', 1, 'USMsaDINVH', 7);
INSERT INTO `rms_room` VALUES (342, '699', 7, 'kOcHoIV1rS', 1, 'i69ulyXaZy', 3);
INSERT INTO `rms_room` VALUES (343, '524', 6, 'KslJL1GO64', 1, 'iG6oRLSehE', 7);
INSERT INTO `rms_room` VALUES (344, '957', 6, '6bT4nmceTH', 0, 'PFSbLQBKIV', 4);
INSERT INTO `rms_room` VALUES (345, '359', 4, 'TuLu2wp1iL', 2, 'ZhEaoogFww', 2);
INSERT INTO `rms_room` VALUES (346, '217', 4, 'ca4UKHytnh', 1, 'VpqhUwlGEA', 6);
INSERT INTO `rms_room` VALUES (347, '618', 2, 'T2XejLqXZ5', 1, 'BtGQpLvcpo', 5);
INSERT INTO `rms_room` VALUES (348, '299', 2, 'wnE52q8GzL', 2, 'DqEOjNbeuC', 5);
INSERT INTO `rms_room` VALUES (349, '922', 9, 'uRaFYXjLeU', 2, 'f9kbjg8KxK', 5);
INSERT INTO `rms_room` VALUES (350, '345', 8, 'ODfyisieSP', 1, 'HzCKf3f5g3', 3);
INSERT INTO `rms_room` VALUES (351, '957', 3, 'RlRK1K1urw', 2, 'PHfHX40F0B', 9);
INSERT INTO `rms_room` VALUES (352, '793', 8, '1D5fa41FqB', 0, 'nebaEAAwSI', 4);
INSERT INTO `rms_room` VALUES (353, '434', 7, '0NaMUaecCe', 1, 'UOfawLhmfN', 2);
INSERT INTO `rms_room` VALUES (354, '721', 6, 'KgkPbG9cvc', 0, 'OJAFpnMzIr', 2);
INSERT INTO `rms_room` VALUES (355, '727', 10, '1vZkm6P9XW', 2, 'EDhp6zfWKM', 7);
INSERT INTO `rms_room` VALUES (356, '493', 3, 'cRxwsFwZVn', 0, 'XM4BWRAC1H', 10);
INSERT INTO `rms_room` VALUES (357, '946', 3, '2iiOynDf1F', 2, 'kqpdArtdEW', 6);
INSERT INTO `rms_room` VALUES (358, '186', 4, 'zO30vuvi3Y', 1, 'RQKVrAuryg', 7);
INSERT INTO `rms_room` VALUES (359, '582', 3, '9bXlM7p5Xt', 2, 'ttpbbzPOKv', 4);
INSERT INTO `rms_room` VALUES (360, '134', 6, 'B7kU5XQEOL', 0, 'f8OyuPSEKA', 3);
INSERT INTO `rms_room` VALUES (361, '792', 7, 'A56ewLQDMM', 1, '8teU4TZ57e', 3);
INSERT INTO `rms_room` VALUES (362, '727', 8, 'sjHPuID9d7', 1, 'WJ4CyLEUIJ', 2);
INSERT INTO `rms_room` VALUES (363, '233', 8, 'IciSHFpJx6', 1, '9e8uOJ2iTV', 3);
INSERT INTO `rms_room` VALUES (364, '529', 2, 'VjJKKFZacm', 1, 'ZKf0TXLzVO', 3);
INSERT INTO `rms_room` VALUES (365, '682', 3, 'cVrDYdifRJ', 0, 'VASsLDZqu6', 4);
INSERT INTO `rms_room` VALUES (366, '522', 10, 'iwPAzRZiDF', 1, 'pqwuux1epn', 8);
INSERT INTO `rms_room` VALUES (367, '112', 6, 'ESbRjlxP7l', 1, 'C8BpfdTr1b', 3);
INSERT INTO `rms_room` VALUES (368, '688', 1, '7ERYVfeAdm', 1, 'pvKxgIdAXh', 7);
INSERT INTO `rms_room` VALUES (369, '657', 5, 'WhvNkf23ZR', 0, '30tUkNMhbq', 7);
INSERT INTO `rms_room` VALUES (370, '587', 8, 'eAZfZ8oo7x', 0, 'pBJQHHIMfu', 2);
INSERT INTO `rms_room` VALUES (371, '435', 2, 'WNS6LzyF1z', 0, 'CjIG9Jfj3O', 4);
INSERT INTO `rms_room` VALUES (372, '348', 7, 'TeEizN95eZ', 1, 'IRazNRDYdV', 5);
INSERT INTO `rms_room` VALUES (373, '911', 6, '0U3Up4OrCe', 2, 'OevqlwNwiY', 3);
INSERT INTO `rms_room` VALUES (374, '792', 9, 'z8vb2ek8aA', 2, 'SotLM0jpXL', 6);
INSERT INTO `rms_room` VALUES (375, '348', 8, 'uOiBQEy7f2', 2, 'A4YfXOuHNQ', 10);
INSERT INTO `rms_room` VALUES (376, '566', 1, 'd7JhYnYU3r', 1, 'C5k1mZEyYc', 9);
INSERT INTO `rms_room` VALUES (377, '299', 4, 'wXPE2uJvR7', 1, 'M2jMW3X6C5', 9);
INSERT INTO `rms_room` VALUES (378, '213', 4, 'Y424Ge0JOS', 1, 's5JOKr5big', 10);
INSERT INTO `rms_room` VALUES (379, '629', 9, 'xQj8ghQvpq', 1, 'taixgcL9Ea', 5);
INSERT INTO `rms_room` VALUES (380, '316', 5, 'goFjQixlUf', 1, 'xDXHI1g3l4', 8);
INSERT INTO `rms_room` VALUES (381, '549', 6, 'cBiePWLwcZ', 0, 'mqFh37kURe', 9);
INSERT INTO `rms_room` VALUES (382, '686', 7, 'VN2iDXKfwo', 1, 'zlvUJexyg4', 7);
INSERT INTO `rms_room` VALUES (383, '513', 3, 'pTkX6SsfL1', 1, 'k7aAx1qNAJ', 3);
INSERT INTO `rms_room` VALUES (384, '315', 1, 'yGJ9PdusIm', 2, 'PRIwsGOYiE', 5);
INSERT INTO `rms_room` VALUES (385, '433', 9, 'SjQ53VTO5r', 1, '8XES84NEzl', 6);
INSERT INTO `rms_room` VALUES (386, '857', 4, 'mvWGojSVdY', 2, 'QW3h2uqigp', 4);
INSERT INTO `rms_room` VALUES (387, '236', 1, '5r6nFqNNTG', 2, '6OxigMnccT', 2);
INSERT INTO `rms_room` VALUES (388, '676', 7, 'uZWIyhxWiH', 0, '1aEXgPlm0v', 8);
INSERT INTO `rms_room` VALUES (389, '678', 2, 'oFvUJEIGKN', 1, 'J8c6CbqXqr', 6);
INSERT INTO `rms_room` VALUES (390, '122', 5, 'Za9ITczGKd', 1, '9RKwANMHel', 11);
INSERT INTO `rms_room` VALUES (391, '521', 2, '7gPop5g4DO', 1, 'h3wr3N5zyC', 4);
INSERT INTO `rms_room` VALUES (392, '971', 7, 'AmTxJ1zUnL', 2, 'cwxM1ghVKE', 4);
INSERT INTO `rms_room` VALUES (393, '859', 5, 'elTIhAcr29', 1, 'RZxoGfIzRz', 2);
INSERT INTO `rms_room` VALUES (394, '711', 7, '8abjRhfKn0', 2, 'ZGYRk7R9Lp', 8);
INSERT INTO `rms_room` VALUES (395, '546', 9, 'KFYLAzLEI1', 1, 'gKAj59dGn2', 8);
INSERT INTO `rms_room` VALUES (396, '694', 6, 'OnuadSi1Lv', 1, 'nOcQ2bT9qw', 3);
INSERT INTO `rms_room` VALUES (397, '766', 6, 'Q2ez6LuL4m', 1, 'fpV3nfsgKw', 2);
INSERT INTO `rms_room` VALUES (398, '835', 7, 'g5PQenAyc8', 1, 'DbIybwGm4z', 6);
INSERT INTO `rms_room` VALUES (399, '896', 3, '8swGNsxxtV', 2, 'xISrMipmWY', 5);
INSERT INTO `rms_room` VALUES (400, '452', 8, 'gYQOwdz1Ls', 1, 'fJOr9RFQvF', 3);
INSERT INTO `rms_room` VALUES (401, '186', 6, 'YQcLYuWo5H', 0, 'km9633ImBw', 2);
INSERT INTO `rms_room` VALUES (402, '733', 7, 'lwBD5bR7Bm', 2, 'auZRsSV3qM', 3);
INSERT INTO `rms_room` VALUES (403, '537', 5, 'zzTYz1Ltkt', 1, 'WDp8w0xp1x', 8);
INSERT INTO `rms_room` VALUES (404, '992', 8, 'XjnLtqQofC', 1, 'taHvWRpQcl', 5);
INSERT INTO `rms_room` VALUES (405, '685', 9, 'BSMNZ0ICSM', 1, 'cY2iwXrRRW', 4);
INSERT INTO `rms_room` VALUES (406, '588', 8, '4Go6FU6idx', 1, 'sp9FuQQLyG', 6);
INSERT INTO `rms_room` VALUES (407, '284', 10, 'Q9OmfwfU3o', 1, '42gjoansI9', 2);
INSERT INTO `rms_room` VALUES (408, '164', 5, 'y3zMmEbpJm', 2, '5uCKmWdjrB', 3);
INSERT INTO `rms_room` VALUES (409, '369', 9, 'LrtILAZIDY', 1, 'YcoIHQdWiE', 5);
INSERT INTO `rms_room` VALUES (410, '835', 7, '9IZ9LsHj62', 0, 'gOTF1lJMbQ', 8);
INSERT INTO `rms_room` VALUES (411, '212', 3, 'LD2K8XtoyD', 2, '8gQYPZfy9X', 2);
INSERT INTO `rms_room` VALUES (412, '798', 10, 'PrdFKUe6yB', 1, 'vpTBnOMCAv', 10);
INSERT INTO `rms_room` VALUES (413, '892', 2, 'kI3jrRy9Uu', 2, 'm4hus5f8Gi', 2);
INSERT INTO `rms_room` VALUES (414, '971', 3, 'QWwnfaSHg3', 0, 'LLTSWBYQVm', 8);
INSERT INTO `rms_room` VALUES (415, '291', 5, 'luOrg2pypm', 1, 'Ww7yK2IIWY', 7);
INSERT INTO `rms_room` VALUES (416, '521', 3, 'B8MP8QIZM2', 0, 'VOt445M7zI', 8);
INSERT INTO `rms_room` VALUES (417, '988', 2, '8bK02Vh4QF', 1, 'j0RKp5PjxO', 5);
INSERT INTO `rms_room` VALUES (418, '791', 9, 'aqnxum2jIg', 2, 'toQioKqu2c', 9);
INSERT INTO `rms_room` VALUES (419, '699', 4, '8GYqPanY4g', 2, 'xFqXCKSBNp', 8);
INSERT INTO `rms_room` VALUES (420, '319', 4, 'clis7EIaRS', 1, 'mqvBj8fD9d', 7);
INSERT INTO `rms_room` VALUES (421, '644', 3, 'b0g7BQTMsE', 0, '0kJ2PmpOOY', 2);
INSERT INTO `rms_room` VALUES (422, '966', 1, '0vyX15Jqij', 2, 'QPisbsynVI', 8);
INSERT INTO `rms_room` VALUES (423, '638', 2, 'W5qI8KJNUr', 2, 'wC0GDIpX4f', 8);
INSERT INTO `rms_room` VALUES (424, '933', 4, 'EKU0y0Iaga', 1, 'Vf3fLTbZj0', 2);
INSERT INTO `rms_room` VALUES (425, '119', 4, 'wn6GyQglIv', 1, 'vZI0wkhy3g', 4);
INSERT INTO `rms_room` VALUES (426, '626', 5, 'GvBZ7URy5G', 1, 'Tsm4h2IQrw', 2);
INSERT INTO `rms_room` VALUES (427, '185', 4, 'f5ZRkI6eaM', 1, 'mKHGP9wkBY', 7);
INSERT INTO `rms_room` VALUES (428, '134', 6, 'x7XD8wqMuV', 0, 'FpXU99s2W2', 8);
INSERT INTO `rms_room` VALUES (429, '779', 9, 'oJ3hsYmKxY', 1, '0QwFnU2Mor', 1);
INSERT INTO `rms_room` VALUES (430, '571', 6, 'Y8txiabb9X', 0, '05gFyEnqOK', 9);
INSERT INTO `rms_room` VALUES (431, '183', 9, 'iI0GmgZdKW', 1, 'xXiNMwLYpj', 6);
INSERT INTO `rms_room` VALUES (432, '899', 5, 'hImL0mlMoT', 0, 'Secg7bYkg6', 3);
INSERT INTO `rms_room` VALUES (433, '681', 2, 'bnG8TzbCn8', 1, 'fF2gJjnCtc', 9);
INSERT INTO `rms_room` VALUES (434, '138', 9, 'UnQXEEbqIo', 0, 'qmVN7tYkDl', 2);
INSERT INTO `rms_room` VALUES (435, '338', 5, 'fTg6ejRx4n', 2, 'HWwerxpryd', 5);
INSERT INTO `rms_room` VALUES (436, '658', 4, 'O9AsDZ2HbS', 2, 'IRDtNFed7z', 7);
INSERT INTO `rms_room` VALUES (437, '867', 8, '7DqRHKYyad', 1, '4KGrXLEiKM', 3);
INSERT INTO `rms_room` VALUES (438, '286', 6, '38lUnRI511', 2, 'eRJeBoLvnO', 7);
INSERT INTO `rms_room` VALUES (439, '738', 8, 'LGfsLdBhrg', 2, 'ouwC8M71Qf', 8);
INSERT INTO `rms_room` VALUES (440, '473', 3, 'p420C5ZWOq', 1, 'AFseCmpWHO', 1);
INSERT INTO `rms_room` VALUES (441, '924', 6, 'o7trfmco7N', 1, 'g6k8hkvaEA', 8);
INSERT INTO `rms_room` VALUES (442, '414', 9, '4uTOBOigBq', 2, 'upxkA2HM7I', 4);
INSERT INTO `rms_room` VALUES (443, '167', 4, 'KuAIUX8i15', 1, '1O9rMzSXIZ', 10);
INSERT INTO `rms_room` VALUES (444, '856', 5, 'JA7nxIkrph', 2, 'vgxtboFfbu', 5);
INSERT INTO `rms_room` VALUES (445, '739', 3, 'ynn5N92K0K', 0, 'NazpzEmzvA', 4);
INSERT INTO `rms_room` VALUES (446, '694', 8, 'SBxNsQC6Nz', 0, 'B47s8uFs7R', 9);
INSERT INTO `rms_room` VALUES (447, '789', 8, 'y6KHjbKJP3', 2, 'ukIh9dFsCR', 4);
INSERT INTO `rms_room` VALUES (448, '863', 6, 'VDE6mpO3ps', 1, 'GqXwXMxDAX', 7);
INSERT INTO `rms_room` VALUES (449, '251', 7, 'tq9Iaf75Qg', 2, '8aAPsGDd3Y', 5);
INSERT INTO `rms_room` VALUES (450, '372', 7, 'EQ3RNpniuO', 1, 'diqVeCfYgK', 3);
INSERT INTO `rms_room` VALUES (451, '629', 9, 'KJgfs4YFIF', 1, 'SeKm4BbowZ', 7);
INSERT INTO `rms_room` VALUES (452, '157', 9, 'vM4jAsc1J3', 1, '3TiKdBJwK6', 1);
INSERT INTO `rms_room` VALUES (453, '857', 3, '9WmBsKWaMH', 1, 'hdXePFtAxi', 3);
INSERT INTO `rms_room` VALUES (454, '367', 3, 'pC2RYmnchd', 0, 'WRhj9gG36Q', 4);
INSERT INTO `rms_room` VALUES (455, '741', 9, '9VPoMqjlCi', 2, 'pabFwA1WEy', 7);
INSERT INTO `rms_room` VALUES (456, '242', 9, 'f6D5kMOuAG', 1, 'hAAjyZPNaU', 8);
INSERT INTO `rms_room` VALUES (457, '339', 5, 'f1GO55LEs4', 2, 'CtHvPUlIrs', 4);
INSERT INTO `rms_room` VALUES (458, '956', 4, 'a3AuUIuyuY', 1, 'KczTrk0THc', 3);
INSERT INTO `rms_room` VALUES (459, '647', 4, 'Dg9jH9fIPQ', 1, '2GB9GhHbkB', 4);
INSERT INTO `rms_room` VALUES (460, '696', 1, 'OGY0bTrm09', 2, '3U1RReQL0z', 9);
INSERT INTO `rms_room` VALUES (461, '976', 5, 'qFkly4t5NR', 2, 'mJUIKh5LZt', 6);
INSERT INTO `rms_room` VALUES (462, '138', 4, '2Emub2hGLG', 1, '725hyV48rX', 10);
INSERT INTO `rms_room` VALUES (463, '687', 7, 'Z43lzokSa9', 0, 'b33CATG6T9', 8);
INSERT INTO `rms_room` VALUES (464, '271', 4, 'xbhP3mWEYS', 0, 'q3QeTJ6TpL', 5);
INSERT INTO `rms_room` VALUES (465, '333', 4, 'yseiIqvIvG', 2, '9zufs6yMbA', 8);
INSERT INTO `rms_room` VALUES (466, '883', 8, 'kehZ5lSLGR', 0, 'IQglJOAjwI', 4);
INSERT INTO `rms_room` VALUES (467, '693', 8, 'E29KV3nqDc', 2, 'hMqM5OZl6L', 10);
INSERT INTO `rms_room` VALUES (468, '935', 7, 'MKQUm8G3Y7', 1, 'qXssZq2fxI', 3);
INSERT INTO `rms_room` VALUES (469, '567', 10, 'aqqf3XASM4', 1, 'NOVz2asHvu', 11);
INSERT INTO `rms_room` VALUES (470, '677', 5, 'ICyyBefvAQ', 1, 'coRRkpzEaJ', 9);
INSERT INTO `rms_room` VALUES (471, '266', 5, 'MFfSOip11j', 1, 'Yb9jQwVSqL', 9);
INSERT INTO `rms_room` VALUES (472, '929', 2, 'pY58jOJR5l', 1, '9ExnWIbe99', 5);
INSERT INTO `rms_room` VALUES (473, '881', 2, 'YExyZJMblB', 1, 'T3HNkk70bz', 5);
INSERT INTO `rms_room` VALUES (474, '655', 3, 'BaNffudsLP', 1, 'BS8ZOxSSgW', 8);
INSERT INTO `rms_room` VALUES (475, '263', 2, 'ksuNASKWek', 0, 'sIxUoRdYrw', 10);
INSERT INTO `rms_room` VALUES (476, '321', 7, 'SLq6qiedHr', 1, 'tl5aBaC6R4', 6);
INSERT INTO `rms_room` VALUES (477, '883', 10, 'zCodYv1syb', 1, 'B4QztGXLU0', 11);
INSERT INTO `rms_room` VALUES (478, '958', 1, 'EQ0J9IGN9t', 1, '3oXTd5ivFp', 9);
INSERT INTO `rms_room` VALUES (479, '147', 9, 'ReoLYtUjOk', 1, 'HqzqyRjjGL', 8);
INSERT INTO `rms_room` VALUES (480, '159', 8, 'nsBct5jIlq', 1, 'ikMIMQ87Bt', 9);
INSERT INTO `rms_room` VALUES (481, '283', 10, 'rie6F6hK5Q', 1, 'zdl3lA6nB1', 6);
INSERT INTO `rms_room` VALUES (482, '262', 1, '50Piv5kdXJ', 1, 'wUzocn7OQP', 3);
INSERT INTO `rms_room` VALUES (483, '373', 6, 'ouFROFJ4g8', 2, 'pzzTs7xI9l', 11);
INSERT INTO `rms_room` VALUES (484, '729', 2, 'xvSIjxKIJJ', 1, 'aPxSqu9YN0', 10);
INSERT INTO `rms_room` VALUES (485, '787', 9, 'fcIksfEfEB', 1, 'TYoreocMNM', 5);
INSERT INTO `rms_room` VALUES (486, '348', 4, 'GvfR2xkTJA', 1, 'I6S4g3Yu7m', 6);
INSERT INTO `rms_room` VALUES (487, '251', 6, 'vTo7xQjATC', 1, 'ZcPhKcvLvJ', 5);
INSERT INTO `rms_room` VALUES (488, '348', 1, 's7pEuztYNU', 1, 'BAqkPSeHjz', 9);
INSERT INTO `rms_room` VALUES (489, '594', 6, 'QaOCdP0xSi', 1, 'ortdx1sXh8', 9);
INSERT INTO `rms_room` VALUES (490, '791', 9, 'PITcwtHpqI', 0, '5sNc1apBd9', 3);
INSERT INTO `rms_room` VALUES (491, '779', 8, 'zh7DtgXs5G', 0, '7HQMOeW70R', 7);
INSERT INTO `rms_room` VALUES (492, '533', 3, 'LYiN4hxLtR', 1, 'yW24K7Q6S8', 4);
INSERT INTO `rms_room` VALUES (493, '391', 4, 'MCrACQV7SF', 1, 'VvJ3jGxZqT', 4);
INSERT INTO `rms_room` VALUES (494, '688', 4, 'xrEXmYBkEa', 2, 'HkTSYuyIz1', 1);
INSERT INTO `rms_room` VALUES (495, '641', 7, 'nJtojbcYrg', 1, 'vMi2xT1Y0q', 7);
INSERT INTO `rms_room` VALUES (496, '959', 2, 'yNw1J85p4o', 0, 'MK3BUmUTgH', 10);
INSERT INTO `rms_room` VALUES (497, '339', 10, 'VQfprKYYV5', 0, '9SMx6OwIgu', 7);
INSERT INTO `rms_room` VALUES (498, '218', 10, 'Qf8hkJ6zok', 0, 'ycOvUGZJbk', 4);
INSERT INTO `rms_room` VALUES (499, '877', 2, '9NqYKpVSjv', 2, 'm6YsNFnCUd', 4);
INSERT INTO `rms_room` VALUES (500, '565', 7, 'ZEhxBuL2wH', 0, 'RZG5zbvYYx', 10);
INSERT INTO `rms_room` VALUES (501, '219', 6, 'CFaRQpUxeG', 0, 'wsfhTSOCt7', 1);
INSERT INTO `rms_room` VALUES (502, '669', 9, 'RTsTmnROcE', 0, 'xsOG1USmTL', 1);
INSERT INTO `rms_room` VALUES (503, '164', 1, '4VEi1OzD28', 1, 'JqtOwUUvde', 4);
INSERT INTO `rms_room` VALUES (504, '392', 2, 'dCMytpigRq', 0, 'NTAWU2D0Wb', 5);
INSERT INTO `rms_room` VALUES (505, '932', 8, '6PemgzaXuQ', 0, 'kJBA0rOX39', 2);
INSERT INTO `rms_room` VALUES (506, '187', 9, 'QuWxcega0w', 0, 'qusA5muQy9', 2);
INSERT INTO `rms_room` VALUES (507, '482', 6, 'os848aClm7', 1, '7GRBi46VGa', 8);
INSERT INTO `rms_room` VALUES (508, '917', 10, 'HGOQABkwwM', 2, 'WMQRXJlqjI', 3);
INSERT INTO `rms_room` VALUES (509, '583', 3, 'feRE8yYJ21', 0, 'dYO3BWcB17', 3);
INSERT INTO `rms_room` VALUES (510, '276', 8, 'jV4fzCMkVq', 0, '38SzAbcjyD', 9);
INSERT INTO `rms_room` VALUES (511, '142', 3, 'qfBUvT4tlN', 0, 'OTG1Ou26Pb', 7);
INSERT INTO `rms_room` VALUES (512, '516', 7, 'UJbWbYhhkF', 0, 'P5vnlRkcMx', 6);
INSERT INTO `rms_room` VALUES (513, '492', 6, 'ga2TLAWbBY', 1, '1M21SzJd6r', 6);
INSERT INTO `rms_room` VALUES (514, '892', 9, '3MJ5DYXncj', 1, 'JGGsKBLfsr', 9);
INSERT INTO `rms_room` VALUES (515, '418', 2, 'LodFnDsvLy', 1, 'veW7X9KnkI', 9);
INSERT INTO `rms_room` VALUES (516, '929', 7, 'kkpJn3XeHh', 1, 'cXTAyvaXSS', 11);
INSERT INTO `rms_room` VALUES (517, '395', 7, 'Gue7OSyDCJ', 1, 'jUmismnbvf', 2);
INSERT INTO `rms_room` VALUES (518, '168', 2, 'FiXRt3m7Tu', 2, 'zFIXmXwkRp', 5);
INSERT INTO `rms_room` VALUES (519, '797', 4, 'C7YZzrPZxQ', 0, 'wkaFHoWp8v', 9);
INSERT INTO `rms_room` VALUES (520, '547', 6, '6Gon0oTbFo', 1, 'T3BYh8DGI3', 8);
INSERT INTO `rms_room` VALUES (521, '975', 7, 'HcKR1jrO8f', 2, 'eZVcD1yFvh', 8);
INSERT INTO `rms_room` VALUES (522, '661', 5, 'Ngki6HBpWh', 1, 'UYuqx2IQYV', 2);
INSERT INTO `rms_room` VALUES (523, '394', 4, 'pMf3BZHW0N', 1, 'OlsHNNCkPs', 9);
INSERT INTO `rms_room` VALUES (524, '912', 9, 'xFp7iJIl3Z', 0, 'zc3pbjgKRd', 6);
INSERT INTO `rms_room` VALUES (525, '656', 2, 'UVidBLpH75', 0, 'HtzQQwVniM', 10);
INSERT INTO `rms_room` VALUES (526, '894', 8, 'Mghn3ZneKx', 2, 'wMeUCd87yG', 7);
INSERT INTO `rms_room` VALUES (527, '613', 4, 'm1uTGp8PRF', 1, 't4qujvmbah', 4);
INSERT INTO `rms_room` VALUES (528, '928', 8, 'FTvUAMuuAE', 0, '0XsLBgLpRW', 8);
INSERT INTO `rms_room` VALUES (529, '638', 7, 'h0sKnYTMYb', 0, 'a77hn2PFpV', 4);
INSERT INTO `rms_room` VALUES (530, '828', 4, '9dWhkkINDc', 0, 'ByIh7R2J6n', 9);
INSERT INTO `rms_room` VALUES (531, '283', 8, 'PMgXta09LH', 1, 'pS1IL7nTjU', 11);
INSERT INTO `rms_room` VALUES (532, '497', 4, 'YnHW2h20Wm', 1, 'lYOBBWTvxS', 6);
INSERT INTO `rms_room` VALUES (533, '531', 6, 'Qri6Dd945k', 1, 'hgtPTYu9aH', 8);
INSERT INTO `rms_room` VALUES (534, '854', 1, 'v3Uyh45t5W', 1, 'rw0C0LvpXl', 2);
INSERT INTO `rms_room` VALUES (535, '727', 10, 'HHqpswICd4', 1, 'sA2cmC8RGg', 4);
INSERT INTO `rms_room` VALUES (536, '392', 5, 'nxqiyEwoLb', 0, 'saGrXb47fG', 7);
INSERT INTO `rms_room` VALUES (537, '597', 1, 'YZ0ai0UVrK', 1, 'b6u0tZKF0w', 3);
INSERT INTO `rms_room` VALUES (538, '316', 7, 'VVnvayLFUg', 1, 'Y722xV27oU', 1);
INSERT INTO `rms_room` VALUES (539, '187', 7, 'GNtyP9mUZS', 1, 'TijAB5jKBq', 5);
INSERT INTO `rms_room` VALUES (540, '981', 7, 'k3FOwo8cVW', 2, 'M3VDFka3Yk', 10);
INSERT INTO `rms_room` VALUES (541, '221', 9, 'jqKr3DzhY5', 0, 'Jh9rE42YKL', 9);
INSERT INTO `rms_room` VALUES (542, '569', 7, 'gThTTn34aB', 1, 'rNWcOqivZD', 9);
INSERT INTO `rms_room` VALUES (543, '538', 4, 'epYUGqIReh', 0, 'P6L5Ugtq3L', 1);
INSERT INTO `rms_room` VALUES (544, '574', 4, 'VsSHDMa7qA', 0, 'tDnB1WAc33', 3);
INSERT INTO `rms_room` VALUES (545, '374', 9, 'DBgKeDbJUz', 1, 'HCVqvBRGcE', 9);
INSERT INTO `rms_room` VALUES (546, '693', 6, 'b84pN4DYHl', 1, 'igTGEldbbr', 10);
INSERT INTO `rms_room` VALUES (547, '198', 5, 'vlnFQsDy47', 1, 'VXDzeOhNwh', 1);
INSERT INTO `rms_room` VALUES (548, '494', 5, 'Zfg7dPhURF', 0, 'HAgwp4p4yY', 9);
INSERT INTO `rms_room` VALUES (549, '786', 6, 'gsV6RAiJ6J', 1, 'HIpT4E4sdz', 1);
INSERT INTO `rms_room` VALUES (550, '674', 5, 'V4t52eP9Vl', 1, 'JaDShlKsdd', 7);
INSERT INTO `rms_room` VALUES (551, '285', 5, 'oWlwqCumEV', 1, 'nN7vcDZmKf', 6);
INSERT INTO `rms_room` VALUES (552, '212', 6, '76ZEV6zXjR', 1, 'cO7mr1Ta9k', 5);
INSERT INTO `rms_room` VALUES (553, '969', 4, '3Dq4YOYTJx', 1, 'fiFm8jZ28B', 4);
INSERT INTO `rms_room` VALUES (554, '671', 7, 'H91khIS5c8', 1, 'FX1Oc5xHIv', 8);
INSERT INTO `rms_room` VALUES (555, '947', 5, 'q7jKK2wObU', 1, 'tWOCpXs94n', 5);
INSERT INTO `rms_room` VALUES (556, '392', 6, '74OQAvomjB', 2, 'KEjfViecgO', 6);
INSERT INTO `rms_room` VALUES (557, '286', 4, 'KKGlR9M6tE', 1, 'tvxZ2mMOoC', 6);
INSERT INTO `rms_room` VALUES (558, '514', 6, 'FngD4nYhZb', 1, 'kbQD7LCiyX', 4);
INSERT INTO `rms_room` VALUES (559, '341', 4, 'E8m32jyXYy', 1, 'EJV5wNWgS8', 3);
INSERT INTO `rms_room` VALUES (560, '726', 9, 'M2fZjd9puR', 0, 'tP81E8MF8J', 2);
INSERT INTO `rms_room` VALUES (561, '288', 8, 'EWCA3WcxR3', 0, '5xTSnXkal0', 5);
INSERT INTO `rms_room` VALUES (562, '211', 5, 'LiMVmUWSgM', 1, 'KAb5mbnIgp', 10);
INSERT INTO `rms_room` VALUES (563, '593', 7, '8DlhqyFDeu', 2, '5vz9MJ9g4B', 5);
INSERT INTO `rms_room` VALUES (564, '353', 8, 'ga17HxHWGr', 1, 'F6QQkCsge4', 3);
INSERT INTO `rms_room` VALUES (565, '325', 4, 'zEx8vFBojc', 1, 'LuV7VfzYg8', 7);
INSERT INTO `rms_room` VALUES (566, '974', 4, 'BpZ1oRCjSG', 1, 'WBrMhIhMKi', 10);
INSERT INTO `rms_room` VALUES (567, '583', 7, 'u3uHCYbqA6', 0, 'vsqXY6O1KY', 2);
INSERT INTO `rms_room` VALUES (568, '845', 4, 'XUawwCXWaa', 1, 'IelvrgotFH', 2);
INSERT INTO `rms_room` VALUES (569, '547', 3, 'zaKNj5suNC', 1, 'GbLklitv28', 5);
INSERT INTO `rms_room` VALUES (570, '929', 4, 'Yi2iJiMLip', 1, 'Qx1j0gz6wM', 10);
INSERT INTO `rms_room` VALUES (571, '873', 10, 'SwRG5gbIgn', 1, 'WIdFbScfg3', 6);
INSERT INTO `rms_room` VALUES (572, '156', 8, 'Hkbli3LtWE', 2, 'pg3imfp3bD', 6);
INSERT INTO `rms_room` VALUES (573, '813', 2, 'eKxsI7inMy', 2, 'nurq08jy2C', 8);
INSERT INTO `rms_room` VALUES (574, '363', 8, 'K9tvqDqvka', 1, 'lKLA40HIGD', 2);
INSERT INTO `rms_room` VALUES (575, '658', 4, 's2MWScFWEx', 2, '061jgDgUs8', 11);
INSERT INTO `rms_room` VALUES (576, '418', 5, 'Qu3B2y5C9g', 2, 'ij3SYZhV9s', 8);
INSERT INTO `rms_room` VALUES (577, '136', 8, 'bNQl7SewBp', 0, 'BuPXjqRwXp', 11);
INSERT INTO `rms_room` VALUES (578, '981', 5, 'kUeigOXh6w', 1, '9kj2YQZICL', 6);
INSERT INTO `rms_room` VALUES (579, '599', 5, 'H8uf6HjIgg', 0, 'NsKwKVJx6b', 6);
INSERT INTO `rms_room` VALUES (580, '121', 2, '0Td6V8fSRu', 2, 'z6DokjPtVq', 8);
INSERT INTO `rms_room` VALUES (581, '244', 8, 'yFqpKFfByp', 0, 'OJp3jvIQ2M', 6);
INSERT INTO `rms_room` VALUES (582, '936', 5, 'FBFUGPNRYv', 1, 'Sp1EofImfb', 5);
INSERT INTO `rms_room` VALUES (583, '776', 5, 'sa723RJBxU', 1, 'U3ZwdJaodE', 4);
INSERT INTO `rms_room` VALUES (584, '331', 10, '5iAsBQO1qE', 0, 'l5M5GsNHWh', 8);
INSERT INTO `rms_room` VALUES (585, '896', 3, 'NUThVenkYO', 2, '7uStbxxHCG', 10);
INSERT INTO `rms_room` VALUES (586, '567', 2, 'yh8k0TBugC', 1, 'hOeazsFe3u', 7);
INSERT INTO `rms_room` VALUES (587, '849', 6, 'Ba6jKCCWcK', 2, 'Dpt9NBOj4w', 8);
INSERT INTO `rms_room` VALUES (588, '318', 7, '96dGcDJrqS', 1, 'MvHqf2D10G', 4);
INSERT INTO `rms_room` VALUES (589, '171', 8, 'WqpkumcF8e', 0, 'bK3cia1zqa', 8);
INSERT INTO `rms_room` VALUES (590, '592', 1, '9hzMCAzPYl', 1, 'LrypHeaCYX', 7);
INSERT INTO `rms_room` VALUES (591, '326', 4, 'ND7l7f7EvG', 1, 'hpm7vFFR3p', 4);
INSERT INTO `rms_room` VALUES (592, '831', 2, 'yboUxkchJM', 1, 'oqfYdyCJWT', 5);
INSERT INTO `rms_room` VALUES (593, '262', 1, 'kZiyM1UFzq', 2, 'MmR4btnIhM', 7);
INSERT INTO `rms_room` VALUES (594, '299', 2, 'FU20Kar25u', 0, 'V7McVgTcxz', 8);
INSERT INTO `rms_room` VALUES (595, '592', 5, 'bhz56SFJVX', 2, 'wuwj04a38q', 6);
INSERT INTO `rms_room` VALUES (596, '538', 6, 'ewnMpQAwaF', 0, 'nvy1trPvM3', 3);
INSERT INTO `rms_room` VALUES (597, '818', 1, 'QaxjZd07mm', 2, 'LwZ9Ke7WVE', 7);
INSERT INTO `rms_room` VALUES (598, '298', 5, 'BSoB9Xy37h', 1, 'Gik2uh0zzY', 5);
INSERT INTO `rms_room` VALUES (599, '378', 8, 'NBCKqo7vW6', 1, 'Lxu4JUyKSX', 10);
INSERT INTO `rms_room` VALUES (600, '997', 2, 'HcPDWHA62O', 1, 'gmeg15hcw2', 7);
INSERT INTO `rms_room` VALUES (601, '585', 7, 'VHpYvmgUnd', 1, 'LHfYGiQXZx', 10);
INSERT INTO `rms_room` VALUES (602, '591', 10, 'svZiQppZGK', 1, '4HIxPtzY9H', 9);
INSERT INTO `rms_room` VALUES (603, '844', 6, 'hNphwdPSdj', 1, 'lFVoTnm6P5', 7);
INSERT INTO `rms_room` VALUES (604, '414', 3, '3UfVZedrnl', 1, 'xpjxVv4ig7', 10);
INSERT INTO `rms_room` VALUES (605, '914', 10, 'DzOdzO31mX', 0, 'BgQQiUKqVJ', 8);
INSERT INTO `rms_room` VALUES (606, '595', 10, 'XwPUaA9j76', 1, 'gyFhx7L71j', 10);
INSERT INTO `rms_room` VALUES (607, '815', 9, 'xTNErcDYRl', 2, 'fYfTNhmDgx', 9);
INSERT INTO `rms_room` VALUES (608, '432', 9, '8pOWQs0HzW', 2, 'iGBW440J8h', 4);
INSERT INTO `rms_room` VALUES (609, '214', 3, 'NbES30JUD1', 1, 'X7cUdmuD8z', 9);
INSERT INTO `rms_room` VALUES (610, '654', 2, 'y91tEFgACK', 2, 'PVjl2nbdVb', 2);
INSERT INTO `rms_room` VALUES (611, '221', 8, 'xzT0SZBQrL', 2, 'NtoW8DtlNA', 7);
INSERT INTO `rms_room` VALUES (612, '234', 5, 'lQbKrpPwtF', 1, 'fgF1lPVmPP', 6);
INSERT INTO `rms_room` VALUES (613, '657', 6, 'KCMU24zSLq', 2, 'kZRcy6dw8j', 9);
INSERT INTO `rms_room` VALUES (614, '495', 4, 'NtkgXOwzyR', 2, 'PdllsYck6d', 2);
INSERT INTO `rms_room` VALUES (615, '191', 3, 'uQH6eNd5Ou', 1, 'ZM0Ki12o7G', 6);
INSERT INTO `rms_room` VALUES (616, '469', 4, 'GfhsSdik0g', 2, 'B6VUYztU22', 7);
INSERT INTO `rms_room` VALUES (617, '459', 7, 'LPyqZPJsq0', 0, 'n9cbPgGCMe', 3);
INSERT INTO `rms_room` VALUES (618, '752', 7, 'KipgqGZGGr', 1, '9g3fZNTmlb', 2);
INSERT INTO `rms_room` VALUES (619, '873', 6, 'VcH2tRBCJO', 1, 'CGjlJ95gkN', 5);
INSERT INTO `rms_room` VALUES (620, '168', 7, 'ci8pbeAo0s', 1, 'eEkIIO5F4Q', 11);
INSERT INTO `rms_room` VALUES (621, '126', 4, 'V9aXItFMo3', 2, 'GTubmEHVXn', 8);
INSERT INTO `rms_room` VALUES (622, '692', 9, 'mIq7ETwKFh', 1, '8ximbBgCzu', 1);
INSERT INTO `rms_room` VALUES (623, '233', 6, 'MDhhAht47j', 1, 'TMzSZ4Tczq', 9);
INSERT INTO `rms_room` VALUES (624, '451', 8, '4La2s2xBIz', 2, 'MRjyjNVg4L', 1);
INSERT INTO `rms_room` VALUES (625, '668', 2, '50wsNyVQW6', 0, 'ILaKwsBc9D', 2);
INSERT INTO `rms_room` VALUES (626, '699', 7, 'ycXZ7sCmCR', 0, 'mntTHRvCGv', 7);
INSERT INTO `rms_room` VALUES (627, '312', 3, 'IeEBP6aktP', 1, 'xoIzsYjC9p', 10);
INSERT INTO `rms_room` VALUES (628, '974', 8, 'nqXIjzg39c', 1, 'NIq4wEbQEd', 9);
INSERT INTO `rms_room` VALUES (629, '421', 4, 'rxBSQitOeO', 1, 'xTbUJdoyW6', 4);
INSERT INTO `rms_room` VALUES (630, '524', 5, 'bE6QvSTrVE', 1, 'SG3G1x9aGG', 1);
INSERT INTO `rms_room` VALUES (631, '743', 3, '0NA3PFnEUw', 2, '33TFCsdA2Y', 5);
INSERT INTO `rms_room` VALUES (632, '578', 6, 'BXr0nmWbnx', 1, 'ohXZWfN8HA', 1);
INSERT INTO `rms_room` VALUES (633, '542', 8, 'Kv70NGsPCQ', 2, 'HdCY8mbUDB', 2);
INSERT INTO `rms_room` VALUES (634, '697', 10, 'mhXlKy0m79', 1, 'AFxbruhij9', 8);
INSERT INTO `rms_room` VALUES (635, '519', 5, 'Yhjt7rjgkJ', 2, 'O3Lw2ab3hM', 6);
INSERT INTO `rms_room` VALUES (636, '179', 3, 'vsslnT7HzQ', 1, '3lSq4QnKHA', 9);
INSERT INTO `rms_room` VALUES (637, '365', 5, 'TF5xhazOEs', 2, '5VCddIPC3v', 3);
INSERT INTO `rms_room` VALUES (638, '234', 4, '1rMjXiuE6F', 1, 'VhyD1Khmmd', 9);
INSERT INTO `rms_room` VALUES (639, '662', 10, 'SncYEXqJq2', 2, 'LnkWxP94Xu', 7);
INSERT INTO `rms_room` VALUES (640, '412', 6, '6mlQrK1XZe', 2, 'VTXShYPBHd', 4);
INSERT INTO `rms_room` VALUES (641, '325', 5, 'fB1DL18pQ0', 2, 'jT8Fq4o2Wu', 1);
INSERT INTO `rms_room` VALUES (642, '823', 8, 'CVRPnv1vwB', 1, 'vKpAQoC2nx', 8);
INSERT INTO `rms_room` VALUES (643, '986', 3, 'Lj0UZ1XjXD', 2, 'AUDbtJl2wZ', 8);
INSERT INTO `rms_room` VALUES (644, '645', 6, 'f9Mc4onv3E', 2, 'kEXzwcLbzV', 10);
INSERT INTO `rms_room` VALUES (645, '737', 1, 'RhHwXW384K', 0, 'UbQIdIDBlO', 2);
INSERT INTO `rms_room` VALUES (646, '272', 1, '4mrN5fiaEb', 0, 'evT0d15SJN', 1);
INSERT INTO `rms_room` VALUES (647, '682', 8, '2dFL0FSjfj', 1, 'zeNQ41mbka', 8);
INSERT INTO `rms_room` VALUES (648, '794', 5, 'A6v8qzZISu', 2, '3mhbAZk9wq', 8);
INSERT INTO `rms_room` VALUES (649, '859', 8, 'Nw8sujUUt2', 0, 'cpxreuS5YO', 8);
INSERT INTO `rms_room` VALUES (650, '586', 9, '14MHxoqTOb', 2, 'A5h37334Zk', 4);
INSERT INTO `rms_room` VALUES (651, '119', 9, 'rzb7DNy37q', 1, 'vkwsVEzXRo', 1);
INSERT INTO `rms_room` VALUES (652, '684', 2, 'JL9xpLmBBq', 1, 'VhvVeJETqs', 8);
INSERT INTO `rms_room` VALUES (653, '174', 6, 'Xipj6BT5wn', 1, 'KdtsAWP8J2', 9);
INSERT INTO `rms_room` VALUES (654, '321', 7, 'HFkEad8IxT', 2, 'OtAqLtfGYb', 9);
INSERT INTO `rms_room` VALUES (655, '939', 7, 'Ij5N3R11lv', 1, '2vW9Bcge2r', 5);
INSERT INTO `rms_room` VALUES (656, '475', 1, 'ZydMKkvrRy', 1, '3eJIqo3sLO', 10);
INSERT INTO `rms_room` VALUES (657, '831', 7, 'Ektnz9yZbw', 1, 'bAcGmrZQEQ', 3);
INSERT INTO `rms_room` VALUES (658, '912', 1, '12UWb4SpAN', 1, '8dagNB8NI1', 10);
INSERT INTO `rms_room` VALUES (659, '992', 4, '7A9GWYJdX5', 1, 'B5JY42DnOU', 3);
INSERT INTO `rms_room` VALUES (660, '217', 9, 'HjHbheOD4L', 1, 'OZKApZ3mQL', 4);
INSERT INTO `rms_room` VALUES (661, '363', 5, 'kQ1vTVbBR1', 0, 'ZWdDXSvGA0', 4);
INSERT INTO `rms_room` VALUES (662, '135', 9, 'okIQvG35pM', 2, 'Lst1ScF6tM', 2);
INSERT INTO `rms_room` VALUES (663, '118', 4, '3mgBrl7fs4', 1, 'lsbNeDwyMV', 2);
INSERT INTO `rms_room` VALUES (664, '577', 4, 'U111etPCZD', 1, 'ITdxvxc9JU', 9);
INSERT INTO `rms_room` VALUES (665, '791', 4, 'V0XGmR7v8S', 1, 'oZbZ6IEWSe', 10);
INSERT INTO `rms_room` VALUES (666, '725', 8, 'a0JovjsuuQ', 1, 'hPsUECPoug', 7);
INSERT INTO `rms_room` VALUES (667, '532', 1, 'Vr2YMQ60NJ', 1, 'mQ3cUeuAOf', 10);
INSERT INTO `rms_room` VALUES (668, '491', 8, 'n6MjwzhuMr', 1, 'TKSXh4boNf', 10);
INSERT INTO `rms_room` VALUES (669, '699', 3, 'c41r8NHgPp', 2, 'ChUwoYwCGc', 8);
INSERT INTO `rms_room` VALUES (670, '441', 2, '8p0xKC41Fj', 1, 'MjkySfTTTj', 1);
INSERT INTO `rms_room` VALUES (671, '593', 2, 'qAwKjPHih0', 1, 'ADJpBIPvJQ', 10);
INSERT INTO `rms_room` VALUES (672, '818', 6, 'zHBny62nhc', 2, 'AwWldJGqBQ', 5);
INSERT INTO `rms_room` VALUES (673, '135', 2, 'mwCbLbRpfv', 0, 'j2YQ1WxZ12', 1);
INSERT INTO `rms_room` VALUES (674, '221', 6, 'AyDICmPFg9', 2, 'ipdiQueSKd', 5);
INSERT INTO `rms_room` VALUES (675, '516', 6, '4EEBX1qJ8l', 1, 'Ng14wQTap8', 6);
INSERT INTO `rms_room` VALUES (676, '882', 3, 'L1pqFbzqSB', 1, 'YUeUyPfClL', 6);
INSERT INTO `rms_room` VALUES (677, '426', 6, 'GRqV720V2c', 0, 'JvWu6FcgcK', 7);
INSERT INTO `rms_room` VALUES (678, '345', 2, 'wLzIEx1leR', 1, 'i14seGv87l', 9);
INSERT INTO `rms_room` VALUES (679, '234', 2, '6ccBdsxgyU', 0, 'OESvTvkPj6', 5);
INSERT INTO `rms_room` VALUES (680, '873', 6, 'TyQU8qZ5Hq', 1, 'AGdnIjCEPc', 4);
INSERT INTO `rms_room` VALUES (681, '552', 1, 'zCCuMe3yj1', 2, 'mC1tUr3Fu4', 7);
INSERT INTO `rms_room` VALUES (682, '335', 3, 'K6MioYKSiE', 1, '0NigUjJfmy', 4);
INSERT INTO `rms_room` VALUES (683, '582', 9, 'M5OZNn4u1V', 1, 'nr0kWRLtnV', 7);
INSERT INTO `rms_room` VALUES (684, '647', 5, 'KzeSYhRzfa', 1, 'WcRPb5CXJc', 10);
INSERT INTO `rms_room` VALUES (685, '363', 8, 't9XlGZXxWD', 1, 'rBN6FNmdr7', 7);
INSERT INTO `rms_room` VALUES (686, '914', 8, 'e8oznsYOfd', 2, 'vnc6BuaSjT', 5);
INSERT INTO `rms_room` VALUES (687, '572', 9, 'yUbib4Cz2l', 1, 'QlamtxTx7D', 6);
INSERT INTO `rms_room` VALUES (688, '216', 2, 'RUM5HRchk6', 1, 'bMmVHv0ks8', 4);
INSERT INTO `rms_room` VALUES (689, '343', 6, 'eAebhBfYsA', 1, 'rDzJtjxkCR', 8);
INSERT INTO `rms_room` VALUES (690, '886', 3, 'ZeJ3WEGc32', 2, 'uuQrrWSiFm', 6);
INSERT INTO `rms_room` VALUES (691, '283', 5, 'mLY8xWP3eq', 2, 'muXRxRauN5', 4);
INSERT INTO `rms_room` VALUES (692, '611', 8, 'zjRBCDS5L6', 1, 'UlZ6ttCLK3', 1);
INSERT INTO `rms_room` VALUES (693, '454', 7, 'UTyB5f3b6t', 2, 'a6dDGB5dAK', 9);
INSERT INTO `rms_room` VALUES (694, '936', 9, 'ozisM8v33P', 0, 'QirdI6BzKz', 6);
INSERT INTO `rms_room` VALUES (695, '155', 7, '2jo6C9hlph', 2, 'TELIPq5KUF', 11);
INSERT INTO `rms_room` VALUES (696, '863', 3, 'Vq29vAhcWv', 0, 'QErjWJXClg', 3);
INSERT INTO `rms_room` VALUES (697, '137', 5, 'WtC9dYiMXT', 0, 'pHHQfV1wMa', 3);
INSERT INTO `rms_room` VALUES (698, '992', 1, 'FRr6H8Kc0j', 0, 'ftDsALY1CF', 7);
INSERT INTO `rms_room` VALUES (699, '237', 2, 'PDL9q59TWY', 2, '0BjwAkBBxA', 7);
INSERT INTO `rms_room` VALUES (700, '335', 1, 'xrwM5J1cbP', 1, 'V8L2pfqXVw', 2);
INSERT INTO `rms_room` VALUES (701, '194', 7, '4jWhPn4J7Q', 0, 'N08UhrrmGp', 5);
INSERT INTO `rms_room` VALUES (702, '231', 6, 'x126k2RigJ', 0, 'rmJVdYeyFs', 7);
INSERT INTO `rms_room` VALUES (703, '127', 3, 'TCp7KZ8PHI', 2, 'efTnkQtyEA', 10);
INSERT INTO `rms_room` VALUES (704, '988', 9, 'p09fv5GwBY', 2, 'xOaG9maml2', 2);
INSERT INTO `rms_room` VALUES (705, '171', 4, '4paWLc6ipy', 0, '0DgNqlBRHT', 9);
INSERT INTO `rms_room` VALUES (706, '526', 6, 'CzbyADBwwc', 1, 'F5dGfxbKzI', 7);
INSERT INTO `rms_room` VALUES (707, '834', 1, 'X2VWxwNiPe', 2, 'iDbfOAfGT3', 5);
INSERT INTO `rms_room` VALUES (708, '534', 4, 'Q2gkhKnqOQ', 2, 'EvlRHrKcBe', 7);
INSERT INTO `rms_room` VALUES (709, '675', 9, 'KIgixRbO1j', 0, 'L8FhnMGEnK', 6);
INSERT INTO `rms_room` VALUES (710, '949', 8, 'txUFPh6Ovu', 2, 'uXUmGgtY8d', 11);
INSERT INTO `rms_room` VALUES (711, '133', 5, '4YAtvFvKXM', 1, 'Bl7jctrVMy', 7);
INSERT INTO `rms_room` VALUES (712, '578', 2, '28kzyyMjqY', 0, 'f1gxGYKlwy', 5);
INSERT INTO `rms_room` VALUES (713, '545', 6, 'PvGg5xSVzD', 1, '5f7q2Zpdfl', 10);
INSERT INTO `rms_room` VALUES (714, '779', 4, 'JqYkeXAPO4', 1, 'vtzLbBZbJO', 4);
INSERT INTO `rms_room` VALUES (715, '461', 3, '5z6sSCl30e', 2, 'V95dyGxZqv', 6);
INSERT INTO `rms_room` VALUES (716, '253', 4, '5XXSTlB167', 0, 'qhEvmpZojI', 9);
INSERT INTO `rms_room` VALUES (717, '272', 7, 'GFNRJbMfTQ', 2, 'quht3127Wp', 9);
INSERT INTO `rms_room` VALUES (718, '171', 2, 'fKPB3D66Na', 1, 'vk5TpZHcUV', 10);
INSERT INTO `rms_room` VALUES (719, '535', 7, '8jxDl2HWVv', 0, 'XFuu61U7Gv', 10);
INSERT INTO `rms_room` VALUES (720, '924', 3, 'CBeDvyrkyZ', 1, 'zuRsaP9mDq', 7);
INSERT INTO `rms_room` VALUES (721, '757', 2, '5oDunyFRy0', 0, 'SMNHVliKcw', 6);
INSERT INTO `rms_room` VALUES (722, '876', 6, '7bPrvtvYUm', 1, 'aldkrz4VsQ', 2);
INSERT INTO `rms_room` VALUES (723, '876', 8, '2tUMxHfcRh', 1, '3wtsXbVvOg', 2);
INSERT INTO `rms_room` VALUES (724, '885', 1, '93XFcIGStt', 2, 'Zg0BLpVnNh', 11);
INSERT INTO `rms_room` VALUES (725, '915', 9, 'xEhyPo3kIS', 1, 'TIWU3cIWIb', 6);
INSERT INTO `rms_room` VALUES (726, '172', 3, 'E8nGkXM4DO', 0, 'Kljp8XEzvO', 7);
INSERT INTO `rms_room` VALUES (727, '624', 8, 'dwYmejEyP0', 1, '5qeppp2mfF', 6);
INSERT INTO `rms_room` VALUES (728, '599', 8, 'WWj9G76SC1', 1, 'uXyrDzC2KG', 8);
INSERT INTO `rms_room` VALUES (729, '168', 8, 'mLnyHPjXe5', 2, 'p8XdTxHQHU', 7);
INSERT INTO `rms_room` VALUES (730, '389', 10, 'QKA4XXYFOh', 2, 'yUA3GHmde3', 3);
INSERT INTO `rms_room` VALUES (731, '652', 2, '3EKROkinI4', 0, 'e4Ka1g81XS', 10);
INSERT INTO `rms_room` VALUES (732, '347', 2, 'vpTBV3ixuu', 2, 'eRNhC1swOA', 5);
INSERT INTO `rms_room` VALUES (733, '295', 8, '6N9HFjN8js', 1, 'o1xUlyv0VQ', 6);
INSERT INTO `rms_room` VALUES (734, '911', 7, 'LbawUNRk9c', 1, 'U9A70d9B6g', 9);
INSERT INTO `rms_room` VALUES (735, '743', 4, 'ICMM5VEJE7', 0, 'S8pF31A25u', 1);
INSERT INTO `rms_room` VALUES (736, '668', 5, '1EwlsnZz1Y', 0, 'DVuGs5iB2a', 10);
INSERT INTO `rms_room` VALUES (737, '116', 9, 'Eh4ID33CUG', 0, 'qQ5UJhxAi6', 3);
INSERT INTO `rms_room` VALUES (738, '284', 8, 'xe6xQg1BdE', 0, 'XU1VTEiCMk', 10);
INSERT INTO `rms_room` VALUES (739, '292', 5, 'eMiytEiycm', 1, 'gMAMQvOhKw', 8);
INSERT INTO `rms_room` VALUES (740, '398', 3, 'NQl0xhFV3L', 1, '8Wh2wNVzJT', 5);
INSERT INTO `rms_room` VALUES (741, '476', 1, 'e9vvQyjIwe', 0, '01yUoiRfq4', 9);
INSERT INTO `rms_room` VALUES (742, '625', 9, 'ubaihrqJPr', 1, 'hgKuyNHxjn', 4);
INSERT INTO `rms_room` VALUES (743, '855', 10, 'YESy0BwsaV', 0, 'J6MSpVFAAO', 5);
INSERT INTO `rms_room` VALUES (744, '458', 4, 'JhpRGOvJAt', 1, 'DLG7jn91ST', 10);
INSERT INTO `rms_room` VALUES (745, '331', 2, 'Tn5MA8Qodu', 1, 'nAqI7ZvWj3', 3);
INSERT INTO `rms_room` VALUES (746, '914', 2, 'uClMzz2tjH', 1, '12Jux39pB0', 1);
INSERT INTO `rms_room` VALUES (747, '796', 5, '2uAYAQs0Vf', 1, 'h4ldCJJxhU', 2);
INSERT INTO `rms_room` VALUES (748, '391', 9, 'KLeyufVlOM', 1, 'JplhOyAVde', 3);
INSERT INTO `rms_room` VALUES (749, '156', 5, 'zXO630Cqta', 1, 'kTENuOQk0W', 3);
INSERT INTO `rms_room` VALUES (750, '392', 10, '5FRob4bPih', 0, 'rslmHmirOD', 11);
INSERT INTO `rms_room` VALUES (751, '875', 4, 'Rr7zIeqx3w', 0, 'YdXUmVsrn2', 6);
INSERT INTO `rms_room` VALUES (752, '777', 4, 'K569ZJNxRM', 2, 'l1gqPQr9wd', 10);
INSERT INTO `rms_room` VALUES (753, '653', 4, 'yqSugh6Kt9', 2, '3h5y5nTiNN', 9);
INSERT INTO `rms_room` VALUES (754, '822', 5, 'Q2h12eOLY5', 1, 'WgbdoURqCW', 4);
INSERT INTO `rms_room` VALUES (755, '975', 7, 'ocOBRKW3PS', 2, '3EclAoivYI', 7);
INSERT INTO `rms_room` VALUES (756, '372', 8, 'K6OuRm1fJi', 0, 'jEx0ZN8pTO', 9);
INSERT INTO `rms_room` VALUES (757, '189', 7, 'aktoTlLjEE', 2, 'Ig8gwfnWE2', 3);
INSERT INTO `rms_room` VALUES (758, '957', 5, 'xp0StTQUJH', 1, 'PQ0plnoGyp', 11);
INSERT INTO `rms_room` VALUES (759, '868', 6, 'iVOZUwIX6Z', 0, 'yFGmjYEDbj', 6);
INSERT INTO `rms_room` VALUES (760, '541', 6, 'E6l53Jf6RE', 1, 'rzuUEoxJs5', 11);
INSERT INTO `rms_room` VALUES (761, '735', 8, 'gml47WvnXo', 1, 'CqjDF1oQA6', 3);
INSERT INTO `rms_room` VALUES (762, '558', 1, 'Ysl6bLXF8e', 1, 'mGrlQdUUsL', 8);
INSERT INTO `rms_room` VALUES (763, '162', 9, 'gEBmf1ASIM', 1, 'KJWv7QFpI2', 3);
INSERT INTO `rms_room` VALUES (764, '658', 6, 'P8BowlGKK8', 0, 'NxBTSN8mLc', 3);
INSERT INTO `rms_room` VALUES (765, '775', 8, 'XQ91cu1Ofi', 2, 'vhTM4j3Z8m', 1);
INSERT INTO `rms_room` VALUES (766, '733', 6, '8y5OYktgdI', 2, 'zPudTEhAfd', 3);
INSERT INTO `rms_room` VALUES (767, '219', 7, 'tVfi12TLxX', 0, '8WRxOV8GPN', 1);
INSERT INTO `rms_room` VALUES (768, '978', 9, 'mkQ0nsHrvk', 0, 'YnDhfcAkIx', 5);
INSERT INTO `rms_room` VALUES (769, '219', 3, 'j3jgoUDxrw', 1, 'EOvfWE4uuA', 4);
INSERT INTO `rms_room` VALUES (770, '823', 9, 'wx162Oa9sA', 2, 'wRwpbmF9Qp', 7);
INSERT INTO `rms_room` VALUES (771, '214', 9, 'd7EdtB8dwI', 0, 'OwYALKS7s9', 8);
INSERT INTO `rms_room` VALUES (772, '315', 6, 'MI0WbYcPDm', 0, 'ejN7WKTzAz', 4);
INSERT INTO `rms_room` VALUES (773, '141', 3, 'ff1xrFBK83', 2, 'g0c9KBaH9I', 3);
INSERT INTO `rms_room` VALUES (774, '812', 6, 'dqt7LQ6DMN', 2, 'KJ9gAH4ju0', 3);
INSERT INTO `rms_room` VALUES (775, '877', 10, 'FoGMOOUZkQ', 1, 'W39VW0is06', 4);
INSERT INTO `rms_room` VALUES (776, '624', 7, 'GiIZz9A97Y', 0, 'dgFCQf7Vhx', 10);
INSERT INTO `rms_room` VALUES (777, '222', 7, 'MkuwXWcUcz', 1, '8vyrIIv1GC', 10);
INSERT INTO `rms_room` VALUES (778, '681', 8, 'GmV5Kh7C00', 0, 'gJkAQ6gnha', 7);
INSERT INTO `rms_room` VALUES (779, '858', 5, '1ZEMwtKDvT', 2, 'nFOSWWGaM9', 4);
INSERT INTO `rms_room` VALUES (780, '259', 3, 'NTJv0BpeRC', 0, 'Nm1WrszX2q', 6);
INSERT INTO `rms_room` VALUES (781, '363', 4, 'K5niLrDb5t', 1, 'wTEVEiz5Al', 5);
INSERT INTO `rms_room` VALUES (782, '657', 6, 'UQfu4DrBJa', 0, 'aQeMoDAgJc', 6);
INSERT INTO `rms_room` VALUES (783, '862', 2, 'Ix325XXalW', 1, 'tnJtrM7xNl', 8);
INSERT INTO `rms_room` VALUES (784, '344', 8, 'XlJqlGm8XS', 1, 'U6GAPDAIfQ', 2);
INSERT INTO `rms_room` VALUES (785, '636', 3, 'RVqkn2YDu1', 0, 'gxPhxFSXlL', 2);
INSERT INTO `rms_room` VALUES (786, '159', 4, 'L0GDlri62W', 1, 'DKVsQcPnQ0', 10);
INSERT INTO `rms_room` VALUES (787, '759', 3, 'c28AnaNW4s', 1, 'aEYoS5QUYg', 9);
INSERT INTO `rms_room` VALUES (788, '598', 7, 'QYQbaiNGiZ', 1, 'TO1h5XRF4I', 5);
INSERT INTO `rms_room` VALUES (789, '347', 2, 'CFPpWQmtDi', 1, 'AmMtlab2vj', 10);
INSERT INTO `rms_room` VALUES (790, '881', 2, '0oNW1WszRN', 1, 'BsAo7bAFEm', 5);
INSERT INTO `rms_room` VALUES (791, '865', 2, 'k1THHNOB83', 1, 'jpZJLIA4rf', 3);
INSERT INTO `rms_room` VALUES (792, '176', 2, 'NMUOUSMFEn', 0, 'Kq3CgTRcDg', 10);
INSERT INTO `rms_room` VALUES (793, '572', 5, 'eDfZBGa2aV', 0, 'A6xFPVOdoT', 4);
INSERT INTO `rms_room` VALUES (794, '595', 7, 'puh1OCbcHm', 0, 'z6QUeqQfaQ', 2);
INSERT INTO `rms_room` VALUES (795, '293', 2, 't2vANutDy0', 1, 'OqDGuWjept', 7);
INSERT INTO `rms_room` VALUES (796, '568', 5, 'GKXiwhO2iv', 0, 'crNctPDRdH', 10);
INSERT INTO `rms_room` VALUES (797, '418', 3, 'jJjsK1Ibbc', 1, 'r9yXTkmrlK', 7);
INSERT INTO `rms_room` VALUES (798, '573', 7, 'fFKsnytpWT', 2, '8VEDkFJcZ9', 10);
INSERT INTO `rms_room` VALUES (799, '352', 5, '0lXsgivIl9', 0, 'BAp6FX2gbi', 10);
INSERT INTO `rms_room` VALUES (800, '747', 3, 'qgwMeMDTFd', 1, '0h5DC9pXdP', 5);
INSERT INTO `rms_room` VALUES (801, '741', 1, 'vhFv6Fqmzt', 2, 'z5JSYE3lRf', 10);
INSERT INTO `rms_room` VALUES (802, '985', 5, 'itjAmzZ3Xh', 2, 'dBNvlZbWLU', 6);
INSERT INTO `rms_room` VALUES (803, '132', 3, 'qHXeObdbW1', 0, 'zoAIoEF0QE', 2);
INSERT INTO `rms_room` VALUES (804, '924', 5, 'LyFXyhvhLZ', 1, '2QyMWy6ih5', 5);
INSERT INTO `rms_room` VALUES (805, '217', 7, 'MJDBz7qtiv', 1, 'DCuAFTCzYp', 3);
INSERT INTO `rms_room` VALUES (806, '353', 1, 'C0JXgbKqKo', 0, 'd4HZKB9f6M', 1);
INSERT INTO `rms_room` VALUES (807, '416', 6, 'CHSFD5b7ZV', 1, 'jEw2SEYmpM', 4);
INSERT INTO `rms_room` VALUES (808, '939', 2, 'utCl1gLvcj', 0, 'HyAYs3nL9R', 10);
INSERT INTO `rms_room` VALUES (809, '385', 5, 'ETMv2djFpa', 1, '5E7fzgFwwz', 4);
INSERT INTO `rms_room` VALUES (810, '393', 6, 'KDo5sdbl9j', 1, 'aRsfaHPHMb', 9);
INSERT INTO `rms_room` VALUES (811, '957', 5, 'urdOmhuuvZ', 0, 'RgTHNVzjS0', 4);
INSERT INTO `rms_room` VALUES (812, '418', 7, '5nZb5gnCJn', 1, 'Ks82B1dWeu', 3);
INSERT INTO `rms_room` VALUES (813, '186', 6, 'W4DlFOdkCS', 1, 'iH34C0Ujqz', 2);
INSERT INTO `rms_room` VALUES (814, '479', 3, 'uPqUkhzEwe', 0, 'iJOau2XiId', 6);
INSERT INTO `rms_room` VALUES (815, '525', 5, '7Hb9Xnytls', 0, 'E5FxkWVKc3', 9);
INSERT INTO `rms_room` VALUES (816, '681', 10, 'SrRCxknlKH', 1, 'HO4LbsyWHY', 2);
INSERT INTO `rms_room` VALUES (817, '138', 5, 'fgQdwBNcVa', 2, 'PNvgmlioNj', 6);
INSERT INTO `rms_room` VALUES (818, '232', 9, 'LoSX3OtK2I', 1, '3cmq5r8QjI', 9);
INSERT INTO `rms_room` VALUES (819, '647', 3, 'ICfbtj37pl', 0, '9Wxk0rSwh7', 8);
INSERT INTO `rms_room` VALUES (820, '284', 9, 'NgbVJovVkC', 0, 'aC7oH9S2YK', 3);
INSERT INTO `rms_room` VALUES (821, '937', 9, 'ZFc8KdQvQZ', 1, '7OtqXn0D6l', 11);
INSERT INTO `rms_room` VALUES (822, '162', 5, 'SIiY7bXKQ8', 2, 'ZOLYyesyuL', 7);
INSERT INTO `rms_room` VALUES (823, '844', 9, 'ayhfsHBcYl', 0, 'ZKlNFI6dCS', 8);
INSERT INTO `rms_room` VALUES (824, '493', 10, '4KOmRWrMlc', 1, 'gOTTttMxrT', 3);
INSERT INTO `rms_room` VALUES (825, '885', 3, 'FNIn1k71TI', 1, 'pV4BO46Zcv', 5);
INSERT INTO `rms_room` VALUES (826, '768', 6, '8lGPUa4OAK', 1, 'b6T1pkzU1o', 9);
INSERT INTO `rms_room` VALUES (827, '818', 2, 'rfijFNRauH', 2, 'GEMFrke8eG', 5);
INSERT INTO `rms_room` VALUES (828, '182', 8, 'tP7YqFb9tC', 1, 'Duh5UxkZaP', 3);
INSERT INTO `rms_room` VALUES (829, '175', 8, 'bwP344Pt6s', 2, 'gp0PkIqNKW', 6);
INSERT INTO `rms_room` VALUES (830, '793', 9, 'txkamRSxUM', 2, 'Iepl8kkk4k', 11);
INSERT INTO `rms_room` VALUES (831, '312', 5, 'W27bj4CalF', 2, 'CsGjqGYrzr', 3);
INSERT INTO `rms_room` VALUES (832, '118', 4, 'jyO0rM4fR2', 1, 'UMSK017zS0', 7);
INSERT INTO `rms_room` VALUES (833, '982', 3, 'Q2eRvdz1dF', 1, 'uZ7DvCHSSU', 5);
INSERT INTO `rms_room` VALUES (834, '814', 6, 'QHjnIB2px9', 1, 'uNNHFmSQvJ', 2);
INSERT INTO `rms_room` VALUES (835, '442', 6, 'Ebkh0ArION', 1, 'uNtGVIwq0H', 6);
INSERT INTO `rms_room` VALUES (836, '536', 7, 'EptSW2QUSa', 1, 'L9zLxFjXbM', 3);
INSERT INTO `rms_room` VALUES (837, '725', 8, 'Yo1O3xyDz0', 2, 'GfIn5LRGcK', 3);
INSERT INTO `rms_room` VALUES (838, '236', 7, 'CECwclc5kh', 1, 'HnErmvqyyd', 4);
INSERT INTO `rms_room` VALUES (839, '455', 4, 'WS9KlITSGE', 2, 'M7NfkcF5yp', 3);
INSERT INTO `rms_room` VALUES (840, '934', 6, 'RYwGRckbT3', 1, 'YbJlFX781L', 7);
INSERT INTO `rms_room` VALUES (841, '724', 6, 'GKT9AuwtCq', 1, 'ANMCkrYagN', 5);
INSERT INTO `rms_room` VALUES (842, '348', 7, '9rBmIXBqSu', 0, 'wtqTc2GV44', 9);
INSERT INTO `rms_room` VALUES (843, '274', 5, 'vWUV4vd2SY', 2, 'EnN5gKs7FI', 10);
INSERT INTO `rms_room` VALUES (844, '463', 10, 'S5s0DZBHMS', 2, 'uu86BoSN6N', 7);
INSERT INTO `rms_room` VALUES (845, '732', 9, 'Cb1LnMz4EY', 1, 'T54aXlfYyy', 5);
INSERT INTO `rms_room` VALUES (846, '247', 10, 'FSdfOUEi8x', 1, 'CYqRspoKqm', 9);
INSERT INTO `rms_room` VALUES (847, '956', 2, 'RfGG2laQ00', 1, 'ncLCbbsKqW', 9);
INSERT INTO `rms_room` VALUES (848, '397', 10, 'Qxy1S6ixsE', 0, '74RH39kCUE', 11);
INSERT INTO `rms_room` VALUES (849, '293', 7, 'CQNdYyTMi4', 1, '5T9rJikxXH', 10);
INSERT INTO `rms_room` VALUES (850, '259', 3, 'Up7lTCS5In', 2, 'Zj4UlIwyol', 8);
INSERT INTO `rms_room` VALUES (851, '719', 4, 'UhbnBGUxPT', 1, '3czgKNp5gi', 9);
INSERT INTO `rms_room` VALUES (852, '617', 2, 'bwulGhqrPP', 1, 'm0lzkxSA1Y', 2);
INSERT INTO `rms_room` VALUES (853, '667', 3, 'TngSdCj53x', 1, 'WSEZ0nDYPs', 9);
INSERT INTO `rms_room` VALUES (854, '432', 6, 'XWzRYdCiw0', 1, 'wkovTO92Uq', 7);
INSERT INTO `rms_room` VALUES (855, '686', 3, '24QG7OH5xz', 2, 'QZa2daDG4r', 5);
INSERT INTO `rms_room` VALUES (856, '347', 9, '7qiUaG8Qwo', 1, 'kDApCSRUh1', 3);
INSERT INTO `rms_room` VALUES (857, '297', 4, '0EP2bmgCum', 1, 'nomddXDwt3', 3);
INSERT INTO `rms_room` VALUES (858, '642', 10, 'grHVIYj3Rq', 1, 'rV6h3UXBSw', 3);
INSERT INTO `rms_room` VALUES (859, '772', 6, 'zrfJViSV7b', 0, 'rXi4Cv9aOQ', 3);
INSERT INTO `rms_room` VALUES (860, '534', 6, '09EsJMCOz4', 0, 'MiPsKwQkiB', 11);
INSERT INTO `rms_room` VALUES (861, '172', 10, 'MDbzoplyBw', 1, '69WWRtIhGQ', 1);
INSERT INTO `rms_room` VALUES (862, '416', 1, '00t4rJjL5p', 1, 'BWidVxpIGS', 6);
INSERT INTO `rms_room` VALUES (863, '293', 4, 'Ynj2t8qBcy', 1, 'dpsh6Saw7S', 5);
INSERT INTO `rms_room` VALUES (864, '952', 6, 'NtBweqjtXE', 2, 'wBcd9Hwlei', 4);
INSERT INTO `rms_room` VALUES (865, '343', 5, 'OjrtA3idB9', 1, 'klUZ4D1A3I', 8);
INSERT INTO `rms_room` VALUES (866, '674', 8, 'gQ3nWATYjJ', 1, 'QDMc2SPLfg', 8);
INSERT INTO `rms_room` VALUES (867, '351', 6, 'yNYGBE9TfY', 2, 'meIX9QOH3W', 3);
INSERT INTO `rms_room` VALUES (868, '223', 10, '1mExyTfzbl', 2, 'ZieQhqQbsj', 3);
INSERT INTO `rms_room` VALUES (869, '223', 2, 'SzK4wnhUHa', 1, 'KZ3cUVyjIG', 10);
INSERT INTO `rms_room` VALUES (870, '312', 9, 'FJauLOKu4j', 1, 'FTUOYDuv6J', 3);
INSERT INTO `rms_room` VALUES (871, '921', 2, 'laHJZSTbaD', 1, 'esMPXzxe5T', 9);
INSERT INTO `rms_room` VALUES (872, '825', 7, 'pzpZ2jynMw', 2, 'KkCF6q8Wlp', 9);
INSERT INTO `rms_room` VALUES (873, '289', 3, 'Ahf36D6Ohg', 0, 'ZrkYVsreg5', 7);
INSERT INTO `rms_room` VALUES (874, '259', 2, 'N4cJEPZdy3', 1, 'CNyJCGXrUO', 6);
INSERT INTO `rms_room` VALUES (875, '644', 6, 'c3ieTuybDb', 0, '1fVuabGMYn', 4);
INSERT INTO `rms_room` VALUES (876, '722', 8, 'AEHjhA0Lj2', 2, 'ko9Fl3xumL', 7);
INSERT INTO `rms_room` VALUES (877, '655', 6, 'fDx5oCWVGS', 2, 'NnbCQzIVGO', 10);
INSERT INTO `rms_room` VALUES (878, '292', 7, 'rUP5fbttNs', 1, 'nG6Mtsnuzr', 10);
INSERT INTO `rms_room` VALUES (879, '598', 3, 'okjMqQzuJf', 0, 'WO5QcI2TNL', 5);
INSERT INTO `rms_room` VALUES (880, '346', 9, 'DcLXJhshw9', 0, 'w6MHVWwGho', 4);
INSERT INTO `rms_room` VALUES (881, '169', 3, 'eA3WDbfy9G', 1, '0lzJ9xxDd2', 4);
INSERT INTO `rms_room` VALUES (882, '548', 7, 'nQJUgJieck', 1, 's6yFrrKnmP', 3);
INSERT INTO `rms_room` VALUES (883, '247', 10, 'Rx46owMizj', 0, 'ApFA2LuELc', 3);
INSERT INTO `rms_room` VALUES (884, '177', 5, 'FQjQsZsLKt', 0, 'SD97uSvmhY', 8);
INSERT INTO `rms_room` VALUES (885, '849', 7, 'f0BZp7dLyT', 0, 'Z1G7CP2GLu', 3);
INSERT INTO `rms_room` VALUES (886, '293', 7, 'zJxdbXwvqH', 1, 'xW6xr9V6xI', 5);
INSERT INTO `rms_room` VALUES (887, '776', 8, 'j18EFPSXQP', 2, 'KqdmqTFM2F', 1);
INSERT INTO `rms_room` VALUES (888, '226', 4, 'XX7pOFiDsv', 1, 'AJTCJGbwHb', 3);
INSERT INTO `rms_room` VALUES (889, '344', 9, 'fS1Ca8iCMv', 2, 'ApSYIuHfG9', 11);
INSERT INTO `rms_room` VALUES (890, '566', 3, 'rZX6DDRx2K', 0, 'rdxy76O8D8', 9);
INSERT INTO `rms_room` VALUES (891, '228', 3, 'BYdnd85TMn', 2, 'RbIOLyn6Sw', 10);
INSERT INTO `rms_room` VALUES (892, '193', 7, 'QMdceNd7pT', 0, 'qoBKr2sRdi', 8);
INSERT INTO `rms_room` VALUES (893, '852', 2, '2DDFs5Qy1B', 0, '175YkL9MCU', 2);
INSERT INTO `rms_room` VALUES (894, '653', 3, 'HSUztK9KcM', 1, 'Ja0em5YnJX', 7);
INSERT INTO `rms_room` VALUES (895, '467', 5, 'awBK3WUi35', 2, 'u7aD4j8p30', 7);
INSERT INTO `rms_room` VALUES (896, '666', 2, 'ldseYw0j9E', 1, 'ZFxxWFdNyQ', 6);
INSERT INTO `rms_room` VALUES (897, '561', 1, 'asKhyj4zHj', 1, '8ZAFRIrUOW', 5);
INSERT INTO `rms_room` VALUES (898, '982', 9, 'ZiJCO81xrf', 1, 'gkccPaaNRT', 7);
INSERT INTO `rms_room` VALUES (899, '265', 4, '7lM5Xo9nmM', 2, 'Mqg4z84Ach', 2);
INSERT INTO `rms_room` VALUES (900, '271', 2, '67WJ76xs1s', 1, '4OEKfCCxhY', 4);
INSERT INTO `rms_room` VALUES (901, '987', 10, 'hs0dHFVEQI', 2, 'tevpYBaFjo', 3);
INSERT INTO `rms_room` VALUES (902, '815', 5, 'X6eRDGy37e', 0, '8sg5Es4NVO', 1);
INSERT INTO `rms_room` VALUES (903, '686', 2, 'prnHVLLEuS', 1, 'p7zXbCgjGc', 5);
INSERT INTO `rms_room` VALUES (904, '496', 2, 'BxPeOwzWD2', 1, 'Yd4uS5Fhxn', 7);
INSERT INTO `rms_room` VALUES (905, '163', 5, 'WBl5gBS0Cz', 1, 'MdcT2TdjUF', 3);
INSERT INTO `rms_room` VALUES (906, '622', 7, 'oksCBG3PQ4', 1, 'HZqdKeev13', 2);
INSERT INTO `rms_room` VALUES (907, '537', 3, 'h83C4KyuC3', 1, 'BCRFUgUwf9', 7);
INSERT INTO `rms_room` VALUES (908, '183', 1, 'hEN1jfvbzK', 1, 'VtXE7n4Cfv', 3);
INSERT INTO `rms_room` VALUES (909, '876', 5, 'Jd1REveAmB', 1, 'TCMOEJdQRT', 8);
INSERT INTO `rms_room` VALUES (910, '783', 9, 'dWhVy9sV9G', 2, 'SUGqyQCAcp', 9);
INSERT INTO `rms_room` VALUES (911, '694', 3, 'SJh5ZrYSUv', 2, '5aujnOeE1K', 2);
INSERT INTO `rms_room` VALUES (912, '394', 5, 'gn9cVRr3Wm', 0, 'DHzrB24SA6', 9);
INSERT INTO `rms_room` VALUES (913, '523', 3, 'LxAKrWLT7A', 0, 'elpRDZMmcr', 3);
INSERT INTO `rms_room` VALUES (914, '188', 4, '7iO7c8czck', 0, 'u3Gs2hBnQK', 9);
INSERT INTO `rms_room` VALUES (915, '298', 3, 'AcUibIaJwZ', 0, 'B9c8ScJc2E', 2);
INSERT INTO `rms_room` VALUES (916, '397', 9, '0Gj0Y5axax', 1, 'ltvWzqKhpR', 4);
INSERT INTO `rms_room` VALUES (917, '122', 8, 'B7ZdvYkcRq', 1, 'qI7UXtg5XN', 4);
INSERT INTO `rms_room` VALUES (918, '187', 10, 'TFkRyUDkzb', 0, 'i9clWZmFDt', 8);
INSERT INTO `rms_room` VALUES (919, '259', 4, 'qqZDPLSBgX', 1, 'KDH6N3P5RF', 8);
INSERT INTO `rms_room` VALUES (920, '976', 8, 'F7Cxt5ukgC', 1, 'iZatmJsVUp', 7);
INSERT INTO `rms_room` VALUES (921, '639', 5, '1MzTw358io', 2, 'ecVqHIHbN2', 5);
INSERT INTO `rms_room` VALUES (922, '515', 9, 'j5v9rcrCnx', 2, 'Wkkow5H3up', 8);
INSERT INTO `rms_room` VALUES (923, '518', 3, 'P28oBePWCI', 1, 'IbPwte8iRx', 10);
INSERT INTO `rms_room` VALUES (924, '929', 2, '7iIulbNg3i', 0, 'Op4W3wvpmv', 5);
INSERT INTO `rms_room` VALUES (925, '841', 10, 'AiObRnGBPA', 2, 'NGu5hTn12G', 10);
INSERT INTO `rms_room` VALUES (926, '393', 1, 'NN2yu2Dem8', 0, 'Pt4yH1oRMX', 6);
INSERT INTO `rms_room` VALUES (927, '999', 2, 'ZI7dkEx2Gg', 1, '6ieqLv7AcC', 7);
INSERT INTO `rms_room` VALUES (928, '298', 6, 'hHxquJjNWe', 1, 'gkcNBLuJJF', 7);
INSERT INTO `rms_room` VALUES (929, '631', 7, 'Fe3GNudnCH', 1, 'a7BAgeyoz1', 6);
INSERT INTO `rms_room` VALUES (930, '215', 7, 'g6NPidQI1v', 2, 'Wak3axJTIU', 5);
INSERT INTO `rms_room` VALUES (931, '332', 9, 'FAo37pNBbn', 1, 'WLbHNWPhYn', 8);
INSERT INTO `rms_room` VALUES (932, '374', 2, 'lCrB0vWIIw', 2, 'quXASD0AE6', 1);
INSERT INTO `rms_room` VALUES (933, '618', 4, 'Wr3F42TdE6', 0, 'KVT6EhAt8c', 11);
INSERT INTO `rms_room` VALUES (934, '738', 5, 'Vb79jAsS6Q', 1, '9l8YOn3krn', 9);
INSERT INTO `rms_room` VALUES (935, '926', 10, 'L1jgK3PmYM', 0, 'ixVLmQahfU', 4);
INSERT INTO `rms_room` VALUES (936, '115', 5, '6cOeUKibkO', 2, 'dH7opNpTFi', 9);
INSERT INTO `rms_room` VALUES (937, '694', 9, 'j770xwq3nF', 1, 'CFTAUyAWVy', 4);
INSERT INTO `rms_room` VALUES (938, '354', 1, 'xvx0SwHcUe', 1, 'ARvTssIoG8', 10);
INSERT INTO `rms_room` VALUES (939, '251', 4, 'OxU0IEBfss', 1, 'zAY7t5jwK1', 8);
INSERT INTO `rms_room` VALUES (940, '938', 4, 'ZvtLDolGnE', 1, 'XgmFJomoi2', 2);
INSERT INTO `rms_room` VALUES (941, '213', 5, 'Q3hWbIwbTK', 1, 'linsXMew31', 7);
INSERT INTO `rms_room` VALUES (942, '417', 6, '3uZUYZmrSQ', 1, 'NNObvjbJsm', 3);
INSERT INTO `rms_room` VALUES (943, '274', 9, 'MamufAQWfV', 1, 'CdNK0YghS8', 6);
INSERT INTO `rms_room` VALUES (944, '599', 2, 'S1NMIotmwZ', 1, '4nJNT4b7q0', 5);
INSERT INTO `rms_room` VALUES (945, '771', 1, 'RQYf7A4UNu', 1, '1GwjcnVP3I', 2);
INSERT INTO `rms_room` VALUES (946, '398', 10, '1dVM0TNX5B', 0, 'LIwc4hcMYJ', 8);
INSERT INTO `rms_room` VALUES (947, '649', 8, 'c3GstdpCN9', 2, 'HMcFLG5PFi', 3);
INSERT INTO `rms_room` VALUES (948, '166', 6, 'VaVMSiIEi8', 2, 'p5K000Sw8R', 5);
INSERT INTO `rms_room` VALUES (949, '345', 7, 'e8Vy8FK7vJ', 1, 'gDbCX1QGJk', 1);
INSERT INTO `rms_room` VALUES (950, '239', 3, 'y0zY0t4c32', 2, 'y1M3FBENwx', 7);
INSERT INTO `rms_room` VALUES (951, '292', 8, 'V7WE786NRz', 1, '9iN6nzhu2m', 6);
INSERT INTO `rms_room` VALUES (952, '539', 3, 'd3iesMx5C3', 0, 'GbdUsQiXw2', 6);
INSERT INTO `rms_room` VALUES (953, '215', 4, 'gF7x7vsbCg', 1, 'hkJU31HMnW', 7);
INSERT INTO `rms_room` VALUES (954, '685', 7, 'TiSDMpyvmZ', 1, 'QYt9MdzGXX', 4);
INSERT INTO `rms_room` VALUES (955, '216', 5, 'nl5Fdee3NM', 2, 'IIeqhpofBf', 8);
INSERT INTO `rms_room` VALUES (956, '943', 2, 'w2GQv4OTa9', 1, 'z0rq49Q8at', 7);
INSERT INTO `rms_room` VALUES (957, '962', 1, 'tWv8WCMEER', 1, '3AWg7JPUHr', 7);
INSERT INTO `rms_room` VALUES (958, '161', 8, '54vVIdNhWV', 1, 'dSFVRpojRB', 4);
INSERT INTO `rms_room` VALUES (959, '695', 6, 'VFfaVtqc08', 0, 'GuLDQqFjSB', 4);
INSERT INTO `rms_room` VALUES (960, '972', 9, 'bFJiCggXQr', 2, 'yNXQEpncud', 10);
INSERT INTO `rms_room` VALUES (961, '454', 3, '8lhOIGcwDE', 1, 'Cs1sfEgsLu', 3);
INSERT INTO `rms_room` VALUES (962, '396', 9, '3rVuVSlKCj', 2, 'NaEpYsXmau', 2);
INSERT INTO `rms_room` VALUES (963, '544', 1, 'XceGxZuTVk', 1, 'YEuwsBtK5C', 10);
INSERT INTO `rms_room` VALUES (964, '616', 4, 'b7Xscc2har', 1, 'QXvBhq22BT', 4);
INSERT INTO `rms_room` VALUES (965, '984', 2, 'MaVbVXHdNc', 1, 'R1IJCfMfhp', 3);
INSERT INTO `rms_room` VALUES (966, '314', 3, 'bfI2FlE8ha', 2, 'ZiCCaWYe7c', 3);
INSERT INTO `rms_room` VALUES (967, '468', 7, '2uYGxFf3p9', 1, '7HogbcRRZg', 8);
INSERT INTO `rms_room` VALUES (968, '387', 6, 'XBEsTZtH4d', 2, 'hL7cPiaSwA', 6);
INSERT INTO `rms_room` VALUES (969, '715', 9, 'f9i48TP4ko', 0, 'pbJo32ngRo', 6);
INSERT INTO `rms_room` VALUES (970, '528', 7, '6FsLYFUFda', 1, '4IBYDqXWhm', 1);
INSERT INTO `rms_room` VALUES (971, '211', 9, 'trDRdqkM63', 2, 'uQ96dsIGHt', 4);
INSERT INTO `rms_room` VALUES (972, '844', 9, 'XTrAv15Mo3', 2, 'm3VZmT0C4b', 11);
INSERT INTO `rms_room` VALUES (973, '992', 2, 'YN9Bxo7aIW', 2, 'fDQqUi666R', 4);
INSERT INTO `rms_room` VALUES (974, '218', 6, '5MS88Df54l', 0, 'v9OCi21a01', 6);
INSERT INTO `rms_room` VALUES (975, '796', 6, '9LFmHxoJgF', 1, 'XqdPWzrGx6', 8);
INSERT INTO `rms_room` VALUES (976, '759', 2, '6iFc2PT1Dn', 1, 'E8mOzm1aqf', 4);
INSERT INTO `rms_room` VALUES (977, '144', 3, 'Hdj17t98kr', 0, '1iyN9xVi1Z', 9);
INSERT INTO `rms_room` VALUES (978, '853', 8, 'WYca64in8j', 1, '8VRH2N6Slp', 10);
INSERT INTO `rms_room` VALUES (979, '822', 9, 'evwIVJQhJ4', 2, 'Zcqd58Wtfv', 3);
INSERT INTO `rms_room` VALUES (980, '382', 1, '7MkRVYea0V', 1, 'rK8nG4fCzf', 9);
INSERT INTO `rms_room` VALUES (981, '918', 6, 'nO2XEA9FCo', 1, 'ugAUSjBMxN', 7);
INSERT INTO `rms_room` VALUES (982, '918', 2, 'Hm4DKDGfRq', 1, 'xTQtmR9kiv', 10);
INSERT INTO `rms_room` VALUES (983, '795', 9, 'PFxwBz4UV5', 0, 'f8ywA08yY8', 4);
INSERT INTO `rms_room` VALUES (984, '548', 6, 'Z8q5aSU3oF', 1, 'wP90lFlaNT', 1);
INSERT INTO `rms_room` VALUES (985, '824', 7, 'pgmjSxIXa7', 1, 'AaYY3Fimqf', 10);
INSERT INTO `rms_room` VALUES (986, '221', 3, 'FLLkMIjmgo', 1, 'qfKZJFgm6V', 10);
INSERT INTO `rms_room` VALUES (987, '758', 1, 'cM9kaOIAqK', 1, 'YIWbyQyBWN', 4);
INSERT INTO `rms_room` VALUES (988, '272', 8, 'Mackes42lv', 1, 'lt3dK0sroD', 10);
INSERT INTO `rms_room` VALUES (989, '126', 2, '06pDgIyT8v', 0, '6CEgDL33rx', 8);
INSERT INTO `rms_room` VALUES (990, '578', 4, 't0oplLoCLr', 1, 'tjTO2PPIPL', 6);
INSERT INTO `rms_room` VALUES (991, '328', 4, 'MVqLem9KH4', 0, 'dOsuF1ted6', 9);
INSERT INTO `rms_room` VALUES (992, '174', 6, 'a1UALEalXp', 0, 'd8tASem3nu', 11);
INSERT INTO `rms_room` VALUES (993, '323', 4, '5oJPYkBHBv', 0, '1md65qQ7bo', 2);
INSERT INTO `rms_room` VALUES (994, '262', 6, 'PTf34Mt2FN', 0, 'px05HN7OJw', 10);
INSERT INTO `rms_room` VALUES (995, '559', 2, 'sGoSkq706V', 2, '4seM7yAxje', 3);
INSERT INTO `rms_room` VALUES (996, '767', 6, 'ncT4VxjfwF', 2, 'CosRUGtx9I', 4);
INSERT INTO `rms_room` VALUES (997, '222', 5, 'Dz9xghJnmN', 1, 'NzmHFTgUKK', 3);
INSERT INTO `rms_room` VALUES (998, '634', 3, 'XHrg0BWtpN', 2, 'rb61njyqO2', 8);
INSERT INTO `rms_room` VALUES (999, '637', 8, 'HbIEu8eiLx', 1, 'wrLmPM7idq', 7);
INSERT INTO `rms_room` VALUES (1000, '676', 9, 'EQjlntljNc', 1, 'aJCHh2Ky3v', 3);
INSERT INTO `rms_room` VALUES (1001, '785', 6, 'AJrCNnWf63', 1, 'cZ2sN5cemi', 8);
INSERT INTO `rms_room` VALUES (1002, '723', 4, 'XzQRVH6TPX', 0, 'B2Q11k10Gr', 10);
INSERT INTO `rms_room` VALUES (1003, '432', 9, 'Sj9FW1pPkE', 1, 'uLnWJThl27', 6);
INSERT INTO `rms_room` VALUES (1004, '689', 8, 'Np8XweK6dN', 0, 'hPkjqgEg8y', 5);
INSERT INTO `rms_room` VALUES (1005, '993', 10, 'Cxo8qAnHBl', 1, 'EYkteL5iyt', 4);
INSERT INTO `rms_room` VALUES (1006, '817', 3, 'eMpZyp9iVJ', 0, 'cXSiyIy46t', 2);
INSERT INTO `rms_room` VALUES (1007, '567', 2, 'trt8vsRT3F', 1, 'QD3ipKVH13', 11);
INSERT INTO `rms_room` VALUES (1008, '637', 3, '9sdP9j38oV', 1, 'GZseNVGVLE', 7);
INSERT INTO `rms_room` VALUES (1009, '892', 8, 'hA52s9plJQ', 1, 'AjMwVmXoI6', 4);
INSERT INTO `rms_room` VALUES (1010, '121', 5, 'kXsMgv8qiR', 2, 'Af1pyOIa93', 2);
INSERT INTO `rms_room` VALUES (1011, '186', 7, 'JAwwiLHlz7', 1, 'Ugq0IuGjdJ', 11);
INSERT INTO `rms_room` VALUES (1012, '722', 2, 'DGfj3thTuO', 1, 'MAzMNUuamU', 4);

-- ----------------------------
-- Table structure for rms_room_goods
-- ----------------------------
DROP TABLE IF EXISTS `rms_room_goods`;
CREATE TABLE `rms_room_goods`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `room_id` int UNSIGNED NULL DEFAULT NULL,
  `goods_id` int UNSIGNED NULL DEFAULT NULL,
  `goods_amount` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `room_id`(`room_id` ASC) USING BTREE,
  INDEX `rms_room_goods_ibfk_2`(`goods_id` ASC) USING BTREE,
  CONSTRAINT `rms_room_goods_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rms_room` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rms_room_goods_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `rms_r_goods` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_room_goods
-- ----------------------------

-- ----------------------------
-- Table structure for rms_tourist
-- ----------------------------
DROP TABLE IF EXISTS `rms_tourist`;
CREATE TABLE `rms_tourist`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `number` int NOT NULL COMMENT '游客账号',
  `full_name` varchar(92) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '真实姓名（世界之最92个字符）',
  `ID_card_passport` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证号18位或护照9位',
  `nickname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '游客昵称',
  `gender` tinyint UNSIGNED NOT NULL DEFAULT 4 COMMENT '性别:0、未知，1、男，2、女，3、其它、4、未知',
  `qq` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '游客qq号',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '游客电子邮箱(目前最长的常用邮箱32位字符)',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录密码（采用md5加密）',
  `telephone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话号码（中国个人号码11位）',
  `introduction` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个人简介（限100字数）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_method` tinyint UNSIGNED NULL DEFAULT 1 COMMENT '注册方式 ：0电话号码，1电子邮箱',
  `wechat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信号6-20',
  `state` tinyint NULL DEFAULT 0 COMMENT '0启用1禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rms_tourist
-- ----------------------------
INSERT INTO `rms_tourist` VALUES (1, 10001, '林子韬', '13123132', 'Zitao', 1, '7304827764', 'zitaol@icloud.com', '9756ec29cbc911df8e641832a6c430c5', '19831373504', 'RvTi0fvTt6', '2023-04-12 09:31:43', '2023-04-22 16:40:28', 1, 'IK8EMBN0Nm', 0);
INSERT INTO `rms_tourist` VALUES (2, 10002, '任子异', '44212321232332', 'Ziyi', 2, '6221945096', 'ziyiren@hotmail.com', '9756ec29cbc911df8e641832a6c430c5', '13927154629', '8IUvmmkj4Z', '2023-04-12 09:31:49', '2023-04-17 15:41:14', 2, '1MCt8R1QBf', 0);
INSERT INTO `rms_tourist` VALUES (4, 10004, '钱子韬', '44222333223', 'Zitao', 1, '4291472166', 'qianzit@icloud.com', '9756ec29cbc911df8e641832a6c430c5', '14122241765', 'sMjA3LrSBu', '2023-04-12 09:32:10', '2023-04-17 15:41:12', 1, 'KHNIk0Sv2V', 0);
INSERT INTO `rms_tourist` VALUES (6, 10007, '薛致远', '3123123123123', 'Zhiyuan', 0, '3373174029', 'xuezhiyuan@mail.com', '9756ec29cbc911df8e641832a6c430c5', '15012468825', '3erjLbif2l', '2023-04-12 09:32:17', '2023-04-17 15:41:09', 1, 'l7QSQ8CsV9', 0);
INSERT INTO `rms_tourist` VALUES (8, 10008, '邱子韬', '123123123123', 'Zitao', 1, '1297187615', 'qiuzitao2014@icloud.com', '9756ec29cbc911df8e641832a6c430c5', '13563992809', 'V5709nGCsA', '2023-04-12 09:32:32', '2023-04-17 15:41:07', 1, 'HKvCJsGenk', 0);
INSERT INTO `rms_tourist` VALUES (9, 10009, '雷震南', 'VHPsMDcTM8', 'Zhennan', 2, '1771411178', 'leizh@mail.com', '9756ec29cbc911df8e641832a6c430c5', '17209048183', 'OlR1HTnv8G', '2023-04-12 09:32:42', '2023-04-17 15:41:04', 2, '7OhPyU9kDk', 0);
INSERT INTO `rms_tourist` VALUES (10, 100010, '傅睿', '9HK4gh2Ef2', 'Rui', 1, '9772687383', 'frui@gmail.com', '9756ec29cbc911df8e641832a6c430c5', '15938405358', 'ntQ2ojNaaj', '2023-04-12 09:32:55', '2023-04-17 15:41:01', 1, 'er6QgBPsBd', 0);
INSERT INTO `rms_tourist` VALUES (11, 100011, '罗子韬', '13123132', 'Zitao', 1, '7304827764', 'zitaol@icloud.com', '9756ec29cbc911df8e641832a6c430c5', '19831373504', 'RvTi0fvTt6', '2023-04-12 10:43:04', '2023-04-17 15:40:52', 1, 'IK8EMBN0Nm', 0);
INSERT INTO `rms_tourist` VALUES (12, 100012, '罗子韬', '13123132', 'Zitao', 1, '7304827764', 'zitaol@icloud.com', '9756ec29cbc911df8e641832a6c430c5', '19831373504', 'RvTi0fvTt6', '2023-04-12 10:45:55', '2023-04-17 15:40:38', 1, 'IK8EMBN0Nm', 0);
INSERT INTO `rms_tourist` VALUES (13, 100013, '3423423', '23432423423424', '342342', 4, '', NULL, '9756ec29cbc911df8e641832a6c430c5', NULL, NULL, '2023-04-16 07:06:33', '2023-04-17 15:40:33', 1, '', 0);
INSERT INTO `rms_tourist` VALUES (14, 100019, '31231', '123123123123', '23123', 4, '', NULL, '67a4592690a36b3cfd582e5d5e06494f', NULL, NULL, '2023-04-17 16:49:01', '2023-04-17 16:49:01', 1, '', 0);

SET FOREIGN_KEY_CHECKS = 1;
