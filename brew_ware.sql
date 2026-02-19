-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2026 at 10:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brew_ware`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `item_price` int(11) DEFAULT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `session_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `item_name`, `price`, `item_price`, `added_at`, `session_id`) VALUES
(9, 'Peri-Peri Fries', 199, NULL, '2026-01-23 19:44:44', '30B5C39435FDF9F2D607DEA3D54D3B41'),
(10, 'Hand-Cut Gourmet Fries', 179, NULL, '2026-01-23 19:44:59', '30B5C39435FDF9F2D607DEA3D54D3B41');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `name`, `price`, `category`, `image_path`) VALUES
(21, 'Artisan Veg Pizza', 349, 'Mains', 'category-images/artisan.jpg'),
(22, 'Truffle Mushroom Pizza', 399, 'Mains', 'category-images/truffle-pizza.jpg'),
(23, 'Gourmet Smoky Veg Burger', 299, 'Mains', 'category-images/smoky-burger.jpg'),
(24, 'Mushroom Swiss Brioche Burger', 329, 'Mains', 'category-images/mushroom-burger.jpg'),
(25, 'Truffle Mushroom & Swiss Panini', 279, 'Mains', 'category-images/swiss-panini.jpg'),
(26, 'Roasted Veg & Pesto Ciabatta', 269, 'Mains', 'category-images/pesto-ciabatta.jpg'),
(27, 'Soft Shell Veg Tacos', 249, 'Mains', 'category-images/shell-taco.jpg'),
(28, 'Creamy Alfredo Pasta', 319, 'Mains', 'category-images/creamy-pasta.jpg'),
(29, 'Grilled Chicken Alfredo Pasta', 399, 'Mains', 'category-images/chicken-pasta.jpg'),
(30, 'BBQ Chicken Gourmet Burger', 359, 'Mains', 'category-images/bbq-burger.jpg'),
(32, 'Hand-Cut Gourmet Fries', 179, 'Snacks', 'category-images/hand-cut-fries.jpg'),
(33, 'Peri-Peri Fries', 199, 'Snacks', 'category-images/peri-peri-fries.jpg'),
(34, 'Truffle Parmesan Fries', 249, 'Snacks', 'category-images/truffle-fries.jpg'),
(35, 'Loaded Cheese Nachos', 279, 'Snacks', 'category-images/cheese-nachos.jpg'),
(36, 'Mozzarella Sticks', 259, 'Snacks', 'category-images/Mozzarella-sticks.jpg'),
(37, 'Herb-Crusted Potato Croquettes', 229, 'Snacks', 'category-images/herb-potato.jpg'),
(38, 'Crispy Corn with Chili Butter', 219, 'Snacks', 'category-images/crispy-corn.jpg'),
(39, 'Chicken Popcorn', 299, 'Snacks', 'category-images/chicken-popcorn.jpg'),
(40, 'Classic Bruschetta', 219, 'Bakes', 'category-images/bruschetta.jpg'),
(41, 'Wild Mushroom & Thyme Toast', 249, 'Bakes', 'category-images/thyme.jpg'),
(42, 'Avocado & Feta Artisan Toast', 269, 'Bakes', 'category-images/feta-toast.jpg'),
(43, 'Garlic Butter Breadsticks', 199, 'Bakes', 'category-images/garlic-butter.jpg'),
(44, 'Herb Roasted Focaccia', 229, 'Bakes', 'category-images/roasted-focaccia.jpg'),
(45, 'Classic New York Cheesecake', 299, 'Desserts', 'category-images/cheesecake.jpg'),
(46, 'Chocolate Truffle Cake', 279, 'Desserts', 'category-images/chocolate-cake.jpg'),
(47, 'Tiramisu Cups', 319, 'Desserts', 'category-images/tiramisu.jpg'),
(48, 'Red Velvet Slice', 269, 'Desserts', 'category-images/red-velvet.jpg'),
(49, 'Chocolate Lava Cake', 249, 'Desserts', 'category-images/lava-cake.jpg'),
(50, 'Pineapple Pudding Cake', 199, 'Desserts', 'category-images/pineaple.jpg'),
(51, 'Fudgy Chocolate Brownie', 179, 'Cookies', 'category-images/chocolate-brownie.jpg'),
(52, 'Walnut Chocolate Brownie', 199, 'Cookies', 'category-images/walnut-brownie.jpg'),
(53, 'Double Chocolate Chip Cookie', 129, 'Cookies', 'category-images/chip-cookie.jpg'),
(54, 'Oatmeal Raisin Cookie', 119, 'Cookies', 'category-images/oatmeal-cookie.jpg'),
(55, 'Butter Shortbread Cookies', 139, 'Cookies', 'category-images/butter-cookie.jpg'),
(56, 'Espresso', 129, 'Coffee', 'category-images/espresso.jpg'),
(57, 'Americano', 149, 'Coffee', 'category-images/americano.jpg'),
(58, 'Cappuccino', 169, 'Coffee', 'category-images/cappuccino.jpg'),
(59, 'Café Latte', 179, 'Coffee', 'category-images/cafe-latte.jpg'),
(60, 'Mocha', 199, 'Coffee', 'category-images/mocha.jpg'),
(61, 'Caramel Macchiato', 219, 'Coffee', 'category-images/caramel.jpg'),
(62, 'Cold Coffee', 199, 'Beverages', 'category-images/cold-coffee.jpg'),
(63, 'Iced Latte', 219, 'Beverages', 'category-images/iced-latte.jpg'),
(64, 'Classic Milkshake Chocolate', 229, 'Beverages', 'category-images/chocolate-milkshake.jpg'),
(65, 'Vanilla Milkshake', 209, 'Beverages', 'category-images/vanilla-milkshake.jpg'),
(66, 'Strawberry Milkshakes', 239, 'Beverages', 'category-images/Strawberry-Milkshake.jpg'),
(67, 'Fresh Lime Soda', 149, 'Beverages', 'category-images/lime-soda.jpg'),
(68, 'Hot Chocolate', 199, 'Beverages', 'category-images/hot-chocolate.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `ordered_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `item_name`, `price`, `session_id`, `ordered_at`) VALUES
(1, 'Artisan Veg Pizza', 349, '85C8EB0271C83BC54CB0E934C9799E99', '2026-01-21 16:45:54'),
(2, 'Truffle Mushroom Pizza', 399, '85C8EB0271C83BC54CB0E934C9799E99', '2026-01-21 16:45:54'),
(3, 'Classic Bruschetta', 219, '85C8EB0271C83BC54CB0E934C9799E99', '2026-01-21 16:45:54'),
(4, 'Truffle Mushroom Pizza', 399, '85C8EB0271C83BC54CB0E934C9799E99', '2026-01-21 16:51:26'),
(5, 'Truffle Mushroom Pizza', 399, '85C8EB0271C83BC54CB0E934C9799E99', '2026-01-21 16:52:11'),
(6, 'Truffle Mushroom Pizza', 399, '85C8EB0271C83BC54CB0E934C9799E99', '2026-01-21 17:03:08'),
(7, 'Artisan Veg Pizza', 349, '30B5C39435FDF9F2D607DEA3D54D3B41', '2026-01-23 19:43:46'),
(8, 'Truffle Mushroom Pizza', 399, '30B5C39435FDF9F2D607DEA3D54D3B41', '2026-01-23 19:44:28'),
(9, 'Peri-Peri Fries', 199, '5ACF30E086C9D123C8405ACCDF8FCF2B', '2026-01-29 06:41:12'),
(10, 'Creamy Alfredo Pasta', 319, 'D2D8B5FC6E578325CB2B41A94837187C', '2026-02-15 16:24:24'),
(11, 'Truffle Mushroom Pizza', 399, 'D2D8B5FC6E578325CB2B41A94837187C', '2026-02-15 16:24:40'),
(12, 'CafÃ© Latte', 179, 'C80ED5C316C83E5168DEAF7568EC4C72', '2026-02-16 04:11:52'),
(13, 'Tiramisu Cups', 319, 'A7FEF959CFC3F37E47FF5EBA97A89FEF', '2026-02-16 20:15:07'),
(14, 'Herb Roasted Focaccia', 229, 'A7FEF959CFC3F37E47FF5EBA97A89FEF', '2026-02-16 20:15:07'),
(16, 'Herb-Crusted Potato Croquettes', 229, 'A7FEF959CFC3F37E47FF5EBA97A89FEF', '2026-02-16 20:24:24'),
(17, 'Butter Shortbread Cookies', 139, 'A7FEF959CFC3F37E47FF5EBA97A89FEF', '2026-02-16 20:24:24'),
(18, 'Espresso', 129, 'A7FEF959CFC3F37E47FF5EBA97A89FEF', '2026-02-16 20:24:24'),
(19, 'Peri-Peri Fries', 199, 'BD9970E02D42726C56DB33A67AB44706', '2026-02-16 22:07:16'),
(20, 'Classic Bruschetta', 219, '9B25BDF6F04321D7D42F1B3498D2BB65', '2026-02-17 06:43:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `age`, `password`) VALUES
(1, 'abc', 'abc@gmail.com', 20, '123'),
(2, 'rita', 'rita@gmail.com', 19, '123'),
(3, 'manya', 'manya@mail.com', 21, 'manya21'),
(4, 'riya', 'riya@gmail.com', 17, '145'),
(6, 'sona', 'sona@gmail.com', 22, '1234'),
(7, 'mena', 'mena11@gmail.com', 32, 'mena32'),
(8, 'rahul', 'rahul12@gmail.com', 23, 'rahul23'),
(9, 'preeta', 'preeta@gmail.com', 34, 'preeta34'),
(10, 'simran', 'simran13@gmail.com', 34, 'simra'),
(11, 'samiksha', 'samiksha1234@gmail.com', 20, '1234'),
(13, 'tina', 'tina1234@gmail.com', 20, '1234'),
(14, 'aaru', 'aaru1234@gmail.com', 14, 'aaru12'),
(15, 'nitya', 'nitya1234@gmail.com', 17, 'nitya12'),
(16, 'JUnit_User_1', 'junit1@example.com', 25, 'password123'),
(20, 'jiya', 'jiya1234@gmail.com', 15, 'jiya15'),
(21, 'priya', 'priya1234@gmail.com', 32, 'priya32'),
(23, 'riya', 'riya1234@gmail.com', 18, 'riya12'),
(24, 'manas', 'manas@gmail.com', 23, 'manas23'),
(25, 'preet', 'preet@gmail.com', 21, 'preet21'),
(26, 'preet', 'preet123@gmail.com', 21, 'pret21'),
(31, 'maya', 'maya1234@gmail.com', 21, 'maya21'),
(81, 'anika', 'anika1234@gmail.com', 21, 'anika21'),
(181, 'rutvik', 'rutvik@gmail.com', 24, 'rutvik'),
(182, 'radhika', 'radika1234@gmail.com', 22, 'radhika12'),
(183, 'rutika', 'rutika1234@gmail.com', 18, 'rutika12'),
(184, 'madhuri', 'madhuri123@gmil.om', 21, 'madhuri');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
