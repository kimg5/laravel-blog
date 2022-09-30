-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: ec2-34-207-151-132.compute-1.amazonaws.com    Database: blog
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.35-MariaDB

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
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,'abc','admin',NULL,NULL),(2,'Jane Smith','Looking for a job.',NULL,NULL),(3,'Admin1','Bored',NULL,NULL),(4,'zac clarke','cuz im a g',NULL,NULL),(5,'Aftab','Take me in to your team!',NULL,NULL),(6,'John smith','I need a job.',NULL,NULL);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'HTML','html','html','html632e18691b946.png','2022-09-23 20:08:31','2022-09-23 20:34:49'),(2,'CSS','css','css','css632e18796e2c5.png','2022-09-23 20:08:31','2022-09-23 20:35:05'),(3,'Javascript','javascript','javascript','javascript632e1884245d5.png','2022-09-23 20:08:31','2022-09-23 20:35:16'),(4,'Blog','blog','Design and spec document of the blog','blog632f89f6cc5e2.png','2022-09-23 20:08:31','2022-09-24 22:51:34'),(5,'Mysql','mysql','mysql','mysql632e18b654e31.png','2022-09-23 20:08:31','2022-09-23 20:36:06'),(6,'PHP','php','PHP','php632e18cd05a2e.jfif','2022-09-23 20:08:31','2022-09-23 20:36:29'),(7,'Laravel','laravel','laravel','laravel632e18eec7dfa.png','2022-09-23 20:08:31','2022-09-23 20:37:02'),(8,'Java','java','java','java632f8a279c80e.png','2022-09-23 20:08:31','2022-09-24 22:52:23');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_replies`
--

DROP TABLE IF EXISTS `comment_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_replies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_replies_comment_id_foreign` (`comment_id`),
  KEY `comment_replies_user_id_foreign` (`user_id`),
  CONSTRAINT `comment_replies_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comment_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_replies`
--

LOCK TABLES `comment_replies` WRITE;
/*!40000 ALTER TABLE `comment_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_user_id_foreign` (`user_id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,36,3,'This is awesome!','2022-09-30 15:54:01','2022-09-30 15:54:01');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2020_08_07_060610_create_roles_table',1),(5,'2020_08_28_091609_create_categories_table',1),(6,'2020_09_07_065450_create_posts_table',1),(7,'2020_09_12_072748_create_tags_table',1),(8,'2020_10_07_072827_create_comments_table',1),(9,'2020_10_13_064245_create_comment_replies_table',1),(10,'2020_10_24_190145_create_post_user_table',1),(11,'2020_11_08_065456_create_jobs_table',1),(12,'2022_09_27_173928_create_reports_table',2),(13,'2022_09_28_170324_create_applications_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_user`
--

DROP TABLE IF EXISTS `post_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_user_post_id_foreign` (`post_id`),
  KEY `post_user_user_id_foreign` (`user_id`),
  CONSTRAINT `post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_user`
--

LOCK TABLES `post_user` WRITE;
/*!40000 ALTER TABLE `post_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_title_unique` (`title`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (2,1,5,'Consectetur aperiam voluptatem et assumenda qui voluptatem deleniti vel fugit.','consectetur-aperiam-voluptatem-et-assumenda-qui-voluptatem-deleniti-vel-fugit','consectetur-aperiam-voluptatem-et-assumenda-qui-voluptatem-deleniti-vel-fugit-6335df15bbb871664474901.jpg','Quae sapiente quod necessitatibus qui consequatur minus. Non autem illum dolorem vel tenetur tempore saepe. Omnis cum explicabo rem voluptates ducimus illo. Velit nam labore id distinctio perferendis in est non. Nobis corporis quaerat consequatur quibusdam qui alias reiciendis dolores. Quia sed eveniet placeat aut corrupti consectetur enim ut. Aspernatur animi accusantium consequatur quia repellat ut maiores. Blanditiis eveniet saepe voluptatibus recusandae quo. Reiciendis sit soluta et praesentium placeat deleniti aspernatur sint. Odit ea laudantium iusto id voluptatem saepe omnis asperiores. Sint laudantium nihil est. Amet necessitatibus est ut enim officia. Quia cumque eveniet voluptatem perspiciatis. A quas illum inventore illo fuga saepe voluptatum amet. Ipsa odit quaerat doloremque sint. Aut adipisci deleniti repellat iste nisi. Dolorum aut assumenda veniam et. Aut perspiciatis in aliquam illo voluptatem recusandae. Sed qui molestiae voluptas iure. Eum dolores earum tenetur pariatur. Reprehenderit repudiandae autem provident repudiandae. Quia qui numquam magnam. Ducimus cum occaecati eius enim. Nostrum totam amet rerum ut temporibus voluptas. Porro libero rerum ut et asperiores perspiciatis temporibus. Id dicta culpa dolores hic molestias rerum quis. Est libero ut suscipit eos vel. Et accusantium officia blanditiis hic ipsam cumque.',27,1,'2022-09-23 20:08:31','2022-09-29 18:08:21'),(3,1,3,'Impedit perferendis error omnis nulla qui vitae et qui doloribus.','accusantium-atque-temporibus-quasi-temporibus-molestiae-non-aut-quia-perspiciatis-et-voluptatem-maiores','laravel-wiki-5f92a8e71c7bc1603447015.jpg','Repellendus minus nostrum vel omnis dolores alias officia. Necessitatibus consequuntur eius est ex autem. Assumenda magni qui debitis nobis. Repellendus voluptatem quia explicabo et sit et sit. Sequi doloribus omnis culpa ut. Est fugit eveniet perferendis et eos maiores. Nesciunt nam magni consequatur blanditiis consequatur delectus eum qui. Eum rerum ut et rerum. Assumenda amet molestiae consequatur sit nesciunt delectus minima repudiandae. Qui rem totam laboriosam quasi ut nemo. Sed quia ad qui voluptate optio dolor. Quasi odit aliquam aliquid omnis quia. Quae quaerat exercitationem aut enim culpa. Beatae esse consequatur nisi dolorem.',82,1,'2022-09-23 20:08:31','2022-09-23 20:08:31'),(4,1,7,'Sequi illo iusto tenetur sapiente consectetur quae ratione non modi omnis neque.','et-dolorem-voluptatibus-quisquam-quae-sed-ut-similique-consectetur-cupiditate','laravel-wiki-5f92a8e71c7bc1603447015.jpg','Nemo recusandae id harum culpa accusamus. Inventore neque veritatis eum culpa. Et culpa iure animi facilis a velit sed. Incidunt sed sed rerum adipisci deserunt sed. Sit quod consequuntur commodi et recusandae aut qui. Facilis vel magnam optio repellendus. Ipsum aut aut consequatur accusamus vitae. In vitae aut et id necessitatibus sunt. Aut officia eveniet nemo illo. Quia illo facilis quae sequi natus repellendus omnis. Quia ea illum sit at. Impedit recusandae quia provident accusantium modi ipsam sed. Autem ab autem minus numquam voluptatum deserunt. Odit voluptatem ullam molestiae asperiores non. Aspernatur et ut qui eos voluptatibus et. Et enim qui vel atque nulla tenetur sequi.',85,1,'2022-09-23 20:08:31','2022-09-23 20:08:31'),(5,1,7,'Neque ut ut deserunt sint aut eveniet.','voluptatem-sit-officia-quis-a-consequatur-ullam-natus-quis','laravel-wiki-5f92a8e71c7bc1603447015.jpg','Est ullam nihil nobis temporibus quis facere. Non maiores maxime exercitationem quaerat similique. Mollitia est est sequi iusto possimus alias eos. Temporibus voluptatum magni dolorum perspiciatis repellendus sed et. Autem consequatur corporis voluptatem necessitatibus quia et tempora. Alias iure voluptatem dolorem voluptatem ex aut consequatur sed. Accusantium deleniti nesciunt veritatis. Eaque doloribus facere amet dolores nisi quibusdam. Repellat maxime nostrum sed corrupti. Facere perspiciatis quia quasi repellat quia consequatur veritatis iusto. Qui necessitatibus nobis sed sed in consequatur optio. Et recusandae totam quod. Quis quas et similique quae nisi fugiat ut. Ea sit voluptatem quo quae vel. Aut non ex repudiandae repellat voluptas a. Illo dolore consequatur autem beatae et eum. Est quia numquam sint adipisci voluptatem est. Molestiae est quia quisquam quibusdam ipsam dicta. Ut velit ullam sit sit voluptas. Beatae id qui nam deleniti qui. Aut distinctio facere ad omnis cum nulla illum. Velit sunt rerum dolore et. Exercitationem cum doloremque autem excepturi aut non. Rem consequuntur et corrupti veniam autem.',49,1,'2022-09-23 20:08:31','2022-09-23 20:08:31'),(6,1,8,'Veniam veritatis amet veritatis delectus ea fugit rerum et cum accusamus aliquam.','hic-et-et-expedita-recusandae-impedit-consequuntur-ut-fugit','laravel-wiki-5f92a8e71c7bc1603447015.jpg','Modi laudantium reiciendis aut quis. Sit non in illo necessitatibus harum voluptates. Aut ullam porro laudantium et. Ut recusandae quam itaque et qui dolorem. Ut eveniet repellendus quis hic. Accusantium maxime voluptatem nesciunt quia. Aut ab dolor ea numquam suscipit animi aut. Et ut quibusdam perspiciatis consequatur enim modi atque consequuntur. Alias aut ea praesentium sunt dolore accusamus animi. Omnis possimus quis eos ad ad laboriosam ea. Necessitatibus ut magni at at eum labore fugit. Aut voluptatem explicabo ea esse laborum quibusdam eveniet. Voluptas vitae vitae a quia nisi quae et. Et vero fugit beatae rem harum.',88,1,'2022-09-23 20:08:31','2022-09-23 20:08:31'),(7,1,2,'Sapiente voluptatem ut temporibus quia et magni delectus incidunt voluptatem voluptatem odio dolorem.','error-in-excepturi-aut-facere-maiores-dolorem-dolore-vitae-eos-omnis-esse-dolores','laravel-wiki-5f92a8e71c7bc1603447015.jpg','Non fugit magnam recusandae eos eum. Quo numquam tempore quia repudiandae aliquid. Blanditiis odit quo voluptatibus adipisci molestiae quisquam. Cum facere rerum reprehenderit tempora. Aut at eos et ea assumenda consectetur ipsam. At vel velit sit omnis ipsa fugit dicta. Suscipit non repudiandae corporis facilis qui. Nihil eaque eligendi voluptatem voluptate. Voluptate dicta nihil culpa harum. Iusto reiciendis natus sunt ea autem magnam mollitia. Vel voluptas explicabo sapiente. Et alias ad minus est sint nulla voluptatem. Nihil distinctio aliquam minima dolor praesentium iure.',33,1,'2022-09-23 20:08:31','2022-09-23 20:08:31'),(8,1,6,'Et omnis deleniti eius velit sed error consequatur ab.','voluptatibus-ad-ut-quia-quo-id-voluptas-mollitia-iste-quia-veniam-consequatur','laravel-wiki-5f92a8e71c7bc1603447015.jpg','Sed voluptates officia iure beatae suscipit perspiciatis quam. Ad sequi hic at. Omnis et est velit dolores corrupti ut aliquid aliquam. Corrupti rem inventore expedita quis. Vero inventore non aut accusamus voluptatem. Vero ea quia et. Temporibus ratione dolorem amet aut rerum odit. Officia nihil tempora itaque et non ut. Quis nesciunt fugit numquam et temporibus ea nobis. Harum rem nemo deleniti debitis. Iure sunt omnis repellendus amet. Enim qui ut fuga atque facilis qui. Est praesentium velit expedita. Eveniet itaque rem dolores ea. Molestias esse reiciendis quibusdam amet vel aperiam. Quasi cupiditate sapiente sint quis.',100,1,'2022-09-23 20:08:31','2022-09-23 20:08:31'),(9,1,8,'Repellat voluptatem consectetur quis inventore blanditiis voluptas.','est-qui-voluptatem-ad-vero-ut-doloremque','laravel-wiki-5f92a8e71c7bc1603447015.jpg','Enim fugit quibusdam fugiat eius vero autem in. Vel quis veritatis qui dicta labore hic voluptatem doloribus. Debitis illo ab laudantium magni. Voluptatem earum quas a laboriosam est nostrum rerum sed. Sit aperiam inventore dolor eum laborum. Aliquid qui fuga repellat et minima et porro iste. Numquam reprehenderit esse temporibus eos fugit consequuntur omnis. Molestiae dolore repellat molestiae cupiditate deserunt voluptates fugiat. Nihil nulla placeat beatae quo alias dignissimos. Quas voluptate amet sed voluptatem dolor magnam corporis. Sunt occaecati vero at consequuntur. Impedit et corporis iste unde dolorum. Et magnam amet iusto cupiditate quos eos. Deserunt occaecati reprehenderit voluptatem illum accusamus corrupti a.',27,1,'2022-09-23 20:08:31','2022-09-23 20:08:31'),(10,1,2,'Reiciendis non recusandae modi dolore dignissimos voluptas quo et perspiciatis rerum doloremque.','quis-perferendis-accusantium-doloremque-qui-est-vel-rem-et-asperiores-architecto-in-vitae-earum','laravel-wiki-5f92a8e71c7bc1603447015.jpg','Optio cumque quia qui repellendus similique enim. Veritatis magnam et dolores vel repellendus autem. Voluptas ut consequuntur dolore nisi facere qui facilis sapiente. Fugiat repudiandae numquam perferendis sint et ut quisquam recusandae. Molestiae odit autem voluptatibus et occaecati et. Et veritatis at incidunt quo quidem. Nemo ea sed quis culpa ea omnis cupiditate. Nesciunt et eos minima voluptas. Sed laborum est iure explicabo expedita id. Tempora praesentium et consequatur tempora. Nobis deleniti et quo. Alias soluta repudiandae voluptas. Nesciunt sunt eos ea dolor. Adipisci dolor sed corporis voluptate libero. Aspernatur omnis consectetur et quidem. Esse cupiditate doloremque enim omnis quis. Et eos unde minus doloremque quidem iure ut quia. Voluptate qui ipsa iure non voluptates dolor. Natus earum cumque soluta dolor omnis fuga. Incidunt est pariatur ea qui magnam rerum. Nobis natus delectus voluptatem doloribus.',59,1,'2022-09-23 20:08:31','2022-09-23 20:08:31'),(11,1,6,'Neque et officiis consequatur non quo ut eveniet.','debitis-porro-repellat-iste-et-a-quos-nihil','laravel-wiki-5f92a8e71c7bc1603447015.jpg','Fuga ipsa eos numquam optio omnis labore. Deleniti distinctio odit pariatur est perferendis officia adipisci. Praesentium amet vero illo possimus ea facere. Numquam iusto cupiditate reprehenderit accusamus dolores nulla delectus. At sunt hic laudantium. Minus eveniet quibusdam autem rerum. Molestiae vero eligendi consectetur tempore dignissimos rerum adipisci. Modi qui animi blanditiis rerum voluptates non. Similique odio dolorum hic et hic temporibus in. Impedit labore est nesciunt iste. Atque excepturi facilis commodi eos. Deserunt vel saepe sunt velit a sed reprehenderit ipsa. Vitae inventore omnis deserunt minima ducimus. Praesentium tempore eaque omnis aut eos beatae sit sequi.',12,1,'2022-09-23 20:08:31','2022-09-23 20:08:31'),(12,1,6,'Necessitatibus adipisci dolores natus asperiores sed et fugiat qui aspernatur.','quae-consequatur-itaque-voluptas-deleniti-qui-et-dicta-optio-est-eos-labore','laravel-wiki-5f92a8e71c7bc1603447015.jpg','Voluptatem natus repellat aut molestiae. Voluptas deserunt ut dolores repudiandae minus nobis nemo id. Placeat praesentium nostrum eos hic voluptatem. Rerum eveniet velit accusamus ratione et saepe. Voluptas velit vel hic aut. Quaerat molestiae ea voluptatum id suscipit. Culpa corrupti eaque aspernatur laborum. Blanditiis ut id officiis dolorem et excepturi harum beatae. Vel qui architecto quo recusandae voluptatibus. Qui esse recusandae modi aut cumque consequatur corporis. Doloribus quo perferendis officiis aut rerum. Dolores qui veritatis ex deserunt atque. Quo quisquam eligendi molestias iure consectetur fugiat laborum maxime. Voluptas sit vel libero delectus quis. Odio quod velit odio repellendus aliquam nostrum. Consectetur error omnis reprehenderit. Distinctio eum numquam repudiandae rerum minus inventore. Sunt dolores doloribus temporibus rerum vero dolores ratione. Blanditiis veniam autem placeat eligendi quibusdam. Ea voluptates veniam molestiae qui. Et iure praesentium perferendis autem. Totam velit animi nulla doloremque.',60,1,'2022-09-23 20:08:31','2022-09-23 20:08:31'),(13,1,3,'Nostrum deleniti possimus repellendus tempore consequatur dolorem voluptatem corrupti minus aut.','quia-provident-minus-a-ut-quo-consequatur-in-maxime-consequatur-et-et','laravel-wiki-5f92a8e71c7bc1603447015.jpg','Perferendis qui ducimus assumenda in consequatur quaerat sunt. Voluptatem autem sequi libero iusto dolor voluptatibus. Voluptatibus quia culpa sed aut aut ut. Fugiat tenetur possimus debitis sed cupiditate nulla. Voluptate quaerat velit consequatur. Labore iure rerum quibusdam praesentium. Consequatur provident similique dolores ipsa vel accusantium non sed. Est incidunt molestias perspiciatis et odio cupiditate. Est et atque suscipit expedita sed sit dolorum. Saepe accusamus ipsum voluptas illum incidunt minus sed. Id nihil sequi nesciunt ut dolorem. Non expedita alias odio. Eius voluptas cum voluptatem inventore occaecati. In ducimus neque eum sit alias sequi. Sequi reiciendis dolores accusantium nam accusamus laborum. Voluptatum enim rem quo et alias fugit. Sit aut deleniti ea numquam sapiente aspernatur amet. Eligendi quia vitae est ratione sint similique blanditiis. Ea est vel fuga eos magnam perspiciatis sed fuga. Placeat et consectetur quidem minima consequatur adipisci a possimus. Suscipit ullam cumque eius vitae. Nam repudiandae qui quasi perspiciatis officiis illo maxime. Repudiandae autem aliquid voluptatum minima. Voluptas officia dolorum ex et culpa. Est similique quis non qui quasi.',40,1,'2022-09-23 20:08:31','2022-09-23 20:08:31'),(14,1,3,'Omnis in sunt consequatur perferendis fugit vero aperiam ut amet.','animi-quis-atque-explicabo-sunt-ipsum-temporibus','laravel-wiki-5f92a8e71c7bc1603447015.jpg','Reiciendis consequatur quae delectus tenetur iusto nihil. Itaque pariatur et labore doloremque et consequuntur. Vel tempora impedit quo est nulla quisquam quae necessitatibus. Ipsa nostrum ut molestias quo aut molestiae in aspernatur. Impedit sed quas sit doloremque et. Sunt ducimus dolores modi id officia. Dolores eveniet necessitatibus totam corporis. Eveniet doloribus et laudantium qui adipisci repellat ad eos. Excepturi eum adipisci fugit eius error quis. Aperiam amet voluptatem laborum dicta magnam. Dolore assumenda accusamus saepe non fuga laboriosam quo. Repudiandae ab sunt ipsa voluptatibus aliquam labore. Facere qui qui vero omnis repudiandae aliquam soluta enim. Molestiae consequatur natus et sit maxime qui. Dolorum totam dolor minima. Saepe dicta animi quia in qui.',24,1,'2022-09-23 20:08:31','2022-09-23 20:08:31'),(16,1,8,'A reprehenderit ut quisquam id dolores enim aspernatur quod distinctio quisquam repellendus.','hic-aut-vero-tenetur-aut-quia-cum','laravel-wiki-5f92a8e71c7bc1603447015.jpg','Non ut explicabo aut odio eligendi. Sit iusto vel eveniet ut ipsa. Maiores tempora cupiditate aspernatur eum quae debitis. Veritatis natus rerum fugit voluptates. Doloremque autem provident cumque vitae debitis labore vel perferendis. Voluptates non ut itaque inventore. Ipsum pariatur est perferendis dolor consequuntur necessitatibus. Nisi facere hic dolor voluptas delectus expedita et. Inventore commodi incidunt tempore et occaecati aut nesciunt. Dignissimos ducimus dolorum quia ut et vel minima. At nemo laboriosam qui aperiam fugit optio sunt maiores. Id harum officia qui in at. Qui neque laboriosam qui et excepturi. Ea eaque et voluptatem et est eos voluptatibus in. Explicabo qui illum officia eveniet aut magni rerum. Numquam labore qui at consequatur corrupti sed. Consequatur amet dignissimos non aut vero quos. Exercitationem asperiores velit atque sed non. Suscipit doloribus qui odio. Culpa doloremque similique reprehenderit facere et maxime. Deserunt doloribus quia corrupti iusto maiores. Animi voluptatum voluptas sit officiis dolore. Molestiae assumenda qui velit atque sequi beatae dicta. Error voluptatibus dolor consequuntur ratione. Sed rerum libero est ipsa officiis quam dolor. Ipsam deserunt omnis et soluta enim iste sit aut.',12,1,'2022-09-23 20:08:31','2022-09-23 20:08:31'),(17,1,7,'Doloremque ut amet quia ratione maxime voluptatem.','repellendus-excepturi-maxime-dolores-dolorem-doloremque-voluptates-ipsa-explicabo-aut-dolor','laravel-wiki-5f92a8e71c7bc1603447015.jpg','Nostrum et repudiandae quia mollitia non ex dolores. Nihil ratione est impedit aut laudantium animi distinctio voluptas. Hic minima eum in. Minus aspernatur blanditiis rerum illum exercitationem labore. Unde aut sit exercitationem eaque. Perferendis sint aspernatur recusandae ea odit odio qui rem. Qui voluptatum totam asperiores aut dicta et. Temporibus maiores inventore quia aut iste. Tempore sequi quibusdam necessitatibus iusto beatae nobis architecto sint. A magni vel perferendis architecto eos corporis. Sint officiis odio quae voluptas suscipit a. Optio harum occaecati nihil. Aut laudantium minus eveniet harum. Quaerat nam perspiciatis hic est commodi. Ipsum veniam aut adipisci sint. Ut repellendus suscipit consequatur illo qui. Reiciendis ipsam aut quo sed. Placeat dolor ratione autem consequatur rerum. Laborum incidunt deserunt praesentium quo nemo maxime totam. Sit voluptates perspiciatis illum nobis adipisci voluptates dignissimos voluptatem. Et sit beatae sunt corrupti aut quia accusamus. Excepturi voluptas dignissimos ipsum labore eos. Aut eveniet velit velit et eos sint inventore dolor. Fuga nihil est tenetur. Alias asperiores quae dolores cum.',57,1,'2022-09-23 20:08:31','2022-09-30 16:06:22'),(18,1,3,'Aut est culpa est quod necessitatibus ea in harum odit est dolor qui.','ipsum-modi-ab-sint-omnis-eum-corrupti-blanditiis-repellendus-dolore-voluptatem','laravel-wiki-5f92a8e71c7bc1603447015.jpg','Voluptatem suscipit ut illum iste et aut autem sed. Voluptas error saepe voluptates dignissimos amet. Quaerat inventore ut assumenda accusantium et labore minus atque. Et non consectetur quas fugit est soluta. Nulla commodi eligendi et expedita sapiente distinctio ex autem. Ex repellat sint rerum autem temporibus odio eveniet. Enim minima esse repellendus soluta deserunt qui voluptatem. Adipisci ut nihil eveniet eius mollitia minus in. Cupiditate suscipit dolorum distinctio. Non dolorem error delectus. Rerum veniam voluptas impedit dolor praesentium doloribus rem iusto. Animi iure ex qui voluptates doloremque. Assumenda sint minima odit dicta ea. Voluptatem fugiat illum libero qui. Rerum rem itaque et perferendis vitae. Molestiae et quod porro nemo officia expedita. Ducimus totam maiores eaque. Voluptatum beatae minima culpa aut eos error. Voluptate enim iure et. Repellendus nemo dolores praesentium quia voluptatibus. Voluptas eius dolores et ea impedit animi est. Odio porro voluptatem sit minima. Totam omnis et dolorem debitis.',14,1,'2022-09-23 20:08:31','2022-09-23 20:08:31'),(19,1,2,'Et dignissimos quisquam qui et ut dignissimos vitae et doloribus dolores.','sit-sed-aut-ut-vitae-nulla-nostrum-quo-animi','laravel-wiki-5f92a8e71c7bc1603447015.jpg','Temporibus veniam praesentium vitae eum. Aperiam quo iste natus totam in qui ut. Voluptatem voluptatem et illum numquam dicta non porro. Fugit commodi vero provident esse accusantium eum ut. Illum pariatur molestias quis omnis. Mollitia ullam aut incidunt enim. Accusamus occaecati molestias maiores eum voluptatibus. Harum et et accusantium. Voluptas ducimus autem sunt molestiae quidem alias expedita. Nobis est sed laboriosam laudantium sed ducimus. Nemo quis corrupti sed possimus non est accusamus. Voluptatum iusto sapiente et enim quisquam ipsa. Adipisci quo consequatur veniam a illo. Cumque eius consequatur illum ut repudiandae. Blanditiis aut nihil architecto sed. Libero est facilis repudiandae. Maxime sed omnis voluptatibus sapiente labore. Quibusdam provident praesentium qui dolorem saepe inventore ipsa. Velit qui quasi ut dolor alias at dolorum. Saepe dolores quo laudantium quo soluta est. Eius dicta ipsum aut id rerum laudantium incidunt. Veritatis aut sint provident fugiat qui reiciendis eius. Consequatur qui voluptas quibusdam officia culpa. A aut voluptatem quia distinctio.',63,1,'2022-09-23 20:08:31','2022-09-23 20:08:31'),(20,1,5,'Eos nihil incidunt doloribus voluptates repellendus aut corporis et nobis quia quia.','beatae-numquam-ratione-tempore-similique-aut-totam-veniam','laravel-wiki-5f92a8e71c7bc1603447015.jpg','Porro molestias non vero reiciendis. Ullam aperiam consequatur dignissimos ut quia. Rerum iure voluptas omnis incidunt qui. Nesciunt quaerat doloremque et. At quia quo facilis. Expedita sed et eius quod sed ea assumenda velit. Omnis quo alias quia quod quisquam enim sapiente quod. Sequi modi magni molestias debitis aperiam ex. Consectetur ipsum ut minima et. Placeat ipsa ut debitis ea mollitia aut et. Debitis aut eum veniam quaerat quo eum. Est deserunt et excepturi veritatis. Rerum quod et sunt ut porro placeat consectetur. Sed nihil dolorum consequuntur adipisci animi. Est molestiae ut aut quaerat excepturi vel. Magni ea sed animi ut qui. Omnis dolor quibusdam nisi architecto perferendis ad sint consequuntur. Alias molestias cupiditate amet amet qui. Aut optio laboriosam eius est commodi. Vel doloremque maxime esse. Autem ducimus iste non ab tempora. Deleniti voluptatibus doloribus est est reprehenderit corrupti aut. Voluptatem consequatur sapiente omnis corporis.',20,1,'2022-09-23 20:08:31','2022-09-23 20:08:31'),(21,1,1,'What is HTML?','what-is-html','what-is-html-632e1f344ca681663967028.jpg','<ol><li style=\"box-sizing: inherit;\">HTML stands for Hyper Text Markup Language</li><li style=\"box-sizing: inherit;\">HTML is the standard markup language for creating Web pages</li><li style=\"box-sizing: inherit;\">HTML describes the structure of a Web page</li><li style=\"box-sizing: inherit;\">HTML consists of a series of elements</li><li style=\"box-sizing: inherit;\">HTML elements tell the browser how to display the content</li><li style=\"box-sizing: inherit;\">HTML elements label pieces of content such as \"this is a heading\", \"this is a paragraph\", \"this is a link\", etc.</li></ol>',3,1,'2022-09-23 21:03:48','2022-09-28 23:50:01'),(22,1,4,'ER Diagram','er-diagram','er-diagram-632f8a89eed161664060041.png','<p>This is the ER diagram of the blog.</p>',2,1,'2022-09-24 22:54:02','2022-09-30 01:41:11'),(23,1,4,'UI Flow','ui-flow','ui-flow-632f8ad3cab0a1664060115.png','<p>This is the web UI design for the blog</p>',1,1,'2022-09-24 22:55:18','2022-09-24 23:10:49'),(24,1,4,'User case diagram','user-case-diagram','user-case-diagram-632f8e5e5b2071664061022.png','<p>This is the UML user case diagram of blog</p>',3,1,'2022-09-24 23:10:22','2022-09-30 02:02:02'),(25,1,4,'UI of admin categories','ui-of-admin-categories','ui-of-admin-categories-632f8f151ade41664061205.png','<p>This is the prototype of admin catogries management page</p>',1,1,'2022-09-24 23:13:25','2022-09-27 11:31:39'),(26,1,4,'UI of admin comments','ui-of-admin-comments','ui-of-admin-comments-632f8f4b4078d1664061259.png','<p>This is the prototype of admin comments management page</p>',1,1,'2022-09-24 23:14:19','2022-09-27 23:37:24'),(27,1,4,'UI of admin dashboard','ui-of-admin-dashboard','ui-of-admin-dashboard-632f8f98098e31664061336.png','<p>This is the prototype of admin dashboard page</p>',1,1,'2022-09-24 23:15:36','2022-09-28 00:22:24'),(28,1,4,'UI of admin new category','ui-of-admin-new-category','ui-of-admin-new-category-632f8ff6b3aa71664061430.png','<p>This is the prototype of admin new category page</p>',0,1,'2022-09-24 23:17:10','2022-09-24 23:17:10'),(29,1,4,'UI of admin new post','ui-of-admin-new-post','ui-of-admin-new-post-632f90304fc891664061488.png','<p>This is the prototype of admin new post page</p>',0,1,'2022-09-24 23:18:08','2022-09-24 23:18:08'),(30,1,4,'UI of admin posts','ui-of-admin-posts','ui-of-admin-posts-632f90757ecd31664061557.png','<p>This is the prototype of admin posts management page</p>',2,1,'2022-09-24 23:19:17','2022-09-26 15:02:04'),(31,1,4,'UI of admin replied comments','ui-of-admin-replied-comments','ui-of-admin-replied-comments-632f90b32de051664061619.png','<p>This is the prototype of admin replied comments management page</p>',1,1,'2022-09-24 23:20:19','2022-09-26 11:21:56'),(32,1,4,'UI of admin users','ui-of-admin-users','ui-of-admin-users-632f90eddceeb1664061677.png','<p>This is the prototype of admin users management page</p>',2,1,'2022-09-24 23:21:18','2022-09-26 12:03:55'),(33,1,4,'UI of user category','ui-of-user-category','ui-of-user-category-632f912714f101664061735.png','<p>This is the prototype of user category page</p>',2,1,'2022-09-24 23:22:15','2022-09-30 13:39:16'),(34,1,4,'UI of user myprofile','ui-of-user-myprofile','ui-of-user-myprofile-632f91716b88c1664061809.png','<p>This is the prototype of user myprofile page</p>',1,1,'2022-09-24 23:23:29','2022-09-26 15:14:35'),(35,1,4,'Blog system requirements summary','blog-system-requirements-summary','blog-system-requirements-summary-632f925d729bf1664062045.jpg','This website will be a social blog, where users/members can post comments and media on their wall. The user will have to register as a member before they can comment and/or post. Upon completion of this blog, this project will demonstrate all CRUD capabilities between users and posts. It will show capabilities in adding, updating, and deleting members. The same functions will be used for posts made. The blog will use Laravel as it’s platform and php as it’s code. The website will contain tables for members, which will contain user information such as full name, id, address, and birth year. Another table will be used for posts such as date posted, length, media/documents, etc. A third table will be used to store login information and validation. To use this application the user will first have to register with the blog. Once registered, it will direct them to the main page where they will see all the posts and comments of other members. This will make the site more exclusive and hopefully attract more members.',7,1,'2022-09-24 23:27:25','2022-09-30 02:01:36'),(36,1,4,'Laravel Archtecture','laravel-archtecture','laravel-archtecture-633709fe516b61664551422.jpg','<p>MVC and ORM</p>',5,1,'2022-09-30 15:23:42','2022-09-30 16:06:52');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `severity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,'2022-09-29 16:09:04','Inappropriate Content','Minor','low','summary','desc','abc'),(2,'2022-09-29 22:00:56','Inappropriate Content','Minor','low','fight fem','fghmghmfg','John Doe'),(3,'2022-09-29 22:03:15','Bug/Error','critical','high','pompon,/jpo,/','job,/jop/jp','Ulysses Grant'),(4,'2022-09-29 22:05:06','Spam','Serious','medium','ion;ji;','jo;ij;j;j','Roland Dean'),(5,'2022-09-30 11:59:28','Inappropriate Content','Moderate','medium','TEST','Testing bad post','Jane Doe');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','2022-09-23 20:08:31','2022-09-23 20:08:31'),(2,'user','2022-09-23 20:08:31','2022-09-23 20:08:31'),(3,'suspend','2022-09-23 20:08:31','2022-09-23 20:08:31');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `postID` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_postid_foreign` (`postID`),
  CONSTRAINT `tags_postid_foreign` FOREIGN KEY (`postID`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (2,21,'www'),(3,22,'database design'),(4,23,'web'),(5,23,'UI'),(6,24,'UML'),(7,24,'user case'),(8,25,'UI'),(9,25,'prototype'),(10,26,'UI'),(11,26,'prototype'),(12,27,'UI'),(13,27,'prototype'),(14,28,'UI'),(15,28,'prototype'),(16,29,'UI'),(17,29,'prototype'),(18,30,'UI'),(19,30,'prototype'),(20,31,'UI'),(21,31,'prototype'),(22,32,'UI'),(23,32,'prototype'),(24,33,'UI'),(25,33,'prototype'),(26,34,'UI'),(27,34,'prototype'),(29,35,'Requirements'),(30,2,'sample'),(31,36,'framework');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT 2,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userid_unique` (`userid`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Admin','admin101','admin@example.com',NULL,'$2y$10$JGNynrpMq0Xg8lpzkvs8O.1urKO0sbMYnlKYSGXd8qk9COXX7TA4e','admin632e143b817e1.png',NULL,NULL,'2022-09-23 20:08:30','2022-09-23 20:16:59'),(2,2,'User','user101','user@example.com',NULL,'$2y$10$dWb4I1wZbrYYtRn0vhZVJ.pKysP25FQ9JWPsd2EMP/BhpBQnFV7Bu','default.jpg',NULL,NULL,'2022-09-23 20:08:31','2022-09-23 20:08:31'),(3,2,'zac clarke','zac','zacclarke@gmail.com',NULL,'$2y$10$LmFUp5ypI7nH2HIGMA7G1eWPupQFXvNGhgg1E13uUSLmB8w8UrBKO','zac-clarke633710eebeb0f.jpg',NULL,NULL,'2022-09-30 15:52:12','2022-09-30 15:53:18'),(4,2,'aftab','aftab514','safdar_aftab@hotmail.com',NULL,'$2y$10$lJ/U6eW0l0BlCBmbMNoI0OuNf7HuoNqDAPWkwD8ZnGl6O1RPPgkmK','default.jpg',NULL,NULL,'2022-09-30 15:52:41','2022-09-30 15:52:41'),(5,2,'user2','user2','user2@example.com',NULL,'$2y$10$rKwyBKHAd2I067Iy.sen8.O7TFdL/3KMPCmxDGxnTWs2rdmNYLmf.','default.jpg',NULL,NULL,'2022-09-30 15:55:03','2022-09-30 15:55:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'blog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-01  0:45:14
