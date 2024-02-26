-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 25, 2024 at 05:38 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movies_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `bookingid` int NOT NULL AUTO_INCREMENT,
  `movieid` int NOT NULL,
  `seatid` int NOT NULL,
  `username` varchar(40) NOT NULL,
  `bookingdate` date NOT NULL,
  PRIMARY KEY (`bookingid`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`bookingid`, `movieid`, `seatid`, `username`, `bookingdate`) VALUES
(72, 19, 202, 'sreekesh', '2024-02-25'),
(71, 19, 201, 'sreekesh', '2024-02-25'),
(70, 19, 199, 'sreekesh', '2024-02-25'),
(69, 19, 204, 'sreekesh', '2024-02-25'),
(68, 26, 198, 'sreekesh', '2024-02-25'),
(67, 26, 199, 'sreekesh', '2024-02-25'),
(66, 26, 200, 'sreekesh', '2024-02-25'),
(65, 19, 3, 'sreekesh', '2024-02-25'),
(64, 19, 2, 'sreekesh', '2024-02-25'),
(63, 19, 1, 'sreekesh', '2024-02-25'),
(62, 51, 198, 'sreekesh', '2024-02-25'),
(61, 19, 200, 'sreekesh', '2024-02-25'),
(60, 19, 198, '1', '2024-02-25'),
(59, 19, 110, 'sreekesh', '2024-02-25'),
(58, 19, 52, 'sreekesh', '2024-02-25'),
(73, 19, 4, 'sreekesh', '2024-02-25'),
(74, 22, 1, 'sreekesh', '2024-02-25'),
(75, 55, 1, 'sreekesh', '2024-02-25'),
(76, 52, 1, 'sreekesh', '2024-02-25'),
(77, 19, 7, 'sreekesh', '2024-02-25'),
(78, 33, 1, 'sreekesh', '2024-02-25'),
(79, 24, 199, 'sreekesh', '2024-02-25'),
(80, 24, 200, 'sreekesh', '2024-02-25'),
(81, 55, 17, 'sreekesh', '2024-02-25'),
(82, 55, 18, 'sreekesh', '2024-02-25'),
(83, 51, 1, '1', '2024-02-25'),
(84, 51, 3, 'sreekesh', '2024-02-25'),
(85, 24, 17, 'sreekesh58', '2024-02-25'),
(86, 24, 18, 'sreekesh58', '2024-02-25');

