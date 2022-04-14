-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: django_channels_tuto
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add message',7,'add_message'),(26,'Can change message',7,'change_message'),(27,'Can delete message',7,'delete_message'),(28,'Can view message',7,'view_message'),(29,'Can add chat',8,'add_chat'),(30,'Can change chat',8,'change_chat'),(31,'Can delete chat',8,'delete_chat'),(32,'Can view chat',8,'view_chat');
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
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$XAqfWE0ZMW2JC4A7ggkS5L$REKjFxejGGxJrw2RTUZ2flXL+TLiP+MwXB+UP1GEf5E=','2022-04-13 10:02:15.000000',1,'halim','Hasinur Rahman','Halim','halim@gmail.com',1,1,'2022-04-13 09:59:22.000000'),(2,'pbkdf2_sha256$260000$1zujXWLwdEZG7lKVCKnJu0$sflXhICBrfA6ul5RkLDsF3jLh5xRj2P0Ii4WOlp/VRE=','2022-04-13 21:07:21.000000',1,'zubair','Zubair','Ahmed','zubair@gmail.com',1,1,'2022-04-13 09:59:40.000000'),(3,'pbkdf2_sha256$260000$KxVGpGr7xm5dYnl2QaSxGi$u3iPaA69UITg7i/XFZgSKdcB9bVMrCvz+3a48j//o+Q=',NULL,0,'user01','User01\'s','Name','user01@gmail.com',0,1,'2022-04-13 10:00:04.000000'),(4,'pbkdf2_sha256$260000$YmTZxvO4TdKwhEEtM4is9h$i486MrAVuBd6CO5drJwXefWbkyPu+DaIQvl/P08KLUI=',NULL,0,'user02','User02\'s','Name','user02@gmail.com',0,1,'2022-04-13 10:00:23.000000'),(5,'pbkdf2_sha256$260000$RKP7VYZ6v5bea547eRSREH$RQswZhGSU5IikmWw6DDVVn4Yx8Q0vbMIVflNtnTdBcI=','2022-04-13 10:07:03.000000',0,'user03','User03\'s','Name','user03@gmail.com',0,1,'2022-04-13 10:00:46.000000'),(6,'pbkdf2_sha256$260000$o0XyOCJFLLNLBKyu3qU212$hom+4hZkrHWf1ft9TjtYqMTKhw58i6x3wysqHbhjXhc=',NULL,0,'vol01','Vol01\'s','Name','vol01@gmail.com',1,1,'2022-04-14 13:13:58.000000'),(7,'pbkdf2_sha256$260000$UJfxH1n1irj2VkQm0ttnBv$SG4jcHvbF21xbvfG+RIe46lxDFZfT01gxbzFtiDVvpo=',NULL,0,'vol02','Vol02\'s','Name','vol02@gmail.com',1,1,'2022-04-14 13:14:18.000000'),(8,'pbkdf2_sha256$260000$X05l4l31GoJ2x4Z8htDCGn$eS5xB/P9ptpRKq24FdN5UA2Ak18oY7r1D/HppNzYDts=',NULL,0,'vol03','Vol03\'s','Name','vol03@gmail.com',1,1,'2022-04-14 13:14:33.000000'),(9,'pbkdf2_sha256$260000$JIeqD5dmUhD7R0FlOYeFIY$k4H4+bSBJGMh3iwujr0sCNp6D2/U3kPYqzishHLdMLA=',NULL,0,'user04','User04\'s','Name','User04@gmail.com',0,1,'2022-04-14 13:15:11.000000'),(10,'pbkdf2_sha256$260000$xyeFUUnDMeS6JbZcgkkz5E$RqxFoJxJeKX4ER/nVaSTOVcrlceKpEwSLqSu34z+Kus=',NULL,0,'user05','User05\'s','Name','User05@gmail.com',0,1,'2022-04-14 13:15:31.000000'),(11,'pbkdf2_sha256$260000$vlJOSBIdHR1hwwUFx7K1aA$4PvjKlSVpWeU7llD0YzWu2PXHctgmeOyjsqAt/MSdF0=',NULL,0,'user06','User06\'s','Name','User06@gmail.com',0,1,'2022-04-14 13:15:48.000000'),(12,'pbkdf2_sha256$260000$SHs7aGYAhtLqaCm8wwi8co$Umt7cUOxib8zniLGAeO6qQTkuEPST9/OuvDsXCH0UtY=',NULL,0,'user07','User07\'s','Name','User07@gmail.com',0,1,'2022-04-14 13:16:03.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_chat`
--

