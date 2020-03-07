/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : db_online_exam

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 07/03/2020 12:50:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限表id',
  `roleId` int(11) NOT NULL COMMENT '角色id',
  `menuId` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  INDEX `menuId`(`menuId`) USING BTREE,
  CONSTRAINT `authority_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `authority_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 630 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES (574, 2, 35);
INSERT INTO `authority` VALUES (575, 2, 36);
INSERT INTO `authority` VALUES (576, 2, 25);
INSERT INTO `authority` VALUES (577, 2, 1);
INSERT INTO `authority` VALUES (578, 2, 14);
INSERT INTO `authority` VALUES (579, 2, 15);
INSERT INTO `authority` VALUES (580, 1, 1);
INSERT INTO `authority` VALUES (581, 1, 5);
INSERT INTO `authority` VALUES (582, 1, 17);
INSERT INTO `authority` VALUES (583, 1, 18);
INSERT INTO `authority` VALUES (584, 1, 19);
INSERT INTO `authority` VALUES (585, 1, 20);
INSERT INTO `authority` VALUES (586, 1, 13);
INSERT INTO `authority` VALUES (587, 1, 21);
INSERT INTO `authority` VALUES (588, 1, 22);
INSERT INTO `authority` VALUES (589, 1, 23);
INSERT INTO `authority` VALUES (590, 1, 35);
INSERT INTO `authority` VALUES (591, 1, 36);
INSERT INTO `authority` VALUES (592, 1, 14);
INSERT INTO `authority` VALUES (593, 1, 15);
INSERT INTO `authority` VALUES (594, 1, 24);
INSERT INTO `authority` VALUES (595, 1, 25);
INSERT INTO `authority` VALUES (596, 1, 26);
INSERT INTO `authority` VALUES (597, 1, 31);
INSERT INTO `authority` VALUES (598, 1, 32);
INSERT INTO `authority` VALUES (599, 1, 33);
INSERT INTO `authority` VALUES (600, 1, 34);
INSERT INTO `authority` VALUES (601, 1, 37);
INSERT INTO `authority` VALUES (602, 1, 38);
INSERT INTO `authority` VALUES (603, 1, 39);
INSERT INTO `authority` VALUES (604, 1, 40);
INSERT INTO `authority` VALUES (605, 1, 41);
INSERT INTO `authority` VALUES (606, 1, 42);
INSERT INTO `authority` VALUES (607, 1, 43);
INSERT INTO `authority` VALUES (608, 1, 44);
INSERT INTO `authority` VALUES (609, 1, 45);
INSERT INTO `authority` VALUES (610, 1, 46);
INSERT INTO `authority` VALUES (611, 1, 47);
INSERT INTO `authority` VALUES (612, 1, 48);
INSERT INTO `authority` VALUES (613, 1, 49);
INSERT INTO `authority` VALUES (614, 1, 50);
INSERT INTO `authority` VALUES (615, 1, 51);
INSERT INTO `authority` VALUES (616, 1, 64);
INSERT INTO `authority` VALUES (617, 1, 52);
INSERT INTO `authority` VALUES (618, 1, 53);
INSERT INTO `authority` VALUES (619, 1, 54);
INSERT INTO `authority` VALUES (620, 1, 55);
INSERT INTO `authority` VALUES (621, 1, 56);
INSERT INTO `authority` VALUES (622, 1, 57);
INSERT INTO `authority` VALUES (623, 1, 58);
INSERT INTO `authority` VALUES (624, 1, 60);
INSERT INTO `authority` VALUES (625, 1, 61);
INSERT INTO `authority` VALUES (626, 1, 62);
INSERT INTO `authority` VALUES (627, 1, 63);
INSERT INTO `authority` VALUES (628, 1, 65);
INSERT INTO `authority` VALUES (629, 1, 66);

