CREATE TABLE `user`(
    `id_user` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `id_role` INT NOT NULL
);
CREATE TABLE `role`(
    `id_role` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `role_name` VARCHAR(255) NOT NULL
);
CREATE TABLE `ct_user`(
    `id_user` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `surname` VARCHAR(255) NOT NULL,
    `lastname` VARCHAR(255) NOT NULL,
    `gender` VARCHAR(255) NOT NULL,
    `phone_num` INT NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `date_of_birth` DATE NOT NULL,
    `address` VARCHAR(255) NOT NULL
);
CREATE TABLE `product`(
    `id_product` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_name` VARCHAR(255) NOT NULL,
    `img` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `in_price` DECIMAL(8, 2) NOT NULL,
    `out_price` DECIMAL(8, 2) NOT NULL,
    `quantity` INT NOT NULL,
    `selled_quantity` INT NOT NULL,
    `created_date` DATE NOT NULL,
    `id_category` BIGINT NOT NULL,
    `size` VARCHAR(255) NOT NULL,
    `color` VARCHAR(255) NOT NULL
);
CREATE TABLE `shopping_cart`(
    `id_cart` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_user` BIGINT NOT NULL,
    `quantity` INT NOT NULL,
    `total_price` DECIMAL(8, 2) NOT NULL
);
CREATE TABLE `vouchers`(
    `id_voucher` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code` VARCHAR(255) NOT NULL,
    `discount_value` DECIMAL(8, 2) NOT NULL,
    `condition` DECIMAL(8, 2) NOT NULL,
    `started_date` DATE NOT NULL,
    `ended_date` DATE NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `category`(
    `id_category` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category_name` VARCHAR(255) NOT NULL
);
CREATE TABLE `ct_cart`(
    `id_ct` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_cart` BIGINT NOT NULL,
    `id_product` BIGINT NOT NULL
);
CREATE TABLE `order`(
    `id_order` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_user` BIGINT NOT NULL,
    `other_dated` DATETIME NOT NULL,
    `id_voucher` BIGINT NOT NULL,
    `total_price` DECIMAL(8, 2) NOT NULL,
    `id_address` BIGINT NOT NULL,
    `note` VARCHAR(255) NOT NULL,
    `pay_method` TINYINT NOT NULL,
    `status` VARCHAR(255) NOT NULL
);
CREATE TABLE `order_items`(
    `id_items` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_order` BIGINT NOT NULL,
    `id_product` BIGINT NOT NULL,
    `quantity` INT NOT NULL,
    `price` DECIMAL(8, 2) NOT NULL
);
CREATE TABLE `order_status`(
    `id_status` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_order` BIGINT NOT NULL,
    `new_status` VARCHAR(255) NOT NULL,
    `update_at` DATETIME NOT NULL
);
CREATE TABLE `address`(
    `id_address` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `phone_num` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL
);
CREATE TABLE `banners`(
    `id_banner` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `img` VARCHAR(255) NOT NULL
);
CREATE TABLE `revenue`(
    `id_revenue` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `revenue_date` DATE NOT NULL,
    `total_revenue` DECIMAL(8, 2) NOT NULL
);
CREATE TABLE `order_history`(
    `id_history` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_user` BIGINT NOT NULL,
    `id_order` BIGINT NOT NULL,
    `id_product` BIGINT NOT NULL,
    `quantity_history` BIGINT NOT NULL,
    `order_date` DATETIME NOT NULL
);
ALTER TABLE
    `ct_cart` ADD CONSTRAINT `ct_cart_id_product_foreign` FOREIGN KEY(`id_product`) REFERENCES `product`(`id_product`);
ALTER TABLE
    `order` ADD CONSTRAINT `order_id_voucher_foreign` FOREIGN KEY(`id_voucher`) REFERENCES `vouchers`(`id_voucher`);
ALTER TABLE
    `user` ADD CONSTRAINT `user_id_role_foreign` FOREIGN KEY(`id_role`) REFERENCES `role`(`id_role`);
ALTER TABLE
    `ct_user` ADD CONSTRAINT `ct_user_id_user_foreign` FOREIGN KEY(`id_user`) REFERENCES `user`(`id_user`);
ALTER TABLE
    `order_items` ADD CONSTRAINT `order_items_id_order_foreign` FOREIGN KEY(`id_order`) REFERENCES `order`(`id_order`);
ALTER TABLE
    `shopping_cart` ADD CONSTRAINT `shopping_cart_id_user_foreign` FOREIGN KEY(`id_user`) REFERENCES `user`(`id_user`);
ALTER TABLE
    `order_history` ADD CONSTRAINT `order_history_id_product_foreign` FOREIGN KEY(`id_product`) REFERENCES `product`(`id_product`);
ALTER TABLE
    `order_history` ADD CONSTRAINT `order_history_id_order_foreign` FOREIGN KEY(`id_order`) REFERENCES `order`(`id_order`);
ALTER TABLE
    `ct_cart` ADD CONSTRAINT `ct_cart_id_cart_foreign` FOREIGN KEY(`id_cart`) REFERENCES `shopping_cart`(`id_cart`);
ALTER TABLE
    `order_status` ADD CONSTRAINT `order_status_id_order_foreign` FOREIGN KEY(`id_order`) REFERENCES `order`(`id_order`);
ALTER TABLE
    `order` ADD CONSTRAINT `order_id_address_foreign` FOREIGN KEY(`id_address`) REFERENCES `address`(`id_address`);
ALTER TABLE
    `order_items` ADD CONSTRAINT `order_items_id_product_foreign` FOREIGN KEY(`id_product`) REFERENCES `product`(`id_product`);
ALTER TABLE
    `product` ADD CONSTRAINT `product_id_category_foreign` FOREIGN KEY(`id_category`) REFERENCES `category`(`id_category`);
ALTER TABLE
    `order_history` ADD CONSTRAINT `order_history_id_user_foreign` FOREIGN KEY(`id_user`) REFERENCES `user`(`id_user`);
ALTER TABLE
    `order` ADD CONSTRAINT `order_id_order_foreign` FOREIGN KEY(`id_order`) REFERENCES `user`(`id_user`);