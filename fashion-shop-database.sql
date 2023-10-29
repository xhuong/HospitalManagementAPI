CREATE TABLE Users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nameOfUser VARCHAR(255) NOT NULL,
    userName VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    level INT NOT NULL DEFAULT 0,
    phoneNumber VARCHAR(255),
    profilePicture VARCHAR(255) DEFAULT "/default-profile-picture.png"
) ENGINE=INNODB;

CREATE TABLE Categories (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(255) NOT NULL
) ENGINE=INNODB;

CREATE TABLE Orders (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    orderDate DATETIME NOT NULL, 
    shippedDate DATETIME,
    status INT NOT NULL DEFAULT 0,
    idUser INT,
    CONSTRAINT fk_user FOREIGN KEY (idUser) REFERENCES Users(id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB;

CREATE TABLE Products (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nameOfProduct VARCHAR(255) NOT NULL,
    priceOfProduct INT NOT NULL,
    productDescription VARCHAR(255),
    countOfProduct INT NOT NULL DEFAULT 0,
    starOfProduct INT DEFAULT 0,
    productImages VARCHAR(255),
    countOfReviewer INT DEFAULT 0,
    size VARCHAR(5) NOT NULL,
    color VARCHAR(10) NOT NULL,
    idCategory INT,
    CONSTRAINT fk_category FOREIGN KEY (idCategory) REFERENCES Categories(id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB;

CREATE TABLE OrderDetails (
    idOrder INT,
    idProduct INT,
    quantityOrdered INT, -- số lượng
    unitPrice INT, -- đơn giá
    CONSTRAINT fk_order FOREIGN KEY (idOrder) REFERENCES Orders(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_product FOREIGN KEY (idProduct) REFERENCES Products(id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB;

-- insert data to Users table
INSERT INTO Users (id, nameOfUser, userName, password, address, level, phoneNumber) VALUES  
(1, "Lê Xuân Hướng", "lxhuong", "admin123", "Thuận Hoá, Tuyên Hoá, Quảng Bình", 1, "0816111308"),
(2, "Trần Đăng Bịp", "tdquocbip", "123123", "Xuân Bồ, Lệ Thuỷ, Quảng Bình", 3, "0123456789"),
(3, "Nguyễn Duy Bịp", "nguyenduybip", "123123", "Chư Sê, Gia Lai", 2, "0123456789"),
(4, "Nguyễn Hoài Bịp", "nguyenhoaibip", "123123", "Đồng Hới, Quảng Bình", 2, "0123456789");

-- insert data to Categories table
INSERT INTO Categories (categoryName) VALUES 
("Men"),
("Women"),
("Kids"),
("Speakers"),
("Accessories");

-- insert data to Products table
INSERT INTO Products (nameOfProduct ,priceOfProduct ,productDescription ,countOfProduct,starOfProduct,productImages,countOfReviewer, size, color,idCategory) VALUES 
-- insert data to Products table (men product)

("Men Printed A-line Dress 01", 500000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 46, 0, "men/men1.jpg", 0,"M", 'black', 1), 
("Men Printed A-line Dress 02", 550000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 56, 0, "men/men2.jpg", 0,"S", 'black', 1), 
("Men Printed A-line Dress 03", 280000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 15, 0, "men/men4.jpg", 0,"S", 'light blue', 1), 
("Men Printed A-line Dress 04", 325000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 32, 0, "men/men5.jpg", 0,"L", 'light blue', 1), 
("Men Printed A-line Dress 05", 430000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 30, 0, "men/men6.jpg", 0,"M", 'black', 1), 
("Men Printed A-line Dress 06", 420000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 26, 0, "men/men7.jpg", 0,"XL", 'orange', 1), 
("Men Printed A-line Dress 07", 400000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "men/men8.jpg", 0,"M", 'black', 1), 
("Men Printed A-line Dress 08", 410000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 23, 0, "men/men9.jpg", 0,"M", 'black', 1), 
("Men Printed A-line Dress 09", 230000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 24, 0, "men/men10.jpg", 0,"S", 'white', 1), 
("Men Printed A-line Dress 10", 650000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 55, 0, "men/men11.jpg", 0,"M", 'light yellow', 1), 
("Men Printed A-line Dress 11", 340000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 43, 0, "men/men12.jpg", 0,"XL", 'light blue', 1), 
("Men Printed A-line Dress 12", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "men/men13.jpg", 0,"M", 'white', 1), 
("Men Printed A-line Dress 13", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "men/men14.jpg", 0,"XL", 'white', 1), 
("Men Printed A-line Dress 14", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "men/men15.jpg", 0,"S", 'black', 1), 
("Men Printed A-line Dress 15", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "men/men16.jpg", 0,"S", 'white', 1), 
("Men Printed A-line Dress 16", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "men/men17.jpg", 0,"S", 'black', 1), 
("Men Printed A-line Dress 17", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "men/men18.jpg", 0,"S", 'brown', 1), 
("Men Printed A-line Dress 18", 900000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "men/men19.jpg", 0,"S", 'light blue', 1), 
("Men Printed A-line Dress 19", 700000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "men/men20.jpg", 0,"S", 'white', 1), 
("Men Printed A-line Dress 20", 535000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "men/men21.jpg", 0,"M", 'light orange', 1), 
("Men Printed A-line Dress 21", 375000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "men/men22.jpg", 0,"XL", 'white', 1), 
("Men Printed A-line Dress 22", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "men/men23.jpg", 0,"XL", 'light blue', 1), 
("Men Printed A-line Dress 23", 460000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "men/men24.jpg", 0,"XL", 'light blue', 1), 
("Men Printed A-line Dress 24", 365000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 34, 0, "men/men25.jpg", 0,"XL", 'white', 1), 
("Men Printed A-line Dress 25", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 65, 0, "men/men26.jpg", 0,"M", 'light blue', 1), 
("Men Printed A-line Dress 26", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 67, 0, "men/men27.jpg", 0,"S", 'dark gray', 1), 
("Men Printed A-line Dress 27", 320000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 47, 0, "men/men28.jpg", 0,"S", 'black', 1), 
("Men Printed A-line Dress 28", 315000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 47, 0, "men/men29.jpg", 0,"S", 'blue', 1), 
("Men Printed A-line Dress 29", 685000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 57, 0, "men/men30.jpg", 0,"S", 'light pink', 1), 
("Men Printed A-line Dress 30", 125000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 55, 0, "men/men31.jpg", 0,"S", 'green', 1), 
("Men Printed A-line Dress 31", 550000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 56, 0, "men/men3.jpg", 0,"S", 'white', 1), 

-- insert data to Products table (women product)
("Women Printed A-Line Dress 01", 425000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 46, 0, "women/women1.png", 0,"M", 'dark pink', 2), 
("Women Printed A-Line Dress 02", 550000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 56, 0, "women/women3.jpg", 0,"S", 'yellow', 2), 
("Women Printed A-Line Dress 03", 280000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 15, 0, "women/women4.jpg", 0,"S", 'yellow', 2), 
("Women Printed A-Line Dress 04", 325000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 32, 0, "women/women5.png", 0,"L", 'light blue', 2), 
("Women Printed A-Line Dress 05", 430000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 30, 0, "women/women6.png", 0,"M", 'light gray', 2), 
("Women Printed A-Line Dress 06", 420000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 26, 0, "women/women7.jpg", 0,"XL", 'white', 2), 
("Women Printed A-Line Dress 07", 400000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "women/women8.jpg", 0,"M", 'light gray', 2), 
("Women Printed A-Line Dress 08", 410000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 23, 0, "women/women9.png", 0,"M", 'light blue', 2), 
("Women Printed A-Line Dress 09", 230000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 24, 0, "women/women10.png", 0,"S", 'light blue', 2), 
("Women Printed A-Line Dress 10", 650000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 55, 0, "women/women11.jpg", 0,"M", 'dark green', 2), 
("Women Printed A-Line Dress 11", 340000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 43, 0, "women/women12.jpg", 0,"XL", 'blue', 2), 
("Women Printed A-Line Dress 12", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "women/women13.jpg", 0,"M", 'dark green', 2), 
("Women Printed A-Line Dress 13", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "women/women14.jpg", 0,"XL", 'light pink', 2), 
("Women Printed A-Line Dress 14", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "women/women15.jpg", 0,"S", 'white', 2), 
("Women Printed A-Line Dress 15", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "women/women16.jpg", 0,"S", 'light pink', 2), 
("Women Printed A-Line Dress 16", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "women/women17.jpg", 0,"S", 'black', 2), 
("Women Printed A-Line Dress 17", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "women/women18.jpg", 0,"S", 'white', 2), 
("Women Printed A-Line Dress 18", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "women/women19.jpg", 0,"S", 'black', 2), 
("Women Printed A-Line Dress 19", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "women/women20.jpg", 0,"S", 'white', 2), 
("Women Printed A-Line Dress 20", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "women/women21.jpg", 0,"M", 'black', 2), 
("Women Printed A-Line Dress 21", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "women/women22.jpg", 0,"XL", 'light pink', 2), 
("Women Printed A-Line Dress 22", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "women/women23.jpg", 0,"XL", 'brown', 2), 
("Women Printed A-Line Dress 23", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 45, 0, "women/women24.jpg", 0,"XL", 'black', 2), 
("Women Printed A-Line Dress 24", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 34, 0, "women/women25.jpg", 0,"XL", 'white', 2), 
("Women Printed A-Line Dress 25", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 65, 0, "women/women26.jpg", 0,"M", 'light blue', 2), 
("Women Printed A-Line Dress 26", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 67, 0, "women/women27.jpg", 0,"S", 'red', 2), 
("Women Printed A-Line Dress 27", 420000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 47, 0, "women/women28.jpg", 0,"S", 'light pink', 2), 
("Women Printed A-Line Dress 28", 325000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 47, 0, "women/women29.jpg", 0,"S", 'light blue', 2), 
("Women Printed A-Line Dress 29", 355000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 57, 0, "women/women30.jpg", 0,"S", 'gray', 2), 
("Women Printed A-Line Dress 30", 365000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 55, 0, "women/women31.jpg", 0,"S", 'black', 2), 
("Women Printed A-Line Dress 31", 375000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 54, 0, "women/women32.jpg", 0,"M", 'light brown', 2), 
("Women Printed A-Line Dress 32", 385000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 24, 0, "women/women33.jpg", 0,"M", 'light green', 2), 
("Women Printed A-Line Dress 33", 395000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 78, 0, "women/women34.jpg", 0,"M", 'gray', 2), 
("Women Printed A-Line Dress 34", 345000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 32, 0, "women/women35.jpg", 0,"M", 'light pink', 2), 
("Women Printed A-Line Dress 35", 325000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 34, 0, "women/women36.jpg", 0,"M", 'light brown', 2), 
("Women Printed A-Line Dress 36", 360000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 65, 0, "women/women37.jpg", 0,"M", 'dark green', 2), 
("Women Printed A-Line Dress 37", 370000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 56, 0, "women/women38.jpg", 0,"M", 'white', 2), 
("Women Printed A-Line Dress 38", 375000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 78, 0, "women/women39.png", 0,"M", 'light gray', 2), 
("Women Printed A-Line Dress 39", 320000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 32, 0, "women/women40.png", 0,"M", 'light brown', 2), 
("Women Printed A-Line Dress 40", 300000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 48, 0, "women/women41.jpg", 0,"M", 'blue', 2),
("Women Printed A-Line Dress 41", 550000, "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus animi iste odit eum error dicta et tempore, repellendus laboriosam facilis maxime. Porro, optio blanditiis. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tempore saepe explicabo molestiae?", 56, 0, "women/women2.png", 0,"S", 'yellow', 2); 

-- insert data to Orders table
INSERT INTO Orders (orderDate, shippedDate, status, idUser) VALUES 
("2022-10-01 10:59:59", "2022-10-05 08:03:15", "delivered", 1);

-- insert data to OrderDetails table
INSERT INTO OrderDetails (idOrder, idProduct, quantityOrdered, unitPrice) VALUES
(1, 1, 2, 500000);