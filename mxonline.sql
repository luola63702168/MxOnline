-- MySQL dump 10.16  Distrib 10.1.34-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: mxonline
-- ------------------------------------------------------
-- Server version	10.1.34-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add 用户信息',7,'add_userprofile'),(26,'Can change 用户信息',7,'change_userprofile'),(27,'Can delete 用户信息',7,'delete_userprofile'),(28,'Can view 用户信息',7,'view_userprofile'),(29,'Can add 轮播图',8,'add_banner'),(30,'Can change 轮播图',8,'change_banner'),(31,'Can delete 轮播图',8,'delete_banner'),(32,'Can view 轮播图',8,'view_banner'),(33,'Can add 邮箱验证码',9,'add_emailverifyrecord'),(34,'Can change 邮箱验证码',9,'change_emailverifyrecord'),(35,'Can delete 邮箱验证码',9,'delete_emailverifyrecord'),(36,'Can view 邮箱验证码',9,'view_emailverifyrecord'),(37,'Can add 章节',10,'add_lesson'),(38,'Can change 章节',10,'change_lesson'),(39,'Can delete 章节',10,'delete_lesson'),(40,'Can view 章节',10,'view_lesson'),(41,'Can add 视频',11,'add_video'),(42,'Can change 视频',11,'change_video'),(43,'Can delete 视频',11,'delete_video'),(44,'Can view 视频',11,'view_video'),(45,'Can add 课程',12,'add_course'),(46,'Can change 课程',12,'change_course'),(47,'Can delete 课程',12,'delete_course'),(48,'Can view 课程',12,'view_course'),(49,'Can add 课程资源',13,'add_courseresource'),(50,'Can change 课程资源',13,'change_courseresource'),(51,'Can delete 课程资源',13,'delete_courseresource'),(52,'Can view 课程资源',13,'view_courseresource'),(53,'Can add 课程机构',14,'add_courseorg'),(54,'Can change 课程机构',14,'change_courseorg'),(55,'Can delete 课程机构',14,'delete_courseorg'),(56,'Can view 课程机构',14,'view_courseorg'),(57,'Can add 老师',15,'add_teacher'),(58,'Can change 老师',15,'change_teacher'),(59,'Can delete 老师',15,'delete_teacher'),(60,'Can view 老师',15,'view_teacher'),(61,'Can add 城市',16,'add_citydict'),(62,'Can change 城市',16,'change_citydict'),(63,'Can delete 城市',16,'delete_citydict'),(64,'Can view 城市',16,'view_citydict'),(65,'Can add 用户咨询',17,'add_userask'),(66,'Can change 用户咨询',17,'change_userask'),(67,'Can delete 用户咨询',17,'delete_userask'),(68,'Can view 用户咨询',17,'view_userask'),(69,'Can add 用户课程',18,'add_usercourse'),(70,'Can change 用户课程',18,'change_usercourse'),(71,'Can delete 用户课程',18,'delete_usercourse'),(72,'Can view 用户课程',18,'view_usercourse'),(73,'Can add 用户收藏',19,'add_userfavorite'),(74,'Can change 用户收藏',19,'change_userfavorite'),(75,'Can delete 用户收藏',19,'delete_userfavorite'),(76,'Can view 用户收藏',19,'view_userfavorite'),(77,'Can add 课程评论',20,'add_coursecomments'),(78,'Can change 课程评论',20,'change_coursecomments'),(79,'Can delete 课程评论',20,'delete_coursecomments'),(80,'Can view 课程评论',20,'view_coursecomments'),(81,'Can add 用户消息',21,'add_usermessage'),(82,'Can change 用户消息',21,'change_usermessage'),(83,'Can delete 用户消息',21,'delete_usermessage'),(84,'Can view 用户消息',21,'view_usermessage'),(85,'Can add Bookmark',22,'add_bookmark'),(86,'Can change Bookmark',22,'change_bookmark'),(87,'Can delete Bookmark',22,'delete_bookmark'),(88,'Can view Bookmark',22,'view_bookmark'),(89,'Can add User Setting',23,'add_usersettings'),(90,'Can change User Setting',23,'change_usersettings'),(91,'Can delete User Setting',23,'delete_usersettings'),(92,'Can view User Setting',23,'view_usersettings'),(93,'Can add User Widget',24,'add_userwidget'),(94,'Can change User Widget',24,'change_userwidget'),(95,'Can delete User Widget',24,'delete_userwidget'),(96,'Can view User Widget',24,'view_userwidget'),(97,'Can add log entry',25,'add_log'),(98,'Can change log entry',25,'change_log'),(99,'Can delete log entry',25,'delete_log'),(100,'Can view log entry',25,'view_log'),(101,'Can add captcha store',26,'add_captchastore'),(102,'Can change captcha store',26,'change_captchastore'),(103,'Can delete captcha store',26,'delete_captchastore'),(104,'Can view captcha store',26,'view_captchastore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (2,'EYIJ','eyij','ec0eb992349c8ddbb14c36409036f8f3f3dc530b','2020-01-18 22:34:38.047644'),(3,'KSHI','kshi','356f0b1eee64cf97c612ab7b54b218fb55806571','2020-01-18 22:37:50.760696'),(5,'DCUQ','dcuq','292ca807ab8d5ccce39878d155c9f751064ad2b6','2020-01-18 22:51:12.705866'),(6,'BSLI','bsli','9a76ce278559ea612f765230f37f82455c7de04d','2020-01-19 00:39:20.266656'),(7,'VQVM','vqvm','eecf9a0a2ac1d45e3dfa706ca625c00c2f0994dc','2020-01-20 19:06:57.331666'),(8,'DEUD','deud','8ab269148889798af7f7129664eef35d56a93c2e','2020-01-20 19:08:21.205652');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

