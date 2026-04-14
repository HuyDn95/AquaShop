-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: aquashop_db
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `image_url` varchar(255) DEFAULT NULL,
  `description` longtext,
  `stock` int DEFAULT '0',
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Cá Lóc Hoàng Đế',2500000,'https://cacanhthaihoa.com/wp-content/uploads/2022/12/ca-loc-hoang-de-2.jpg','Dòng cá săn mồi đẳng cấp nhất thế giới thủy sinh. Nhiệt độ lý tưởng từ 22-28°C, độ pH 6.0-7.0. Cá có kích thước trưởng thành lên đến 60-80cm, cần hồ nuôi rộng tối thiểu 1m2 với nắp đậy chắc chắn. Màu sắc vàng rực kết hợp hoa văn đen tạo nên vẻ uy nghi, cực kỳ thông minh.',5,1),(2,'Cá Neon Vua',25000,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOJbssXNHuklY3nk3eujA_5qaxq_d0_ADnUA&s','Kích thước lớn (3-5cm) với dải màu đỏ kéo dài toàn thân. Sống tốt ở nhiệt độ 24-27°C, pH 5.0-7.0. Nên nuôi theo đàn từ 20 con trở lên trong hồ có nhiều cây thủy sinh để cá phát huy màu sắc rực rỡ nhất.',200,1),(3,'Cá Chuột Cà Phê Vây Dài',65000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/403/653/products/4d986242-f505-4763-94a8-4ce4608714fe.jpg','Chuyên gia dọn bể tầng đáy với bộ vây dài thướt tha. Nhiệt độ 22-26°C. Cá rất hiền lành, giúp dọn sạch thức ăn thừa và làm tơi xốp lớp phân nền, phù hợp cho hồ cộng đồng.',30,1),(4,'Cá Cầu Vồng Thạch Mỹ Nhân',80000,'https://mayaqua.vn/wp-content/uploads/2021/12/THACH-MY-NHAN-DO.jpg','Màu sắc lấp lánh như ngọc trai, thay đổi theo góc nhìn của ánh đèn. Kích thước 8-10cm, nhiệt độ 24-28°C, pH 7.0-8.0. Cá bơi rất khỏe, cần không gian mở để bơi lội tự do.',40,1),(5,'Cá Cầu Vồng Kurumoi',120000,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYIF8z_CxPas0frBFyr3I73zKjV7PqalE6Tw&s','Dòng cầu vồng quý hiếm với tông màu đỏ thẫm sang trọng. Nhiệt độ 25-28°C. Cá cần chế độ dinh dưỡng đa dạng và nước sạch để duy trì sắc tố đỏ đặc trưng trên vây.',15,1),(6,'Rêu Mini Fiss (Vỉ)',60000,'https://thuysinhxanh.vn/wp-content/uploads/2021/03/minifiss-la-nuoc-3.jpg','Loại rêu bám đá tạo thành các thảm xanh mướt tự nhiên. Cần ánh sáng mạnh và CO2 để phát triển tốt nhất. Nhiệt độ mát mẻ dưới 26°C giúp lá rêu luôn xanh mướt và không bị đen.',50,2),(7,'Dương Xỉ Mỹ Nhân',150000,'https://bizweb.dktcdn.net/thumb/1024x1024/100/519/158/products/duong-xi-my-nhan.jpg?v=1718294625277','Lá dài, mỏng và thanh thoát. Dòng dương xỉ này phát triển chậm, không cần nhiều ánh sáng nhưng cần nước mát và dòng chảy ổn định. Thường được gắn trên lũa để tạo vẻ hoang sơ.',20,2),(8,'Thạch Xương Bồ',120000,'https://aquariumcare.vn/upload/sanpham/cay-thach-xuong-bo.jpg','Loại cây bán cạn bền bỉ, có thể trồng ngập nước hoàn toàn. Kích thước lá nhỏ, mọc thành bụi. Rất phù hợp cho hồ phong cách biotope hoặc hồ suối chảy mạnh.',15,2),(9,'Ráy Nana Petits',95000,'https://aquariumcare.vn/upload/user/images/14(5).jpg','Dòng ráy lá nhỏ nhất, cực kỳ sang trọng. Cây rất dễ trồng, không cần CO2 quá nhiều. Nhiệt độ 22-28°C. Điểm đặc biệt là bộ rễ bám rất chắc vào giá thể đá hoặc gỗ.',40,2),(10,'Bucep Ghost 2011',350000,'https://aquariumcare.vn/upload/user/images/C%C3%A2y%20Th%E1%BB%A7y%20Sinh%20Bucep%20Ghost%20%202.jpg','Nữ hoàng thủy sinh với lá màu tím lịm và phấn ánh kim. Cần môi trường nước mát (dưới 26°C), dòng chảy mạnh và CO2 dồi dào để cây lên màu đẹp nhất.',10,2),(11,'Lọc Thùng HW-3000',1850000,'https://koithienduong.com/wp-content/uploads/2021/05/tong-hop-nhung-thong-tin-ve-loc-hw-3000.jpg','Lọc thùng thông minh tích hợp đèn UV diệt khuẩn và bộ điều chỉnh lưu lượng 6 cấp độ. Công suất mạnh mẽ cho hồ từ 100-150cm. Vận hành cực êm và tiết kiệm điện.',8,3),(12,'Lọc Treo XBL-600',320000,'https://down-vn.img.susercontent.com/file/a67ce96ebd655917b42cb1c2f51a5c43','Thiết kế treo thành hồ sang trọng, lọc váng tích hợp xoay 360 độ. Thích hợp cho hồ mini từ 40-60cm, giúp mặt nước luôn trong trẻo và giàu oxy.',25,3),(13,'Đèn Chihiros WRGB 2 90cm',4200000,'https://thuysinhquoidecor.com/wp-content/uploads/2021/04/Chihiros-Wrgb-2-B-C-n-LED-Phi-n-B-n-N-ng-C-p-nh.jpg','Phiên bản kỷ niệm 10 năm, tích hợp App điều chỉnh màu sắc. Giả lập ánh sáng mặt trời tự nhiên giúp cây lên màu đỏ rực và phát triển căng tràn nhựa sống.',3,3),(14,'In Out Inox Váng Xoay',450000,'https://thuysinhquoidecor.com/wp-content/uploads/2023/08/in-out-week-1.jpg','Chất liệu inox 304 không gỉ bóng loáng. Đầu hút váng xoay tự động theo mực nước hồ. Giúp hệ thống lọc trông chuyên nghiệp và thẩm mỹ hơn rất nhiều.',15,3);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-14 15:03:01
