CREATE DATABASE IF NOT EXISTS MysticHome_Creation;

USE MysticHome_Creation;

CREATE TABLE IF NOT EXISTS `Role` (
  `role_id` INT AUTO_INCREMENT,
  `role_description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`role_id`)
);


CREATE TABLE IF NOT EXISTS `Users` (
  `user_id` INT AUTO_INCREMENT,
  `role_id` INT NOT NULL,
  `user_name` VARCHAR(255) NOT NULL,
  `user_password` VARCHAR(255) NOT NULL,
  `user_email` VARCHAR(50) NOT NULL,
  `user_birthdate` DATE,
  `shipping_information` JSON,
  INDEX (`role_id`),
  PRIMARY KEY (`user_id`),
  FOREIGN KEY (`role_id`) REFERENCES `Role`(`role_id`)
);

CREATE TABLE IF NOT EXISTS `User_Image` (
  `image_id` INT AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `image_data` MEDIUMBLOB NOT NULL,
  PRIMARY KEY (`image_id`),
  FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`)
);



CREATE TABLE IF NOT EXISTS `Order_Status` (
  `status_id` INT AUTO_INCREMENT,
  `status_description` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`status_id`)
);
CREATE TABLE IF NOT EXISTS `Payment_Method` (
  `method_id` INT AUTO_INCREMENT,
  `method_description` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`method_id`)
);

CREATE TABLE IF NOT EXISTS `Voucher` (
  `voucher_id` INT AUTO_INCREMENT,
  `voucher_type` VARCHAR(20) NOT NULL,
  `voucher_min` DECIMAL,
  `voucher_max` DECIMAL,
  `voucher_amount` DECIMAL,
  `voucher_usage_per_month` INT,
  `voucher_name` VARCHAR(50) NOT NULL,
  `voucher_description` VARCHAR(255),
  `voucher_status` BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY (`voucher_id`)
);

CREATE TABLE IF NOT EXISTS `Payment` (
  `payment_id` INT AUTO_INCREMENT,
  `method_id` INT NOT NULL,
  `voucher_id` INT,
  `total_paid` DECIMAL(10,2) NOT NULL,
  `payment_info` JSON,
  INDEX (`method_id`),
  PRIMARY KEY (`payment_id`),
  FOREIGN KEY (`method_id`) REFERENCES `Payment_Method`(`method_id`),
  FOREIGN KEY (`voucher_id`) REFERENCES `Voucher`(`voucher_id`)
);


CREATE TABLE  IF NOT EXISTS `Orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `payment_id` int NOT NULL,
  `status_id` int NOT NULL,
  `shipping_information` varchar(500) DEFAULT NULL,
  `order_date` VARCHAR(255) NOT NULL,
  `pack_date` VARCHAR(255) DEFAULT NULL,
  `ship_date` VARCHAR(255) DEFAULT NULL,
  `receive_date` VARCHAR(255) DEFAULT NULL,
  `order_ref_no` varchar(255) NOT NULL,
  INDEX (`user_id`),
  INDEX (`status_id`),
  INDEX (`payment_id`),
  PRIMARY KEY (`order_id`),
  FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`) ,
  FOREIGN KEY (`status_id`) REFERENCES `Order_Status`(`status_id`),
  FOREIGN KEY (`payment_id`) REFERENCES `Payment`(`payment_id`)
) ;


CREATE TABLE IF NOT EXISTS `Product_Type` (
  `product_type_id` INT AUTO_INCREMENT,
  `product_type` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`product_type_id`)
);

 CREATE TABLE IF NOT EXISTS `Product_Image` (
   `image_id` INT AUTO_INCREMENT,
   `image_data` MEDIUMBLOB NOT NULL,
    PRIMARY KEY (`image_id`)
);

CREATE TABLE IF NOT EXISTS `Product` (
  `product_id` INT AUTO_INCREMENT,
  `product_type_id` INT NOT NULL,
  `product_title` VARCHAR(50) NOT NULL,
  `product_slug` VARCHAR(50),
  `product_desc` VARCHAR(255),
  `product_price` DECIMAL NOT NULL,
  `product_stock` INT NOT NULL DEFAULT 0,
  `product_retail_info` VARCHAR(255),
  `product_featured` INT,
  `product_variations` JSON,
  `product_created_date` DATE NOT NULL,
  `product_image_id` INT,
  INDEX (`product_type_id`),
  PRIMARY KEY (`product_id`),
  FOREIGN KEY (`product_type_id`) REFERENCES `Product_Type`(`product_type_id`),
  FOREIGN KEY (`product_image_id`) REFERENCES `Product_Image`(`image_id`)
);



CREATE TABLE IF NOT EXISTS `Permission` (
  `permission_id` INT AUTO_INCREMENT,
  `role_id` INT NOT NULL,
  `permission_url` VARCHAR(255) NOT NULL,
  `permission_description` VARCHAR(50) NOT NULL,
   INDEX (`role_id`),
  PRIMARY KEY (`permission_id`),
  FOREIGN KEY (`role_id`) REFERENCES `Role`(`role_id`)
);

CREATE TABLE IF NOT EXISTS `Product_Feedback` (
  `product_id` int NOT NULL,
  `order_id` int NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `rating` double NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `feedback_date` date NOT NULL,
  `reply_date` date DEFAULT NULL,
  PRIMARY KEY (`product_id`,`order_id`,`created_at`),
  FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`) ON DELETE CASCADE,
  FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`)
);



CREATE TABLE IF NOT EXISTS `Cart` (
  `cart_id` INT AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  INDEX (`user_id`),
  PRIMARY KEY (`cart_id`),
  FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`)
);



CREATE TABLE IF NOT EXISTS `Cart_Item` (
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `selected_variations` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`cart_id`,`product_id`,`created_at`),
  FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`),
  FOREIGN KEY (`cart_id`) REFERENCES `Cart` (`cart_id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `Bank_Type` (
  `bank_type_id` INT AUTO_INCREMENT PRIMARY KEY,
  `bank_type_description` VARCHAR(100) NOT NULL,
  `bank_type_logo_path` VARCHAR(255) -- stores path or URL to logo image
);

CREATE TABLE IF NOT EXISTS `User_Payment_Card` (
  `card_id` INT AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `bank_type_id` INT NOT NULL,
  `card_name` VARCHAR(50),
  `card_no` VARCHAR(50) NOT NULL,
  `expiry` DATE NOT NULL,
  `card_isDefault` BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY (`card_id`),
  FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`),
  FOREIGN KEY (`bank_type_id`) REFERENCES `Bank_Type`(`bank_type_id`)
);

CREATE TABLE IF NOT EXISTS `Order_Transaction` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `order_quantity` int NOT NULL,
  `ordered_product_price` double DEFAULT NULL,
  `selected_variations` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`,`created_at`),
  FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`),
  FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `Audit_Trail` (
  `id` INT AUTO_INCREMENT,
  `source` VARCHAR(50) NOT NULL,
  `description` TEXT NULL,
  `type` VARCHAR(20) NOT NULL,
  `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `Notifications` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `content` TEXT,
    `is_read` TINYINT(1) DEFAULT 1,
    `url` VARCHAR(255),
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `read_at` DATETIME,
    INDEX (`user_id`),
    PRIMARY KEY(`id`),
    FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`) ON DELETE CASCADE
);

-- For Chat Bot
CREATE TABLE IF NOT EXISTS `EmbeddedProducts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `category` VARCHAR(100) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `variations` JSON,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Chats` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `sender_id` INT NOT NULL,
    `prompt` TEXT NOT NULL,
    `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);