DROP TABLE IF EXISTS `courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(2) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  `you_need_know` varchar(300) NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_course_org_id_4d2c4aab_fk_organizat` (`course_org_id`),
  KEY `courses_course_teacher_id_846fa526_fk_organization_teacher_id` (`teacher_id`),
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (1,'django入门','django入门','django入门','cj',0,0,0,'courses/2019/11/540e57300001d6d906000338-240-135_qpYyfUX.jpg',0,'2019-11-08 15:38:00.000000',1,'后端开发','',NULL,'','',0),(2,'java入门','java入门','java入门','zj',0,0,0,'courses/2019/11/57035ff200014b8a06000338-240-135.jpg',10,'2019-11-21 16:00:00.000000',1,'后端开发','',NULL,'','',0),(3,'java入门','java入门','java入门java入门java入门java入门java入门java入门java入门java入门java入门java入门java入门java入门java入门java入门java入门java入门java入门java入门java入门java入门','zj',12,23,1,'courses/2019/11/57035ff200014b8a06000338-240-135_TqS7Nyt.jpg',78,'2019-11-21 20:34:00.000000',2,'后端开发','',NULL,'','',0),(4,'vue.js的学习','vue.js的学习','vue.js的学习vue.js的学习vue.js的学习vue.js的学习vue.js的学习vue.js的学习vue.js的学习vue.js的学习vue.js的学习vue.js的学习vue.js的学习vue.js的学习vue.js的学习vue.js的学习','gj',232,121,12,'courses/2019/11/mysql.jpg',123,'2019-11-21 20:35:00.000000',3,'后端开发','',NULL,'','',0),(5,'web开发','web开发','web开发web开发web开发web开发web开发web开发web开发web开发web开发web开发web开发web开发web开发','gj',12,121,232,'courses/2019/11/540e57300001d6d906000338-240-135_mvvGYHL.jpg',12,'2019-11-21 20:36:00.000000',5,'后端开发','',NULL,'','',0),(6,'go语言','go语言','go语言go语言go语言go语言go语言go语言go语言go语言go语言','zj',12,23,1212,'courses/2019/11/540e57300001d6d906000338-240-135_n0L8vbw.jpg',23,'2019-11-21 20:37:00.000000',5,'后端开发','',NULL,'','',0),(7,'node.js','node.js','node.jsnode.jsnode.jsnode.jsnode.jsnode.jsnode.jsnode.jsnode.jsnode.js','zj',1,2,3,'courses/2019/11/540e57300001d6d906000338-240-135_n0L8vbw_mnw7THl.jpg',78,'2019-11-21 20:37:00.000000',6,'后端开发','',NULL,'','',0),(8,'flask框架学习','flask框架学习','flask框架学习flask框架学习flask框架学习flask框架学习flask框架学习flask框架学习flask框架学习flask框架学习','zj',12,23,21,'courses/2019/11/57035ff200014b8a06000338-240-135_0nFiBSI.jpg',34,'2019-11-21 20:38:00.000000',8,'后端开发','',NULL,'','',0),(9,'docker容器技术','docker容器技术','docker容器技术docker容器技术docker容器技术docker容器技术docker容器技术docker容器技术docker容器技术docker容器技术','zj',12,12,12,'courses/2019/11/540e57300001d6d906000338-240-135_mvvGYHL_UwyhoBb.jpg',1137,'2019-11-21 20:39:00.000000',10,'后端开发','',NULL,'','',0),(10,'spider入门','spider入门','spider入门spider入门spider入门spider入门spider入门spider入门spider入门spider入门spider入门spider入门','cj',12,23,34,'courses/2019/12/540e57300001d6d906000338-240-135_hbj3cWc.jpg',330,'2019-11-21 20:39:00.000000',11,'后端开发','python',NULL,'','',0),(11,'web框架开发','web框架开发','web框架开发web框架开发web框架开发web框架开发web框架开发web框架开发web框架开发','zj',123,121,23,'courses/2019/12/540e57300001d6d906000338-240-135_yNxHsbs.jpg',65,'2019-11-21 20:40:00.000000',7,'后端开发','python',1,'django框架的使用','python基础得好',0),(12,'golong','golonggolonggolonggolonggolong','golonggolonggolonggolonggolonggolonggolonggolonggolonggolonggolonggolonggolonggolonggolonggolong','gj',0,0,0,'courses/2020/01/bjdx.jpg',0,'2020-01-19 23:14:00.000000',NULL,'后端开发','golong',1,'golonggolong','golong',1),(13,'scrapy学习','scrapy学习scrapy学习','scrapy学习scrapy学习scrapy学习','zj',0,0,0,'courses/2020/01/57aa86a0000145c512000460_BdQlgHT.jpg',0,'2020-01-19 23:17:00.000000',NULL,'后端开发','scrapy学习',2,'scrapy学习','scrapy学习',1),(14,'scrapy学习','scrapy学习scrapy学习','scrapy学习scrapy学习scrapy学习','cj',0,0,0,'courses/2020/01/57a801860001c34b12000460_z4Vb8zl.jpg',0,'2020-01-19 23:18:00.000000',NULL,'后端开发','scrapy学习',1,'scrapy学习','scrapy学习',1);
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_courseresource`
--

DROP TABLE IF EXISTS `courses_courseresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `download` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_courseresource`
--

LOCK TABLES `courses_courseresource` WRITE;
/*!40000 ALTER TABLE `courses_courseresource` DISABLE KEYS */;
INSERT INTO `courses_courseresource` VALUES (1,'course/resource/2019/12/project.zip','前端页面','2019-12-06 15:52:00.000000',11);
/*!40000 ALTER TABLE `courses_courseresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_lesson`
--

DROP TABLE IF EXISTS `courses_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson`
--

LOCK TABLES `courses_lesson` WRITE;
/*!40000 ALTER TABLE `courses_lesson` DISABLE KEYS */;
INSERT INTO `courses_lesson` VALUES (1,'第一节','2019-11-08 15:44:00.000000',1),(2,'第一章 基础知识','2019-12-06 15:26:00.000000',11),(3,'第二章 进阶开发','2019-12-06 15:27:00.000000',11);
/*!40000 ALTER TABLE `courses_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_video`
--

DROP TABLE IF EXISTS `courses_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_video`
--

LOCK TABLES `courses_video` WRITE;
/*!40000 ALTER TABLE `courses_video` DISABLE KEYS */;
INSERT INTO `courses_video` VALUES (1,'1.1 hello world','2019-12-06 15:33:00.000000',2,'https://media.w3.org/2010/05/sintel/trailer.mp4',0),(2,'1.2 基本概念','2019-12-06 15:34:00.000000',2,'https://media.w3.org/2010/05/sintel/trailer.mp4',0),(3,'2.1 test','2019-12-06 15:35:00.000000',3,'https://media.w3.org/2010/05/sintel/trailer.mp4',0),(4,'2.1 test2','2019-12-06 15:35:00.000000',3,'https://media.w3.org/2010/05/sintel/trailer.mp4',0);
/*!40000 ALTER TABLE `courses_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(26,'captcha','captchastore'),(5,'contenttypes','contenttype'),(12,'courses','course'),(13,'courses','courseresource'),(10,'courses','lesson'),(11,'courses','video'),(20,'operation','coursecomments'),(17,'operation','userask'),(18,'operation','usercourse'),(19,'operation','userfavorite'),(21,'operation','usermessage'),(16,'organization','citydict'),(14,'organization','courseorg'),(15,'organization','teacher'),(6,'sessions','session'),(8,'users','banner'),(9,'users','emailverifyrecord'),(7,'users','userprofile'),(22,'xadmin','bookmark'),(25,'xadmin','log'),(23,'xadmin','usersettings'),(24,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-07 07:12:42.642972'),(2,'auth','0001_initial','2019-11-07 07:12:43.224019'),(3,'admin','0001_initial','2019-11-07 07:12:43.400157'),(4,'admin','0002_logentry_remove_auto_add','2019-11-07 07:12:43.413122'),(5,'admin','0003_logentry_add_action_flag_choices','2019-11-07 07:12:43.426115'),(6,'contenttypes','0002_remove_content_type_name','2019-11-07 07:12:43.508865'),(7,'auth','0002_alter_permission_name_max_length','2019-11-07 07:12:43.562722'),(8,'auth','0003_alter_user_email_max_length','2019-11-07 07:12:43.624215'),(9,'auth','0004_alter_user_username_opts','2019-11-07 07:12:43.636197'),(10,'auth','0005_alter_user_last_login_null','2019-11-07 07:12:43.678109'),(11,'auth','0006_require_contenttypes_0002','2019-11-07 07:12:43.683120'),(12,'auth','0007_alter_validators_add_error_messages','2019-11-07 07:12:43.697028'),(13,'auth','0008_alter_user_username_max_length','2019-11-07 07:12:43.757133'),(14,'auth','0009_alter_user_last_name_max_length','2019-11-07 07:12:43.809992'),(15,'sessions','0001_initial','2019-11-07 07:12:43.851133'),(16,'users','0001_initial','2019-11-07 09:49:40.660603'),(17,'courses','0001_initial','2019-11-07 15:54:12.033776'),(18,'operation','0001_initial','2019-11-07 15:54:12.395833'),(19,'organization','0001_initial','2019-11-07 15:54:12.564628'),(20,'users','0002_banner_emailverifyrecord','2019-11-07 15:54:12.617639'),(21,'users','0003_auto_20191108_1201','2019-11-08 04:01:38.742765'),(22,'xadmin','0001_initial','2019-11-08 13:10:34.011675'),(23,'xadmin','0002_log','2019-11-08 13:10:34.171664'),(24,'xadmin','0003_auto_20160715_0100','2019-11-08 13:10:34.238566'),(25,'captcha','0001_initial','2019-11-13 21:46:02.033727'),(26,'courses','0002_auto_20191113_2144','2019-11-13 21:46:02.046689'),(27,'users','0004_auto_20191113_2144','2019-11-13 21:46:02.060657'),(28,'organization','0002_auto_20191117_1704','2019-11-17 17:04:28.239327'),(29,'organization','0003_auto_20191117_2211','2019-11-17 22:11:13.087746'),(30,'courses','0003_course_course_org','2019-11-21 13:00:48.126994'),(31,'organization','0004_teacher_image','2019-11-21 14:49:03.743634'),(32,'courses','0004_course_category','2019-11-21 22:48:25.663170'),(33,'operation','0002_usercourse_comments','2019-11-21 23:16:51.991032'),(34,'courses','0005_course_tag','2019-12-06 13:56:51.829677'),(35,'courses','0006_video_url','2019-12-06 15:32:52.883566'),(36,'courses','0007_video_learn_times','2019-12-06 15:50:45.094548'),(37,'courses','0008_course_teacher','2019-12-06 16:06:03.634518'),(38,'courses','0009_auto_20191206_1616','2019-12-06 16:17:01.272423'),(39,'organization','0005_teacher_age','2020-01-17 22:40:34.773555'),(40,'users','0005_auto_20200118_2330','2020-01-18 23:30:30.935642'),(41,'courses','0010_course_is_banner','2020-01-19 23:05:33.245835'),(42,'organization','0006_courseorg_tag','2020-01-19 23:26:24.309102');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('h8fk337omik76h94e9zho4kyfq9f4aff','NTc0OWE0YjE3MjRkY2Q5ZWE1MzZiM2VhNDM3Mzk1ZWRkMmNkMjU2OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjI0MzA5YjZlYzA5NDI0MmRkM2RiNmEyMDAwMGY5NzY2ZDM1YTdkZDUifQ==','2020-02-02 00:27:47.875073'),('iikya38czbo0re338z8th20r5x39i5z2','MThlY2Q2YjRlNzMwY2UzNmE1ZjVhOTM2NGU3ZjM0MWUwNDBlM2QzYTp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMjdkODdjYjk1ZDQwZDFmYWIxZmI4YjYwOGJkZWNmYzlhZjc4YjdlIn0=','2020-02-02 00:26:51.632170'),('kwqv4gd463nib66gd5fc3jij2zwjtf4h','MGE1NzllOWU1NGQ0MWUzMmZhN2FmMTg5YzQyNGFiNjhkNDU5MDAzYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjI0MzA5YjZlYzA5NDI0MmRkM2RiNmEyMDAwMGY5NzY2ZDM1YTdkZDUiLCJMSVNUX1FVRVJZIjpbWyJvcGVyYXRpb24iLCJ1c2VyYXNrIl0sIiJdfQ==','2020-02-03 19:06:29.136866'),('q13agr9nbj2ndpih6kzx0afoj6zetxmq','NTc0OWE0YjE3MjRkY2Q5ZWE1MzZiM2VhNDM3Mzk1ZWRkMmNkMjU2OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjI0MzA5YjZlYzA5NDI0MmRkM2RiNmEyMDAwMGY5NzY2ZDM1YTdkZDUifQ==','2020-02-02 00:28:43.003456');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_coursecomments`
--

DROP TABLE IF EXISTS `operation_coursecomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomm_user_id_f5ff70b3_fk_users_use` (`user_id`),
  CONSTRAINT `operation_coursecomm_user_id_f5ff70b3_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_coursecomments`
--

LOCK TABLES `operation_coursecomments` WRITE;
/*!40000 ALTER TABLE `operation_coursecomments` DISABLE KEYS */;
INSERT INTO `operation_coursecomments` VALUES (1,'撒','2020-01-17 16:35:07.528176',11,1),(2,'add','2020-01-17 16:48:15.307013',11,1);
/*!40000 ALTER TABLE `operation_coursecomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userask`
--

DROP TABLE IF EXISTS `operation_userask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userask`
--

LOCK TABLES `operation_userask` WRITE;
/*!40000 ALTER TABLE `operation_userask` DISABLE KEYS */;
INSERT INTO `operation_userask` VALUES (1,'罗拉','123','django','2019-11-20 22:15:30.045277'),(2,'我','123','sdad','2019-11-20 22:18:47.552383'),(3,'时令水果','sda','asd','2019-11-20 22:21:35.760441'),(4,'时令水果','sda','asd','2019-11-20 22:21:45.126607'),(5,'时令水果','sda','asd','2019-11-20 22:21:49.962186'),(6,'时令水果','sda','asd','2019-11-20 22:24:12.293321'),(7,'时令水果','123','2','2019-11-20 22:26:36.040052'),(8,'asd','asda','asd','2019-11-20 22:31:03.245299'),(9,'asd','18538383342','sad','2019-11-20 22:47:14.151526');
/*!40000 ALTER TABLE `operation_userask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usercourse`
--

DROP TABLE IF EXISTS `operation_usercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comments` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usercourse`
--

LOCK TABLES `operation_usercourse` WRITE;
/*!40000 ALTER TABLE `operation_usercourse` DISABLE KEYS */;
INSERT INTO `operation_usercourse` VALUES (2,'2019-11-21 23:35:00.000000',9,1,'空'),(3,'2020-01-17 18:06:21.145491',11,1,'空'),(4,'2020-01-17 18:06:48.255561',10,1,'空'),(5,'2020-01-19 00:24:46.360020',11,17,'空');
/*!40000 ALTER TABLE `operation_usercourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userfavorite`
--

DROP TABLE IF EXISTS `operation_userfavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userfavorite`
--

LOCK TABLES `operation_userfavorite` WRITE;
/*!40000 ALTER TABLE `operation_userfavorite` DISABLE KEYS */;
INSERT INTO `operation_userfavorite` VALUES (2,1,2,'2020-01-19 19:04:51.209977',1),(4,1,3,'2020-01-19 21:17:44.227026',1),(8,11,1,'2020-01-19 21:18:16.429546',1);
/*!40000 ALTER TABLE `operation_userfavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usermessage`
--

DROP TABLE IF EXISTS `operation_usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usermessage`
--

LOCK TABLES `operation_usermessage` WRITE;
/*!40000 ALTER TABLE `operation_usermessage` DISABLE KEYS */;
INSERT INTO `operation_usermessage` VALUES (1,1,'哈哈哈',1,'2020-01-19 21:30:00.000000'),(2,1,'哈哈哈2',1,'2020-01-19 21:36:00.000000'),(3,1,'哈哈哈3',1,'2020-01-19 21:37:00.000000'),(4,1,'哈哈哈2',1,'2020-01-19 21:40:00.000000'),(5,0,'23131',0,'2020-01-19 21:40:00.000000'),(6,1,'2321313',1,'2020-01-19 21:40:00.000000'),(7,0,'哈哈哈事实上',0,'2020-01-19 21:41:00.000000'),(8,1,'哈哈哈223',1,'2020-01-19 21:44:00.000000');
/*!40000 ALTER TABLE `operation_usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_citydict`
--

DROP TABLE IF EXISTS `organization_citydict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_citydict`
--

LOCK TABLES `organization_citydict` WRITE;
/*!40000 ALTER TABLE `organization_citydict` DISABLE KEYS */;
INSERT INTO `organization_citydict` VALUES (1,'北京市','北京市','2019-11-17 16:36:00.000000'),(2,'上海市','上海市','2019-11-17 16:37:00.000000'),(3,'广州市','广州市','2019-11-17 16:37:00.000000'),(4,'深圳市','深圳市','2019-11-17 16:37:00.000000'),(5,'天津市','天津','2019-11-17 16:37:00.000000');
/*!40000 ALTER TABLE `organization_citydict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_courseorg`
--

DROP TABLE IF EXISTS `organization_courseorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `tag` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_courseo_city_id_4a842f85_fk_organizat` (`city_id`),
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_courseorg`
--

LOCK TABLES `organization_courseorg` WRITE;
/*!40000 ALTER TABLE `organization_courseorg` DISABLE KEYS */;
INSERT INTO `organization_courseorg` VALUES (1,'慕课网','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验',11,0,'org/2019/11/imooc.png','北京市','2019-11-17 16:46:00.000000',1,'pxjg',0,0,'知名大学'),(2,'慕课网1','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。',2,0,'org/2019/11/imooc_3xp0foe.png','上海市','2019-11-17 16:52:00.000000',2,'gx',0,0,'知名大学'),(3,'慕课网2','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。',1,0,'org/2019/11/imooc_91paBwi.png','天津市','2019-11-17 16:53:00.000000',5,'pxjg',0,0,'知名大学'),(4,'慕课网3','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。',0,0,'org/2019/11/bjdx.jpg','广州市','2019-11-17 16:53:00.000000',3,'gr',0,0,'知名大学'),(5,'慕课网4','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。',0,0,'org/2019/11/imooc_FnOVpjY.png','深圳市','2019-11-17 16:54:00.000000',4,'pxjg',0,0,'知名大学'),(6,'慕课网5','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。',0,0,'org/2019/11/imooc_fuvcyDu.png','北京市','2019-11-17 16:54:00.000000',1,'pxjg',0,0,'知名大学'),(7,'慕课网6','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。',1,0,'org/2019/11/imooc_NOsxkJR.png','上海市','2019-11-17 16:55:00.000000',2,'pxjg',0,0,'知名大学'),(8,'慕课网7','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。',0,0,'org/2019/11/imooc_mF5ZuCl.png','天津市','2019-11-17 16:55:00.000000',5,'pxjg',0,0,'知名大学'),(9,'慕课网8','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。',0,0,'org/2020/01/57a801860001c34b12000460.jpg','广州市','2019-11-17 16:55:00.000000',3,'pxjg',2,0,'知名大学'),(10,'慕课网9','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。',0,0,'org/2019/11/imooc_q7W5EeB.png','深圳市','2019-11-17 16:55:00.000000',4,'pxjg',0,0,'知名大学'),(11,'慕课网10','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。',0,0,'org/2020/01/57a801860001c34b12000460_6YQu2dE.jpg','天津市','2019-11-17 16:56:00.000000',5,'pxjg',2,0,'知名大学'),(12,'北京大学','清华大学',12,22,'org/2020/01/bjdx.jpg','天津市','2020-01-18 17:48:00.000000',5,'pxjg',1,22,'知名大学');
/*!40000 ALTER TABLE `organization_courseorg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_teacher`
--

DROP TABLE IF EXISTS `organization_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teacher_org_id_cd000a1a_fk_organizat` (`org_id`),
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_teacher`
--

LOCK TABLES `organization_teacher` WRITE;
/*!40000 ALTER TABLE `organization_teacher` DISABLE KEYS */;
INSERT INTO `organization_teacher` VALUES (1,'luola',5,'xxx','xxx','xxx',32,0,'2019-11-21 12:51:00.000000',1,'teacher/2019/11/aobama_CXWwMef.png',18),(2,'caiyun',3,'xxx','xxx','xxx',15,0,'2019-11-21 12:52:00.000000',1,'teacher/2019/11/aobama.png',18);
/*!40000 ALTER TABLE `organization_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_banner`
--

DROP TABLE IF EXISTS `users_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_banner`
--

LOCK TABLES `users_banner` WRITE;
/*!40000 ALTER TABLE `users_banner` DISABLE KEYS */;
INSERT INTO `users_banner` VALUES (1,'第一个','banner/2020/01/57a801860001c34b12000460.jpg','https://www.baidu.com/',1,'2020-01-19 23:07:00.000000'),(2,'第二个','banner/2020/01/57a801860001c34b12000460_z4Vb8zl.jpg','https://www.baidu.com/',2,'2020-01-19 23:08:00.000000'),(3,'第三个','banner/2020/01/57aa86a0000145c512000460.jpg','https://www.baidu.com/',3,'2020-01-19 23:09:00.000000'),(4,'第四个','banner/2020/01/57aa86a0000145c512000460_GXIBATC.jpg','https://www.baidu.com/',4,'2020-01-19 23:09:00.000000'),(5,'第五个','banner/2020/01/57aa86a0000145c512000460_nMwvoQD.jpg','https://www.baidu.com/',5,'2020-01-19 23:09:00.000000');
/*!40000 ALTER TABLE `users_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_emailverifyrecord`
--

DROP TABLE IF EXISTS `users_emailverifyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(18) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_emailverifyrecord`
--

LOCK TABLES `users_emailverifyrecord` WRITE;
/*!40000 ALTER TABLE `users_emailverifyrecord` DISABLE KEYS */;
INSERT INTO `users_emailverifyrecord` VALUES (1,'admin','63702168x@qq.com','register','2019-11-08 14:40:00.000000'),(2,'rusi','813338303@qq.com','forget','2019-11-08 15:03:00.000000'),(3,'FLROgcG92gnf5vlF','2@2.com','register','2019-11-14 15:28:24.188967'),(4,'bywtLSp2G6Gy1Jt0','','register','2019-11-14 15:34:12.621683'),(5,'F7A3EDXmjUWhWqq2','2aw@qq.com','register','2019-11-14 15:44:14.139582'),(6,'wP0fRs7Jz6yGOLB6','None@.com','register','2019-11-14 15:45:51.584126'),(7,'Rf0nWxmpzrpnhtbC','rusiwillbeok@sina.com','register','2019-11-14 16:19:41.102649'),(8,'p1qJNUhbbOKw5ZMP','rusiwillbeok@sina.com','register','2019-11-14 16:27:01.013301'),(9,'FJHgVMXtRPWdGW1S','rusiwillbeok@sina.com','register','2019-11-14 16:29:32.884461'),(10,'74g8PLsKLtoFkTBB','rusiwillbeok@sina.com','register','2019-11-14 16:30:32.086790'),(11,'iT11YtfmBcwKfDMF','rusiwillbeok@sina.com','register','2019-11-14 16:33:08.458313'),(12,'D1WIJSF1ftAGrcCj','rusiwillbeok@sina.com','register','2019-11-14 16:33:43.834605'),(13,'0RMfoEelmA52GQEt','rusiwillbeok@sina.com','register','2019-11-14 16:46:12.923271'),(14,'VBz8FYMbzgSVIXrS','63763040@qq.com','register','2019-11-14 16:47:57.235267'),(15,'l7gqGUTu30EaM4FB','63763040@qq.com','register','2019-11-14 16:48:59.823087'),(16,'8qi4Z2sCbLYzPcfB','63763040@qq.com','register','2019-11-14 16:50:43.872430'),(17,'CrQgLEXkdDZStZos','rusiwillbeok@sina.com','register','2019-11-14 16:56:37.677881'),(18,'tij6KDagby1cq2aY','rusiwillbeok@sina.com','register','2019-11-14 16:58:42.940386'),(19,'oOou0ctHFOsULM7e','rusiwillbeok@sina.com','register','2019-11-14 17:01:18.714661'),(20,'WInluIgJC8Po1N5D','rusiwillbeok@sina.com','register','2019-11-14 17:05:08.131436'),(21,'SKQWdILFZMc5zPVG','rusiwillbeok@sina.com','register','2019-11-14 17:05:46.752735'),(22,'YpMCCXtWzqXIoAsL','rusiwillbeok@sina.com','forget','2019-11-14 19:43:43.282059'),(23,'kPk45aZ4sN708aNn','813338303@qq.com','register','2020-01-18 22:33:46.385182'),(24,'8CPAVOuGHa8mBUFQ','712098842@qq.com','update_email','2020-01-18 23:30:56.555525'),(25,'hbS6HWLRvaLW31Oo','712098842@qq.com','update_email','2020-01-18 23:31:13.508247'),(26,'ZNUSJlPzL6K3XjyK','712098842@qq.com','update_email','2020-01-18 23:34:04.467035'),(27,'0GZdVyyboU0ju1FX','712098842@qq.com','update_email','2020-01-18 23:35:35.776186'),(28,'Vove','712098842@qq.com','update_email','2020-01-18 23:39:10.391222'),(29,'qD2A','712098842@qq.com','update_email','2020-01-18 23:40:19.679275'),(30,'3PH0','712098842@qq.com','update_email','2020-01-18 23:43:42.991610');
/*!40000 ALTER TABLE `users_emailverifyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birday` date DEFAULT NULL,
  `gender` varchar(7) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$120000$FdCrfRtaum3N$vySih3v5Rec0b8l7SqNj9hpt/A57yplLIRq8w9vnECk=','2020-01-20 19:03:51.485684',1,'admin','罗拉','罗','712098842@qq.com',1,1,'2019-11-08 04:02:00.000000','罗拉','2020-01-13','male','信阳市','1888888888','image/2020/01/njdx_IugrObp.jpg'),(2,'pbkdf2_sha256$120000$kRIu0q0lTw1X$T8b2Xly7FX5RflMeYleA1YelNYGtpTaeLB45KnFCdM8=',NULL,0,'adsa@qq.com','','','adsa@qq.com',0,1,'2019-11-13 22:50:13.017962','',NULL,'female','',NULL,'image/default.png'),(3,'pbkdf2_sha256$120000$rOPTkOojK2O3$sYFPSkOnWhGNrnUtswu2ydZoNyWe141w94cAL09CCvc=',NULL,0,'2@2.com','','','2@2.com',0,1,'2019-11-14 15:28:24.004459','',NULL,'female','',NULL,'image/default.png'),(5,'pbkdf2_sha256$120000$kRyWHrKhQO0X$Gv1B3kwiwybhWuXI1NcYq73k/vFwq0mOc8pZEaE8NDY=',NULL,0,'','','','',0,1,'2019-11-14 15:34:12.462058','',NULL,'female','',NULL,'image/default.png'),(6,'pbkdf2_sha256$120000$VeSGIiTzjYoJ$zzJ6z3D/k7+wU9luGbl7evm84lteIGY8VFlXnaAZNxU=',NULL,0,'None','','','None',0,0,'2019-11-14 15:37:12.469762','',NULL,'female','',NULL,'image/default.png'),(11,'pbkdf2_sha256$120000$5YLfHO9zfXel$VEmO7aqGHW/iNH2Xgx8BayUtC/iXye1+P2ZYZFH9iVY=',NULL,0,'2aw@qq.com','','','2aw@qq.com',0,0,'2019-11-14 15:44:13.990971','',NULL,'female','',NULL,'image/default.png'),(13,'pbkdf2_sha256$120000$QQCNjlVSYbok$oGCDCvDJjbKcFAIEEVXf6MPetYsH/JsgxAFDs2aNI0Y=',NULL,0,'None@.com','','','None@.com',0,0,'2019-11-14 15:45:51.446135','',NULL,'female','',NULL,'image/default.png'),(15,'pbkdf2_sha256$120000$wH89zyA3iMUS$UVfv/D6STHu87g7MIMAhgWLaEdvYQLNb7vjZOcyCBQI=',NULL,0,'63763040@qq.com','','','63763040@qq.com',0,0,'2019-11-14 16:50:43.779676','',NULL,'female','',NULL,'image/default.png'),(16,'pbkdf2_sha256$120000$gZy17lsIrPO7$Lhn+SMGatemcorGMCx4QtEPrmlbJqkuTYck5kMej0yQ=','2019-11-14 20:48:34.910791',0,'rusiwillbeok@sina.com','','','rusiwillbeok@sina.com',0,1,'2019-11-14 17:05:46.644056','',NULL,'female','',NULL,'image/default.png'),(17,'pbkdf2_sha256$120000$hXI3jxVgqWc8$zPeo35tvmZZPowh8+Ck6XzlTiVpZ/cf3mhjpdO53fZk=','2020-01-20 15:56:09.740142',0,'admin2','','','813338303@qq.com',0,1,'2020-01-18 22:33:46.286412','',NULL,'female','',NULL,'image/default.png');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2019-11-08 14:42:01.101164','127.0.0.1','1','EmailVerifyRecord object (1)','create','已添加。',9,1),(2,'2019-11-08 15:03:51.596457','127.0.0.1','2','邮箱：813338303@qq.com 验证码：rusi','create','已添加。',9,1),(3,'2019-11-08 15:43:11.072515','127.0.0.1','1','Course object (1)','create','已添加。',12,1),(4,'2019-11-08 15:48:05.513752','127.0.0.1','1','Lesson object (1)','create','已添加。',10,1),(5,'2019-11-17 16:36:55.989002','127.0.0.1','1','CityDict object (1)','create','已添加。',16,1),(6,'2019-11-17 16:37:13.548090','127.0.0.1','2','CityDict object (2)','create','已添加。',16,1),(7,'2019-11-17 16:37:22.141376','127.0.0.1','3','CityDict object (3)','create','已添加。',16,1),(8,'2019-11-17 16:37:30.306257','127.0.0.1','4','CityDict object (4)','create','已添加。',16,1),(9,'2019-11-17 16:37:44.668976','127.0.0.1','5','CityDict object (5)','create','已添加。',16,1),(10,'2019-11-17 16:47:20.178171','127.0.0.1','1','CourseOrg object (1)','create','已添加。',14,1),(11,'2019-11-17 16:53:01.515810','127.0.0.1','2','慕课网1','create','已添加。',14,1),(12,'2019-11-17 16:53:33.698376','127.0.0.1','3','慕课网2','create','已添加。',14,1),(13,'2019-11-17 16:54:20.256850','127.0.0.1','4','慕课网3','create','已添加。',14,1),(14,'2019-11-17 16:54:48.638272','127.0.0.1','5','慕课网4','create','已添加。',14,1),(15,'2019-11-17 16:55:04.474475','127.0.0.1','6','慕课网5','create','已添加。',14,1),(16,'2019-11-17 16:55:17.283088','127.0.0.1','7','慕课网6','create','已添加。',14,1),(17,'2019-11-17 16:55:32.090548','127.0.0.1','8','慕课网7','create','已添加。',14,1),(18,'2019-11-17 16:55:50.050965','127.0.0.1','9','慕课网8','create','已添加。',14,1),(19,'2019-11-17 16:56:06.097486','127.0.0.1','10','慕课网9','create','已添加。',14,1),(20,'2019-11-17 16:56:26.304557','127.0.0.1','11','慕课网10','create','已添加。',14,1),(21,'2019-11-17 16:57:19.696363','127.0.0.1','11','慕课网10','change','修改 image，address 和 city',14,1),(22,'2019-11-17 17:07:58.649981','127.0.0.1','1','django入门','change','修改 image',12,1),(23,'2019-11-17 17:10:19.116332','127.0.0.1','5','天津市','change','修改 desc',16,1),(24,'2019-11-21 12:51:57.404566','127.0.0.1','1','luola','create','已添加。',15,1),(25,'2019-11-21 12:53:11.907400','127.0.0.1','2','caiyun','create','已添加。',15,1),(26,'2019-11-21 13:04:02.772354','127.0.0.1','1','django入门','change','修改 course_org 和 image',12,1),(27,'2019-11-21 14:49:50.529539','127.0.0.1','2','caiyun','change','修改 image',15,1),(28,'2019-11-21 14:49:57.548624','127.0.0.1','1','luola','change','修改 image',15,1),(29,'2019-11-21 16:01:34.346188','127.0.0.1','2','java入门','create','已添加。',12,1),(30,'2019-11-21 20:35:17.933204','127.0.0.1','3','java入门','create','已添加。',12,1),(31,'2019-11-21 20:36:19.524969','127.0.0.1','4','vue.js的学习','create','已添加。',12,1),(32,'2019-11-21 20:37:03.359494','127.0.0.1','5','web开发','create','已添加。',12,1),(33,'2019-11-21 20:37:48.335696','127.0.0.1','6','go语言','create','已添加。',12,1),(34,'2019-11-21 20:38:31.657429','127.0.0.1','7','node.js','create','已添加。',12,1),(35,'2019-11-21 20:39:12.538451','127.0.0.1','8','flask框架学习','create','已添加。',12,1),(36,'2019-11-21 20:39:46.907615','127.0.0.1','9','docker容器技术','create','已添加。',12,1),(37,'2019-11-21 20:40:31.772244','127.0.0.1','10','spider入门','create','已添加。',12,1),(38,'2019-11-21 20:41:26.637286','127.0.0.1','11','web框架开发','create','已添加。',12,1),(39,'2019-11-21 23:36:49.563937','127.0.0.1','2','UserCourse object (2)','create','已添加。',18,1),(40,'2019-11-21 23:39:00.408342','127.0.0.1','1','admin','change','修改 last_login，first_name，last_name，nick_name，address，mobile 和 image',7,1),(41,'2019-12-06 14:10:14.223468','127.0.0.1','11','web框架开发','change','修改 image 和 tag',12,1),(42,'2019-12-06 14:10:29.798007','127.0.0.1','10','spider入门','change','修改 image 和 tag',12,1),(43,'2019-12-06 15:27:31.728846','127.0.0.1','2','Lesson object (2)','create','已添加。',10,1),(44,'2019-12-06 15:28:13.123189','127.0.0.1','3','Lesson object (3)','create','已添加。',10,1),(45,'2019-12-06 15:34:35.354769','127.0.0.1','1','1.1 hello world','create','已添加。',11,1),(46,'2019-12-06 15:35:09.963224','127.0.0.1','2','1.2 基本概念','create','已添加。',11,1),(47,'2019-12-06 15:35:35.248733','127.0.0.1','3','2.1 test','create','已添加。',11,1),(48,'2019-12-06 15:35:45.972941','127.0.0.1','4','2.1 test2','create','已添加。',11,1),(49,'2019-12-06 15:54:57.020390','127.0.0.1','1','CourseResource object (1)','create','已添加。',13,1),(50,'2019-12-06 16:08:30.329826','127.0.0.1','11','web框架开发','change','修改 teacher 和 image',12,1),(51,'2019-12-06 16:18:39.016987','127.0.0.1','11','web框架开发','change','修改 image，you_need_know 和 teacher_tell',12,1),(52,'2020-01-17 21:37:48.153414','127.0.0.1','1','1.1 hello world','change','修改 url',11,1),(53,'2020-01-17 21:38:04.970620','127.0.0.1','1','1.1 hello world','change','没有字段被修改。',11,1),(54,'2020-01-17 21:38:09.901358','127.0.0.1','2','1.2 基本概念','change','修改 url',11,1),(55,'2020-01-17 21:38:13.356183','127.0.0.1','3','2.1 test','change','修改 url',11,1),(56,'2020-01-17 21:38:16.399227','127.0.0.1','4','2.1 test2','change','修改 url',11,1),(57,'2020-01-18 17:49:34.379027','127.0.0.1','12','北京大学','create','已添加。',14,1),(58,'2020-01-19 21:35:37.485780','127.0.0.1','1','UserMessage object (1)','create','已添加。',21,1),(59,'2020-01-19 21:36:58.238493','127.0.0.1','2','UserMessage object (2)','create','已添加。',21,1),(60,'2020-01-19 21:37:07.665099','127.0.0.1','3','UserMessage object (3)','create','已添加。',21,1),(61,'2020-01-19 21:40:16.941567','127.0.0.1','4','UserMessage object (4)','create','已添加。',21,1),(62,'2020-01-19 21:40:21.386676','127.0.0.1','5','UserMessage object (5)','create','已添加。',21,1),(63,'2020-01-19 21:40:59.066512','127.0.0.1','6','UserMessage object (6)','create','已添加。',21,1),(64,'2020-01-19 21:41:20.473112','127.0.0.1','7','UserMessage object (7)','create','已添加。',21,1),(65,'2020-01-19 21:45:00.206822','127.0.0.1','8','UserMessage object (8)','create','已添加。',21,1),(66,'2020-01-19 23:08:50.341540','127.0.0.1','1','Banner object (1)','create','已添加。',8,1),(67,'2020-01-19 23:09:03.411964','127.0.0.1','2','Banner object (2)','create','已添加。',8,1),(68,'2020-01-19 23:09:17.621727','127.0.0.1','3','Banner object (3)','create','已添加。',8,1),(69,'2020-01-19 23:09:30.215419','127.0.0.1','4','Banner object (4)','create','已添加。',8,1),(70,'2020-01-19 23:09:42.856364','127.0.0.1','5','Banner object (5)','create','已添加。',8,1),(71,'2020-01-19 23:16:38.903716','127.0.0.1','12','golong','create','已添加。',12,1),(72,'2020-01-19 23:18:07.347200','127.0.0.1','13','scrapy学习','create','已添加。',12,1),(73,'2020-01-19 23:18:22.751888','127.0.0.1','13','scrapy学习','change','修改 is_banner 和 image',12,1),(74,'2020-01-19 23:18:51.434932','127.0.0.1','14','scrapy学习','create','已添加。',12,1),(75,'2020-01-20 18:07:08.595230','127.0.0.1','9','慕课网8','change','修改 image 和 course_nums',14,1),(76,'2020-01-20 18:07:27.894146','127.0.0.1','11','慕课网10','change','修改 image 和 course_nums',14,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1),(2,'site-theme','/static/xadmin/css/themes/bootstrap-xadmin.css',1),(3,'users_userprofile_editform_portal',',,,,|',1);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-20 21:11:33
