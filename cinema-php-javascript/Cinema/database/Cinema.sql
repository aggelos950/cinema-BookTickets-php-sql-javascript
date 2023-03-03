-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Εξυπηρετητής: 127.0.0.1
-- Χρόνος δημιουργίας: 13 Φεβ 2023 στις 13:55:43
-- Έκδοση διακομιστή: 10.4.27-MariaDB
-- Έκδοση PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `Cinema`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `movie`
--

CREATE TABLE `movie` (
  `movie_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `duration` varchar(30) NOT NULL,
  `production_date` int(5) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Άδειασμα δεδομένων του πίνακα `movie`
--

INSERT INTO `movie` (`movie_id`, `title`, `director`, `duration`, `production_date`, `image`) VALUES
(1, 'Avatar: The way of water', 'James Cameron', '190min', 2022, 'avatar.jpg'),
(2, 'Bullet Train', 'David Leitch', '126min', 2022, 'bullettrain.jpg'),
(3, 'Carol', 'Todd Haynes', '118min', 2016, 'carol.jpg'),
(4, 'Dont Look Up', 'Adam McKay', '138min', 2021, 'dontlookup.jpg'),
(5, 'Smile', 'Parker Finn', '116min', 2022, 'smile2.jpg'),
(6, 'Spiderman: No Way Home', 'Jon Watts','148min', 2021, 'spiderman.jpg');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `row` int(11) NOT NULL,
  `seat` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Άδειασμα δεδομένων του πίνακα `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `row`, `seat`, `movie_id`) VALUES
(1, 7, 9, 1),
(1, 7, 10, 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `screening`
--

CREATE TABLE `screening` (
  `screening_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `hour` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Άδειασμα δεδομένων του πίνακα `screening`
--

INSERT INTO `screening` (`screening_id`, `movie_id`, `date`, `hour`) VALUES
(1, 1, '2023-02-13', '21:30:00'),
(2, 1, '2023-02-19', '22:00:00'),
(3, 1, '2023-03-03', '19:00:00'),
(4, 2, '2023-03-10', '20:00:00'),
(5, 2, '2023-02-15', '18:30:00'),
(6, 2, '2023-02-20', '21:45:00'),
(7, 3, '2023-03-09', '20:00:00'),
(8, 3, '2023-03-11', '19:30:00'),
(9, 3, '2023-03-21', '18:45:00'),
(10, 4, '2023-03-07', '19:30:00'),
(11, 4, '2023-03-12', '21:30:00'),
(12, 4, '2023-03-05', '23:00:00'),
(13, 5, '2023-03-12', '23:00:00'),
(14, 5, '2023-03-29', '19:00:00'),
(15, 5, '2023-03-30', '20:30:00'),
(16, 6, '2023-04-02', '18:45:00'),
(17, 6, '2023-04-07', '23:00:00'),
(18, 6, '2023-04-10', '19:00:00');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `counrty` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `admin` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;


--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_id`);

--
-- Ευρετήρια για πίνακα `screening`
--
ALTER TABLE `screening`
  ADD PRIMARY KEY (`screening_id`);

--
-- Ευρετήρια για πίνακα `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT για πίνακα `screening`
--
ALTER TABLE `screening`
  MODIFY `screening_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT για πίνακα `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