-- --------------------------------------------------------

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
CREATE TABLE IF NOT EXISTS `directors` (
  `directorid` int NOT NULL AUTO_INCREMENT,
  `directorname` varchar(40) NOT NULL,
  PRIMARY KEY (`directorid`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `directors`
--

INSERT INTO `directors` (`directorid`, `directorname`) VALUES
(1, 'Frank Darabont'),
(2, 'Francis Ford Coppola'),
(3, 'Christopher Nolan'),
(4, 'Robert Zemeckis'),
(5, 'Lana Wachowski and Lilly Wachowski'),
(6, 'Peter Jackson'),
(7, 'David Fincher'),
(8, 'Jonathan Demme'),
(9, 'Quentin Tarantino'),
(10, 'Martin Scorsese'),
(11, 'Nitesh Tiwari'),
(12, 'Rajkumar Hirani'),
(13, 'Zoya Akhtar'),
(14, 'Ashutosh Gowariker'),
(15, 'Sriram Raghavan'),
(16, 'Vikas Bahl'),
(17, 'Anurag Basu'),
(18, 'Aamir Khan'),
(19, 'Shimit Amin'),
(20, 'Farhan Akhtar'),
(21, 'Sujoy Ghosh'),
(22, 'Rakeysh Omprakash Mehra'),
(23, 'Anurag Kashyap'),
(24, 'Jeethu Joseph'),
(25, 'Alphonse Puthren'),
(26, 'Anjali Menon'),
(27, 'Manu Ashokan'),
(28, 'Dileesh Pothan'),
(29, 'Madhu C. Narayanan'),
(30, 'M. Padmakumar'),
(31, 'Lijo Jose Pellissery'),
(32, 'Martin Prakkat'),
(33, 'Amal Neerad'),
(34, 'Zakariya Mohammed'),
(35, 'Zoya Akhtar'),
(36, 'S.S. Rajamouli'),
(37, 'Pushkar-Gayathri'),
(38, 'C. Prem Kumar'),
(39, 'Lokesh Kanagaraj'),
(40, 'Thiagarajan Kumararaja'),
(41, 'Vetrimaaran'),
(42, 'Mari Selvaraj'),
(44, 'Karthik Subbaraj');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `movieid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `r_date` date DEFAULT NULL,
  `image_url` text,
  `runtime` decimal(5,2) DEFAULT NULL,
  `imdb_rating` decimal(3,1) DEFAULT '0.0',
  `description` text,
  `certificate` varchar(5) DEFAULT NULL,
  `metascore` decimal(3,1) DEFAULT '0.0',
  `votes` int DEFAULT '0',
  `language` varchar(20) DEFAULT NULL,
  `genre` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`movieid`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movieid`, `title`, `r_date`, `image_url`, `runtime`, `imdb_rating`, `description`, `certificate`, `metascore`, `votes`, `language`, `genre`) VALUES
(1, 'The Shawshank Redemption', '1994-10-14', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/vdVab7yNvgYEMd8shCfy2D6nTMu.jpg', 142.00, 9.3, 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 'R', 80.0, 2140000, 'English', 'Drama'),
(2, 'The Godfather', '1972-03-24', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/3bhkrj58Vtu7enYsRolD1fZdja1.jpg', 175.00, 9.2, 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 'R', 99.9, 1500000, 'English', 'Crime'),
(3, 'The Dark Knight', '2008-07-18', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qJ2tW6WMUDux911r6m7haRef0WH.jpg', 152.00, 9.0, 'When the menace known as The Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 'PG-13', 84.0, 2100000, 'English', 'Action'),
(4, 'Inception', '2010-07-16', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/oYuLEt3zVCKq57qu2F8dT7NIa6f.jpg', 148.00, 8.8, 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', 'PG-13', 74.0, 1900000, 'English', 'Sci-Fi'),
(5, 'Forrest Gump', '1994-07-06', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/arw2vcBveWOVZr6pxd9XTd1TdQa.jpg', 142.00, 8.8, 'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.', 'PG-13', 82.0, 1900000, 'English', 'Drama'),
(6, 'The Matrix', '1999-03-31', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg', 136.00, 8.7, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', 'R', 73.0, 1800000, 'English', 'Action'),
(7, 'The Lord of the Rings: The Fellowship of', '2001-12-19', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg', 178.00, 8.8, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', 'PG-13', 92.0, 2100000, 'English', 'Adventure'),
(8, 'Fight Club', '1999-10-15', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/bptfVGEQuv6vDTIMVCHjJ9Dz8PX.jpg', 139.00, 8.8, 'An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.', 'R', 66.0, 1800000, 'English', 'Drama'),
(9, 'Interstellar', '2014-11-07', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg', 169.00, 8.6, 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.', 'PG-13', 74.0, 1400000, 'English', 'Sci-Fi'),
(10, 'The Lord of the Rings: The Return of the', '2003-12-17', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg', 201.00, 8.9, 'Gandalf and Aragorn lead the World of Men against Sauron\'s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', 'PG-13', 94.0, 1800000, 'English', 'Adventure'),
(11, 'The Silence of the Lambs', '1991-02-14', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uS9m8OBk1A8eM9I042bx8XXpqAq.jpg', 118.00, 8.6, 'A young FBI cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.', 'R', 85.0, 1300000, 'English', 'Thriller'),
(12, 'Pulp Fiction', '1994-10-14', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uhoPx0bgAUlvQG02vZaXlCik9nn.jpg', 154.00, 8.9, 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 'R', 94.0, 1600000, 'English', 'Crime'),
(13, 'Django Unchained', '2012-12-25', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7oWY8VDWW7thTzWh3OKYRkWUlD5.jpg', 165.00, 8.4, 'With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal Mississippi plantation owner.', 'R', 81.0, 1400000, 'English', 'Western'),
(14, 'The Departed', '2006-10-06', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/nT97ifVT2J1yMQmeq20Qblg61T.jpg', 151.00, 8.5, 'An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.', 'R', 85.0, 1100000, 'English', 'Crime'),
(15, 'Goodfellas', '1990-09-19', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/aKuFiU82s5ISJpGZp7YkIr3kCUd.jpg', 146.00, 8.7, 'The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito in the Italian-American crime syndicate.', 'R', 89.0, 1000000, 'English', 'Crime'),
(16, 'Drishyam', '2013-12-19', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7d8GLneJkF81q1POdK7VUrjWafX.jpg', 164.00, 8.9, 'A man goes to extreme lengths to save his family from punishment after the family commits an accidental crime.', 'U', 85.0, 110000, 'Malayalam', 'Drama'),
(17, 'Premam', '2015-05-29', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/p8GsLenkRvV5SfQY2X5WPE4pebA.jpg', 157.00, 8.3, 'A young man has three opportunities to find love.', 'U', 75.0, 86000, 'Malayalam', 'Romance'),
(18, 'Bangalore Days', '2014-05-30', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/iFMyZw1DTGvZ8hPa0eTseSFiRT1.jpg', 171.00, 8.3, 'Three cousins set out to fulfill their Bangalore dreams.', 'U', 70.0, 89000, 'Malayalam', 'Drama'),
(19, 'Uyare', '2019-04-26', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/xwo3PIN8hipmCsySx76kaUtuXxH.jpg', 120.00, 8.3, 'Pallavi, a strong-willed woman, encounters numerous challenges when she decides to become a pilot.', 'U', 80.0, 69000, 'Malayalam', 'Drama'),
(20, 'Maheshinte Prathikaaram', '2016-02-05', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hhQr0tyo5YkljA9AVhofkDzAdvF.jpg', 121.00, 8.3, 'Mahesh, a photographer, gets beaten up by a stranger when he tries to solve an issue in his village. He sets out to take revenge on the stranger as he feels insulted after the incident.', 'U', 75.0, 70000, 'Malayalam', 'Drama'),
(21, 'Neram', '2013-05-10', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/cA5OgwysDaFmMGeEjUEG59aVoMs.jpg', 116.00, 7.5, 'Mathew, a graduate, tries to complete a challenge for his lover, and he crosses paths with a dreaded loan shark.', 'U', 70.0, 53000, 'Malayalam', 'Thriller'),
(22, 'Kumbalangi Nights', '2019-02-07', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/lJ3RvIirE2C7gdBKvPRaoQ3iCo2.jpg', 135.00, 8.7, 'The film revolves around four brothers who share a love-hate relationship with each other.', 'U', 85.0, 73000, 'Malayalam', 'Drama'),
(23, 'Joseph', '2018-11-16', 'https://m.media-amazon.com/images/M/MV5BMGY3NDIyMTMtYjZmMy00MzgyLThiMDUtYTc1OWE5N2Y0NDYxXkEyXkFqcGdeQXVyMjkxNzQ1NDI@._V1_.jpg', 138.00, 8.7, 'A retired cop investigates a murder that happened in the past but something seems off about it.', 'U', 82.0, 61000, 'Malayalam', 'Thriller'),
(24, 'Drishyam 2', '2021-02-19', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8RJBCUGE27LX06tAES4jTELN0KA.jpg', 152.00, 8.7, 'Six years after the abduction of his daughter, a man is hired by a stranger to enact a revenge kidnapping on the man\'s own daughter.', 'U', 80.0, 51000, 'Malayalam', 'Thriller'),
(25, 'Ee Ma Yau', '2018-05-04', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8NfC32RyRkgAFzQuW42PW3TigDv.jpg', 120.00, 8.1, 'Eeshi, a low-ranking government employee, struggles to give his deceased father a worthy funeral.', 'U', 83.0, 47000, 'Malayalam', 'Drama'),
(26, 'Jallikattu', '2019-10-04', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hVrC1y1lzsDuqqfM6OvxwKCFxt0.jpg', 95.00, 7.8, 'A young man from a village sets out to catch the escaped buffalo that has been causing havoc in the village.', 'U', 79.0, 59000, 'Malayalam', 'Drama'),
(27, 'Thondimuthalum Driksakshiyum', '2017-06-30', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ki1EguwPuXM1t4UTDuaBqD8BLJi.jpg', 135.00, 8.1, 'Prasad and Sreeja enter wedlock and move to a new place to continue the rest of their lives. Unfortunate events begin to take place after Prasad, a small-time thief, robs Sreeja\'s gold chain during a bus journey.', 'U', 80.0, 54000, 'Malayalam', 'Drama'),
(28, 'Charlie', '2015-12-24', 'https://m.media-amazon.com/images/M/MV5BMmZhMzVlNzEtMjQ3ZS00ZGJlLTk4N2YtMDIyNDNmZThhMGVmXkEyXkFqcGdeQXVyMzIyNDI4NjU@._V1_.jpg', 130.00, 7.7, 'A young, nonconforming woman named Tessa gets entangled in a cat-and-mouse chase in the by-lanes of Kerala, hunting for a mysterious artist who previously lived in her apartment.', 'U', 76.0, 62000, 'Malayalam', 'Drama'),
(29, 'Varathan', '2018-09-20', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/agHSdoDGqmJZBupYhxCnpkYX2nG.jpg', 130.00, 7.3, 'After losing his job in Dubai, Arun moves back to Kerala in an effort to start anew. However, he soon learns that his wife Priya\'s family is hostile towards him.', 'U', 74.0, 51000, 'Malayalam', 'Thriller'),
(30, 'Sudani from Nigeria', '2018-03-23', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/iyxaHXxzLrIz4pxVkrqVGysn6b5.jpg', 125.00, 8.2, 'Majeed forms a football team and dreams of playing in the prestigious Sevens Football League. But he faces various challenges when his star player, a Nigerian, is injured.', 'U', 81.0, 58000, 'Malayalam', 'Drama'),
(31, 'Dangal', '2016-12-23', 'https://m.media-amazon.com/images/M/MV5BMTQ4MzQzMzM2Nl5BMl5BanBnXkFtZTgwMTQ1NzU3MDI@._V1_FMjpg_UX1000_.jpg', 161.00, 8.4, 'Former wrestler Mahavir Singh Phogat trains young daughters Geeta and Babita to follow in his footsteps and become world-class grapplers.', 'U', 76.0, 157000, 'Hindi', 'Biography'),
(32, '3 Idiots', '2009-12-25', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/66A9MqXOyVFCssoloscw79z8Tew.jpg', 170.00, 8.4, 'Two friends are searching for their long lost companion. They revisit their college days and recall the memories of their friend who inspired them to think differently, even as the rest of the world called them \"idiots\".', 'U', 67.0, 362000, 'Hindi', 'Comedy'),
(33, 'Gully Boy', '2019-02-14', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/h57EzPdrDvtUkvbTj6ar5yZOPic.jpg', 153.00, 8.2, 'A coming-of-age story based on the lives of street rappers in Mumbai.', 'U', 65.0, 116000, 'Hindi', 'Drama'),
(34, 'Lagaan', '2001-06-15', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ldJtjnulba43rti5R3ngnkpZq1H.jpg', 224.00, 8.1, 'The people of a small village in Victorian India stake their future on a game of cricket against their ruthless British rulers.', 'U', 84.0, 106000, 'Hindi', 'Adventure'),
(35, 'Andhadhun', '2018-10-05', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/dy3K6hNvwE05siGgiLJcEiwgpdO.jpg', 139.00, 8.3, 'A series of mysterious events change the life of a blind pianist, who must now report a crime that he should technically know nothing of.', 'U', 82.0, 94000, 'Hindi', 'Crime'),
(36, 'PK', '2014-12-19', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/z2x2Y4tncefsIU7h82gmUM5vnBJ.jpg', 153.00, 8.1, 'An alien on Earth loses the only device he can use to communicate with his spaceship. His innocent nature and child-like questions force the country to evaluate the impact of religion on its people.', 'U', 51.0, 180000, 'Hindi', 'Comedy'),
(37, 'Queen', '2014-03-07', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/vKLp0X2RQOuA31R3AdaYtDdKIPK.jpg', 146.00, 8.2, 'A Delhi girl from a traditional family sets out on a solo honeymoon after her marriage gets canceled.', 'U', 66.0, 123000, 'Hindi', 'Adventure'),
(38, 'Barfi!', '2012-09-14', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8lVuWmArvr41CvyvpgI3elD5iB1.jpg', 151.00, 8.1, 'Three young people learn that love can neither be defined nor contained by society\'s norms of normal and abnormal.', 'U', 58.0, 102000, 'Hindi', 'Adventure'),
(39, 'Taare Zameen Par', '2007-12-21', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qP8ruHtfYDlrjr1KAeZ5iVBJKE9.jpg', 165.00, 8.4, 'An eight-year-old boy is thought to be a lazy trouble-maker until the new art teacher has the patience and compassion to discover the real problem behind his struggles in school.', 'U', 77.0, 134000, 'Hindi', 'Drama'),
(40, 'Chak De! India', '2007-08-10', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/mmFMgEsTRCAGAtwffGpuo3mJsxN.jpg', 153.00, 8.2, 'Kabir Khan is the coach of the Indian Women\'s National Hockey Team and his dream is to make his all-girls team emerge victorious against all odds.', 'U', 68.0, 97000, 'Hindi', 'Drama'),
(41, 'Swades', '2004-12-17', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/oigboNMVOBzOhVUEmvJFkAqq8Br.jpg', 189.00, 8.2, 'A successful Indian scientist returns to an Indian village to take his nanny to America with him and in the process rediscovers his roots.', 'U', 69.0, 82000, 'Hindi', 'Drama'),
(42, 'Dil Chahta Hai', '2001-08-10', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/3Rwy4UjWBGEbD23xjyeBsL3OnXQ.jpg', 183.00, 8.1, 'Three inseparable childhood friends are just out of college. Nothing comes between them - until they each fall in love, and their wildly different approaches to relationships creates tension.', 'U', 75.0, 115000, 'Hindi', 'Comedy'),
(43, 'Kahaani', '2012-03-09', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/shsN1B7IPAQG1NLF6WVVi3X89lM.jpg', 122.00, 8.1, 'A pregnant woman\'s search for her missing husband takes her from London to Kolkata, but everyone she questions denies having ever met him.', 'U', 78.0, 86000, 'Hindi', 'Mystery'),
(44, 'Rang De Basanti', '2006-01-26', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ybrrlM3uwDBegwH646n2NPL7XU8.jpg', 157.00, 8.1, 'A young woman from England comes to India to make a documentary about her grandfather\'s diary, which was written in the 1920s about the Indian Independence with five young men.', 'U', 68.0, 101000, 'Hindi', 'Comedy'),
(45, 'Dev.D', '2009-02-06', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/oIVRjyhfiLehy6V5GVQJm9GsbZ9.jpg', 144.00, 8.0, 'After breaking up with his childhood sweetheart, a young man finds solace in drugs. Meanwhile, a teenage girl is caught in the world of prostitution. Will they be destroyed, or will they find redemption?', 'U', 70.0, 67000, 'Hindi', 'Drama'),
(46, 'Gangs of Wasseypur', '2012-06-22', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/oIVRjyhfiLehy6V5GVQJm9GsbZ9.jpg', 321.00, 8.2, 'A clash between Sultan and Shahid Khan leads to the expulsion of Khan from Wasseypur, and ignites a deadly blood feud spanning three generations.', 'A', 89.0, 98000, 'Hindi', 'Action'),
(47, 'Baahubali: The Beginning', '2015-07-10', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/9BAjt8nSSms62uOVYn1t3C3dVto.jpg', 159.00, 8.1, 'In ancient India, an adventurous and daring man becomes involved in a decades-old feud between two warring people.', 'U', 58.0, 83000, 'Tamil', 'Action'),
(48, 'Baahubali 2: The Conclusion', '2017-04-28', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/21sC2assImQIYCEDA84Qh9d1RsK.jpg', 167.00, 8.2, 'When Shiva, the son of Bahubali, learns about his heritage, he begins to look for answers. His story is juxtaposed with past events that unfolded in the Mahishmati Kingdom.', 'U', 59.0, 96000, 'Tamil', 'Action'),
(49, 'Vikram Vedha', '2017-07-21', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ffLYucQnjLPKAnCM7oTVwsrTlpx.jpg', 147.00, 8.6, 'Vikram, a no-nonsense police officer, accompanied by Simon, his partner, is on the hunt to capture Vedha, a smuggler and a murderer. Vedha tries to change Vikram\'s life, which leads to a conflict.', 'U', 76.0, 72000, 'Tamil', 'Action'),
(50, '96', '2018-10-04', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/dYImzEquIZglfzDnJlHYdlUIeSo.jpg', 158.00, 8.6, 'Two high school sweethearts meet at a reunion after 22 years and reminisce about their past over the course of an evening.', 'U', 79.0, 62000, 'Tamil', 'Drama'),
(51, 'Kaithi', '2019-10-25', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hOF9CgPsy9aLr5GJEBESC8MEXFy.jpg', 145.00, 8.5, 'A recently released prisoner becomes involved in a chase with criminals as he races against time to drive poisoned cops to hospitals in exchange for meeting his daughter.', 'U', 73.0, 67000, 'Tamil', 'Action'),
(52, 'Super Deluxe', '2019-03-29', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/6N346GcTUjhYa0InIiGHW61Zo3O.jpg', 176.00, 8.4, 'An unfaithful newly-wed wife, an estranged father, a priest, and an angry son suddenly find themselves in the most unexpected predicaments, each poised to experience their destiny, all on one fateful day.', 'U', 82.0, 55000, 'Tamil', 'Comedy'),
(53, 'Visaaranai', '2016-02-05', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8HbknP82NFye7GCsL8L9vyWzMUM.jpg', 117.00, 8.5, 'Four immigrants, with dreams of a better life, fall prey to human trafficking and have to fight to escape a nightmarish prison.', 'U', 80.0, 51000, 'Tamil', 'Crime'),
(54, 'Pariyerum Perumal', '2018-09-28', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8DTRzfTOfFPltARkl7AKZnYaCVv.jpg', 154.00, 8.6, 'A law student from a lower caste begins a friendship with his classmate, a girl who belongs to a higher caste, and the men in her family start giving him trouble over this.', 'U', 82.0, 47000, 'Tamil', 'Drama'),
(55, 'Asuran', '2019-10-04', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/9EUF0c13y5aigU1Mmzt4fthxrkR.jpg', 141.00, 8.5, 'The teenage son of a farmer from an underprivileged caste kills a rich, upper-caste landlord. Will the farmer, a loving father and a pacifist by heart, be able to save his hot-blooded son is the rest of the story.', 'U', 77.0, 62000, 'Tamil', 'Action'),
(56, 'Jigarthanda', '2014-08-01', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/mh6uLFD5aWbQeKvrBK2hDLN5DIu.jpg', 170.00, 8.3, 'An aspiring director targets a ruthless gangster because he wants to make a violent gangster film. His discreet attempts to research the gangster fail miserably. Finally, when he gets caught snooping, things hit the fan.', 'U', 75.0, 56000, 'Tamil', 'Action');

-- --------------------------------------------------------

--
-- Table structure for table `moviesdirectors`
--

DROP TABLE IF EXISTS `moviesdirectors`;
CREATE TABLE IF NOT EXISTS `moviesdirectors` (
  `mdid` int NOT NULL AUTO_INCREMENT,
  `moviesid` int DEFAULT NULL,
  `directorsid` int DEFAULT NULL,
  PRIMARY KEY (`mdid`),
  KEY `moviesid` (`moviesid`),
  KEY `directorsid` (`directorsid`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `moviesdirectors`
--

INSERT INTO `moviesdirectors` (`mdid`, `moviesid`, `directorsid`) VALUES
(57, 1, 1),
(58, 2, 2),
(59, 3, 3),
(60, 4, 3),
(61, 5, 4),
(62, 6, 5),
(63, 7, 6),
(64, 8, 7),
(65, 9, 3),
(66, 10, 6),
(67, 11, 8),
(68, 12, 9),
(69, 13, 9),
(70, 14, 10),
(71, 15, 10),
(72, 16, 24),
(73, 17, 25),
(74, 18, 26),
(75, 19, 27),
(76, 20, 28),
(77, 21, 25),
(78, 22, 29),
(79, 23, 30),
(80, 24, 24),
(81, 25, 31),
(82, 26, 31),
(83, 27, 28),
(84, 28, 32),
(85, 29, 33),
(86, 30, 34),
(87, 31, 11),
(88, 32, 12),
(89, 33, 35),
(90, 34, 14),
(91, 35, 36),
(92, 36, 12),
(93, 37, 37),
(94, 38, 38),
(95, 39, 39),
(96, 40, 40),
(97, 41, 41),
(98, 42, 42),
(99, 43, 43),
(100, 44, 44),
(101, 45, 23),
(102, 46, 23),
(103, 47, 36),
(104, 48, 36),
(105, 49, 37),
(106, 50, 38),
(107, 51, 39),
(108, 52, 40),
(109, 53, 41),
(110, 54, 42),
(111, 55, 41),
(112, 56, 44);

-- --------------------------------------------------------

--
-- Table structure for table `moviesstars`
--

DROP TABLE IF EXISTS `moviesstars`;
CREATE TABLE IF NOT EXISTS `moviesstars` (
  `msid` int NOT NULL AUTO_INCREMENT,
  `moviesid` int NOT NULL,
  `starsid` int NOT NULL,
  PRIMARY KEY (`msid`),
  KEY `starsid` (`starsid`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `moviesstars`
--

INSERT INTO `moviesstars` (`msid`, `moviesid`, `starsid`) VALUES
(48, 1, 1),
(49, 2, 2),
(50, 3, 3),
(51, 4, 4),
(52, 5, 5),
(53, 6, 6),
(54, 7, 7),
(55, 8, 8),
(56, 9, 9),
(57, 10, 10),
(58, 11, 11),
(59, 12, 12),
(60, 13, 13),
(61, 14, 14),
(62, 15, 15),
(63, 16, 16),
(64, 17, 17),
(65, 18, 18),
(66, 19, 19),
(67, 20, 20),
(68, 21, 21),
(69, 22, 22),
(70, 23, 23),
(71, 24, 24),
(72, 25, 25),
(73, 26, 26),
(74, 27, 27),
(75, 28, 28),
(76, 29, 29),
(77, 30, 30),
(78, 31, 31),
(79, 32, 32),
(80, 33, 33),
(81, 34, 34),
(82, 35, 35),
(83, 36, 36),
(84, 37, 37),
(85, 38, 38),
(86, 39, 39),
(87, 40, 40),
(88, 41, 41),
(89, 42, 42),
(90, 43, 43),
(91, 44, 44),
(92, 45, 45),
(93, 46, 46),
(94, 47, 47),
(95, 48, 48),
(96, 49, 49),
(97, 50, 50),
(98, 51, 51),
(99, 52, 52),
(100, 53, 53),
(101, 54, 54),
(102, 55, 55),
(103, 56, 56);

-- --------------------------------------------------------

--
-- Table structure for table `newreleases`
--

DROP TABLE IF EXISTS `newreleases`;
CREATE TABLE IF NOT EXISTS `newreleases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int NOT NULL,
  `backdrop_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `newreleases`
--

INSERT INTO `newreleases` (`id`, `mid`, `backdrop_url`) VALUES
(1, 19, 'https://xstreamcp-assets-msp.streamready.in/assets/MANORAMAMAX/MOVIE/647eada37ec03c02b0159a06/images/1920x1080_Uyare_142063_65d47aa1-d0ca-43f9-8d2a-50fe2a70be8b.jpg'),
(2, 22, 'https://wallpapercave.com/wp/wp5742699.jpg'),
(3, 24, 'https://static-ai.asianetnews.com/images/01exrt819tdznfchxhq2thd84q/whatsapp-image-2021-02-05-at-3-21-49-pm--1--jpeg_710x400xt.jpg'),
(4, 26, 'https://qph.cf2.quoracdn.net/main-qimg-171b64bda62840782a86c8fff48fc786-lq'),
(5, 33, 'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/envYqk9BomXElkyWqrnncQfzz3c.jpg'),
(6, 51, 'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/AkO8hEXTTlaMt5tvSKNHwxrE9jt.jpg'),
(7, 52, 'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/5UNyZyvnjei8XW0bG20CCxjFQMo.jpg'),
(8, 55, 'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/uKbwrwsR65azSwzCM0YMzcZArwA.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
CREATE TABLE IF NOT EXISTS `seats` (
  `seatid` int NOT NULL AUTO_INCREMENT,
  `seatno` int NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`seatid`)
) ENGINE=MyISAM AUTO_INCREMENT=290 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`seatid`, `seatno`, `price`) VALUES
(1, 1, 200),
(2, 2, 200),
(3, 3, 200),
(4, 4, 200),
(5, 5, 200),
(6, 6, 200),
(7, 7, 200),
(8, 8, 200),
(9, 9, 200),
(10, 10, 200),
(11, 11, 200),
(12, 12, 200),
(13, 13, 200),
(14, 14, 200),
(15, 15, 200),
(16, 16, 200),
(17, 17, 200),
(18, 18, 200),
(19, 19, 200),
(20, 20, 200),
(21, 21, 200),
(22, 22, 200),
(23, 23, 200),
(24, 24, 200),
(25, 25, 200),
(26, 26, 200),
(27, 27, 200),
(28, 28, 200),
(29, 29, 200),
(30, 30, 200),
(31, 31, 200),
(32, 32, 200),
(33, 33, 200),
(34, 34, 200),
(35, 35, 200),
(36, 36, 200),
(37, 37, 200),
(38, 38, 200),
(39, 39, 200),
(40, 40, 200),
(41, 41, 200),
(42, 42, 200),
(43, 43, 200),
(44, 44, 200),
(45, 45, 200),
(46, 46, 200),
(47, 47, 200),
(48, 48, 200),
(49, 49, 200),
(50, 50, 200),
(51, 51, 200),
(52, 52, 200),
(53, 53, 200),
(54, 54, 200),
(55, 55, 200),
(56, 56, 200),
(57, 57, 200),
(58, 58, 200),
(59, 59, 200),
(60, 60, 200),
(61, 61, 180),
(62, 62, 180),
(63, 63, 180),
(64, 64, 180),
(65, 65, 180),
(66, 66, 180),
(67, 67, 180),
(68, 68, 180),
(69, 69, 180),
(70, 70, 180),
(71, 71, 180),
(72, 72, 180),
(73, 73, 180),
(74, 74, 180),
(75, 75, 180),
(76, 76, 180),
(77, 77, 180),
(78, 78, 180),
(79, 79, 180),
(80, 80, 180),
(81, 81, 180),
(82, 82, 180),
(83, 83, 180),
(84, 84, 180),
(85, 85, 180),
(86, 86, 180),
(87, 87, 180),
(88, 88, 180),
(89, 89, 180),
(90, 90, 180),
(91, 91, 180),
(92, 92, 180),
(93, 93, 180),
(94, 94, 180),
(95, 95, 180),
(96, 96, 180),
(97, 97, 180),
(98, 98, 180),
(99, 99, 180),
(100, 100, 180),
(101, 101, 180),
(102, 102, 180),
(103, 103, 180),
(104, 104, 180),
(105, 105, 180),
(106, 106, 180),
(107, 107, 180),
(108, 108, 180),
(109, 109, 180),
(110, 110, 180),
(111, 111, 180),
(112, 112, 180),
(113, 113, 180),
(114, 114, 180),
(115, 115, 180),
(116, 116, 180),
(117, 117, 180),
(118, 118, 180),
(119, 119, 180),
(120, 120, 180),
(121, 121, 150),
(122, 122, 150),
(123, 123, 150),
(124, 124, 150),
(125, 125, 150),
(126, 126, 150),
(127, 127, 150),
(128, 128, 150),
(129, 129, 150),
(130, 130, 150),
(131, 131, 150),
(132, 132, 150),
(133, 133, 150),
(134, 134, 150),
(135, 135, 150),
(136, 136, 150),
(137, 137, 150),
(138, 138, 150),
(139, 139, 150),
(140, 140, 150),
(141, 141, 150),
(142, 142, 150),
(143, 143, 150),
(144, 144, 150),
(145, 145, 150),
(146, 146, 150),
(147, 147, 150),
(148, 148, 150),
(149, 149, 150),
(150, 150, 150),
(151, 151, 150),
(152, 152, 150),
(153, 153, 150),
(154, 154, 150),
(155, 155, 150),
(156, 156, 150),
(157, 157, 150),
(158, 158, 150),
(159, 159, 150),
(160, 160, 150),
(161, 161, 150),
(162, 162, 150),
(163, 163, 120),
(164, 164, 120),
(165, 165, 120),
(166, 166, 120),
(167, 167, 120),
(168, 168, 120),
(169, 169, 120),
(170, 170, 120),
(171, 171, 120),
(172, 172, 120),
(173, 173, 120),
(174, 174, 120),
(175, 175, 120),
(176, 176, 120),
(177, 177, 120),
(178, 178, 120),
(179, 179, 120),
(180, 180, 120),
(181, 181, 120),
(182, 182, 120),
(183, 183, 120),
(184, 184, 120),
(185, 185, 120),
(186, 186, 120),
(187, 187, 120),
(188, 188, 120),
(189, 189, 120),
(190, 190, 120),
(191, 191, 120),
(192, 192, 120),
(193, 193, 120),
(194, 194, 120),
(195, 195, 120),
(196, 196, 120),
(197, 197, 120),
(198, 198, 120),
(199, 199, 120),
(200, 200, 120),
(201, 201, 120),
(202, 202, 120),
(203, 203, 120),
(204, 204, 120);

-- --------------------------------------------------------

--
-- Table structure for table `stars`
--

DROP TABLE IF EXISTS `stars`;
CREATE TABLE IF NOT EXISTS `stars` (
  `starsid` int NOT NULL AUTO_INCREMENT,
  `stars_name` varchar(50) NOT NULL,
  PRIMARY KEY (`starsid`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `stars`
--

INSERT INTO `stars` (`starsid`, `stars_name`) VALUES
(1, 'Tim Robbins'),
(2, 'Marlon Brando'),
(3, 'Christian Bale'),
(4, 'Leonardo DiCaprio'),
(5, 'Tom Hanks'),
(6, 'Keanu Reeves'),
(7, 'Elijah Wood'),
(8, 'Brad Pitt'),
(9, 'Matthew McConaughey'),
(10, 'Elijah Wood'),
(11, 'Anthony Hopkins'),
(12, 'John Travolta'),
(13, 'Leonardo DiCaprio'),
(14, 'Leonardo DiCaprio'),
(15, 'Robert De Niro'),
(16, 'Mohanlal'),
(17, 'Nivin Pauly'),
(18, 'Dulquer Salmaan'),
(19, 'Parvathy Thiruvothu'),
(20, 'Fahadh Faasil'),
(21, 'Nivin Pauly'),
(22, 'Fahadh Faasil'),
(23, 'Joju George'),
(24, 'Mohanlal'),
(25, 'Chemban Vinod Jose'),
(26, 'Antony Varghese'),
(27, 'Fahadh Faasil'),
(28, 'Dulquer Salmaan'),
(29, 'Fahadh Faasil'),
(30, 'Soubin Shahir'),
(31, 'Aamir Khan'),
(32, 'Aamir Khan'),
(33, 'Ranveer Singh'),
(34, 'Aamir Khan'),
(35, 'Ayushmann Khurrana'),
(36, 'Aamir Khan'),
(37, 'Kangana Ranaut'),
(38, 'Ranbir Kapoor'),
(39, 'Aamir Khan'),
(40, 'Shah Rukh Khan'),
(41, 'Shah Rukh Khan'),
(42, 'Aamir Khan'),
(43, 'Vidya Balan'),
(44, 'Aamir Khan'),
(45, 'Abhay Deol'),
(46, 'Manoj Bajpayee'),
(47, 'Prabhas'),
(48, 'Rana Daggubati'),
(49, 'Vijay Sethupathi'),
(50, 'Trisha Krishnan'),
(51, 'Karthi'),
(52, 'Fahadh Faasil'),
(53, 'Vijay Sethupathi'),
(54, 'Kathir'),
(55, 'Dhanush'),
(56, 'Siddharth');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `emailid` varchar(30) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `password`, `emailid`) VALUES
(13, 'sreekesh1', '123', 'sreekeshkprabhu.arp@gmail.com'),
(14, 'sreekesh', '123', 'sreekeshkprabhu.arp@gmail.com'),
(15, 'Ridha', 'ridha', 'ridha@gmail.com'),
(18, '1', '1', '1@gmail.com'),
(19, '12', '13', '1'),
(20, 'sreekesh58', 'sreekesh123', 'mca2357@rajagiri.edu');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
