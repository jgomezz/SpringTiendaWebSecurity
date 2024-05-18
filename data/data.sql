INSERT INTO `roles` VALUES (1,'Administrador'),(2,'Ventas'),(3,'Almacen');
COMMIT;

INSERT INTO `usuarios` VALUES 
(1,1,'ebenites@tecsup.edu.pe','$2a$10$nz5OS/P/AziT/6VNzMzQkuplfkuckgaaP8NnnVZGzXLcj/R3Vau0C','Erick','Benites','M','1990-05-08','954658512','Av. Peru 123','1'),
(2,2,'jaraujo@tecsup.edu.pe','$2a$10$nz5OS/P/AziT/6VNzMzQkuplfkuckgaaP8NnnVZGzXLcj/R3Vau0C','Janeth','Araujo','F',NULL,NULL,NULL,'1'),
(3,3,'jflores@tecsup.edu.pe','$2a$10$nz5OS/P/AziT/6VNzMzQkuplfkuckgaaP8NnnVZGzXLcj/R3Vau0C','Jorge','Flores','M',NULL,NULL,NULL,'1'),
(4,2,'jfarfan@tecsup.edu.pe','$2a$10$nz5OS/P/AziT/6VNzMzQkuplfkuckgaaP8NnnVZGzXLcj/R3Vau0C','Jaime','Farfan','M','2019-10-09','3258545','Av. Cascanueces 2221 Santa Anita','1'),
(5,1,'erick.benites@gmail.com','$2a$10$nz5OS/P/AziT/6VNzMzQkuplfkuckgaaP8NnnVZGzXLcj/R3Vau0C','Erick','Benites','M','2019-12-02','3258545','Av. Cascanueces 2221 Santa Anita','1'),
(6,2,'lmaza@tecsup.edu.pe','$2a$10$nz5OS/P/AziT/6VNzMzQkuplfkuckgaaP8NnnVZGzXLcj/R3Vau0C','Luis','Maza','M','2019-12-10','3258545','Av. Cascanueces 2221 Santa Anita','1');
COMMIT;