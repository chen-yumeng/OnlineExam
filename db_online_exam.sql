/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : db_online_exam

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 31/05/2021 10:09:52
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
) ENGINE = InnoDB AUTO_INCREMENT = 1057 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES (807, 1, 1);
INSERT INTO `authority` VALUES (808, 1, 5);
INSERT INTO `authority` VALUES (809, 1, 17);
INSERT INTO `authority` VALUES (810, 1, 18);
INSERT INTO `authority` VALUES (811, 1, 19);
INSERT INTO `authority` VALUES (812, 1, 20);
INSERT INTO `authority` VALUES (813, 1, 13);
INSERT INTO `authority` VALUES (814, 1, 21);
INSERT INTO `authority` VALUES (815, 1, 22);
INSERT INTO `authority` VALUES (816, 1, 23);
INSERT INTO `authority` VALUES (817, 1, 35);
INSERT INTO `authority` VALUES (818, 1, 36);
INSERT INTO `authority` VALUES (819, 1, 14);
INSERT INTO `authority` VALUES (820, 1, 15);
INSERT INTO `authority` VALUES (821, 1, 24);
INSERT INTO `authority` VALUES (822, 1, 25);
INSERT INTO `authority` VALUES (823, 1, 26);
INSERT INTO `authority` VALUES (824, 1, 31);
INSERT INTO `authority` VALUES (825, 1, 32);
INSERT INTO `authority` VALUES (826, 1, 33);
INSERT INTO `authority` VALUES (827, 1, 34);
INSERT INTO `authority` VALUES (828, 1, 37);
INSERT INTO `authority` VALUES (829, 1, 38);
INSERT INTO `authority` VALUES (830, 1, 39);
INSERT INTO `authority` VALUES (831, 1, 40);
INSERT INTO `authority` VALUES (832, 1, 41);
INSERT INTO `authority` VALUES (833, 1, 42);
INSERT INTO `authority` VALUES (834, 1, 43);
INSERT INTO `authority` VALUES (835, 1, 44);
INSERT INTO `authority` VALUES (836, 1, 45);
INSERT INTO `authority` VALUES (837, 1, 46);
INSERT INTO `authority` VALUES (838, 1, 47);
INSERT INTO `authority` VALUES (839, 1, 48);
INSERT INTO `authority` VALUES (840, 1, 49);
INSERT INTO `authority` VALUES (841, 1, 50);
INSERT INTO `authority` VALUES (842, 1, 51);
INSERT INTO `authority` VALUES (843, 1, 64);
INSERT INTO `authority` VALUES (844, 1, 52);
INSERT INTO `authority` VALUES (845, 1, 53);
INSERT INTO `authority` VALUES (846, 1, 54);
INSERT INTO `authority` VALUES (847, 1, 55);
INSERT INTO `authority` VALUES (848, 1, 56);
INSERT INTO `authority` VALUES (849, 1, 57);
INSERT INTO `authority` VALUES (850, 1, 58);
INSERT INTO `authority` VALUES (851, 1, 60);
INSERT INTO `authority` VALUES (852, 1, 61);
INSERT INTO `authority` VALUES (853, 1, 62);
INSERT INTO `authority` VALUES (854, 1, 63);
INSERT INTO `authority` VALUES (855, 1, 67);
INSERT INTO `authority` VALUES (856, 1, 65);
INSERT INTO `authority` VALUES (857, 1, 66);
INSERT INTO `authority` VALUES (1031, 3, 35);
INSERT INTO `authority` VALUES (1032, 3, 36);
INSERT INTO `authority` VALUES (1033, 3, 42);
INSERT INTO `authority` VALUES (1034, 3, 43);
INSERT INTO `authority` VALUES (1035, 3, 44);
INSERT INTO `authority` VALUES (1036, 3, 45);
INSERT INTO `authority` VALUES (1037, 3, 46);
INSERT INTO `authority` VALUES (1038, 3, 47);
INSERT INTO `authority` VALUES (1039, 3, 48);
INSERT INTO `authority` VALUES (1040, 3, 49);
INSERT INTO `authority` VALUES (1041, 3, 50);
INSERT INTO `authority` VALUES (1042, 3, 51);
INSERT INTO `authority` VALUES (1043, 3, 64);
INSERT INTO `authority` VALUES (1044, 3, 52);
INSERT INTO `authority` VALUES (1045, 3, 53);
INSERT INTO `authority` VALUES (1046, 3, 54);
INSERT INTO `authority` VALUES (1047, 3, 55);
INSERT INTO `authority` VALUES (1048, 3, 56);
INSERT INTO `authority` VALUES (1049, 3, 57);
INSERT INTO `authority` VALUES (1050, 3, 58);
INSERT INTO `authority` VALUES (1051, 3, 60);
INSERT INTO `authority` VALUES (1052, 3, 61);
INSERT INTO `authority` VALUES (1053, 3, 62);
INSERT INTO `authority` VALUES (1054, 3, 63);
INSERT INTO `authority` VALUES (1055, 3, 67);
INSERT INTO `authority` VALUES (1056, 3, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考试信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES (10, '软件工程小测试', 12, '2021-02-05 14:57:33', '2021-02-06 14:57:37', 60, 20, 40, 30, 20, 0, 0, 1, 1, 0, '2021-02-05 14:57:53');
INSERT INTO `exam` VALUES (11, '软件工程课堂测试', 12, '2021-02-09 22:17:28', '2021-02-10 22:17:29', 60, 20, 40, 30, 20, 0, 0, 1, 1, 0, '2021-02-09 22:17:55');

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '试卷信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exampaper
-- ----------------------------
INSERT INTO `exampaper` VALUES (23, 10, 16, 1, 40, 10, '2021-02-05 15:08:29', '2021-02-05 15:11:08', 2, '2021-02-05 15:08:29');
INSERT INTO `exampaper` VALUES (24, 11, 16, 1, 40, 20, '2021-02-09 22:41:31', '2021-02-09 22:50:48', 9, '2021-02-09 22:41:31');

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
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '试卷答题信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exampaperanswer
-- ----------------------------
INSERT INTO `exampaperanswer` VALUES (105, 10, 23, 16, 86, 'D', 0);
INSERT INTO `exampaperanswer` VALUES (106, 10, 23, 16, 85, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (107, 10, 23, 16, 87, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (108, 10, 23, 16, 104, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (109, 10, 23, 16, 89, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (110, 10, 23, 16, 94, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (111, 10, 23, 16, 109, 'D', 0);
INSERT INTO `exampaperanswer` VALUES (112, 10, 23, 16, 107, 'D', 0);
INSERT INTO `exampaperanswer` VALUES (113, 10, 23, 16, 106, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (114, 10, 23, 16, 99, 'B', 1);
INSERT INTO `exampaperanswer` VALUES (115, 10, 23, 16, 91, 'C', 0);
INSERT INTO `exampaperanswer` VALUES (116, 10, 23, 16, 102, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (117, 10, 23, 16, 95, 'C', 0);
INSERT INTO `exampaperanswer` VALUES (118, 10, 23, 16, 88, 'D', 1);
INSERT INTO `exampaperanswer` VALUES (119, 10, 23, 16, 100, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (120, 10, 23, 16, 92, 'C', 0);
INSERT INTO `exampaperanswer` VALUES (121, 10, 23, 16, 97, 'C', 0);
INSERT INTO `exampaperanswer` VALUES (122, 10, 23, 16, 93, 'B', 1);
INSERT INTO `exampaperanswer` VALUES (123, 10, 23, 16, 103, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (124, 10, 23, 16, 105, 'C', 1);
INSERT INTO `exampaperanswer` VALUES (125, 11, 24, 16, 102, 'D', 1);
INSERT INTO `exampaperanswer` VALUES (126, 11, 24, 16, 109, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (127, 11, 24, 16, 88, 'A', 0);
INSERT INTO `exampaperanswer` VALUES (128, 11, 24, 16, 85, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (129, 11, 24, 16, 106, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (130, 11, 24, 16, 93, 'C', 0);
INSERT INTO `exampaperanswer` VALUES (131, 11, 24, 16, 110, 'C', 1);
INSERT INTO `exampaperanswer` VALUES (132, 11, 24, 16, 97, 'C', 0);
INSERT INTO `exampaperanswer` VALUES (133, 11, 24, 16, 90, 'D', 0);
INSERT INTO `exampaperanswer` VALUES (134, 11, 24, 16, 103, 'A', 1);
INSERT INTO `exampaperanswer` VALUES (135, 11, 24, 16, 98, 'D', 0);
INSERT INTO `exampaperanswer` VALUES (136, 11, 24, 16, 105, 'C', 1);
INSERT INTO `exampaperanswer` VALUES (137, 11, 24, 16, 94, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (138, 11, 24, 16, 108, 'C', 1);
INSERT INTO `exampaperanswer` VALUES (139, 11, 24, 16, 104, 'B', 0);
INSERT INTO `exampaperanswer` VALUES (140, 11, 24, 16, 99, 'B', 1);
INSERT INTO `exampaperanswer` VALUES (141, 11, 24, 16, 107, 'B', 1);
INSERT INTO `exampaperanswer` VALUES (142, 11, 24, 16, 92, 'C', 0);
INSERT INTO `exampaperanswer` VALUES (143, 11, 24, 16, 95, 'D', 1);
INSERT INTO `exampaperanswer` VALUES (144, 11, 24, 16, 89, 'C', 0);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统日志表id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志内容',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 527 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (205, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-04 15:34:43');
INSERT INTO `log` VALUES (206, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-04 15:38:00');
INSERT INTO `log` VALUES (207, '用户名为teacher的用户登录时输入验证码错误!', '2021-02-04 15:38:44');
INSERT INTO `log` VALUES (208, '用户名为{teacher}，角色为{教师}的用户登录成功!', '2021-02-04 15:38:52');
INSERT INTO `log` VALUES (209, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-04 15:39:11');
INSERT INTO `log` VALUES (210, '用户名为{teacher}，角色为{教师}的用户登录成功!', '2021-02-04 15:39:28');
INSERT INTO `log` VALUES (211, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-04 15:52:44');
INSERT INTO `log` VALUES (212, '用户名为admin的用户登录时输入验证码错误!', '2021-02-04 16:33:40');
INSERT INTO `log` VALUES (213, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-04 16:33:46');
INSERT INTO `log` VALUES (214, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-04 16:44:04');
INSERT INTO `log` VALUES (215, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-04 17:00:38');
INSERT INTO `log` VALUES (216, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-04 17:03:41');
INSERT INTO `log` VALUES (217, '{HNDD}，Id为{15}，学号为{null}的考生登录成功!', '2021-02-04 17:12:30');
INSERT INTO `log` VALUES (218, '用户名为{teacher}，角色为{教师}的用户登录成功!', '2021-02-04 17:13:15');
INSERT INTO `log` VALUES (219, '用户名为admin的用户登录时输入验证码错误!', '2021-02-04 17:25:16');
INSERT INTO `log` VALUES (220, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-04 17:25:23');
INSERT INTO `log` VALUES (221, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-04 23:49:46');
INSERT INTO `log` VALUES (222, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-04 23:56:04');
INSERT INTO `log` VALUES (223, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-04 23:58:08');
INSERT INTO `log` VALUES (224, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-04 23:59:47');
INSERT INTO `log` VALUES (225, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-05 00:04:29');
INSERT INTO `log` VALUES (226, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-05 00:07:48');
INSERT INTO `log` VALUES (227, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-05 00:10:44');
INSERT INTO `log` VALUES (228, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-05 00:12:19');
INSERT INTO `log` VALUES (229, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-05 00:24:07');
INSERT INTO `log` VALUES (250, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-05 00:32:54');
INSERT INTO `log` VALUES (251, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-02-05 00:39:16');
INSERT INTO `log` VALUES (252, '管理员{超级管理员:admin} 上传了图片{1612456892933.JPG，大小为0M，保存地址为E:\\workspace\\idea-workspace\\OnlineExam\\target\\OnlineExam\\/resources/upload/}', '2021-02-05 00:41:33');
INSERT INTO `log` VALUES (253, '管理员{超级管理员:admin} 更新{teacher，Id为14，角色为教师}的管理员成功!', '2021-02-05 00:41:40');
INSERT INTO `log` VALUES (254, '用户名为{admin}，角色为{超级管理员}的管理员登录成功!', '2021-02-05 00:55:33');
INSERT INTO `log` VALUES (255, '用户名为admin的用户登录时输入密码错误!', '2021-02-05 01:05:19');
INSERT INTO `log` VALUES (256, '用户名为{admin}，角色为{超级管理员}的管理员登录成功!', '2021-02-05 01:05:26');
INSERT INTO `log` VALUES (257, '管理员{超级管理员:admin} 更新试卷{Id为22}成功!', '2021-02-05 01:05:50');
INSERT INTO `log` VALUES (258, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 11:45:52');
INSERT INTO `log` VALUES (259, '用户名为admin的用户登录时输入验证码错误!', '2021-02-05 11:48:09');
INSERT INTO `log` VALUES (260, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 11:48:14');
INSERT INTO `log` VALUES (261, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员退出!', '2021-02-05 11:49:09');
INSERT INTO `log` VALUES (262, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 11:49:15');
INSERT INTO `log` VALUES (283, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 11:53:15');
INSERT INTO `log` VALUES (304, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 11:58:16');
INSERT INTO `log` VALUES (305, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=85, studentId=15, examId=9, examPaperId=22, questionId=83, answer=\'A\', isCorrect=1, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (306, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=86, studentId=15, examId=9, examPaperId=22, questionId=70, answer=\'D\', isCorrect=1, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (307, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=87, studentId=15, examId=9, examPaperId=22, questionId=66, answer=\'B\', isCorrect=1, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (308, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=88, studentId=15, examId=9, examPaperId=22, questionId=69, answer=\'D\', isCorrect=1, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (309, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=89, studentId=15, examId=9, examPaperId=22, questionId=81, answer=\'D\', isCorrect=0, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (310, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=90, studentId=15, examId=9, examPaperId=22, questionId=62, answer=\'A\', isCorrect=0, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (311, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=91, studentId=15, examId=9, examPaperId=22, questionId=79, answer=\'C\', isCorrect=1, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (312, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=92, studentId=15, examId=9, examPaperId=22, questionId=60, answer=\'A\', isCorrect=1, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (313, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=93, studentId=15, examId=9, examPaperId=22, questionId=75, answer=\'B\', isCorrect=1, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (314, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=94, studentId=15, examId=9, examPaperId=22, questionId=64, answer=\'B\', isCorrect=0, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (315, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=95, studentId=15, examId=9, examPaperId=22, questionId=76, answer=\'D\', isCorrect=1, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (316, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=96, studentId=15, examId=9, examPaperId=22, questionId=84, answer=\'C\', isCorrect=1, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (317, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=97, studentId=15, examId=9, examPaperId=22, questionId=61, answer=\'A\', isCorrect=1, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (318, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=98, studentId=15, examId=9, examPaperId=22, questionId=82, answer=\'C\', isCorrect=1, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (319, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=99, studentId=15, examId=9, examPaperId=22, questionId=65, answer=\'B\', isCorrect=1, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (320, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=100, studentId=15, examId=9, examPaperId=22, questionId=77, answer=\'A\', isCorrect=1, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (321, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=101, studentId=15, examId=9, examPaperId=22, questionId=63, answer=\'A\', isCorrect=1, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (322, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=102, studentId=15, examId=9, examPaperId=22, questionId=80, answer=\'D\', isCorrect=1, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (323, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=103, studentId=15, examId=9, examPaperId=22, questionId=59, answer=\'A\', isCorrect=1, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (324, '管理员 { 超级管理员 : admin } 删除考生答题项 { ExamPaperAnswer{id=104, studentId=15, examId=9, examPaperId=22, questionId=72, answer=\'C\', isCorrect=1, question=null} }', '2021-02-05 11:58:25');
INSERT INTO `log` VALUES (326, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 12:05:07');
INSERT INTO `log` VALUES (328, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 13:20:16');
INSERT INTO `log` VALUES (330, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 13:22:53');
INSERT INTO `log` VALUES (331, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 13:27:46');
INSERT INTO `log` VALUES (332, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 13:29:55');
INSERT INTO `log` VALUES (333, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 13:35:32');
INSERT INTO `log` VALUES (334, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 13:37:45');
INSERT INTO `log` VALUES (335, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 13:41:54');
INSERT INTO `log` VALUES (336, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 13:43:43');
INSERT INTO `log` VALUES (337, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 13:52:36');
INSERT INTO `log` VALUES (338, '管理员 { 超级管理员 : admin } 更新试卷 { ExamPaper{id=22, examId=9, studentId=15, status=1, totalScore=40, score=35, startExamTime=2021-02-04 15:43:26, endExamTime=2021-02-04 15:45:24, useTime=1, createTime=2021-02-04 15:43:26} } 为 { ExamPaper{id=22, examId=9, studentId=15, status=1, totalScore=40, score=34, startExamTime=2021-02-04 15:43:26, endExamTime=2021-02-04 15:45:24, useTime=1, createTime=2021-02-04 15:43:26} }', '2021-02-05 13:52:51');
INSERT INTO `log` VALUES (339, '管理员 { 超级管理员 : admin } 删除试卷 { ExamPaper{id=22, examId=9, studentId=15, status=1, totalScore=40, score=34, startExamTime=2021-02-04 15:43:26, endExamTime=2021-02-04 15:45:24, useTime=1, createTime=2021-02-04 15:43:26} }', '2021-02-05 13:53:06');
INSERT INTO `log` VALUES (342, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 13:55:50');
INSERT INTO `log` VALUES (343, '管理员 { 超级管理员:admin } 更新考试 { Exam{id=9, name=\'软件素养小测试\', subjectId=11, startTime=2021-02-04 15:40:30, endTime=2021-02-05 15:40:39, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=1, passNum=1, createTime=2021-02-04 15:42:07} } 为 { Exam{id=9, name=\'软件素养小测试\', subjectId=11, startTime=2021-02-04 15:40:30, endTime=2021-02-05 15:40:39, avaliableTime=40, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=1, passNum=1, createTime=2021-02-04 15:42:07} }', '2021-02-05 13:56:12');
INSERT INTO `log` VALUES (344, '管理员 { 超级管理员 : admin} 删除考试 { Exam{id=9, name=\'软件素养小测试\', subjectId=11, startTime=2021-02-04 15:40:30, endTime=2021-02-05 15:40:39, avaliableTime=40, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=1, passNum=1, createTime=2021-02-04 15:42:07} }', '2021-02-05 13:56:24');
INSERT INTO `log` VALUES (345, '管理员 { 超级管理员 : admin } 更新试题 { Question{id=59, subjectId=11, questionType=0, title=\'Java是什么？\', score=2, attrA=\'编程语言\', attrB=\'不知道\', attrC=\'一种吃的东西\', attrD=\'诗歌语言吧\', answer=\'A\', createTime=2021-02-04 15:40:00}} 为 { Question{id=59, subjectId=11, questionType=0, title=\'Java是什么？\', score=2, attrA=\'编程语言\', attrB=\'不知道\', attrC=\'一种吃的东西\', attrD=\'诗歌语言\', answer=\'A\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:56:45');
INSERT INTO `log` VALUES (346, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=59, subjectId=11, questionType=0, title=\'Java是什么？\', score=2, attrA=\'编程语言\', attrB=\'不知道\', attrC=\'一种吃的东西\', attrD=\'诗歌语言\', answer=\'A\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (347, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=60, subjectId=11, questionType=0, title=\'联合国教科文组织分别于2003年和2005年召开了以______为主题的世界性大会，并发布了《布拉格宣言》和《亚历山大宣言》。\', score=2, attrA=\'信息素养\', attrB=\'信息安全\', attrC=\'信息检索\', attrD=\'信息评价\', answer=\'A\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (348, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=61, subjectId=11, questionType=0, title=\'\"Information retrieval \"翻译为______。\n\', score=2, attrA=\'信息检索\', attrB=\'信息素养\', attrC=\'信息安全\', attrD=\'信息评价\', answer=\'A\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (349, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=62, subjectId=11, questionType=0, title=\'______是指在信息的生产、存储、获取、传播和利用等信息活动各个环节中，用来规范相关主体之间相互关系的法律关系和道德规范的总称。\', score=2, attrA=\'信息知识\', attrB=\'信息能力\', attrC=\'信息意识\', attrD=\'信息伦理\', answer=\'D\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (350, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=63, subjectId=11, questionType=0, title=\'下列各项中______属于一次文献。\', score=2, attrA=\'专利说明书\', attrB=\'百科全书\', attrC=\'目录\', attrD=\'综述\', answer=\'A\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (351, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=64, subjectId=11, questionType=0, title=\'下列各项中______属于二次文献。\', score=2, attrA=\'索引\', attrB=\'期刊\', attrC=\'学位论文\', attrD=\'百科全书\', answer=\'A\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (352, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=65, subjectId=11, questionType=0, title=\'国内使用的《中国图书馆分类法》是采用______方法进行编排的。\', score=2, attrA=\'字顺\', attrB=\'分类\', attrC=\'主题\', attrD=\'时序\', answer=\'B\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (353, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=66, subjectId=11, questionType=0, title=\'布尔逻辑检索中检索符号“OR”的主要作用在于______。\', score=2, attrA=\'提高查准率\', attrB=\'提高查全率\', attrC=\'排除不必要信息\', attrD=\'减少文献输出量\', answer=\'B\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (354, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=67, subjectId=11, questionType=0, title=\'______指检出的相关文献信息量与检出的文献总量之比\', score=2, attrA=\'查全率\', attrB=\'查准率\', attrC=\'误检率\', attrD=\'漏检率\', answer=\'B\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (355, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=68, subjectId=11, questionType=0, title=\'______是出版周期最短的定期连续出版物。\', score=2, attrA=\'图书\', attrB=\'期刊\', attrC=\'报纸\', attrD=\'学位论文\', answer=\'C\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (356, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=69, subjectId=11, questionType=0, title=\'利用图书末尾所附参考文献进行检索的方法是____。\', score=2, attrA=\'顺查法\', attrB=\'倒查法\', attrC=\'抽查法\', attrD=\'追溯法\', answer=\'D\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (357, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=70, subjectId=11, questionType=0, title=\'《四级英语词汇》这本图书的分类号可能是______。\', score=2, attrA=\'G636.33\', attrB=\'J216.2\', attrC=\'I247.4\', attrD=\'H319\', answer=\'D\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (358, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=71, subjectId=11, questionType=0, title=\'布尔逻辑检索技术属于_____。\', score=2, attrA=\'文本检索技术\', attrB=\'图像检索技术\', attrC=\'音频检索技术\', attrD=\'视频检索技术\', answer=\'A\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (359, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=72, subjectId=11, questionType=0, title=\'二次检索指的是______。\', score=2, attrA=\'第二次检索\', attrB=\'检索了一次之后，结果不满意，再检索一次\', attrC=\'在上一次检索的结果集上进行的检索\', attrD=\'与上一次检索的结果进行对比，得到的检索\', answer=\'C\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (360, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=73, subjectId=11, questionType=0, title=\'利用CNKI的全文数据库，检索“文庭孝”老师的作品，应选择______作为检索途径。\', score=2, attrA=\'题名\', attrB=\'作者\', attrC=\'关键词\', attrD=\'单位\', answer=\'B\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (361, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=74, subjectId=11, questionType=0, title=\'Adobe Reader可以阅读____格式文献。\', score=2, attrA=\'VIP\', attrB=\'TXT\', attrC=\'HTML\', attrD=\'PDF\', answer=\'D\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (362, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=75, subjectId=11, questionType=0, title=\'CAJviewer（俗称：CAJ阅读器）是______数据库的全文阅读软件。\', score=2, attrA=\'超星数字图书馆\', attrB=\'中国知网\', attrC=\'万方\', attrD=\'维普期刊\', answer=\'B\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (363, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=76, subjectId=11, questionType=0, title=\'以下哪项不是中国期刊全文数据库（CNKI）的检索字段？\', score=2, attrA=\'作者\', attrB=\'第一作者\', attrC=\'基金\', attrD=\'分子式\', answer=\'D\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (364, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=77, subjectId=11, questionType=0, title=\'美国《科学引文索引》的缩写为____。\', score=2, attrA=\'SCI\', attrB=\'CSSCI\', attrC=\'EI\', attrD=\'ISTP\', answer=\'A\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (365, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=78, subjectId=11, questionType=0, title=\'当今世界上最知名也是最权威的百科全书是____。\', score=2, attrA=\'美国百科全书\', attrB=\'哥伦比亚百科全书\', attrC=\'不列颠百科全书\', attrD=\'中国大百科全书\', answer=\'C\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:07');
INSERT INTO `log` VALUES (366, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=59, subjectId=11, questionType=0, title=\'Java是什么？\', score=2, attrA=\'编程语言\', attrB=\'不知道\', attrC=\'一种吃的东西\', attrD=\'诗歌语言\', answer=\'A\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (367, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=60, subjectId=11, questionType=0, title=\'联合国教科文组织分别于2003年和2005年召开了以______为主题的世界性大会，并发布了《布拉格宣言》和《亚历山大宣言》。\', score=2, attrA=\'信息素养\', attrB=\'信息安全\', attrC=\'信息检索\', attrD=\'信息评价\', answer=\'A\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (368, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=61, subjectId=11, questionType=0, title=\'\"Information retrieval \"翻译为______。\n\', score=2, attrA=\'信息检索\', attrB=\'信息素养\', attrC=\'信息安全\', attrD=\'信息评价\', answer=\'A\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (369, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=62, subjectId=11, questionType=0, title=\'______是指在信息的生产、存储、获取、传播和利用等信息活动各个环节中，用来规范相关主体之间相互关系的法律关系和道德规范的总称。\', score=2, attrA=\'信息知识\', attrB=\'信息能力\', attrC=\'信息意识\', attrD=\'信息伦理\', answer=\'D\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (370, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=63, subjectId=11, questionType=0, title=\'下列各项中______属于一次文献。\', score=2, attrA=\'专利说明书\', attrB=\'百科全书\', attrC=\'目录\', attrD=\'综述\', answer=\'A\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (371, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=64, subjectId=11, questionType=0, title=\'下列各项中______属于二次文献。\', score=2, attrA=\'索引\', attrB=\'期刊\', attrC=\'学位论文\', attrD=\'百科全书\', answer=\'A\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (372, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=65, subjectId=11, questionType=0, title=\'国内使用的《中国图书馆分类法》是采用______方法进行编排的。\', score=2, attrA=\'字顺\', attrB=\'分类\', attrC=\'主题\', attrD=\'时序\', answer=\'B\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (373, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=66, subjectId=11, questionType=0, title=\'布尔逻辑检索中检索符号“OR”的主要作用在于______。\', score=2, attrA=\'提高查准率\', attrB=\'提高查全率\', attrC=\'排除不必要信息\', attrD=\'减少文献输出量\', answer=\'B\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (374, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=67, subjectId=11, questionType=0, title=\'______指检出的相关文献信息量与检出的文献总量之比\', score=2, attrA=\'查全率\', attrB=\'查准率\', attrC=\'误检率\', attrD=\'漏检率\', answer=\'B\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (375, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=68, subjectId=11, questionType=0, title=\'______是出版周期最短的定期连续出版物。\', score=2, attrA=\'图书\', attrB=\'期刊\', attrC=\'报纸\', attrD=\'学位论文\', answer=\'C\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (376, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=69, subjectId=11, questionType=0, title=\'利用图书末尾所附参考文献进行检索的方法是____。\', score=2, attrA=\'顺查法\', attrB=\'倒查法\', attrC=\'抽查法\', attrD=\'追溯法\', answer=\'D\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (377, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=70, subjectId=11, questionType=0, title=\'《四级英语词汇》这本图书的分类号可能是______。\', score=2, attrA=\'G636.33\', attrB=\'J216.2\', attrC=\'I247.4\', attrD=\'H319\', answer=\'D\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (378, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=71, subjectId=11, questionType=0, title=\'布尔逻辑检索技术属于_____。\', score=2, attrA=\'文本检索技术\', attrB=\'图像检索技术\', attrC=\'音频检索技术\', attrD=\'视频检索技术\', answer=\'A\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (379, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=72, subjectId=11, questionType=0, title=\'二次检索指的是______。\', score=2, attrA=\'第二次检索\', attrB=\'检索了一次之后，结果不满意，再检索一次\', attrC=\'在上一次检索的结果集上进行的检索\', attrD=\'与上一次检索的结果进行对比，得到的检索\', answer=\'C\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (380, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=73, subjectId=11, questionType=0, title=\'利用CNKI的全文数据库，检索“文庭孝”老师的作品，应选择______作为检索途径。\', score=2, attrA=\'题名\', attrB=\'作者\', attrC=\'关键词\', attrD=\'单位\', answer=\'B\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (381, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=74, subjectId=11, questionType=0, title=\'Adobe Reader可以阅读____格式文献。\', score=2, attrA=\'VIP\', attrB=\'TXT\', attrC=\'HTML\', attrD=\'PDF\', answer=\'D\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (382, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=75, subjectId=11, questionType=0, title=\'CAJviewer（俗称：CAJ阅读器）是______数据库的全文阅读软件。\', score=2, attrA=\'超星数字图书馆\', attrB=\'中国知网\', attrC=\'万方\', attrD=\'维普期刊\', answer=\'B\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (383, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=76, subjectId=11, questionType=0, title=\'以下哪项不是中国期刊全文数据库（CNKI）的检索字段？\', score=2, attrA=\'作者\', attrB=\'第一作者\', attrC=\'基金\', attrD=\'分子式\', answer=\'D\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (384, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=77, subjectId=11, questionType=0, title=\'美国《科学引文索引》的缩写为____。\', score=2, attrA=\'SCI\', attrB=\'CSSCI\', attrC=\'EI\', attrD=\'ISTP\', answer=\'A\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (385, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=78, subjectId=11, questionType=0, title=\'当今世界上最知名也是最权威的百科全书是____。\', score=2, attrA=\'美国百科全书\', attrB=\'哥伦比亚百科全书\', attrC=\'不列颠百科全书\', attrD=\'中国大百科全书\', answer=\'C\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (386, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=79, subjectId=11, questionType=0, title=\'WWW信息资源主要基于___协议传输。\', score=2, attrA=\'FTP\', attrB=\'TELNET\', attrC=\'HTTP\', attrD=\'P2P\', answer=\'C\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (387, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=80, subjectId=11, questionType=0, title=\'微软公司开发的搜索引擎是______。\', score=2, attrA=\'www.baidu.com\', attrB=\'www.yahoo.com\', attrC=\'www.iask.com\', attrD=\'www.bing.com\', answer=\'D\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (388, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=81, subjectId=11, questionType=0, title=\'全球最大的中文搜索引擎是______。\', score=2, attrA=\'搜搜\', attrB=\'百度\', attrC=\'雅虎\', attrD=\'谷歌\', answer=\'B\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (389, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=82, subjectId=11, questionType=0, title=\'在百度和谷歌中，可以通过______语法实现把检索范围限定在网页标题中这个功能。\', score=2, attrA=\'filetype：\', attrB=\'inurl：\', attrC=\'intitle：\', attrD=\'site：\', answer=\'C\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (390, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=83, subjectId=11, questionType=0, title=\'下载工具是帮助用户快速、稳定地从网上下载资源的软件。下列属于常用下载工具有哪些？\', score=2, attrA=\'迅雷\', attrB=\'优酷\', attrC=\'淘宝\', attrD=\'新浪\', answer=\'A\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (391, '管理员 { 超级管理员 : admin } 删除试题 { Question{id=84, subjectId=11, questionType=0, title=\'在参考文献“李国新 . 开启新时代图书馆法治研究的新阶段[J]. 图书馆, 2018.”中，“[J]”表示该参考文献是_____。\', score=2, attrA=\'著作\', attrB=\'专利\', attrC=\'连续出版物\', attrD=\'标准\', answer=\'C\', createTime=2021-02-04 15:40:00} }', '2021-02-05 13:57:21');
INSERT INTO `log` VALUES (392, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 14:01:58');
INSERT INTO `log` VALUES (393, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 14:13:05');
INSERT INTO `log` VALUES (394, '用户名为admin的用户登录时输入验证码错误!', '2021-02-05 14:14:48');
INSERT INTO `log` VALUES (395, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 14:14:55');
INSERT INTO `log` VALUES (396, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 14:17:03');
INSERT INTO `log` VALUES (397, '用户名为admin的用户登录时输入验证码错误!', '2021-02-05 14:29:35');
INSERT INTO `log` VALUES (398, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 14:29:42');
INSERT INTO `log` VALUES (399, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 14:32:30');
INSERT INTO `log` VALUES (400, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 14:36:30');
INSERT INTO `log` VALUES (401, '管理员 { 超级管理员 : admin } 更新考生 { Student{id=15, studentId=null, subjectId=11, name=\'HNDD\', trueName=\'HNDD\', tel=\'17674748338\', createTime=2021-02-04 15:42:54} } 为 { Student{id=15, studentId=201865110155, subjectId=11, name=\'HNDD\', trueName=\'HNDD\', tel=\'17674748338\', createTime=2021-02-04 15:42:54} }', '2021-02-05 14:36:42');
INSERT INTO `log` VALUES (402, '管理员 { 超级管理员 : admin } 删除考生 {Student{id=15, studentId=201865110155, subjectId=11, name=\'HNDD\', trueName=\'HNDD\', tel=\'17674748338\', createTime=2021-02-04 15:42:54} }', '2021-02-05 14:38:00');
INSERT INTO `log` VALUES (403, '管理员 { 教师 : teacher } 更新学科 { Subject{id=11, name=\'软件素养\', userId=14, remark=\'软件素养\'} } 为 { Subject{id=11, name=\'软件素养\', userId=14, remark=\'软件素养123\'} }', '2021-02-05 14:38:31');
INSERT INTO `log` VALUES (404, '管理员 { 超级管理员 : admin } 删除学科 { Subject{id=11, name=\'软件素养\', userId=14, remark=\'软件素养123\'} }', '2021-02-05 14:38:42');
INSERT INTO `log` VALUES (405, '管理员 { 超级管理员 : admin } 更新管理员 { User{id=14, username=\'teacher\', roleId=3, photo=\'/OnlineExam/resources/upload/1612456892933.JPG\', sex=0, age=1, address=\'\'} ，角色为 Role{id=3, name=\'教师\', remark=\'管理考试\'} } 为 { User{id=14, username=\'teacher\', roleId=3, photo=\'/OnlineExam/resources/upload/1612456892933.JPG\', sex=0, age=1, address=\'123\'} ，角色为 Role{id=3, name=\'教师\', remark=\'管理考试\'} }', '2021-02-05 14:39:03');
INSERT INTO `log` VALUES (406, '用户名为 { admin } 的管理员修改密码!', '2021-02-05 14:40:49');
INSERT INTO `log` VALUES (407, '管理员 { 超级管理员 : admin } 更新角色 { Role{id=3, name=\'教师\', remark=\'管理考试\'} } 为 { Role{id=3, name=\'教师\', remark=\'管理考试1\'} }', '2021-02-05 14:41:05');
INSERT INTO `log` VALUES (408, '管理员 { 超级管理员 : admin } 更新角色 { Role{id=3, name=\'教师\', remark=\'管理考试1\'} } 为 { Role{id=3, name=\'教师\', remark=\'管理考试\'} }', '2021-02-05 14:41:08');
INSERT INTO `log` VALUES (409, '管理员{超级管理员:admin} 修改{教师，Id为3}角色的权限为{权限ids为(35,36,42,43,44,45,46,47,48,49,50,51,64,52,53,54,55,56,57,58,60,61,1)}!', '2021-02-05 14:41:19');
INSERT INTO `log` VALUES (410, '管理员{超级管理员:admin} 修改{教师，Id为3}角色的权限为{权限ids为(35,36,42,43,44,45,46,47,48,49,50,51,64,52,53,54,55,56,57,58,60,61,62,63,67,1)}!', '2021-02-05 14:41:22');
INSERT INTO `log` VALUES (411, '用户名为admin的用户登录时输入密码错误!', '2021-02-05 14:46:49');
INSERT INTO `log` VALUES (412, '用户名为admin的用户登录时输入验证码错误!', '2021-02-05 14:46:59');
INSERT INTO `log` VALUES (413, '用户名为admin的用户登录时输入密码错误!', '2021-02-05 14:47:14');
INSERT INTO `log` VALUES (414, '用户名为admin的用户登录时输入密码错误!', '2021-02-05 14:47:19');
INSERT INTO `log` VALUES (415, '用户名为admin的用户登录时输入密码错误!', '2021-02-05 14:47:25');
INSERT INTO `log` VALUES (416, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 14:47:30');
INSERT INTO `log` VALUES (417, '管理员 { 超级管理员 : admin } 上传了图片 { 1612507896479.JPG，大小为 (0kb)，保存地址为 ( E:\\workspace\\idea-workspace\\OnlineExam\\target\\OnlineExam\\/resources/upload/ ) }', '2021-02-05 14:51:37');
INSERT INTO `log` VALUES (418, '管理员 { 超级管理员 : admin } 添加管理员 { User{id=null, username=\'teacher\', roleId=3, photo=\'/OnlineExam/resources/upload/1612507896479.JPG\', sex=0, age=1, address=\'\'} } 角色为 { Role{id=3, name=\'教师\', remark=\'管理考试\'} }', '2021-02-05 14:52:16');
INSERT INTO `log` VALUES (419, '管理员 { 教师 : teacher } 添加学科 { Subject{id=null, name=\'软件工程\', userId=16, remark=\'\'} }', '2021-02-05 14:52:47');
INSERT INTO `log` VALUES (420, '管理员 { 超级管理员 : admin } 添加考生 { Student{id=null, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguang\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} }', '2021-02-05 14:56:53');
INSERT INTO `log` VALUES (421, '管理员 { 超级管理员 : admin } 添加考试 { Exam{id=null, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=0, examedNum=0, passNum=0, createTime=2021-02-05 14:57:52} }', '2021-02-05 14:57:53');
INSERT INTO `log` VALUES (422, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguang\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 登录', '2021-02-05 14:58:09');
INSERT INTO `log` VALUES (423, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguang\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 登录', '2021-02-05 15:03:51');
INSERT INTO `log` VALUES (424, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguang\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 修改密码', '2021-02-05 15:04:01');
INSERT INTO `log` VALUES (425, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguang\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 修改密码', '2021-02-05 15:04:28');
INSERT INTO `log` VALUES (426, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguang\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 登录', '2021-02-05 15:06:54');
INSERT INTO `log` VALUES (427, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguang\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 修改密码', '2021-02-05 15:07:01');
INSERT INTO `log` VALUES (428, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguang\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 修改个人信息为 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} }', '2021-02-05 15:07:13');
INSERT INTO `log` VALUES (429, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 修改个人信息为 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} }', '2021-02-05 15:08:18');
INSERT INTO `log` VALUES (430, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 修改个人信息为 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} }', '2021-02-05 15:08:20');
INSERT INTO `log` VALUES (431, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 试卷已生成，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:29');
INSERT INTO `log` VALUES (432, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:31');
INSERT INTO `log` VALUES (433, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:31');
INSERT INTO `log` VALUES (434, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:32');
INSERT INTO `log` VALUES (435, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:32');
INSERT INTO `log` VALUES (436, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:33');
INSERT INTO `log` VALUES (437, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:33');
INSERT INTO `log` VALUES (438, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:34');
INSERT INTO `log` VALUES (439, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:34');
INSERT INTO `log` VALUES (440, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:35');
INSERT INTO `log` VALUES (441, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:35');
INSERT INTO `log` VALUES (442, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:40');
INSERT INTO `log` VALUES (443, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:41');
INSERT INTO `log` VALUES (444, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:41');
INSERT INTO `log` VALUES (445, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:42');
INSERT INTO `log` VALUES (446, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:42');
INSERT INTO `log` VALUES (447, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:43');
INSERT INTO `log` VALUES (448, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:43');
INSERT INTO `log` VALUES (449, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:44');
INSERT INTO `log` VALUES (450, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:44');
INSERT INTO `log` VALUES (451, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:46');
INSERT INTO `log` VALUES (452, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:08:49');
INSERT INTO `log` VALUES (453, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 登录', '2021-02-05 15:09:10');
INSERT INTO `log` VALUES (454, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:09:39');
INSERT INTO `log` VALUES (455, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:09:39');
INSERT INTO `log` VALUES (456, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:10:54');
INSERT INTO `log` VALUES (457, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:10:54');
INSERT INTO `log` VALUES (458, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:10:55');
INSERT INTO `log` VALUES (459, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:10:56');
INSERT INTO `log` VALUES (460, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:10:57');
INSERT INTO `log` VALUES (461, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:10:57');
INSERT INTO `log` VALUES (462, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:10:58');
INSERT INTO `log` VALUES (463, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:10:58');
INSERT INTO `log` VALUES (464, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:10:59');
INSERT INTO `log` VALUES (465, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:11:00');
INSERT INTO `log` VALUES (466, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:11:01');
INSERT INTO `log` VALUES (467, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:11:02');
INSERT INTO `log` VALUES (468, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:11:03');
INSERT INTO `log` VALUES (469, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:11:03');
INSERT INTO `log` VALUES (470, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:11:04');
INSERT INTO `log` VALUES (471, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:11:05');
INSERT INTO `log` VALUES (472, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:11:05');
INSERT INTO `log` VALUES (473, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:11:06');
INSERT INTO `log` VALUES (474, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-05 14:57:53} }', '2021-02-05 15:11:07');
INSERT INTO `log` VALUES (475, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交试卷，试卷为 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=1, passNum=0, createTime=2021-02-05 14:57:53} },分数为 { 10 }', '2021-02-05 15:11:08');
INSERT INTO `log` VALUES (476, '用户名为admin的用户登录时输入密码错误!', '2021-02-05 15:11:26');
INSERT INTO `log` VALUES (477, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 15:11:33');
INSERT INTO `log` VALUES (478, '用户名为 { admin } 的管理员修改密码!', '2021-02-05 15:11:42');
INSERT INTO `log` VALUES (479, '管理员 { 超级管理员 : admin } 查询了考试 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=1, passNum=0, createTime=2021-02-05 14:57:53} } 的图表数据!', '2021-02-05 15:12:59');
INSERT INTO `log` VALUES (480, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-05 16:28:06');
INSERT INTO `log` VALUES (481, '管理员 { 超级管理员 : admin } 查询了考试 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=1, passNum=0, createTime=2021-02-05 14:57:53} } 的图表数据!', '2021-02-05 16:40:27');
INSERT INTO `log` VALUES (482, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 登录', '2021-02-05 16:44:49');
INSERT INTO `log` VALUES (483, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 登录', '2021-02-09 22:16:41');
INSERT INTO `log` VALUES (484, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-09 22:17:09');
INSERT INTO `log` VALUES (485, '管理员 { 超级管理员 : admin } 添加考试 { Exam{id=null, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=0, examedNum=0, passNum=0, createTime=2021-02-09 22:17:54} }', '2021-02-09 22:17:55');
INSERT INTO `log` VALUES (486, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 试卷已生成，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:41:31');
INSERT INTO `log` VALUES (487, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:12');
INSERT INTO `log` VALUES (488, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:14');
INSERT INTO `log` VALUES (489, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:14');
INSERT INTO `log` VALUES (490, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:17');
INSERT INTO `log` VALUES (491, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:18');
INSERT INTO `log` VALUES (492, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:21');
INSERT INTO `log` VALUES (493, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:25');
INSERT INTO `log` VALUES (494, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:31');
INSERT INTO `log` VALUES (495, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:32');
INSERT INTO `log` VALUES (496, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:34');
INSERT INTO `log` VALUES (497, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:35');
INSERT INTO `log` VALUES (498, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:36');
INSERT INTO `log` VALUES (499, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:37');
INSERT INTO `log` VALUES (500, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:37');
INSERT INTO `log` VALUES (501, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:39');
INSERT INTO `log` VALUES (502, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:40');
INSERT INTO `log` VALUES (503, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:41');
INSERT INTO `log` VALUES (504, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:41');
INSERT INTO `log` VALUES (505, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:42');
INSERT INTO `log` VALUES (506, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:43');
INSERT INTO `log` VALUES (507, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:43');
INSERT INTO `log` VALUES (508, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:44');
INSERT INTO `log` VALUES (509, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:45');
INSERT INTO `log` VALUES (510, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交答案，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=0, passNum=0, createTime=2021-02-09 22:17:55} }', '2021-02-09 22:50:45');
INSERT INTO `log` VALUES (511, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 已提交试卷，试卷为 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=1, passNum=0, createTime=2021-02-09 22:17:55} },分数为 { 20 }', '2021-02-09 22:50:48');
INSERT INTO `log` VALUES (512, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员退出!', '2021-02-09 23:09:31');
INSERT INTO `log` VALUES (513, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-09 23:14:22');
INSERT INTO `log` VALUES (514, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-02-15 15:20:44');
INSERT INTO `log` VALUES (515, '管理员 { 超级管理员 : admin } 查询了考试 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=1, passNum=0, createTime=2021-02-05 14:57:53} } 的图表数据!', '2021-02-15 16:02:58');
INSERT INTO `log` VALUES (516, '管理员 { 超级管理员 : admin } 查询了考试 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=1, passNum=0, createTime=2021-02-09 22:17:55} } 的图表数据!', '2021-02-15 16:02:59');
INSERT INTO `log` VALUES (517, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-05-16 01:21:37');
INSERT INTO `log` VALUES (518, '管理员 { 超级管理员 : admin } 添加角色 { Role{id=null, name=\'教师\', remark=\'\'} }', '2021-05-16 01:24:09');
INSERT INTO `log` VALUES (519, '管理员 { 超级管理员 : admin } 删除角色 { Role{id=4, name=\'教师\', remark=\'\'} }', '2021-05-16 01:24:14');
INSERT INTO `log` VALUES (520, '管理员 { 超级管理员 : admin } 查询了考试 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=1, passNum=0, createTime=2021-02-05 14:57:53} } 的图表数据!', '2021-05-16 02:16:10');
INSERT INTO `log` VALUES (521, '管理员 { 超级管理员 : admin } 查询了考试 { Exam{id=11, name=\'软件工程课堂测试\', subjectId=12, startTime=2021-02-09 22:17:28, endTime=2021-02-10 22:17:29, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=1, passNum=0, createTime=2021-02-09 22:17:55} } 的图表数据!', '2021-05-16 02:16:13');
INSERT INTO `log` VALUES (522, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员退出!', '2021-05-16 02:22:23');
INSERT INTO `log` VALUES (523, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-05-16 02:29:39');
INSERT INTO `log` VALUES (524, '考生 { Student{id=16, studentId=201865110155, subjectId=12, name=\'chenguang\', trueName=\'chenguangGG\', tel=\'17674748338\', createTime=2021-02-05 14:56:53} } 登录', '2021-05-16 02:30:12');
INSERT INTO `log` VALUES (525, '用户名为 { admin }，角色为 { 超级管理员 } 的管理员登录', '2021-05-16 10:28:19');
INSERT INTO `log` VALUES (526, '管理员 { 超级管理员 : admin } 查询了考试 { Exam{id=10, name=\'软件工程小测试\', subjectId=12, startTime=2021-02-05 14:57:33, endTime=2021-02-06 14:57:37, avaliableTime=60, questionNum=20, totalScore=40, passScore=30, singleQuestionNum=20, muiltQuestionNum=0, chargeQuestionNum=0, paperNum=1, examedNum=1, passNum=0, createTime=2021-02-05 14:57:53} } 的图表数据!', '2021-05-16 10:30:39');

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
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单实体表' ROW_FORMAT = Dynamic;

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
INSERT INTO `menu` VALUES (67, 63, '删除', 'remove()', 'icon-cross');

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
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '试题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (85, 12, 0, 'Java是什么？', 2, '编程语言', '不知道', '一种吃的东西', '诗歌语言吧', 'A', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (86, 12, 0, '联合国教科文组织分别于2003年和2005年召开了以______为主题的世界性大会，并发布了《布拉格宣言》和《亚历山大宣言》。', 2, '信息素养', '信息安全', '信息检索', '信息评价', 'A', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (87, 12, 0, '\"Information retrieval \"翻译为______。\n', 2, '信息检索', '信息素养', '信息安全', '信息评价', 'A', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (88, 12, 0, '______是指在信息的生产、存储、获取、传播和利用等信息活动各个环节中，用来规范相关主体之间相互关系的法律关系和道德规范的总称。', 2, '信息知识', '信息能力', '信息意识', '信息伦理', 'D', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (89, 12, 0, '下列各项中______属于一次文献。', 2, '专利说明书', '百科全书', '目录', '综述', 'A', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (90, 12, 0, '下列各项中______属于二次文献。', 2, '索引', '期刊', '学位论文', '百科全书', 'A', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (91, 12, 0, '国内使用的《中国图书馆分类法》是采用______方法进行编排的。', 2, '字顺', '分类', '主题', '时序', 'B', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (92, 12, 0, '布尔逻辑检索中检索符号“OR”的主要作用在于______。', 2, '提高查准率', '提高查全率', '排除不必要信息', '减少文献输出量', 'B', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (93, 12, 0, '______指检出的相关文献信息量与检出的文献总量之比', 2, '查全率', '查准率', '误检率', '漏检率', 'B', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (94, 12, 0, '______是出版周期最短的定期连续出版物。', 2, '图书', '期刊', '报纸', '学位论文', 'C', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (95, 12, 0, '利用图书末尾所附参考文献进行检索的方法是____。', 2, '顺查法', '倒查法', '抽查法', '追溯法', 'D', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (96, 12, 0, '《四级英语词汇》这本图书的分类号可能是______。', 2, 'G636.33', 'J216.2', 'I247.4', 'H319', 'D', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (97, 12, 0, '布尔逻辑检索技术属于_____。', 2, '文本检索技术', '图像检索技术', '音频检索技术', '视频检索技术', 'A', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (98, 12, 0, '二次检索指的是______。', 2, '第二次检索', '检索了一次之后，结果不满意，再检索一次', '在上一次检索的结果集上进行的检索', '与上一次检索的结果进行对比，得到的检索', 'C', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (99, 12, 0, '利用CNKI的全文数据库，检索“文庭孝”老师的作品，应选择______作为检索途径。', 2, '题名', '作者', '关键词', '单位', 'B', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (100, 12, 0, 'Adobe Reader可以阅读____格式文献。', 2, 'VIP', 'TXT', 'HTML', 'PDF', 'D', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (101, 12, 0, 'CAJviewer（俗称：CAJ阅读器）是______数据库的全文阅读软件。', 2, '超星数字图书馆', '中国知网', '万方', '维普期刊', 'B', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (102, 12, 0, '以下哪项不是中国期刊全文数据库（CNKI）的检索字段？', 2, '作者', '第一作者', '基金', '分子式', 'D', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (103, 12, 0, '美国《科学引文索引》的缩写为____。', 2, 'SCI', 'CSSCI', 'EI', 'ISTP', 'A', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (104, 12, 0, '当今世界上最知名也是最权威的百科全书是____。', 2, '美国百科全书', '哥伦比亚百科全书', '不列颠百科全书', '中国大百科全书', 'C', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (105, 12, 0, 'WWW信息资源主要基于___协议传输。', 2, 'FTP', 'TELNET', 'HTTP', 'P2P', 'C', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (106, 12, 0, '微软公司开发的搜索引擎是______。', 2, 'www.baidu.com', 'www.yahoo.com', 'www.iask.com', 'www.bing.com', 'D', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (107, 12, 0, '全球最大的中文搜索引擎是______。', 2, '搜搜', '百度', '雅虎', '谷歌', 'B', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (108, 12, 0, '在百度和谷歌中，可以通过______语法实现把检索范围限定在网页标题中这个功能。', 2, 'filetype：', 'inurl：', 'intitle：', 'site：', 'C', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (109, 12, 0, '下载工具是帮助用户快速、稳定地从网上下载资源的软件。下列属于常用下载工具有哪些？', 2, '迅雷', '优酷', '淘宝', '新浪', 'A', '2021-02-05 14:57:14');
INSERT INTO `question` VALUES (110, 12, 0, '在参考文献“李国新 . 开启新时代图书馆法治研究的新阶段[J]. 图书馆, 2018.”中，“[J]”表示该参考文献是_____。', 2, '著作', '专利', '连续出版物', '标准', 'C', '2021-02-05 14:57:14');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色表id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '超级管理员拥有一切权限！');
INSERT INTO `role` VALUES (3, '教师', '管理考试');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考生表id',
  `studentId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `subjectId` int(11) NOT NULL COMMENT '所属学科专业ID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `trueName` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `tel` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subjectId`(`subjectId`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考生表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (16, '201865110155', 12, 'chenguang', '123', 'chenguangGG', '17674748338', '2021-02-05 14:56:53');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学科专业表id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学科名称',
  `userId` int(11) NULL DEFAULT NULL COMMENT '任课教师id',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学科备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `teacher_id`(`userId`) USING BTREE,
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学科专业表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (12, '软件工程', 16, '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', 1, '/OnlineExam/resources/admin/easyui/images/user_photo.jpg', 1, 0, '湖南开放大学');
INSERT INTO `user` VALUES (16, 'teacher', '123', 3, '/OnlineExam/resources/upload/1612507896479.JPG', 0, 1, '');

SET FOREIGN_KEY_CHECKS = 1;
