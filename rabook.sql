DROP DATABASE IF exists rabook;
CREATE DATABASE rabook;
use rabook;
​
CREATE TABLE `books` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(50),
  `language_id` int,
  `price` float,
  `owner_id` int,
  `thumbnail` text,
  `description` text,
  `SKU` varchar(20),
  `QR_picture` text,
  `rate_point` float,
  `total_rate` int,
  `total_view` int,
  `total_review` int,
  `total_page` int,
  `total_borrow` int,
  `status` int,
  `republish` int,
  `publish_date` timestamp,
  `sumary` text
);
​
CREATE TABLE `blogs` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `book_id` int,
  `content` text,
  `created_date` timestamp
);
​
CREATE TABLE `votings` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `blog_id` int
);
​
CREATE TABLE `comments` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `content` text,
  `created_date` timestamp,
  `blog_id` int,
  `reply` int
);
​
CREATE TABLE `categories` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50)
);
​
CREATE TABLE `authors` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50)
);
​
CREATE TABLE `ratings` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `book_id` int
);
​
CREATE TABLE `languages` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50)
);
​
CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50)
);
​
ALTER TABLE `books` ADD FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);
​
ALTER TABLE `books` ADD FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`);
​
ALTER TABLE `blogs` ADD FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);
​
ALTER TABLE `votings` ADD FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`);
​
ALTER TABLE `comments` ADD FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`);
​
ALTER TABLE `comments` ADD FOREIGN KEY (`reply`) REFERENCES `comments` (`id`);
​
CREATE TABLE `books_authors` (
  `books_id` int,
  `authors_id` int,
  PRIMARY KEY (`books_id`, `authors_id`)
);
​
ALTER TABLE `books_authors` ADD FOREIGN KEY (`books_id`) REFERENCES `books` (`id`);
​
ALTER TABLE `books_authors` ADD FOREIGN KEY (`authors_id`) REFERENCES `authors` (`id`);
​
​
CREATE TABLE `books_categories` (
  `books_id` int,
  `categories_id` int,
  PRIMARY KEY (`books_id`, `categories_id`)
);
​
ALTER TABLE `books_categories` ADD FOREIGN KEY (`books_id`) REFERENCES `books` (`id`);
​
ALTER TABLE `books_categories` ADD FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`);
​
​
ALTER TABLE `ratings` ADD FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);