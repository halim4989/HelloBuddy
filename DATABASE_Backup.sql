-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2022 at 07:31 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `django_channels_tuto`
--

-- --------------------------------------------------------

--
-- Table structure for table `ask_answers`
--

CREATE TABLE `ask_answers` (
  `id` bigint(20) NOT NULL,
  `answer` longtext NOT NULL,
  `likes` int(10) UNSIGNED NOT NULL CHECK (`likes` >= 0),
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `questions_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ask_answers`
--

INSERT INTO `ask_answers` (`id`, `answer`, `likes`, `created_at`, `modified_at`, `author_id`, `questions_id`) VALUES
(3, 'Myth: Children don\'t experience mental health problems.\r\nFact: Even very young children may show early warning signs of mental health concerns. These mental health problems are often clinically diagnosable, and can be a product of the interaction of biological, psychological, and social factors.\r\n\r\nHalf of all mental health disorders show first signs before a person turns 14 years old, and three-quarters of mental health disorders begin before age 24.\r\n\r\nUnfortunately, only half of children and adolescents with diagnosable mental health problems receive the treatment they need. Early mental health support can help a child before problems interfere with other developmental needs.', 3, '2022-05-06 16:51:45.029527', '2022-05-08 15:24:22.622719', 5, 1),
(4, 'It is crucial to pay attention to mental health. We should not give much time to the unwanted thoughts running in the mind. This can affect our decision-making ability. Our old people say that an empty mind is the house of the devil. So it is better to keep yourself busy.\r\n\r\nThinking too much is a waste of time. This used to happen to me earlier as well. Well, when I found myself working continuously, I stayed away from unwanted thoughts. We should consider life as a gift, and enjoy it. Spend time with our friends and family. This will relax your mind too.', 5, '2022-05-19 14:44:23.030882', '2022-05-19 14:51:35.242565', 4, 3),
(6, 'Mental health includes our emotional, psychological, and social well-being. It affects how we think, feel, and act. It also helps determine how we handle stress, relate to others, and make choices. Mental health is important at every stage of life, from childhood and adolescence through adulthood.\r\n\r\nOver the course of your life, if you experience mental health problems, your thinking, mood, and behavior could be affected. Many factors contribute to mental health problems, including: Biological factors, such as genes or brain chemistry Life experiences, such as trauma or abuse Family history of mental health problems', 12, '2022-05-19 15:17:25.644108', '2022-05-19 15:20:45.834992', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ask_questions`
--

CREATE TABLE `ask_questions` (
  `id` bigint(20) NOT NULL,
  `question_title` varchar(100) NOT NULL,
  `full_question` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `author_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ask_questions`
--

INSERT INTO `ask_questions` (`id`, `question_title`, `full_question`, `created`, `author_id`) VALUES
(1, 'Dose Children face Dipression?', 'plz describe', '2022-05-06 16:44:11.000000', 4),
(3, 'What are your thoughts on mental health?', 'What are your thoughts on mental health?', '2022-05-19 14:42:26.000000', 4),
(4, 'What Is Mental Health?', 'What Is Mental Health?', '2022-05-19 15:16:29.000000', 5);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add message', 7, 'add_message'),
(26, 'Can change message', 7, 'change_message'),
(27, 'Can delete message', 7, 'delete_message'),
(28, 'Can view message', 7, 'view_message'),
(29, 'Can add chat', 8, 'add_chat'),
(30, 'Can change chat', 8, 'change_chat'),
(31, 'Can delete chat', 8, 'delete_chat'),
(32, 'Can view chat', 8, 'view_chat'),
(33, 'Can add questions', 9, 'add_questions'),
(34, 'Can change questions', 9, 'change_questions'),
(35, 'Can delete questions', 9, 'delete_questions'),
(36, 'Can view questions', 9, 'view_questions'),
(37, 'Can add answers', 10, 'add_answers'),
(38, 'Can change answers', 10, 'change_answers'),
(39, 'Can delete answers', 10, 'delete_answers'),
(40, 'Can view answers', 10, 'view_answers'),
(41, 'Can add comments', 11, 'add_comments'),
(42, 'Can change comments', 11, 'change_comments'),
(43, 'Can delete comments', 11, 'delete_comments'),
(44, 'Can view comments', 11, 'view_comments'),
(45, 'Can add blogs', 12, 'add_blogs'),
(46, 'Can change blogs', 12, 'change_blogs'),
(47, 'Can delete blogs', 12, 'delete_blogs'),
(48, 'Can view blogs', 12, 'view_blogs'),
(49, 'Can add volunteer chats', 13, 'add_volunteerchats'),
(50, 'Can change volunteer chats', 13, 'change_volunteerchats'),
(51, 'Can delete volunteer chats', 13, 'delete_volunteerchats'),
(52, 'Can view volunteer chats', 13, 'view_volunteerchats'),
(53, 'Can add volunteer messages', 14, 'add_volunteermessages'),
(54, 'Can change volunteer messages', 14, 'change_volunteermessages'),
(55, 'Can delete volunteer messages', 14, 'delete_volunteermessages'),
(56, 'Can view volunteer messages', 14, 'view_volunteermessages');

-- --------------------------------------------------------

--
-- Table structure for table `blog_blogs`
--

CREATE TABLE `blog_blogs` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `likes` int(10) UNSIGNED NOT NULL CHECK (`likes` >= 0),
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `author_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_blogs`
--

INSERT INTO `blog_blogs` (`id`, `title`, `content`, `likes`, `created_at`, `modified_at`, `author_id`) VALUES
(1, 'What Is Mental Health?', 'Mental health includes our emotional, psychological, and social well-being. It affects how we think, feel, and act. It also helps determine how we handle stress, relate to others, and make choices. Mental health is important at every stage of life, from childhood and adolescence through adulthood.\r\n\r\nOver the course of your life, if you experience mental health problems, your thinking, mood, and behavior could be affected. Many factors contribute to mental health problems, including:\r\n\r\nBiological factors, such as genes or brain chemistry\r\nLife experiences, such as trauma or abuse\r\nFamily history of mental health problems', 32, '2022-05-06 16:29:53.053886', '2022-05-08 15:20:05.144035', 4),
(2, 'Mental Health and Wellness', 'Positive mental health allows people to:\r\nRealize their full potential\r\nCope with the stresses of life\r\nWork productively\r\nMake meaningful contributions to their communities\r\n\r\nWays to maintain positive mental health include:\r\nGetting professional help if you need it\r\nConnecting with others\r\nStaying positive\r\nGetting physically active\r\nHelping others\r\nGetting enough sleep\r\nDeveloping coping skills\r\nGet In Touch', 25, '2022-05-19 19:52:04.903549', '2022-05-19 21:05:56.355639', 5);

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint(20) NOT NULL,
  `content` longtext NOT NULL,
  `likes` int(10) UNSIGNED NOT NULL CHECK (`likes` >= 0),
  `created` datetime(6) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `blog_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`id`, `content`, `likes`, `created`, `author_id`, `blog_id`) VALUES
(1, 'nice blog', 0, '2022-05-06 16:29:57.000000', 5, 1),
(2, 'good post', 0, '2022-05-06 16:52:27.000000', 3, 1),
(3, 'comment', 0, '2022-05-06 16:52:47.000000', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `chat_chat`
--

CREATE TABLE `chat_chat` (
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chat_chat`
--

INSERT INTO `chat_chat` (`id`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `chat_chat_messages`
--

CREATE TABLE `chat_chat_messages` (
  `id` bigint(20) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `message_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chat_chat_messages`
--

INSERT INTO `chat_chat_messages` (`id`, `chat_id`, `message_id`) VALUES
(4, 2, 4),
(5, 2, 5),
(6, 2, 6),
(8, 2, 7),
(9, 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `chat_chat_participants`
--

CREATE TABLE `chat_chat_participants` (
  `id` bigint(20) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chat_chat_participants`
--

INSERT INTO `chat_chat_participants` (`id`, `chat_id`, `user_id`) VALUES
(3, 2, 4),
(4, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `chat_message`
--

CREATE TABLE `chat_message` (
  `id` bigint(20) NOT NULL,
  `content` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `author_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chat_message`
--

INSERT INTO `chat_message` (`id`, `content`, `timestamp`, `author_id`) VALUES
(4, '😁😁😁', '2022-04-14 19:36:58.000000', 4),
(5, '🙌🙌', '2022-04-14 19:37:07.000000', 5),
(6, '👍👍👍', '2022-04-14 19:37:17.000000', 4),
(7, 'Test message', '2022-05-08 15:15:45.000000', 5),
(8, 'a test msg msg msg', '2022-05-20 12:09:19.000000', 4);

-- --------------------------------------------------------

--
-- Table structure for table `chat_user`
--

CREATE TABLE `chat_user` (
  `id` bigint(20) NOT NULL,
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
  `is_available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chat_user`
--

INSERT INTO `chat_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `is_available`) VALUES
(3, 'pbkdf2_sha256$260000$I8LoXgMqdGBGLyS7fODnrV$IC9mTdGlZQZ5eAp2dR75otLB1JtmORQfHqoEjcQTsSY=', '2022-04-14 20:34:04.941837', 0, 'vol01', 'Vol01\'s', 'Name', 'vol01@gmail.com', 1, 1, '2022-04-14 19:32:21.000000', 1),
(4, 'pbkdf2_sha256$260000$yqJXMArHy9pg8mzB7rdo9k$XA7QyP0WMtQZsnvXaK+v9NSQ2janxuAgr3OYq5DywgA=', '2022-06-17 04:26:02.495096', 1, 'halim', 'Hasinur', 'Rahman', '', 1, 1, '2022-04-14 19:36:01.000000', 1),
(5, 'pbkdf2_sha256$260000$TuHbKTl0Nb0va5lvUSfuFj$wCL3nmlKZ3r5ld8UxHMGV9jcvyPZdRquE0IyT0zIL6I=', '2022-05-21 09:01:10.314115', 0, 'zubair', 'Zubair', 'Ahmed', 'zubair@gmail.com', 1, 1, '2022-04-14 19:36:17.000000', 1),
(6, '', NULL, 0, 'deleted', '', '', '', 0, 1, '2022-05-19 15:07:20.749647', 0),
(10, 'pbkdf2_sha256$260000$9H993xlZVlu2dRGLCMxWGa$2QWxalFfERRTzRjcztgfm3+7ymSCn26GqcDgFWTm0Sc=', '2022-05-21 08:05:28.888261', 0, 'user01', 'Users Full', 'Name', 'user06@gmail.com', 0, 1, '2022-05-21 05:40:37.721704', 0),
(14, 'pbkdf2_sha256$260000$VqO74mFM5USAtyfhpcvDer$7tiG0gclu0DHFuzQjjvNpIyyI+TO1wegr6CkLv7E1pc=', '2022-05-21 09:18:13.045759', 0, 'user10', 'Md. Zubair', 'Ahmed', 'mdzubairahmedrabby@gmail.com', 0, 1, '2022-05-21 09:18:12.842744', 0),
(15, 'pbkdf2_sha256$260000$6NIYpY3QCrhXpNjKwAoMTP$LD7iWcMPNJnlHdeLAXPxVBnOQabog2Qk2ofJeOZvyVw=', '2022-06-17 06:37:30.057221', 0, 'user5', 'Md. Zubair', 'Ahmed', 'mdzubairahmedrabby@gmail.com', 0, 1, '2022-05-21 09:19:36.565275', 0),
(16, 'pbkdf2_sha256$260000$s5zYDnPbkco0Xl3dowDY1a$OAjOyBDQaurNKT5KviCN1dAYkZ87+iLQevJTuvU2wF0=', '2022-06-03 14:43:02.973831', 0, 'rohim', 'Rohim', 'Mia', 'rohimmia007@gmail.com', 0, 1, '2022-06-03 14:43:02.790326', 0);

-- --------------------------------------------------------

--
-- Table structure for table `chat_user_groups`
--

CREATE TABLE `chat_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chat_user_user_permissions`
--

CREATE TABLE `chat_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chat_volunteerchats`
--

CREATE TABLE `chat_volunteerchats` (
  `id` bigint(20) NOT NULL,
  `owner_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chat_volunteerchats`
--

INSERT INTO `chat_volunteerchats` (`id`, `owner_id`) VALUES
(1, 10),
(14, 14),
(15, 15),
(16, 16);

-- --------------------------------------------------------

--
-- Table structure for table `chat_volunteerchats_messages`
--

CREATE TABLE `chat_volunteerchats_messages` (
  `id` bigint(20) NOT NULL,
  `volunteerchats_id` bigint(20) NOT NULL,
  `volunteermessages_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chat_volunteerchats_messages`
--

INSERT INTO `chat_volunteerchats_messages` (`id`, `volunteerchats_id`, `volunteermessages_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(9, 14, 6),
(10, 15, 6),
(13, 15, 11),
(14, 15, 12),
(15, 15, 13),
(11, 16, 6);

-- --------------------------------------------------------

--
-- Table structure for table `chat_volunteermessages`
--

CREATE TABLE `chat_volunteermessages` (
  `id` bigint(20) NOT NULL,
  `author` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chat_volunteermessages`
--

INSERT INTO `chat_volunteermessages` (`id`, `author`, `content`, `timestamp`) VALUES
(1, 'volunteer', 'a test message from volunteer', '2022-05-21 05:54:36.000000'),
(2, 'user01', 'a test message to volunteer', '2022-05-21 05:54:06.000000'),
(3, 'user02', 'message to volunteer', '2022-05-21 05:55:37.000000'),
(4, 'volunteer', 'replay to user02', '2022-05-21 05:56:03.000000'),
(5, 'user03', '444', '2022-05-21 08:29:54.000000'),
(6, 'volunteer', 'Welcome', '2022-05-21 08:55:23.000000'),
(11, 'user5', 'hello\n', '2022-06-16 06:30:05.808730'),
(12, 'volunteer', 'hi', '2022-06-16 06:32:18.295506'),
(13, 'user5', 'ddddd\n', '2022-06-17 06:36:51.589425');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-04-14 19:33:17.109683', '1', 'sss', 1, '[{\"added\": {}}]', 7, 3),
(2, '2022-04-14 19:33:22.617104', '2', 'xczcz', 1, '[{\"added\": {}}]', 7, 3),
(3, '2022-04-14 19:33:27.521954', '3', 'zczxzzzz', 1, '[{\"added\": {}}]', 7, 3),
(4, '2022-04-14 19:33:28.492916', '1', '[1, 3] 1', 1, '[{\"added\": {}}]', 8, 3),
(5, '2022-04-14 19:35:23.316697', '1', 'halim', 3, '', 6, 3),
(6, '2022-04-14 19:35:23.319295', '2', 'zubair', 3, '', 6, 3),
(7, '2022-04-14 19:35:34.090973', '1', '[3] 1', 3, '', 8, 3),
(8, '2022-04-14 19:36:44.546414', '2', 'xczcz', 3, '', 7, 3),
(9, '2022-04-14 19:37:06.493251', '4', '😁😁😁', 1, '[{\"added\": {}}]', 7, 3),
(10, '2022-04-14 19:37:15.022302', '5', '🙌🙌', 1, '[{\"added\": {}}]', 7, 3),
(11, '2022-04-14 19:37:27.699707', '6', '👍👍👍', 1, '[{\"added\": {}}]', 7, 3),
(12, '2022-04-14 19:37:28.840685', '2', '[4, 5] 2', 1, '[{\"added\": {}}]', 8, 3),
(13, '2022-04-14 19:39:17.298079', '4', 'halim', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 6, 4),
(14, '2022-04-14 19:39:30.621108', '3', 'vol01', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Superuser status\"]}}]', 6, 4),
(15, '2022-04-14 19:39:47.205934', '5', 'zubair', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 6, 4),
(16, '2022-04-14 20:44:45.973981', '5', 'zubair', 2, '[{\"changed\": {\"fields\": [\"Superuser status\"]}}]', 6, 4),
(17, '2022-05-06 16:29:53.055512', '1', 'first blog', 1, '[{\"added\": {}}]', 12, 4),
(18, '2022-05-06 16:30:24.373705', '1', 'nice blog', 1, '[{\"added\": {}}]', 11, 4),
(19, '2022-05-06 16:30:30.281822', '1', 'nice blog', 2, '[]', 11, 4),
(20, '2022-05-06 16:44:48.960587', '1', 'first question ', 1, '[{\"added\": {}}]', 9, 4),
(21, '2022-05-06 16:51:45.030687', '3', 'Answer For firs', 1, '[{\"added\": {}}]', 10, 4),
(22, '2022-05-06 16:51:49.828897', '3', 'Answer For firs', 2, '[]', 10, 4),
(23, '2022-05-06 16:52:44.745811', '2', 'good post', 1, '[{\"added\": {}}]', 11, 4),
(24, '2022-05-06 16:53:03.433495', '3', 'comment', 1, '[{\"added\": {}}]', 11, 4),
(25, '2022-05-06 16:55:57.319868', '1', 'first question ', 2, '[{\"changed\": {\"fields\": [\"Full question\"]}}]', 9, 4),
(26, '2022-05-06 16:56:31.652790', '1', 'first blog', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 12, 4),
(27, '2022-05-08 10:50:23.971961', '1', 'What Is Mental ', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Content\", \"Likes\"]}}]', 12, 4),
(28, '2022-05-08 10:50:30.631566', '1', 'What Is Mental ', 2, '[]', 12, 4),
(29, '2022-05-08 10:53:08.263609', '1', 'Dose Children f', 2, '[{\"changed\": {\"fields\": [\"Question title\", \"Full question\"]}}]', 9, 4),
(30, '2022-05-08 10:53:48.433298', '3', 'Myth: Children ', 2, '[{\"changed\": {\"fields\": [\"Answer\"]}}]', 10, 4),
(31, '2022-05-08 15:16:13.692705', '7', 'Test message', 1, '[{\"added\": {}}]', 7, 4),
(32, '2022-05-08 15:17:08.619178', '2', '[4, 5] 2', 2, '[{\"changed\": {\"fields\": [\"Messages\"]}}]', 8, 4),
(33, '2022-05-08 15:17:24.213449', '2', '[4, 5] 2', 2, '[{\"changed\": {\"fields\": [\"Messages\"]}}]', 8, 4),
(34, '2022-05-08 15:17:34.332268', '2', '[4, 5] 2', 2, '[{\"changed\": {\"fields\": [\"Messages\"]}}]', 8, 4),
(35, '2022-05-08 15:20:05.145705', '1', 'What Is Mental ', 2, '[{\"changed\": {\"fields\": [\"Likes\"]}}]', 12, 4),
(36, '2022-05-08 15:24:22.623845', '3', 'Myth: Children ', 2, '[{\"changed\": {\"fields\": [\"Likes\"]}}]', 10, 4),
(37, '2022-05-19 13:37:31.877340', '2', '2. Dose Childre', 1, '[{\"added\": {}}]', 9, 4),
(38, '2022-05-19 13:37:38.101973', '1', 'Dose Children f', 2, '[]', 9, 4),
(39, '2022-05-19 14:43:43.096016', '3', 'What are your t', 1, '[{\"added\": {}}]', 9, 4),
(40, '2022-05-19 14:44:23.033860', '4', 'It is crucial t', 1, '[{\"added\": {}}]', 10, 4),
(41, '2022-05-19 14:51:35.245787', '4', 'It is crucial t', 2, '[]', 10, 4),
(42, '2022-05-19 15:07:15.156000', '5', 'fsdfsdfsd', 1, '[{\"added\": {}}]', 10, 4),
(43, '2022-05-19 15:07:22.006802', '2', '2. Dose Childre', 3, '', 9, 4),
(44, '2022-05-19 15:11:14.199291', '2', '2. Dose Childre', 3, '', 9, 4),
(47, '2022-05-19 15:15:44.780898', '2', '2. Dose Childre', 3, '', 9, 4),
(48, '2022-05-19 15:16:43.632537', '4', 'What Is Mental ', 1, '[{\"added\": {}}]', 9, 4),
(49, '2022-05-19 15:17:25.644867', '6', 'Mental health i', 1, '[{\"added\": {}}]', 10, 4),
(50, '2022-05-19 15:20:45.836119', '6', 'Mental health i', 2, '[{\"changed\": {\"fields\": [\"Likes\"]}}]', 10, 4),
(51, '2022-05-19 19:52:04.907060', '2', 'Mental Health a', 1, '[{\"added\": {}}]', 12, 4),
(52, '2022-05-19 21:05:56.358476', '2', 'Mental Health a', 2, '[]', 12, 4),
(53, '2022-05-20 12:09:47.211765', '8', 'a test msg msg ', 1, '[{\"added\": {}}]', 7, 4),
(54, '2022-05-20 12:09:48.291275', '2', '[4, 5] 2', 2, '[{\"changed\": {\"fields\": [\"Messages\"]}}]', 8, 4),
(55, '2022-05-20 23:48:46.919285', '7', 'user01', 3, '', 6, 4),
(56, '2022-05-20 23:51:43.561479', '8', 'user01', 3, '', 6, 4),
(57, '2022-05-20 23:51:43.565319', '9', 'user02', 3, '', 6, 4),
(58, '2022-05-21 05:54:00.595849', '1', 'a test message ', 1, '[{\"added\": {}}]', 14, 4),
(59, '2022-05-21 05:54:22.352406', '2', 'a test message ', 1, '[{\"added\": {}}]', 14, 4),
(60, '2022-05-21 05:54:26.513425', '1', 'user01', 1, '[{\"added\": {}}]', 13, 4),
(61, '2022-05-21 05:54:37.902177', '1', 'a test message ', 2, '[{\"changed\": {\"fields\": [\"Timestamp\"]}}]', 14, 4),
(62, '2022-05-21 05:55:52.074688', '3', 'message to volu', 1, '[{\"added\": {}}]', 14, 4),
(63, '2022-05-21 05:56:04.323294', '4', 'replay to user0', 1, '[{\"added\": {}}]', 14, 4),
(64, '2022-05-21 05:56:05.951736', '2', 'user02', 1, '[{\"added\": {}}]', 13, 4),
(65, '2022-05-21 08:30:01.880195', '5', '444', 1, '[{\"added\": {}}]', 14, 4),
(66, '2022-05-21 08:30:03.488872', '3', 'user03', 2, '[{\"changed\": {\"fields\": [\"Messages\"]}}]', 13, 4),
(67, '2022-05-21 08:32:21.534302', '5', 'user03', 3, '', 13, 4),
(68, '2022-05-21 08:32:21.537302', '4', 'user03', 3, '', 13, 4),
(69, '2022-05-21 08:32:21.541299', '3', 'user03', 3, '', 13, 4),
(70, '2022-05-21 08:50:59.974901', '6', 'user03', 3, '', 13, 4),
(71, '2022-05-21 08:53:44.754076', '7', 'user03', 3, '', 13, 4),
(72, '2022-05-21 08:55:38.159461', '6', 'Welcome', 1, '[{\"added\": {}}]', 14, 4),
(73, '2022-05-21 09:12:43.394811', '8', 'user03', 3, '', 13, 4),
(74, '2022-05-21 09:12:57.660458', '9', 'user03', 3, '', 13, 4),
(75, '2022-05-21 09:14:26.250285', '10', 'user03', 3, '', 13, 4),
(76, '2022-05-21 09:14:37.983470', '11', 'user03', 2, '[{\"changed\": {\"fields\": [\"Messages\"]}}]', 13, 4),
(77, '2022-05-21 09:15:10.573129', '11', 'user03', 3, '', 13, 4),
(78, '2022-05-21 09:16:20.514359', '12', 'user03', 3, '', 13, 4),
(79, '2022-05-21 09:17:41.832340', '11', 'user02', 3, '', 6, 4),
(80, '2022-05-21 09:17:41.834273', '12', 'user03', 3, '', 6, 4),
(81, '2022-05-21 09:17:41.837330', '13', 'user4', 3, '', 6, 4),
(82, '2022-06-03 14:42:24.792777', '10', 'user01', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 6, 4),
(83, '2022-06-16 05:56:12.640666', '15', 'user5', 2, '[{\"changed\": {\"fields\": [\"Messages\"]}}]', 13, 4),
(84, '2022-06-16 06:03:41.947852', '15', 'user5', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(10, 'ask', 'answers'),
(9, 'ask', 'questions'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(12, 'blog', 'blogs'),
(11, 'blog', 'comments'),
(8, 'chat', 'chat'),
(7, 'chat', 'message'),
(6, 'chat', 'user'),
(13, 'chat', 'volunteerchats'),
(14, 'chat', 'volunteermessages'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-04-14 19:29:42.157371'),
(2, 'contenttypes', '0002_remove_content_type_name', '2022-04-14 19:29:42.204246'),
(3, 'auth', '0001_initial', '2022-04-14 19:29:42.422996'),
(4, 'auth', '0002_alter_permission_name_max_length', '2022-04-14 19:29:42.485533'),
(5, 'auth', '0003_alter_user_email_max_length', '2022-04-14 19:29:42.485533'),
(6, 'auth', '0004_alter_user_username_opts', '2022-04-14 19:29:42.501120'),
(7, 'auth', '0005_alter_user_last_login_null', '2022-04-14 19:29:42.501120'),
(8, 'auth', '0006_require_contenttypes_0002', '2022-04-14 19:29:42.501120'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2022-04-14 19:29:42.516784'),
(10, 'auth', '0008_alter_user_username_max_length', '2022-04-14 19:29:42.516784'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2022-04-14 19:29:42.532415'),
(12, 'auth', '0010_alter_group_name_max_length', '2022-04-14 19:29:42.548041'),
(13, 'auth', '0011_update_proxy_permissions', '2022-04-14 19:29:42.548041'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2022-04-14 19:29:42.548041'),
(15, 'chat', '0001_initial', '2022-04-14 19:29:43.189162'),
(16, 'admin', '0001_initial', '2022-04-14 19:29:43.314133'),
(17, 'admin', '0002_logentry_remove_auto_add', '2022-04-14 19:29:43.329792'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2022-04-14 19:29:43.345427'),
(19, 'sessions', '0001_initial', '2022-04-14 19:29:43.376632'),
(20, 'ask', '0001_initial', '2022-05-06 16:25:32.633791'),
(21, 'blog', '0001_initial', '2022-05-06 16:25:32.852539'),
(22, 'ask', '0002_rename_answers_answers_answer', '2022-05-06 16:50:20.367075'),
(23, 'ask', '0003_auto_20220519_1938', '2022-05-19 13:38:25.665984'),
(24, 'ask', '0004_alter_answers_questions', '2022-05-19 15:15:18.979435'),
(25, 'blog', '0002_auto_20220520_0225', '2022-05-19 20:25:12.057232'),
(26, 'chat', '0002_volunteerchats_volunteermessages', '2022-05-21 05:29:42.908456'),
(27, 'chat', '0003_alter_volunteerchats_owner', '2022-05-21 05:36:38.778938');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('303jklk94sxlscmd58gj3hjtkhhj7k54', '.eJxVjMsOwiAUBf-FtSFCy8ule7-BcB9I1UBS2pXx322TLnR7Zua8RUzrUuLaeY4TiYsw4vS7QcIn1x3QI9V7k9jqMk8gd0UetMtbI35dD_fvoKRettpTIkUZnBkIrSKgERE4G3Zh0NYz6IGct5jYEoes8xk2TXkTLGQcxecLKQw5Zw:1ns8UF:ue6ugv6Hds5v_0gFEH6JkkW5uZHDvBeD2F29nai1fJ0', '2022-06-03 19:40:35.872699'),
('4e8da5xs29amw840lmt3mqacn8nac7wr', '.eJxVjEEOwiAQRe_C2hBamEJduu8ZyAwDUjWQlHZlvLtt0oVu_3vvv4XHbc1-a3HxM4ur6EBcfkfC8IzlIPzAcq8y1LIuM8lDkSdtcqocX7fT_TvI2PJeq2R6CBhCVGBgsHpkFxP2dnRAxuLgSGmjgkPLbInI7ZDQmo4hIWjx-QIRVziV:1o1ibd:XsWcFTahjJyF_RaSWF0vG1FM_jPng3jpgQjDvJtK9As', '2022-06-30 06:03:49.294668'),
('4l98qkoy2lbbnv3yip79vjjltr6xpuu2', '.eJxVjMsOgjAUBf-la9OUQr2tS_d8A7mvWtRAQmFl_HclYaHbMzPnZQbc1jJsVZdhFHMxnTn9boT80GkHcsfpNluep3UZye6KPWi1_Sz6vB7u30HBWr61xghJJQlQIuc7ZtAcKbVJMniMgSAQQpfh3AT2ohpc44ATxtYHFPP-AP16OFY:1o1pJC:QcKUdiuoAaXnE6VgLmzWJjQ8HQ6IUBiwy8G_13V0o3A', '2022-06-30 13:13:14.422189'),
('4ti5qnm67ault4k31eo7e52mkykehpg6', '.eJxVjMsOwiAUBf-FtSFCy8ule7-BcB9I1UBS2pXx322TLnR7Zua8RUzrUuLaeY4TiYsw4vS7QcIn1x3QI9V7k9jqMk8gd0UetMtbI35dD_fvoKRettpTIkUZnBkIrSKgERE4G3Zh0NYz6IGct5jYEoes8xk2TXkTLGQcxecLKQw5Zw:1nnejF:ogfmsw7oTPNXTvaclzj-_ihA0hZdEtM12ppsJAMlgYI', '2022-05-22 11:05:33.784851'),
('cltwsnubykhteut5zsv05axmf12b088v', '.eJxVjMsOgjAUBf-la9OUQr2tS_d8A7mvWtRAQmFl_HclYaHbMzPnZQbc1jJsVZdhFHMxnTn9boT80GkHcsfpNluep3UZye6KPWi1_Sz6vB7u30HBWr61xghJJQlQIuc7ZtAcKbVJMniMgSAQQpfh3AT2ohpc44ATxtYHFPP-AP16OFY:1nqzz7:9T96_BUsgZLutjIrjjVLk31QDyC4KeSVkSG0tONzonk', '2022-05-31 16:23:45.289952'),
('fc0y0fwv811yqbhenu35esqrq4if5edm', '.eJxVjMsOwiAUBf-FtSFCy8ule7-BcB9I1UBS2pXx322TLnR7Zua8RUzrUuLaeY4TiYsw4vS7QcIn1x3QI9V7k9jqMk8gd0UetMtbI35dD_fvoKRettpTIkUZnBkIrSKgERE4G3Zh0NYz6IGct5jYEoes8xk2TXkTLGQcxecLKQw5Zw:1nnedU:Th2xy-hDMZ8exvJZe8GJ9qeYGvtm7cbdGsHqxzSsUEI', '2022-05-22 10:59:36.563395'),
('fesjrmfl5cty118nm26uz8ri4muyulby', '.eJxVjMsOgjAUBf-la9OUQr2tS_d8A7mvWtRAQmFl_HclYaHbMzPnZQbc1jJsVZdhFHMxnTn9boT80GkHcsfpNluep3UZye6KPWi1_Sz6vB7u30HBWr61xghJJQlQIuc7ZtAcKbVJMniMgSAQQpfh3AT2ohpc44ATxtYHFPP-AP16OFY:1o23YY:-xP-mEYSV9ZtTgg23q6zHoN9feraaXfV22xESUL3CZA', '2022-07-01 04:26:02.499063'),
('hpykllkyicw8jgr8fkmvr42sx4ogpbvo', '.eJxVjMsOgjAUBf-la9OUQr2tS_d8A7mvWtRAQmFl_HclYaHbMzPnZQbc1jJsVZdhFHMxnTn9boT80GkHcsfpNluep3UZye6KPWi1_Sz6vB7u30HBWr61xghJJQlQIuc7ZtAcKbVJMniMgSAQQpfh3AT2ohpc44ATxtYHFPP-AP16OFY:1nf5IM:_uwBBATwa1a_uC-r7u73S9xw16RtdnDy0ygxzdG75w4', '2022-04-28 19:38:22.537891'),
('jw758pyjuriqksi3d09kfu4ajhw0ptd3', '.eJxVjLEOAiEQRP-F2hBglV0t7f0GsrBETg0kx11l_He55ApNppl5M_NWgdelhLXnOUyiLso6dfgNI6dnrhuRB9d706nVZZ6i3ip6p13fmuTXde_-HRTuZazRAEZAiCcEF4_i8xmHvAfBxIasccLDUEagERHb5K0hoRQzOVCfL-byN4M:1nsL5S:z3lBGgWy1qkORfVxBr7nGMZ9_fok8qdy3meGkD12Hu4', '2022-06-04 09:07:50.363048'),
('kqiecgqbw0lapud4m0zgvh7r4g5vi7z5', '.eJxVjMsOgjAUBf-la9OUQr2tS_d8A7mvWtRAQmFl_HclYaHbMzPnZQbc1jJsVZdhFHMxnTn9boT80GkHcsfpNluep3UZye6KPWi1_Sz6vB7u30HBWr61xghJJQlQIuc7ZtAcKbVJMniMgSAQQpfh3AT2ohpc44ATxtYHFPP-AP16OFY:1o1tO9:PVLIVPAo5EpCTnsftnayQWyky-2obRBgJFxBRAmtiSI', '2022-06-30 17:34:37.086896'),
('l9jrwbaqiik8mvo1cfidtkxtmm0qzp4m', '.eJxVjEEOwiAQRe_C2hBamEJduu8ZyAwDUjWQlHZlvLtt0oVu_3vvv4XHbc1-a3HxM4ur6EBcfkfC8IzlIPzAcq8y1LIuM8lDkSdtcqocX7fT_TvI2PJeq2R6CBhCVGBgsHpkFxP2dnRAxuLgSGmjgkPLbInI7ZDQmo4hIWjx-QIRVziV:1o1j0g:H4ktNXStz8LRnSQ3k8fBMjRT5pR07Y1QRXO72Vx1Lqk', '2022-06-30 06:29:42.464974'),
('nugxqu1v47ftrwprbj1v07e9rxtreizc', '.eJxVjMsOgjAUBf-la9OUQr2tS_d8A7mvWtRAQmFl_HclYaHbMzPnZQbc1jJsVZdhFHMxnTn9boT80GkHcsfpNluep3UZye6KPWi1_Sz6vB7u30HBWr61xghJJQlQIuc7ZtAcKbVJMniMgSAQQpfh3AT2ohpc44ATxtYHFPP-AP16OFY:1o1ibV:b3nrxx0Xrv6U9wbY7N-dGpUdlYQXVuQoICDzoqwLsys', '2022-06-30 06:03:41.959817'),
('oy3o04el0u01yc1xv923kg1p1vs6xaio', '.eJxVjEEOwiAQRe_C2hCnUCgu3fcMZOjMSNVAUtqV8e7apAvd_vfef6mI25rj1niJM6mLMur0uyWcHlx2QHcst6qnWtZlTnpX9EGbHivx83q4fwcZW_7WATtka4j7gQWD9wbSAN7Y4JyzEHrnBUTQAYczgbECKJ0ly0xJEqj3B9v-OBM:1nf6AG:lrWdoM9uB1bvlcp_sT7rzNUdCRw5IL5Iie5JlIXFk9E', '2022-04-28 20:34:04.947872'),
('pp9p7qyas223k9k8d731lofyym27ln89', '.eJxVjMsOgjAUBf-la9OUQr2tS_d8A7mvWtRAQmFl_HclYaHbMzPnZQbc1jJsVZdhFHMxnTn9boT80GkHcsfpNluep3UZye6KPWi1_Sz6vB7u30HBWr61xghJJQlQIuc7ZtAcKbVJMniMgSAQQpfh3AT2ohpc44ATxtYHFPP-AP16OFY:1nsL1i:Iggl9BWEzM8iaev5DjFshdiiat0mOdRqW7MiChu-2XI', '2022-06-04 09:03:58.335245'),
('q9ygz19zu58vq6u1x430pykh4iur2wmh', '.eJxVjMsOwiAQRf-FtSGM0AFcuu83kOExUjU0Ke3K-O_apAvd3nPOfYlA21rD1ssSpiwuAkCcfsdI6VHaTvKd2m2WaW7rMkW5K_KgXY5zLs_r4f4dVOr1W2vjQHEEHsiwh2zobNlEQocebAbWiCkprbQBT2ydRZ0QVSl-UFSceH8A8083eg:1nsI56:TW6Ycye37wkA_sI0Q7JTrhe1tuQSSq_sYKuyqW2CUHI', '2022-06-04 05:55:16.278558'),
('r0auf2fn8mv237naee6cy3u3n4smlfwr', '.eJxVjEEOwiAQRe_C2hBamEJduu8ZyAwDUjWQlHZlvLtt0oVu_3vvv4XHbc1-a3HxM4ur6EBcfkfC8IzlIPzAcq8y1LIuM8lDkSdtcqocX7fT_TvI2PJeq2R6CBhCVGBgsHpkFxP2dnRAxuLgSGmjgkPLbInI7ZDQmo4hIWjx-QIRVziV:1o23Y2:oQ5_6xk-4ohjEJD4cMhiPwWvZ3UfG9Zj4yYV5AnvNSM', '2022-07-01 04:25:30.477674'),
('s2vqfemmglzj6o1wpjyf6r00tqmfctef', '.eJxVjMsOgjAUBf-la9OUQr2tS_d8A7mvWtRAQmFl_HclYaHbMzPnZQbc1jJsVZdhFHMxnTn9boT80GkHcsfpNluep3UZye6KPWi1_Sz6vB7u30HBWr61xghJJQlQIuc7ZtAcKbVJMniMgSAQQpfh3AT2ohpc44ATxtYHFPP-AP16OFY:1nnefq:SMjIlQoeiFgp8ew4au3jqdCraR_AT_j4Nnc5a6i2aWM', '2022-05-22 11:02:02.114978'),
('tcis8jt943wvbdlx696mnrexgxahhkmy', '.eJxVjEEOwiAQRe_C2hBamEJduu8ZyAwDUjWQlHZlvLtt0oVu_3vvv4XHbc1-a3HxM4ur6EBcfkfC8IzlIPzAcq8y1LIuM8lDkSdtcqocX7fT_TvI2PJeq2R6CBhCVGBgsHpkFxP2dnRAxuLgSGmjgkPLbInI7ZDQmo4hIWjx-QIRVziV:1o23aE:ImrFMq3n9rZEULjIMoovG5-QhxtbSZOwqXmRIz9XH3U', '2022-07-01 04:27:46.659068'),
('u9w8m2z5sggvydx0pswqulif1oabqrdc', '.eJxVjMsOwiAUBf-FtSFCy8ule7-BcB9I1UBS2pXx322TLnR7Zua8RUzrUuLaeY4TiYsw4vS7QcIn1x3QI9V7k9jqMk8gd0UetMtbI35dD_fvoKRettpTIkUZnBkIrSKgERE4G3Zh0NYz6IGct5jYEoes8xk2TXkTLGQcxecLKQw5Zw:1nf6I1:bowvQLn1_OZ9laJBlwhNdLldHb_CVHjtMAaBETA13dM', '2022-04-28 20:42:05.629947'),
('v709nz53xozw1mj3tt8e9jj6rkt4k76z', '.eJxVjMsOwiAUBf-FtSFCy8ule7-BcB9I1UBS2pXx322TLnR7Zua8RUzrUuLaeY4TiYsw4vS7QcIn1x3QI9V7k9jqMk8gd0UetMtbI35dD_fvoKRettpTIkUZnBkIrSKgERE4G3Zh0NYz6IGct5jYEoes8xk2TXkTLGQcxecLKQw5Zw:1ns8hy:6eRj7EEp1ORKUnFEWwLvFvRqmas5YqGgxof_Sa1p1ck', '2022-06-03 19:54:46.049509'),
('wr42v4n6koofrxuh2vty859rlcwdzooz', '.eJxVjLEOAiEQRP-F2hBglV0t7f0GsrBETg0kx11l_He55ApNppl5M_NWgdelhLXnOUyiLso6dfgNI6dnrhuRB9d706nVZZ6i3ip6p13fmuTXde_-HRTuZazRAEZAiCcEF4_i8xmHvAfBxIasccLDUEagERHb5K0hoRQzOVCfL-byN4M:1nsKXj:VI2d4FuL_w9JaJKWvQ5czhDF6vuIff05LiNjWNeDqu4', '2022-06-04 08:32:59.500835');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ask_answers`
--
ALTER TABLE `ask_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ask_answers_author_id_24cf7f50_fk_chat_user_id` (`author_id`),
  ADD KEY `ask_answers_questions_id_1bbd3704_fk_ask_questions_id` (`questions_id`);

--
-- Indexes for table `ask_questions`
--
ALTER TABLE `ask_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ask_questions_author_id_e023e755_fk_chat_user_id` (`author_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `blog_blogs`
--
ALTER TABLE `blog_blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_blogs_author_id_a7ca4a98_fk_chat_user_id` (`author_id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comments_author_id_883440ef_fk_chat_user_id` (`author_id`),
  ADD KEY `blog_comments_blog_id_1f77eacd_fk_blog_blogs_id` (`blog_id`);

--
-- Indexes for table `chat_chat`
--
ALTER TABLE `chat_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_chat_messages`
--
ALTER TABLE `chat_chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chat_chat_messages_chat_id_message_id_0dc243e3_uniq` (`chat_id`,`message_id`),
  ADD KEY `chat_chat_messages_message_id_efa31cba_fk_chat_message_id` (`message_id`);

--
-- Indexes for table `chat_chat_participants`
--
ALTER TABLE `chat_chat_participants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chat_chat_participants_chat_id_user_id_69c2a5ac_uniq` (`chat_id`,`user_id`),
  ADD KEY `chat_chat_participants_user_id_581344a5_fk_chat_user_id` (`user_id`);

--
-- Indexes for table `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_message_author_id_923569d5_fk_chat_user_id` (`author_id`);

--
-- Indexes for table `chat_user`
--
ALTER TABLE `chat_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `chat_user_groups`
--
ALTER TABLE `chat_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chat_user_groups_user_id_group_id_b44ee6ad_uniq` (`user_id`,`group_id`),
  ADD KEY `chat_user_groups_group_id_79acbd29_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `chat_user_user_permissions`
--
ALTER TABLE `chat_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chat_user_user_permissions_user_id_permission_id_94176845_uniq` (`user_id`,`permission_id`),
  ADD KEY `chat_user_user_permi_permission_id_3e59ce8b_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `chat_volunteerchats`
--
ALTER TABLE `chat_volunteerchats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_volunteerchats_owner_id_4a318754` (`owner_id`);

--
-- Indexes for table `chat_volunteerchats_messages`
--
ALTER TABLE `chat_volunteerchats_messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chat_volunteerchats_mess_volunteerchats_id_volunt_4e252051_uniq` (`volunteerchats_id`,`volunteermessages_id`),
  ADD KEY `chat_volunteerchats__volunteermessages_id_e51699a6_fk_chat_volu` (`volunteermessages_id`);

--
-- Indexes for table `chat_volunteermessages`
--
ALTER TABLE `chat_volunteermessages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_chat_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ask_answers`
--
ALTER TABLE `ask_answers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ask_questions`
--
ALTER TABLE `ask_questions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `blog_blogs`
--
ALTER TABLE `blog_blogs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chat_chat`
--
ALTER TABLE `chat_chat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chat_chat_messages`
--
ALTER TABLE `chat_chat_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `chat_chat_participants`
--
ALTER TABLE `chat_chat_participants`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `chat_user`
--
ALTER TABLE `chat_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `chat_user_groups`
--
ALTER TABLE `chat_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_user_user_permissions`
--
ALTER TABLE `chat_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_volunteerchats`
--
ALTER TABLE `chat_volunteerchats`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `chat_volunteerchats_messages`
--
ALTER TABLE `chat_volunteerchats_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `chat_volunteermessages`
--
ALTER TABLE `chat_volunteermessages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ask_answers`
--
ALTER TABLE `ask_answers`
  ADD CONSTRAINT `ask_answers_author_id_24cf7f50_fk_chat_user_id` FOREIGN KEY (`author_id`) REFERENCES `chat_user` (`id`),
  ADD CONSTRAINT `ask_answers_questions_id_1bbd3704_fk_ask_questions_id` FOREIGN KEY (`questions_id`) REFERENCES `ask_questions` (`id`);

--
-- Constraints for table `ask_questions`
--
ALTER TABLE `ask_questions`
  ADD CONSTRAINT `ask_questions_author_id_e023e755_fk_chat_user_id` FOREIGN KEY (`author_id`) REFERENCES `chat_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `blog_blogs`
--
ALTER TABLE `blog_blogs`
  ADD CONSTRAINT `blog_blogs_author_id_a7ca4a98_fk_chat_user_id` FOREIGN KEY (`author_id`) REFERENCES `chat_user` (`id`);

--
-- Constraints for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `blog_comments_author_id_883440ef_fk_chat_user_id` FOREIGN KEY (`author_id`) REFERENCES `chat_user` (`id`),
  ADD CONSTRAINT `blog_comments_blog_id_1f77eacd_fk_blog_blogs_id` FOREIGN KEY (`blog_id`) REFERENCES `blog_blogs` (`id`);

--
-- Constraints for table `chat_chat_messages`
--
ALTER TABLE `chat_chat_messages`
  ADD CONSTRAINT `chat_chat_messages_chat_id_6ef09da4_fk_chat_chat_id` FOREIGN KEY (`chat_id`) REFERENCES `chat_chat` (`id`),
  ADD CONSTRAINT `chat_chat_messages_message_id_efa31cba_fk_chat_message_id` FOREIGN KEY (`message_id`) REFERENCES `chat_message` (`id`);

--
-- Constraints for table `chat_chat_participants`
--
ALTER TABLE `chat_chat_participants`
  ADD CONSTRAINT `chat_chat_participants_chat_id_c4383b55_fk_chat_chat_id` FOREIGN KEY (`chat_id`) REFERENCES `chat_chat` (`id`),
  ADD CONSTRAINT `chat_chat_participants_user_id_581344a5_fk_chat_user_id` FOREIGN KEY (`user_id`) REFERENCES `chat_user` (`id`);

--
-- Constraints for table `chat_message`
--
ALTER TABLE `chat_message`
  ADD CONSTRAINT `chat_message_author_id_923569d5_fk_chat_user_id` FOREIGN KEY (`author_id`) REFERENCES `chat_user` (`id`);

--
-- Constraints for table `chat_user_groups`
--
ALTER TABLE `chat_user_groups`
  ADD CONSTRAINT `chat_user_groups_group_id_79acbd29_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `chat_user_groups_user_id_3784c6c8_fk_chat_user_id` FOREIGN KEY (`user_id`) REFERENCES `chat_user` (`id`);

--
-- Constraints for table `chat_user_user_permissions`
--
ALTER TABLE `chat_user_user_permissions`
  ADD CONSTRAINT `chat_user_user_permi_permission_id_3e59ce8b_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `chat_user_user_permissions_user_id_5b7ea77b_fk_chat_user_id` FOREIGN KEY (`user_id`) REFERENCES `chat_user` (`id`);

--
-- Constraints for table `chat_volunteerchats`
--
ALTER TABLE `chat_volunteerchats`
  ADD CONSTRAINT `chat_volunteerchats_owner_id_4a318754_fk_chat_user_id` FOREIGN KEY (`owner_id`) REFERENCES `chat_user` (`id`);

--
-- Constraints for table `chat_volunteerchats_messages`
--
ALTER TABLE `chat_volunteerchats_messages`
  ADD CONSTRAINT `chat_volunteerchats__volunteerchats_id_4d65a079_fk_chat_volu` FOREIGN KEY (`volunteerchats_id`) REFERENCES `chat_volunteerchats` (`id`),
  ADD CONSTRAINT `chat_volunteerchats__volunteermessages_id_e51699a6_fk_chat_volu` FOREIGN KEY (`volunteermessages_id`) REFERENCES `chat_volunteermessages` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_chat_user_id` FOREIGN KEY (`user_id`) REFERENCES `chat_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
