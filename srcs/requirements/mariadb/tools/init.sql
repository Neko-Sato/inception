CREATE USER 'wordpress'@'%' IDENTIFIED BY 'wordpress';
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';
FLUSH PRIVILEGES;