-- ----------------------------
-- Table structure for c3p0testtable
-- ----------------------------
DROP TABLE IF EXISTS `c3p0testtable`;
CREATE TABLE `c3p0testtable`  (
  `a` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考试信息表id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试名称',
  `subjectId` int(11) NOT NULL COMMENT '所属学科专业id',
  `startTime` datetime(0) NOT NULL COMMENT '考试开始时间',
  `endTime` datetime(0) NOT NULL COMMENT '考试结束时间',
  `avaliableTime` int(8) NOT NULL COMMENT '考试所需时间',
  `questionNum` int(5) NOT NULL COMMENT '试题总数',
  `totalScore` int(5) NOT NULL COMMENT '总分',
  `passScore` int(5) NOT NULL COMMENT '及格分数',
  `singleQuestionNum` int(5) NOT NULL COMMENT '单选题数量',
  `muiltQuestionNum` int(5) NOT NULL COMMENT '多选题数量',
  `chargeQuestionNum` int(5) NOT NULL COMMENT '判断题数量',
  `paperNum` int(5) NOT NULL DEFAULT 0 COMMENT '试卷数量',
  `examedNum` int(5) NOT NULL DEFAULT 0 COMMENT '已考人数',
  `passNum` int(5) NOT NULL COMMENT '及格人数',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subjectId`(`subjectId`) USING BTREE,
  CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考试信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES (2, '软件工程期中考试', 1, '2019-05-01 00:00:00', '2019-05-31 00:00:00', 60, 4, 10, 5, 2, 1, 1, 5, 5, 4, '2019-04-29 20:23:03');
INSERT INTO `exam` VALUES (3, '计算机基本知识小测验', 1, '2019-04-12 20:28:48', '2019-05-31 20:28:51', 2, 11, 28, 20, 4, 3, 4, 2, 2, 0, '2019-04-29 20:29:06');
INSERT INTO `exam` VALUES (4, '软件工程课堂随机小测试', 1, '2019-05-03 11:45:00', '2019-05-05 11:12:02', 1, 2, 6, 2, 1, 1, 0, 2, 2, 2, '2019-05-04 11:12:12');
INSERT INTO `exam` VALUES (5, '物理课堂测验', 6, '2019-05-01 16:48:31', '2019-05-18 16:48:34', 30, 3, 8, 4, 1, 1, 1, 1, 1, 1, '2019-05-04 16:49:28');
INSERT INTO `exam` VALUES (6, '软件工程2018期末考试', 1, '2018-12-01 17:00:05', '2018-12-31 17:00:16', 60, 14, 36, 20, 6, 4, 4, 0, 0, 0, '2019-05-04 17:01:57');
INSERT INTO `exam` VALUES (8, '测试', 8, '2020-01-01 00:00:00', '2020-01-31 00:00:00', 60, 10, 20, 20, 10, 0, 0, 1, 1, 0, '2020-01-14 20:51:04');

-- ----------------------------
-- Table structure for exampaper
-- ----------------------------
DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE `exampaper`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '试卷信息表id',
  `examId` int(11) NOT NULL COMMENT '所属考试ID',
  `studentId` int(11) NOT NULL COMMENT '所属学生ID',
  `status` int(2) NOT NULL DEFAULT 0 COMMENT '试卷状态：0：未考，1：已考',
  `totalScore` int(5) NOT NULL DEFAULT 0 COMMENT '总分',
  `score` int(5) NOT NULL DEFAULT 0 COMMENT '得分',
  `startExamTime` datetime(0) NULL DEFAULT NULL COMMENT '开始考试时间',
  `endExamTime` datetime(0) NULL DEFAULT NULL COMMENT '结束考试时间',
  `useTime` int(8) NULL DEFAULT NULL COMMENT '考试用时',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `examId`(`examId`) USING BTREE,
  INDEX `studentId`(`studentId`) USING BTREE,
  CONSTRAINT `exampaper_ibfk_1` FOREIGN KEY (`examId`) REFERENCES `exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exampaper_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '试卷信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exampaper
-- ----------------------------
INSERT INTO `exampaper` VALUES (9, 2, 6, 1, 10, 6, '2019-05-04 11:04:02', '2019-05-04 11:07:11', 3, '2019-05-04 11:06:49');
INSERT INTO `exampaper` VALUES (10, 4, 6, 1, 6, 6, '2019-05-04 11:12:32', '2019-05-04 11:13:31', 0, '2019-05-04 11:12:32');
INSERT INTO `exampaper` VALUES (11, 3, 6, 1, 28, 4, '2019-05-04 13:25:22', '2019-05-04 13:26:30', 1, '2019-05-04 13:25:22');
INSERT INTO `exampaper` VALUES (12, 5, 8, 1, 8, 4, '2019-05-04 16:55:38', '2019-05-04 16:55:58', 0, '2019-05-04 16:55:38');
INSERT INTO `exampaper` VALUES (14, 2, 9, 1, 10, 8, '2019-05-04 18:20:37', '2019-05-04 18:20:56', 0, '2019-05-04 18:20:37');
INSERT INTO `exampaper` VALUES (15, 2, 10, 1, 10, 6, '2019-05-04 18:22:29', '2019-05-04 18:22:46', 0, '2019-05-04 18:22:29');
INSERT INTO `exampaper` VALUES (16, 2, 11, 1, 10, 2, '2019-05-04 18:24:07', '2019-05-04 18:24:19', 0, '2019-05-04 18:24:07');
INSERT INTO `exampaper` VALUES (17, 4, 11, 1, 6, 2, '2019-05-04 18:24:51', '2019-05-04 18:25:50', 0, '2019-05-04 18:24:51');
INSERT INTO `exampaper` VALUES (18, 3, 11, 1, 28, 6, '2019-05-04 18:26:25', '2019-05-04 18:26:44', 0, '2019-05-04 18:26:25');
INSERT INTO `exampaper` VALUES (21, 8, 13, 1, 20, 14, '2020-01-14 20:51:34', '2020-01-14 20:52:40', 1, '2020-01-14 20:51:34');

-- ----------------------------
-- Table structure for exampaperanswer
-- ----------------------------
DROP TABLE IF EXISTS `exampaperanswer`;
CREATE TABLE `exampaperanswer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '试卷答题信息表id',
  `examId` int(11) NOT NULL COMMENT '所属考试ID',
  `examPaperId` int(11) NOT NULL COMMENT '所属试卷ID',
  `studentId` int(11) NOT NULL COMMENT '所属学生ID',
  `questionId` int(11) NOT NULL DEFAULT 0 COMMENT '所属试题ID',
  `answer` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '提交答案',
  `isCorrect` int(2) NOT NULL DEFAULT 0 COMMENT '是否正确',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `examId`(`examPaperId`) USING BTREE,
  INDEX `studentId`(`studentId`) USING BTREE,
  INDEX `questionId`(`questionId`) USING BTREE,
  INDEX `examId_2`(`examId`) USING BTREE,
  CONSTRAINT `exampaperanswer_ibfk_1` FOREIGN KEY (`examPaperId`) REFERENCES `exampaper` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exampaperanswer_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exampaperanswer_ibfk_3` FOREIGN KEY (`questionId`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exampaperanswer_ibfk_4` FOREIGN KEY (`examId`) REFERENCES `exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '试卷答题信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exampaperanswer
-- ----------------------------
INSERT INTO `exampaperanswer` VALUES (21, 2, 9, 6, 2, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (22, 2, 9, 6, 6, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (23, 2, 9, 6, 1, 'ABCD', 1);
INSERT INTO `exampaperanswer` VALUES (24, 2, 9, 6, 5, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (25, 4, 10, 6, 6, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (26, 4, 10, 6, 1, 'ABCD', 1);
INSERT INTO `exampaperanswer` VALUES (27, 3, 11, 6, 16, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (28, 3, 11, 6, 6, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (29, 3, 11, 6, 14, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (30, 3, 11, 6, 2, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (31, 3, 11, 6, 21, 'ACD', 0);
INSERT INTO `exampaperanswer` VALUES (32, 3, 11, 6, 20, 'AB', 0);
INSERT INTO `exampaperanswer` VALUES (33, 3, 11, 6, 22, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (34, 3, 11, 6, 5, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (35, 3, 11, 6, 17, 'B', 1);
INSERT INTO `exampaperanswer` VALUES (36, 3, 11, 6, 18, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (37, 3, 11, 6, 19, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (38, 5, 12, 8, 29, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (39, 5, 12, 8, 28, 'BD', 1);
INSERT INTO `exampaperanswer` VALUES (40, 5, 12, 8, 30, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (50, 2, 14, 9, 14, 'D', 0);
INSERT INTO `exampaperanswer` VALUES (51, 2, 14, 9, 6, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (52, 2, 14, 9, 21, 'CD', 1);
INSERT INTO `exampaperanswer` VALUES (53, 2, 14, 9, 19, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (54, 2, 15, 10, 2, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (55, 2, 15, 10, 13, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (56, 2, 15, 10, 21, 'ABCD', 0);
INSERT INTO `exampaperanswer` VALUES (57, 2, 15, 10, 18, 'B', 1);
INSERT INTO `exampaperanswer` VALUES (58, 2, 16, 11, 2, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (59, 2, 16, 11, 16, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (60, 2, 16, 11, 1, 'D', 0);
INSERT INTO `exampaperanswer` VALUES (61, 2, 16, 11, 19, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (62, 4, 17, 11, 13, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (63, 4, 17, 11, 20, 'AC', 0);
INSERT INTO `exampaperanswer` VALUES (64, 3, 18, 11, 2, 'C', 0);
INSERT INTO `exampaperanswer` VALUES (65, 3, 18, 11, 6, 'C', 0);
INSERT INTO `exampaperanswer` VALUES (66, 3, 18, 11, 15, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (67, 3, 18, 11, 13, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (68, 3, 18, 11, 1, 'BC', 0);
INSERT INTO `exampaperanswer` VALUES (69, 3, 18, 11, 20, NULL, 0);
INSERT INTO `exampaperanswer` VALUES (70, 3, 18, 11, 22, 'ABD', 0);
INSERT INTO `exampaperanswer` VALUES (71, 3, 18, 11, 5, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (72, 3, 18, 11, 17, 'B', 1);
INSERT INTO `exampaperanswer` VALUES (73, 3, 18, 11, 18, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (74, 3, 18, 11, 19, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (75, 8, 21, 13, 57, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (76, 8, 21, 13, 54, 'D', 1);
INSERT INTO `exampaperanswer` VALUES (77, 8, 21, 13, 35, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (78, 8, 21, 13, 58, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (79, 8, 21, 13, 34, 'C', 0);
INSERT INTO `exampaperanswer` VALUES (80, 8, 21, 13, 48, 'D', 1);
INSERT INTO `exampaperanswer` VALUES (81, 8, 21, 13, 47, 'B', 1);
INSERT INTO `exampaperanswer` VALUES (82, 8, 21, 13, 56, 'C', 1);
INSERT INTO `exampaperanswer` VALUES (83, 8, 21, 13, 43, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (84, 8, 21, 13, 33, 'A', 1);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统日志表id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志内容',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (13, '用户名为admin的用户登录时输入验证码错误!', '2018-12-16 18:17:30');
INSERT INTO `log` VALUES (14, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 18:22:56');
INSERT INTO `log` VALUES (15, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 18:37:15');
INSERT INTO `log` VALUES (16, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 18:40:21');
INSERT INTO `log` VALUES (17, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 19:11:49');
INSERT INTO `log` VALUES (18, '用户名为{admin}，的用户成功修改密码!', '2018-12-16 19:13:32');
INSERT INTO `log` VALUES (19, '用户名为{admin}，的用户成功修改密码!', '2018-12-16 19:14:01');
INSERT INTO `log` VALUES (20, '用户名为{cg}，角色为{普通用户}的用户登录成功!', '2018-12-16 19:17:46');
INSERT INTO `log` VALUES (21, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-21 14:03:54');
INSERT INTO `log` VALUES (22, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-21 16:32:59');
INSERT INTO `log` VALUES (23, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-21 16:41:20');
INSERT INTO `log` VALUES (24, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-21 17:00:15');
INSERT INTO `log` VALUES (25, '用户名为admin的用户登录时输入验证码错误!', '2019-04-21 17:08:58');
INSERT INTO `log` VALUES (26, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-21 17:09:09');
INSERT INTO `log` VALUES (27, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-21 17:20:28');
INSERT INTO `log` VALUES (28, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-21 19:14:08');
INSERT INTO `log` VALUES (29, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-21 19:20:51');
INSERT INTO `log` VALUES (30, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-21 20:31:38');
INSERT INTO `log` VALUES (31, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-21 20:40:28');
INSERT INTO `log` VALUES (32, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-21 20:57:55');
INSERT INTO `log` VALUES (33, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-21 20:59:17');
INSERT INTO `log` VALUES (34, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-22 21:26:13');
INSERT INTO `log` VALUES (35, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-22 21:31:25');
INSERT INTO `log` VALUES (36, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-22 22:09:06');
INSERT INTO `log` VALUES (37, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-25 21:20:00');
INSERT INTO `log` VALUES (38, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-25 21:24:30');
INSERT INTO `log` VALUES (39, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-28 19:35:44');
INSERT INTO `log` VALUES (40, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-28 19:39:37');
INSERT INTO `log` VALUES (41, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-28 19:51:46');
INSERT INTO `log` VALUES (42, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-28 21:35:07');
INSERT INTO `log` VALUES (43, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-28 21:52:27');
INSERT INTO `log` VALUES (44, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-28 21:55:07');
INSERT INTO `log` VALUES (45, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-28 22:11:24');
INSERT INTO `log` VALUES (46, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-29 20:22:22');
INSERT INTO `log` VALUES (47, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-29 20:59:06');
INSERT INTO `log` VALUES (48, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-29 21:14:00');
INSERT INTO `log` VALUES (49, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-29 22:08:39');
INSERT INTO `log` VALUES (50, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-29 22:25:57');
INSERT INTO `log` VALUES (51, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-29 22:28:04');
INSERT INTO `log` VALUES (52, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-29 22:40:32');
INSERT INTO `log` VALUES (53, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-29 22:48:00');
INSERT INTO `log` VALUES (54, '用户名为admin的用户登录时输入验证码错误!', '2019-04-29 22:50:44');
INSERT INTO `log` VALUES (55, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-04-29 22:50:52');
INSERT INTO `log` VALUES (56, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-01 18:34:56');
INSERT INTO `log` VALUES (57, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-01 18:48:06');
INSERT INTO `log` VALUES (58, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-02 15:06:28');
INSERT INTO `log` VALUES (59, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-02 15:15:13');
INSERT INTO `log` VALUES (60, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-03 13:37:07');
INSERT INTO `log` VALUES (61, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 10:47:34');
INSERT INTO `log` VALUES (62, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 11:03:48');
INSERT INTO `log` VALUES (63, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 11:11:14');
INSERT INTO `log` VALUES (64, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 11:37:59');
INSERT INTO `log` VALUES (65, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 11:40:08');
INSERT INTO `log` VALUES (66, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 12:00:26');
INSERT INTO `log` VALUES (67, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 12:24:33');
INSERT INTO `log` VALUES (68, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 12:37:20');
INSERT INTO `log` VALUES (69, '用户名为admin的用户登录时输入验证码错误!', '2019-05-04 12:40:30');
INSERT INTO `log` VALUES (70, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 12:40:37');
INSERT INTO `log` VALUES (71, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 12:42:25');
INSERT INTO `log` VALUES (72, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 12:50:11');
INSERT INTO `log` VALUES (73, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 12:53:01');
INSERT INTO `log` VALUES (74, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 12:59:13');
INSERT INTO `log` VALUES (75, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 13:00:32');
INSERT INTO `log` VALUES (76, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 13:05:07');
INSERT INTO `log` VALUES (77, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 14:58:38');
INSERT INTO `log` VALUES (78, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 15:08:45');
INSERT INTO `log` VALUES (79, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 16:31:28');
INSERT INTO `log` VALUES (80, '用户名为admin的用户登录时输入验证码错误!', '2019-05-04 16:44:02');
INSERT INTO `log` VALUES (81, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 16:44:08');
INSERT INTO `log` VALUES (82, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 16:59:46');
INSERT INTO `log` VALUES (83, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 17:17:13');
INSERT INTO `log` VALUES (84, '用户名为admin的用户登录时输入验证码错误!', '2019-05-04 17:21:28');
INSERT INTO `log` VALUES (85, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 17:21:34');
INSERT INTO `log` VALUES (86, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 17:23:51');
INSERT INTO `log` VALUES (87, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 18:08:31');
INSERT INTO `log` VALUES (88, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-05-04 18:21:39');
INSERT INTO `log` VALUES (89, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-11 13:45:06');
INSERT INTO `log` VALUES (90, '用户名为admin的用户登录时输入密码错误!', '2020-01-11 16:16:56');
INSERT INTO `log` VALUES (91, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-11 16:17:05');
INSERT INTO `log` VALUES (93, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-11 16:41:15');
INSERT INTO `log` VALUES (94, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-11 17:13:58');
INSERT INTO `log` VALUES (95, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-11 17:56:51');
INSERT INTO `log` VALUES (96, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-11 18:10:39');
INSERT INTO `log` VALUES (97, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-11 18:18:22');
INSERT INTO `log` VALUES (98, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-11 19:13:08');
INSERT INTO `log` VALUES (99, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-11 19:38:22');
INSERT INTO `log` VALUES (100, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-11 19:56:36');
INSERT INTO `log` VALUES (101, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-11 20:41:18');
INSERT INTO `log` VALUES (102, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-12 11:27:53');
INSERT INTO `log` VALUES (103, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-12 12:08:47');
INSERT INTO `log` VALUES (104, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-12 21:19:38');
INSERT INTO `log` VALUES (105, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-12 22:23:58');
INSERT INTO `log` VALUES (106, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-12 23:19:21');
INSERT INTO `log` VALUES (107, '用户名为admin的用户登录时输入验证码错误!', '2020-01-12 23:31:54');
INSERT INTO `log` VALUES (108, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-12 23:32:00');
INSERT INTO `log` VALUES (109, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-13 00:17:55');
INSERT INTO `log` VALUES (110, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-13 00:20:04');
INSERT INTO `log` VALUES (111, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-13 14:00:51');
INSERT INTO `log` VALUES (112, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-13 14:47:11');
INSERT INTO `log` VALUES (113, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-14 20:18:51');
INSERT INTO `log` VALUES (114, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-14 22:17:43');
INSERT INTO `log` VALUES (115, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-14 22:21:45');
INSERT INTO `log` VALUES (116, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-14 22:22:48');
INSERT INTO `log` VALUES (117, '用户名为admin的用户登录时输入验证码错误!', '2020-01-14 22:24:44');
INSERT INTO `log` VALUES (118, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-14 22:24:52');
INSERT INTO `log` VALUES (119, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-14 22:25:23');
INSERT INTO `log` VALUES (120, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-14 22:27:44');
INSERT INTO `log` VALUES (121, '用户名为admin的用户登录时输入验证码错误!', '2020-01-14 22:29:39');
INSERT INTO `log` VALUES (122, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-14 22:29:45');
INSERT INTO `log` VALUES (123, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-14 22:33:07');
INSERT INTO `log` VALUES (124, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-01-14 22:34:08');
INSERT INTO `log` VALUES (125, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-03-07 12:48:55');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单实体表id',
  `parentId` int(11) NOT NULL DEFAULT -1 COMMENT '父类id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点击后的url',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单icon图表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单实体表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 0, '系统设置', '', 'icon-advancedsettings');
INSERT INTO `menu` VALUES (5, 1, '菜单管理', '../admin/menu/list', 'icon-chart-organisation');
INSERT INTO `menu` VALUES (13, 1, '角色管理', '../admin/role/list', 'icon-group-key');
INSERT INTO `menu` VALUES (14, 0, '用户管理', '', 'icon-group-gear');
INSERT INTO `menu` VALUES (15, 14, '用户列表', '../admin/user/list', 'icon-group');
INSERT INTO `menu` VALUES (17, 5, '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES (18, 5, '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES (19, 5, '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES (20, 5, '添加按钮', 'openAddMenu()', 'icon-add');
INSERT INTO `menu` VALUES (21, 13, '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES (22, 13, '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES (23, 13, '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES (24, 15, '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES (25, 15, '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES (26, 15, '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES (31, 0, '系统日志', '', 'icon-table-cell');
INSERT INTO `menu` VALUES (32, 31, '日志列表', '../admin/log/list', 'icon-page-white-text');
INSERT INTO `menu` VALUES (33, 32, '添加日志', 'openAdd()', 'icon-add1');
INSERT INTO `menu` VALUES (34, 32, '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES (35, 1, '修改密码', 'edit_password', 'icon-lock-edit');
INSERT INTO `menu` VALUES (36, 35, '修改密码', 'openAdd()', 'icon-lock-edit');
INSERT INTO `menu` VALUES (37, 0, '学科管理', '', 'icon-text-padding-left');
INSERT INTO `menu` VALUES (38, 37, '学科列表', '../admin/subject/list', 'icon-application-view-columns');
INSERT INTO `menu` VALUES (39, 38, '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES (40, 38, '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES (41, 38, '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES (42, 0, '考生管理', '', 'icon-users');
INSERT INTO `menu` VALUES (43, 42, '考生列表', '../admin/student/list', 'icon-vcard');
INSERT INTO `menu` VALUES (44, 43, '添加', 'openAdd()', 'icon-user-add');
INSERT INTO `menu` VALUES (45, 43, '编辑', 'openEdit()', 'icon-user-edit');
INSERT INTO `menu` VALUES (46, 43, '删除', 'remove()', 'icon-user-cross');
INSERT INTO `menu` VALUES (47, 0, '试题管理', '', 'icon-date');
INSERT INTO `menu` VALUES (48, 47, '试题列表', '../admin/question/list', 'icon-date-magnify');
INSERT INTO `menu` VALUES (49, 48, '添加', 'openAdd()', 'icon-date-add');
INSERT INTO `menu` VALUES (50, 48, '编辑', 'openEdit()', 'icon-date-edit');
INSERT INTO `menu` VALUES (51, 48, '删除', 'remove()', 'icon-date-delete');
INSERT INTO `menu` VALUES (52, 0, '考试管理', '', 'icon-map');
INSERT INTO `menu` VALUES (53, 52, '考试列表', '../admin/exam/list', 'icon-map-magnify');
INSERT INTO `menu` VALUES (54, 53, '添加', 'openAdd()', 'icon-map-add');
INSERT INTO `menu` VALUES (55, 53, '编辑', 'openEdit()', 'icon-map-edit');
INSERT INTO `menu` VALUES (56, 53, '删除', 'remove()', 'icon-map-delete');
INSERT INTO `menu` VALUES (57, 0, '试卷管理', '', 'icon-page-white-text');
INSERT INTO `menu` VALUES (58, 57, '试卷列表', '../admin/examPaper/list', 'icon-page-white-stack');
INSERT INTO `menu` VALUES (60, 58, '编辑', 'openEdit()', 'icon-page-white-edit');
INSERT INTO `menu` VALUES (61, 58, '删除', 'remove()', 'icon-page-white-delete');
INSERT INTO `menu` VALUES (62, 0, '答题管理', '', 'icon-building-edit');
INSERT INTO `menu` VALUES (63, 62, '答题列表', '../admin/examPaperAnswer/list', 'icon-building');
INSERT INTO `menu` VALUES (64, 48, '导入试题', 'openImport()', 'icon-note-go');
INSERT INTO `menu` VALUES (65, 0, '成绩统计', '', 'icon-text-letter-omega');
INSERT INTO `menu` VALUES (66, 65, '统计图表', '../admin/stats/exam_stats', 'icon-chart-line');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '试题表id',
  `subjectId` int(11) NOT NULL DEFAULT 1 COMMENT '学科专业类型',
  `questionType` int(2) NOT NULL DEFAULT 0 COMMENT '试题类型',
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目',
  `score` int(3) NOT NULL COMMENT '分值',
  `attrA` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '选项A',
  `attrB` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '选项B',
  `attrC` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项C',
  `attrD` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项D',
  `answer` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '正确答案',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subjectId`(`subjectId`) USING BTREE,
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '试题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, 1, 1, '下列哪些是高级编程语言？', 4, 'java', 'C', 'C++', 'PHP', 'ABCD', '2019-04-22 22:03:44');
INSERT INTO `question` VALUES (2, 1, 0, '下列需要虚拟机中执行代码的是？', 2, 'Java代码', 'C代码', 'C++代码', 'PHP代码', 'A', '2019-04-22 22:10:05');
INSERT INTO `question` VALUES (5, 1, 2, '泛化针对类型而不针对实例，一个类可以继承另一个类，但一个对象不能继承另一个对象', 2, '正确', '错误', '', '', 'A', '2019-04-22 22:19:22');
INSERT INTO `question` VALUES (6, 1, 0, '下列哪个是百度官网地址？', 2, 'http://www.baidu.com', 'http://www,baidu.com', 'http://baidu.com', 'www.baidu.com', 'A', '2019-04-25 21:26:31');
INSERT INTO `question` VALUES (13, 1, 0, 'Java是什么？', 2, '编程语言', '不知道', '一种吃的东西', '诗歌语言吧', 'A', '2019-05-04 13:05:18');
INSERT INTO `question` VALUES (14, 1, 0, '瀑布模型把软件生命周期划分为八个阶段：问题的定义、可行性研究、软件需求分析、系统总体设计、详细设计、编码、测试和运行、维护。八个阶段又可归纳为三个大的阶段：计划阶段、开发阶段和＿。', 2, '详细计划', '可行性分析', '运行阶段', '测试与排错', 'C', '2019-05-04 13:21:54');
INSERT INTO `question` VALUES (15, 1, 0, '在结构化的瀑布模型中，哪一个阶段定义的标准将成为软件测试年勺系统测试阶段的目标', 2, '需求分析阶段', '详细设计阶段', '概要设计阶段', '可行性研究阶段', 'A', '2019-05-04 13:21:54');
INSERT INTO `question` VALUES (16, 1, 0, '软件工程的出现主要是由于', 2, '程序设计方法学的影响', '其它工程科学的影响', '软件危机的出现', '计算机的发展', 'C', '2019-05-04 13:21:54');
INSERT INTO `question` VALUES (17, 1, 2, '开发软件就是编写程序。', 2, '正确', '错误', '', '', 'B', '2019-05-04 13:21:54');
INSERT INTO `question` VALUES (18, 1, 2, '系统测试的主要方法是白盒法，主要进行功能测试、性能测试、安全性测试及可靠性等测试。', 2, '正确', '错误', '', '', 'B', '2019-05-04 13:21:54');
INSERT INTO `question` VALUES (19, 1, 2, '生产高质量的软件产品是软件工程的首要目标。', 2, '正确', '错误', '', '', 'A', '2019-05-04 13:21:54');
INSERT INTO `question` VALUES (20, 1, 1, '计算机病毒有两大类，它们是()', 4, '感染可执行文件', '感染磁盘dos启动区', '文件型病毒', '感染磁盘分区引导区，系统引导型病毒', 'ACD', '2019-05-04 13:21:54');
INSERT INTO `question` VALUES (21, 1, 1, '指令系统中控制程序流程的指令通常有()', 4, '传送指令', '比较指令', '转移指令', '转移与返回指令', 'CD', '2019-05-04 13:21:54');
INSERT INTO `question` VALUES (22, 1, 1, '关于计算机的主要发展趋势,以下说法正确的是', 4, '为形成计算机网络,使一国乃至全世界的多台计算机能够共享信息', '为满足科研等领域的需要,向超高速巨型化发展', '向高速微型发展', '为节约耗电量,形成计算机网络', 'ABC', '2019-05-04 13:21:54');
INSERT INTO `question` VALUES (25, 5, 0, '被誉为中国现代数学祖师的是？', 2, '姜伯驹', '苏步青', '姜立夫', '杨振宁', 'C', '2019-05-04 16:35:57');
INSERT INTO `question` VALUES (26, 5, 1, '荣获1989年台湾当局颁发的景星奖章是（），中国的第一份数学刊物--《算学报》是由（）创办的。', 4, '黄庆澄', '柯召', '徐贤修', '华罗庚', 'AC', '2019-05-04 16:38:15');
INSERT INTO `question` VALUES (27, 5, 2, '1988年被英国国际传记中心收入《世界名人录》的是方德植？', 2, '正确', '错误', '', '', 'A', '2019-05-04 16:39:00');
INSERT INTO `question` VALUES (28, 6, 1, '以下物理学知识的相关叙述，其中正确的是', 4, '用透明的标准样板和单色光检查平面的平整度是利用了光的偏振', '变化的电场周围不一定产生变化的磁场', '交警通过发射超声波测量车速是利用了波的干涉原理', '狭义相对论认为，在惯性参照系中，光速与光源、观察者间的相对运动无关', 'BD', '2019-05-04 16:41:43');
INSERT INTO `question` VALUES (29, 6, 0, '许多物理学家的科学研究不仅促进了物理学的发展，而且推动了人类文明的进步。在对以下几位物理学家所做科学贡献的叙述中，正确的是', 2, '英国物理学家卡文迪许用实验的方法测出了引力常量G ', '牛顿通过计算首先发现了海王星和冥王星', '爱因斯坦建立了相对论，相对论物理学否定了经典物理学', '开普勒经过多年的天文观测和记录，提出了“日心说”的观点', 'A', '2019-05-04 16:43:14');
INSERT INTO `question` VALUES (30, 6, 2, '许多物体可以在不发生形变的条件下对物体施以弹力作用', 2, '正确', '错误', '', '', 'B', '2019-05-04 16:45:01');
INSERT INTO `question` VALUES (31, 7, 0, 'Your sister looks very ________.What\'s the matter with her?', 2, 'funny', 'weak', 'boring', 'relaxed', 'B', '2019-05-04 16:46:42');
INSERT INTO `question` VALUES (33, 8, 0, 'Java是什么？', 2, '编程语言', '不知道', '一种吃的东西', '诗歌语言吧', 'A', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (34, 8, 0, '联合国教科文组织分别于2003年和2005年召开了以______为主题的世界性大会，并发布了《布拉格宣言》和《亚历山大宣言》。', 2, '信息素养', '信息安全', '信息检索', '信息评价', 'A', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (35, 8, 0, '\"Information retrieval \"翻译为______。\n', 2, '信息检索', '信息素养', '信息安全', '信息评价', 'A', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (36, 8, 0, '______是指在信息的生产、存储、获取、传播和利用等信息活动各个环节中，用来规范相关主体之间相互关系的法律关系和道德规范的总称。', 2, '信息知识', '信息能力', '信息意识', '信息伦理', 'D', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (37, 8, 0, '下列各项中______属于一次文献。', 2, '专利说明书', '百科全书', '目录', '综述', 'A', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (38, 8, 0, '下列各项中______属于二次文献。', 2, '索引', '期刊', '学位论文', '百科全书', 'A', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (39, 8, 0, '国内使用的《中国图书馆分类法》是采用______方法进行编排的。', 2, '字顺', '分类', '主题', '时序', 'B', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (40, 8, 0, '布尔逻辑检索中检索符号“OR”的主要作用在于______。', 2, '提高查准率', '提高查全率', '排除不必要信息', '减少文献输出量', 'B', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (41, 8, 0, '______指检出的相关文献信息量与检出的文献总量之比', 2, '查全率', '查准率', '误检率', '漏检率', 'B', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (42, 8, 0, '______是出版周期最短的定期连续出版物。', 2, '图书', '期刊', '报纸', '学位论文', 'C', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (43, 8, 0, '利用图书末尾所附参考文献进行检索的方法是____。', 2, '顺查法', '倒查法', '抽查法', '追溯法', 'D', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (44, 8, 0, '《四级英语词汇》这本图书的分类号可能是______。', 2, 'G636.33', 'J216.2', 'I247.4', 'H319', 'D', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (45, 8, 0, '布尔逻辑检索技术属于_____。', 2, '文本检索技术', '图像检索技术', '音频检索技术', '视频检索技术', 'A', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (46, 8, 0, '二次检索指的是______。', 2, '第二次检索', '检索了一次之后，结果不满意，再检索一次', '在上一次检索的结果集上进行的检索', '与上一次检索的结果进行对比，得到的检索', 'C', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (47, 8, 0, '利用CNKI的全文数据库，检索“文庭孝”老师的作品，应选择______作为检索途径。', 2, '题名', '作者', '关键词', '单位', 'B', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (48, 8, 0, 'Adobe Reader可以阅读____格式文献。', 2, 'VIP', 'TXT', 'HTML', 'PDF', 'D', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (49, 8, 0, 'CAJviewer（俗称：CAJ阅读器）是______数据库的全文阅读软件。', 2, '超星数字图书馆', '中国知网', '万方', '维普期刊', 'B', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (50, 8, 0, '以下哪项不是中国期刊全文数据库（CNKI）的检索字段？', 2, '作者', '第一作者', '基金', '分子式', 'D', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (51, 8, 0, '美国《科学引文索引》的缩写为____。', 2, 'SCI', 'CSSCI', 'EI', 'ISTP', 'A', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (52, 8, 0, '当今世界上最知名也是最权威的百科全书是____。', 2, '美国百科全书', '哥伦比亚百科全书', '不列颠百科全书', '中国大百科全书', 'C', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (53, 8, 0, 'WWW信息资源主要基于___协议传输。', 2, 'FTP', 'TELNET', 'HTTP', 'P2P', 'C', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (54, 8, 0, '微软公司开发的搜索引擎是______。', 2, 'www.baidu.com', 'www.yahoo.com', 'www.iask.com', 'www.bing.com', 'D', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (55, 8, 0, '全球最大的中文搜索引擎是______。', 2, '搜搜', '百度', '雅虎', '谷歌', 'B', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (56, 8, 0, '在百度和谷歌中，可以通过______语法实现把检索范围限定在网页标题中这个功能。', 2, 'filetype：', 'inurl：', 'intitle：', 'site：', 'C', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (57, 8, 0, '下载工具是帮助用户快速、稳定地从网上下载资源的软件。下列属于常用下载工具有哪些？', 2, '迅雷', '优酷', '淘宝', '新浪', 'A', '2020-01-14 20:48:07');
INSERT INTO `question` VALUES (58, 8, 0, '在参考文献“李国新 . 开启新时代图书馆法治研究的新阶段[J]. 图书馆, 2018.”中，“[J]”表示该参考文献是_____。', 2, '著作', '专利', '连续出版物', '标准', 'C', '2020-01-14 20:48:07');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色表id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '超级管理员拥有一切权限！');
INSERT INTO `role` VALUES (2, '普通用户', '普通用户，请自由授权！');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考生表id',
  `subjectId` int(11) NOT NULL COMMENT '所属学科专业ID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `trueName` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `tel` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subjectId`(`subjectId`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考生表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (2, 1, 'cg', '123', 'cg', '13656564656', '2019-04-21 20:40:48');
INSERT INTO `student` VALUES (3, 5, 'llqllq', 'sadsad', 'llq', '1356565656', '2019-04-21 20:46:42');
INSERT INTO `student` VALUES (4, 1, 'zs', 'sadsadsa', '张三', '18989898989', '2019-04-21 20:46:52');
INSERT INTO `student` VALUES (5, 7, 'ls', 'dsad111', '李四', '15656565656', '2019-04-21 20:47:00');
INSERT INTO `student` VALUES (6, 1, 'llq', 'llq', 'yy', '13918655696', '2019-05-01 21:33:31');
INSERT INTO `student` VALUES (8, 6, '张三丰', '123456', '张三丰', '18959558585', '2019-05-04 16:51:59');
INSERT INTO `student` VALUES (9, 1, '马大云', '123', '马云', '13656565656', '2019-05-04 18:11:12');
INSERT INTO `student` VALUES (10, 1, 'jack', '123', '马化腾', '13656564545', '2019-05-04 18:22:19');
INSERT INTO `student` VALUES (11, 1, 'test', '123', '测试人员', '13989895959', '2019-05-04 18:23:40');
INSERT INTO `student` VALUES (12, 7, '小马哥', '123123', '小马哥', '1556565655', '2019-05-04 18:27:45');
INSERT INTO `student` VALUES (13, 8, '123', '123', '123', '123', '2020-01-11 20:52:57');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学科专业表id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学科名称',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学科备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学科专业表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, '软件工程', '软件工程专业');
INSERT INTO `subject` VALUES (5, '数学专业', '数学专业');
INSERT INTO `subject` VALUES (6, '物理专业', '');
INSERT INTO `subject` VALUES (7, '英语专业', '');
INSERT INTO `subject` VALUES (8, 'cg', '测试');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表id',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名，登录名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `roleId` int(11) NOT NULL COMMENT '所属角色id',
  `photo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像照片地址',
  `sex` int(1) NOT NULL DEFAULT 0 COMMENT '性别0,代表未知，1代表男，2代表女',
  `age` int(3) NOT NULL DEFAULT 0 COMMENT '年龄',
  `address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭住址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', 1, '/BaseProjectSSM/resources/upload/1544880711002.jpg', 1, 18, '上海市浦东新区浦东南路1835号');
INSERT INTO `user` VALUES (13, 'cg', '123456', 2, '/OnlineExam/resources/upload/1578733190431.png', 1, 18, 'HNDD');

SET FOREIGN_KEY_CHECKS = 1;