DROP TABLE IF EXISTS `chat_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_chat`
--

LOCK TABLES `chat_chat` WRITE;
/*!40000 ALTER TABLE `chat_chat` DISABLE KEYS */;
INSERT INTO `chat_chat` VALUES (1);
/*!40000 ALTER TABLE `chat_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_chat_messages`
--

DROP TABLE IF EXISTS `chat_chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_chat_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `chat_id` bigint(20) NOT NULL,
  `message_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chat_chat_messages_chat_id_message_id_0dc243e3_uniq` (`chat_id`,`message_id`),
  KEY `chat_chat_messages_message_id_efa31cba_fk_chat_message_id` (`message_id`),
  CONSTRAINT `chat_chat_messages_chat_id_6ef09da4_fk_chat_chat_id` FOREIGN KEY (`chat_id`) REFERENCES `chat_chat` (`id`),
  CONSTRAINT `chat_chat_messages_message_id_efa31cba_fk_chat_message_id` FOREIGN KEY (`message_id`) REFERENCES `chat_message` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_chat_messages`
--

LOCK TABLES `chat_chat_messages` WRITE;
/*!40000 ALTER TABLE `chat_chat_messages` DISABLE KEYS */;
INSERT INTO `chat_chat_messages` VALUES (1,1,2),(2,1,3),(3,1,4);
/*!40000 ALTER TABLE `chat_chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_chat_participants`
--

DROP TABLE IF EXISTS `chat_chat_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_chat_participants` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `chat_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chat_chat_participants_chat_id_user_id_69c2a5ac_uniq` (`chat_id`,`user_id`),
  KEY `chat_chat_participants_user_id_581344a5_fk_auth_user_id` (`user_id`),
  CONSTRAINT `chat_chat_participants_chat_id_c4383b55_fk_chat_chat_id` FOREIGN KEY (`chat_id`) REFERENCES `chat_chat` (`id`),
  CONSTRAINT `chat_chat_participants_user_id_581344a5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_chat_participants`
--

LOCK TABLES `chat_chat_participants` WRITE;
/*!40000 ALTER TABLE `chat_chat_participants` DISABLE KEYS */;
INSERT INTO `chat_chat_participants` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `chat_chat_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_message`
--

DROP TABLE IF EXISTS `chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_message_author_id_923569d5_fk_auth_user_id` (`author_id`),
  CONSTRAINT `chat_message_author_id_923569d5_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_message`
--

