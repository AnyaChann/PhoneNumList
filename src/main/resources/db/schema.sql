USE phonelist;

CREATE TABLE Phone (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    brand ENUM('Apple', 'Samsung', 'Nokia', 'Others') NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT
);