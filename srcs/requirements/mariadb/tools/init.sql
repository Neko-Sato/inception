ALTER USER 'root'@'localhost' IDENTIFIED BY '350350';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host!='localhost';
DROP DATABASE IF EXISTS test;
CREATE USER 'wordpress'@'%' IDENTIFIED BY 'wordpress';
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';
FLUSH PRIVILEGES;