LOCK TABLES `chat_message` WRITE;
/*!40000 ALTER TABLE `chat_message` DISABLE KEYS */;
INSERT INTO `chat_message` VALUES (2,'😁😁','2022-04-13 16:53:23.000000',1),(3,'👍👍','2022-04-13 16:53:40.000000',2),(4,'👌👌👌','2022-04-13 16:53:59.000000',1);
/*!40000 ALTER TABLE `chat_message` ENABLE KEYS */;
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
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-04-13 10:04:18.365358','1','halim',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(2,'2022-04-13 10:04:56.677289','3','user01',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(3,'2022-04-13 10:05:07.776509','4','user02',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(4,'2022-04-13 10:05:18.201980','5','user03',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(5,'2022-04-13 10:05:36.581745','2','zubair',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(6,'2022-04-13 10:06:20.777878','5','user03',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',4,1),(7,'2022-04-13 10:07:44.733552','5','user03',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,1),(8,'2022-04-13 10:08:58.190110','3','user01',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',4,1),(9,'2022-04-13 10:09:05.254125','4','user02',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',4,1),(10,'2022-04-13 10:09:13.885834','5','user03',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,1),(11,'2022-04-13 10:09:55.303209','5','user03',2,'[]',4,1),(12,'2022-04-13 10:10:49.030946','2','zubair',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,1),(13,'2022-04-13 10:12:52.838085','2','zubair',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',4,1),(14,'2022-04-13 10:13:40.591696','2','zubair',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',4,1),(15,'2022-04-13 10:18:29.209120','1','aaaa',1,'[{\"added\": {}}]',7,1),(16,'2022-04-13 16:53:38.878180','2','😁😁',1,'[{\"added\": {}}]',7,1),(17,'2022-04-13 16:53:52.834524','3','👍👍',1,'[{\"added\": {}}]',7,1),(18,'2022-04-13 16:54:06.298671','4','👌👌👌',1,'[{\"added\": {}}]',7,1),(19,'2022-04-13 16:54:07.604916','1','[1, 2] 1',1,'[{\"added\": {}}]',8,1),(20,'2022-04-14 13:18:09.391297','9','user04',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Superuser status\"]}}]',4,1),(21,'2022-04-14 13:18:45.442518','10','user05',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Superuser status\"]}}]',4,1),(22,'2022-04-14 13:19:13.474187','11','user06',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Superuser status\"]}}]',4,1),(23,'2022-04-14 13:19:31.448531','12','user07',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Superuser status\"]}}]',4,1),(24,'2022-04-14 13:20:14.128245','6','vol01',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Superuser status\"]}}]',4,1),(25,'2022-04-14 13:20:38.245337','7','vol02',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Superuser status\"]}}]',4,1),(26,'2022-04-14 13:20:55.588664','8','vol03',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Superuser status\"]}}]',4,1),(27,'2022-04-14 13:21:03.536092','2','zubair',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'chat','chat'),(7,'chat','message'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-04-13 09:49:17.320191'),(2,'auth','0001_initial','2022-04-13 09:49:17.830489'),(3,'admin','0001_initial','2022-04-13 09:49:17.960028'),(4,'admin','0002_logentry_remove_auto_add','2022-04-13 09:49:17.970115'),(5,'admin','0003_logentry_add_action_flag_choices','2022-04-13 09:49:17.981789'),(6,'contenttypes','0002_remove_content_type_name','2022-04-13 09:49:18.045682'),(7,'auth','0002_alter_permission_name_max_length','2022-04-13 09:49:18.104263'),(8,'auth','0003_alter_user_email_max_length','2022-04-13 09:49:18.122097'),(9,'auth','0004_alter_user_username_opts','2022-04-13 09:49:18.135144'),(10,'auth','0005_alter_user_last_login_null','2022-04-13 09:49:18.187998'),(11,'auth','0006_require_contenttypes_0002','2022-04-13 09:49:18.190996'),(12,'auth','0007_alter_validators_add_error_messages','2022-04-13 09:49:18.202996'),(13,'auth','0008_alter_user_username_max_length','2022-04-13 09:49:18.221995'),(14,'auth','0009_alter_user_last_name_max_length','2022-04-13 09:49:18.241000'),(15,'auth','0010_alter_group_name_max_length','2022-04-13 09:49:18.261993'),(16,'auth','0011_update_proxy_permissions','2022-04-13 09:49:18.270996'),(17,'auth','0012_alter_user_first_name_max_length','2022-04-13 09:49:18.287995'),(18,'chat','0001_initial','2022-04-13 09:49:18.645574'),(19,'sessions','0001_initial','2022-04-13 09:49:18.714053');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('h9ixglfzn5vx805jvgawpmck193g9z7z','.eJxVjM0OwiAQhN-FsyF16fLj0XufgbAsStVAUtqT8d2lSQ86x2--mbfwYVuz31pa_MziIkCcfhmF-ExlL_gRyr3KWMu6zCR3RR5tk1Pl9Loe7t9BDi33tVOIkXHQxgARmJiMNphcRNLWhbPTHfXQqG4IhNGO1jAgsiJQA4jPF9ktN40:1nekCv:lq7QPCuy5BtoN2gTsGwwHmczcA1vSAbtIsnDpqs8Ses','2022-04-27 21:07:21.667949'),('wh537ransbvfkejwi2mxh35c96ezprmh','.eJxVjM0OwiAQhN-FsyF16fLj0XufgbAsStVAUtqT8d2lSQ86x2--mbfwYVuz31pa_MziIkCcfhmF-ExlL_gRyr3KWMu6zCR3RR5tk1Pl9Loe7t9BDi33tVOIkXHQxgARmJiMNphcRNLWhbPTHfXQqG4IhNGO1jAgsiJQA4jPF9ktN40:1nea0P:3XPxQ5qvwOlxTXOK87fVKq89gGlnS5TwBWo7Kj1EA-A','2022-04-27 10:13:45.158618'),('yc9luznbzh9uv0nqfn95n6cdot4o4u57','.eJxVjEEOwiAQRe_C2pB0GAq4dO8ZyABTqRqalHbVeHch6UK377_3D-Fp37LfK69-TuIqBnH5ZYHii0sf0pPKY5FxKds6B9kVea5V3pfE79vp_h1kqrnVHBjCpB2jtWBIK3Ks1QhmYgcAA2MKPELDiBxTRIhdRmNbAaTE5wvumTfn:1neZpH:8n4WK9wDB1NPeya2Ati0b-aOXJvHMMNF2iu5Y7wXfbI','2022-04-27 10:02:15.575799');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-14 19:38:31
