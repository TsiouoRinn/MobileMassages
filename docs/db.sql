-- MySQL Script generated by MySQL Workbench
-- 06/25/17 17:12:36
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering
DROP DATABASE mobilemassages;
SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mobilemassages's user
-- -----------------------------------------------------
# GRANT ALL ON mobilemassages.* TO 'mm'@'localhost'
# IDENTIFIED BY '123456';

-- -----------------------------------------------------
-- Schema mobilemassages
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mobilemassages`
  DEFAULT CHARACTER SET utf8;
USE `mobilemassages`;

-- -----------------------------------------------------
-- Table `mobilemassages`.`todo`
-- test table
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mobilemassages`.`todo`;

CREATE TABLE todo (
  `id`      INT         NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB;
INSERT INTO todo VALUES (1, 'aaa'), (2, 'bbb'), (3, 'ccc');

-- -----------------------------------------------------
-- Table `mobilemassages`.`therapist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mobilemassages`.`therapist`;

CREATE TABLE IF NOT EXISTS `mobilemassages`.`therapist` (
  `id`           INT          NOT NULL AUTO_INCREMENT,
  `name`         VARCHAR(255) NOT NULL,
  `introduction` TEXT         NOT NULL,
  `headImage`    VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC)
)
  ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mobilemassages`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mobilemassages`.`user`;

CREATE TABLE IF NOT EXISTS `mobilemassages`.`user` (
  `id`           INT          NOT NULL AUTO_INCREMENT,
  `firstName`    VARCHAR(45)  NOT NULL,
  `lastName`     VARCHAR(45)  NOT NULL,
  `emailAddress` VARCHAR(45)  NOT NULL,
  `mobileNumber` VARCHAR(45)  NOT NULL,
  `password`     VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `emailAddress_UNIQUE` (`emailAddress` ASC)
)
  ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mobilemassages`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mobilemassages`.`address`;

CREATE TABLE IF NOT EXISTS `mobilemassages`.`address` (
  `userId`              INT         NOT NULL AUTO_INCREMENT,
  `streetAddress`       CHAR(255)   NOT NULL,
  `province`            VARCHAR(45) NOT NULL,
  `postCode`            VARCHAR(45) NOT NULL,
  `parkingInstructions` TEXT        NULL,
  `addresscol`          VARCHAR(45) NULL,
  INDEX `fk_address_user_idx` (`userId` ASC),
  PRIMARY KEY (`userId`, `streetAddress`),
  CONSTRAINT `fk_address_user`
  FOREIGN KEY (`userId`)
  REFERENCES `mobilemassages`.`user` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
)
  ENGINE = InnoDB
  KEY_BLOCK_SIZE = 2;

-- -----------------------------------------------------
-- Table `mobilemassages`.`creditCard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mobilemassages`.`creditCard`;

CREATE TABLE IF NOT EXISTS `mobilemassages`.`creditCard` (
  `userId`           INT          NOT NULL AUTO_INCREMENT,
  `nameOnCard`       VARCHAR(45)  NOT NULL,
  `creditCardNumber` VARCHAR(255) NOT NULL,
  `expirationDate`   VARCHAR(45)  NOT NULL,
  `securityCode`     VARCHAR(45)  NOT NULL,
  INDEX `fk_table1_user1_idx` (`userId` ASC),
  PRIMARY KEY (`userId`, `creditCardNumber`),
  CONSTRAINT `fk_table1_user1`
  FOREIGN KEY (`userId`)
  REFERENCES `mobilemassages`.`user` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
)
  ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mobilemassages`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mobilemassages`.`order`;

CREATE TABLE IF NOT EXISTS `mobilemassages`.`order` (
  `userId`           INT           NOT NULL,
  `therapistId`      INT           NOT NULL,
  `date`             varchar(10)   NOT NULL,
  `time`             varchar(10)   NOT NULL,
  `style`            VARCHAR(45)   NOT NULL,
  `massageLength`    VARCHAR(45)   NOT NULL,
  `address`          VARCHAR(255)  NULL,
  `creditCardNumber` VARCHAR(255)  NULL,
  `price`            DECIMAL(5, 2) NULL,
  INDEX `fk_order_user1_idx` (`userId` ASC),
  INDEX `fk_order_therapist1_idx` (`therapistId` ASC),
  PRIMARY KEY (`userId`, `therapistId`,`date`),
  CONSTRAINT `fk_order_user1`
  FOREIGN KEY (`userId`)
  REFERENCES `mobilemassages`.`user` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_therapist1`
  FOREIGN KEY (`therapistId`)
  REFERENCES `mobilemassages`.`therapist` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
)
  ENGINE = InnoDB;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;




INSERT INTO mobilemassages.user (id, firstName, lastName, emailAddress, mobileNumber, passWord) VALUES (1, 'Xu', 'Zero', '87987987@qq.com', 15398755641, 'ckVcvi+mI1Q=');
INSERT INTO mobilemassages.user (id, firstName, lastName, emailAddress, mobileNumber, passWord) VALUES (2, 'Zhou', 'Meilin', '98662952@gmail.com', 15568749635, 'ckVcvi+mI1Q=');
INSERT INTO mobilemassages.user (id, firstName, lastName, emailAddress, mobileNumber, passWord) VALUES (3, 'Kenway', 'Connor', '175644190@qq.com', 15381555478, 'ckVcvi+mI1Q=');
INSERT INTO mobilemassages.user (id, firstName, lastName, emailAddress, mobileNumber, passWord) VALUES (4, 'Er', 'Gouzi', '29841518522@qq.com', 15289635874, 'ckVcvi+mI1Q=');
INSERT INTO mobilemassages.user (id, firstName, lastName, emailAddress, mobileNumber, passWord) VALUES (5, 'Shi', 'Lezhi', '8513541111@qq.com', 15155568886, 'ckVcvi+mI1Q=');
INSERT INTO mobilemassages.user (id, firstName, lastName, emailAddress, mobileNumber, passWord) VALUES (6, 'Doma', 'Umaru', '6523443221@163.com', 15388882222, 'ckVcvi+mI1Q=');
INSERT INTO mobilemassages.user (id, firstName, lastName, emailAddress, mobileNumber, passWord) VALUES (7, 'Hoppou', 'Seiki', '65464616@qq.com', 15342656212, 'ckVcvi+mI1Q=');
INSERT INTO mobilemassages.user (id, firstName, lastName, emailAddress, mobileNumber, passWord) VALUES (8, 'Mercer', 'Alex', 'aleixy@yahoo.com', 15388652247, 'ckVcvi+mI1Q=');
INSERT INTO mobilemassages.user (id, firstName, lastName, emailAddress, mobileNumber, passWord) VALUES (9, 'Wang', 'Ada', '885262137@qq.com', 15322356543, 'ckVcvi+mI1Q=');
INSERT INTO mobilemassages.user (id, firstName, lastName, emailAddress, mobileNumber, passWord) VALUES (10, 'Chu', 'Xuan', '1326578884@qq.com', 15315832556, 'ckVcvi+mI1Q=');


INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (1, 'Rose', 'Rose immediately puts you at ease with her cheerful smile,calm approach & friendly personality. With over 3 years  of experience from Latvia where she focused on both beauty and massage treatments, she is now massaging London better with us as she loves London and always enjoyed doing massages more than beauty treatments. When you just fancy melting away from the rest of the world for a blissful, no fuss, real pampering treat from head to toe, we recommend you book a session with Rose!!');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (2, 'Susan', 'Susan has a deep passion for relaxing and rejuvenating people through her excellent massages. Her naturally warm, calm and flowing touch will unwind you into a state of bliss, or, if you wish, Susan can instead work firmer into your muscles for a more invigorating deeper session. Holistic massage is about the whole you, so enjoy her listening skills too - feel free to chat away during your session or remain totally silent if you prefer. Friendly, reliable, on time and a massage not to be missed .');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (3, 'Anne', 'Anne loves massaging because seeing people feel better and happier after her treatment makes her smile. Using her warm hands, Anne will give you an massage which is both relaxing and also as strong as you like. She can apply extra deep pressure with long flowing forearm strokes which really get into your muscles. Emese has lots of energy and can happily do a really long treatment at full throttle without tiring out. For those of you who love a strong and active yet smooth and graceful massage, Anne the therapist to try!');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (4, 'Piper', 'Hand over to Piper, a highly skilled therapist for a magnificent health treat. She combines several techniques to create a totally captivating & unique massage. Beginning with softer strokes to prepare and warm you, Piper then utilises intense deep tissue techniques to squeeze out and release toxins thus reviving your muscles. She continuously adjusts her massage to adapt to your body’s signals. To top it all off, Piper has a really lovely personality and creates a feeling of total calm from the start. Highly recommended if you want a deep and wonderful massage.');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (5, 'Carol', 'Carol has a really lovely, calm and relaxed approach which immediately makes you comfortable. Combining two of the most popular international styles into one excellent treatment, Carol’s massage is both deep and relaxing at the same time. Reliable, dedicated and polite in manner, Carol serves up a truly excellent holistic massage. Her wish is to make her clients feel better and we are confident she will achieve that with your booking! Treat yourself to a totally soothing deep tissue massage today.');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (6, 'Lisa', 'Lisa warms your body with rhythmic, gradual, presses and applies fine oils to provide you with a luxurious, deep, holistic treatment personalised for you. You will enjoy warm, focused and confident touches starting from your legs and flowing naturally onto your other muscles throughout the massage. This technique achieves an excellent all-over body massage which deeply works and relaxes each muscle group individually whilst being seamless and smooth in nature. Treat yourself to a truly excellent mobile treatment and true bliss!');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (7, 'Josie', 'Our smiling therapist Josie has loads of experience having previously worked in a Hungarian massage spa for over 4 years. Josie has a very flowing style, starting with your feet and moving upwards. Initial softer strokes are designed to warm your muscles, and then deeper massage manipulation strokes flow expertly along your body, targeting tight spots directly for additional remedial relief. This is an excellent head to toe massage which is graceful and elegant allowing you to relax but also deep, thus easing tension, reducing stress and massaging you into better health!');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (8, 'Kate', 'Confident, experienced and cmiley! Kate qualified as a medical masseur in Hungary and worked in an excellent spa there. She is highly skilled and tops that off by having a true passion for massage. From relaxing to deeper deep and passive stretching, Kate is sure to have a style that will work wonders for you. Lie back and hand over total control for the ultimate in home visit massage.');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (9, 'Chloe', 'Chloe is passionate about massage her specialist area is oil based Ayurvedic Yoga style treatments. Using a combination of oil massage techniques and yoga techniques, Chloewill balance your elements, improve circulation and release toxins. Deeply satisfying yoga and thai stretches are used to help mobilise your joints and release deep tension in your muscles. If you are brave and interested in a pure and deep massage with a real difference from the rest, this is one to try!');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (10, 'Alice', 'Highly skilled in a wide range of styles, your massage with Alice will commence with her calming nature and warming touch before progressing into deep, thorough strokes which flow expertly up and down your body. Prepare yourself for an intense feeling of tranquility and relaxation whilst also enjoying a really deep massage into each muscle group. Deep & relaxing to the extreme! Her passion for massage, nature and skills make Alice an excellent therapist.');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (11, 'Maria', 'Maria loves seeing the immediate beneficial relief that deep tissue massage can bring to her clients aches and pains. In fact it was deep tissue massage which inspired Mariato become a massage therapist in the first place! She is also a firm believer that the best massages incorporate good energy and commitment and this is clear when you receive her treatment.Massage makes Maria feel better... even though she is doing the treatment... a wonderful philosophy!');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (12, 'Sam', 'Sam’s expertise in massage shows as soon as she starts your treatment. Her style is flowing in nature, with circular movements effortlessly mixed with deeply relaxing presses. Sam gradually moves her massage along your body, tracing each muscle group precisely and thoroughly. You will feel a deep and instant relaxation in each of these areas before she moves on. Both her hands work closely together in harmony, interweaving and applying deeper pressure exactly where you need it most.');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (13, 'Lara', 'A charming and friendly personality coupled with a magnificent massage from warm Hungarian hands, Lara is sure to make your aches, pains and stresses seem like they were never even there! Melinda''s sessions start with warm relaxing, flowing, touches of a classic Swedish style massage and then progress, if you wish, into a more intensive, deeper tissue treatment, but retain the lovely flowing nature throughout. Lara qualified in Hungary and really loves massaging people better all around London!');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (14, 'Tia', 'Tia is keen to ensure you enjoy the very best treatment she can provide, so puts her heart and full energy into every massage treatment. Whether you need deep, intense massage techniques to revive and refresh your muscles or prefer a more soothing and softer touch to relax, Tia is sure to please. Tia has a friendly and very calm personality, thus creating the perfect atmosphere for you to enjoy your massage. An excellent and very reliable therapist providing wonderful treatments!');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (15, 'Sarah', 'Warm hands and a caring personality, Sarah offers an excellent deep relaxation massage combining high-end classic and deep tissue techniques with long, flowing relaxation strokes. Sarah trained at a premium Hungarian spa and qualified as a medical masseuse before bringing her amazing massage to you in London. Her lovely calm personality and enthusiasm to be reliable and organised makes her stress-busting massage all that much better.');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (16, 'Penelope', 'Take a deep breath, close your eyes, let Penelepo take complete control from her first touch. Lara is one of our most experienced therapists with a wide range of styles. From soft massages which send you to sleep, to intense deep tissue massages which revive you. Penelope is also happy to combine several techniques into one session. A happy, calm and friendly Hungarian personality with bags of skill, Lara has a magical ability to take you to Massage Heaven. You are in for a treat!');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (17, 'Molly', 'After repeatedly hearing how wonderful her massage was from friends and family in Budapest, Molly moved to London and has started as a mobile massage therapist! She offers you a truly brilliant oil-based massage, working deeper into tight muscles whenever needed. Her passion for massage, calm personality and attentive caring nature ensure you will feel comfortable throughout your treatment and make her an excellent therapist. In her spare time, Piroska enjoys travelling, hiking and sports.');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (18, 'Clara', 'If you are looking for a really strong full-body massage, which is warm, slow and expertly delivered, then Clarais the therapist for you! Clara, who has over 5 years of experience, progresses calmly across the contours of your body, in skillful flowing strokes. Both hands work each muscle group thoroughly and slowly, applying pressure point techniques in any tight spots. A super relaxation or rejuvenation massage from an excellent and reliable therapist. Total body relaxation expertly delivered.');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (19, 'Kylie', 'When we asked Kylie what she would have done if she had not become a masseuse she replied ''Nothing else! I love massage!''. And it shows. A dedicated, experienced massage therapist who knows what she is doing and does it with real skill, style and understanding. Confident, calm and caring Bernadett is able to massage you from strong and deep to soft and relaxing. In over four years of mobile massage therapy,.');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (20, 'Lauren', 'Lauren believes no two people are the same and so a really good massage comes from feeling and reacting to the different requirements of each person and their various muscles. She has a very warm and engaging personality with a deep passion for massage. Being physiotherapy trained and with extensive experience of working in a military hospital, Lauren is very comfortable doing a really deep massage working right into your problematic areas, or if you prefer, she can of course do a softer relaxation massage melting away mental stresses.');
INSERT INTO mobilemassages.therapist (id, name, introduction) VALUES (21, 'Either Therapist', 'Lauren believes no two people are the same and so a really good massage comes from feeling and reacting to the different requirements of each person and their various muscles. She has a very warm and engaging personality with a deep passion for massage. Being physiotherapy trained and with extensive experience of working in a military hospital, Lauren is very comfortable doing a really deep massage working right into your problematic areas, or if you prefer, she can of course do a softer relaxation massage melting away mental stresses.');


INSERT INTO mobilemassages.creditcard (userId, nameOnCard, creditCardNumber, expirationDate, securityCode) VALUES (1, 'Zero.Xu', 33546585416, '97.2.28', 123);
INSERT INTO mobilemassages.creditcard (userId, nameOnCard, creditCardNumber, expirationDate, securityCode) VALUES (2, 'ZhouMeilin', 35981655452, '03.8.28', 123);
INSERT INTO mobilemassages.creditcard (userId, nameOnCard, creditCardNumber, expirationDate, securityCode) VALUES (3, 'Connor.Kenway', 33568465495, '17.2.16', 123);
INSERT INTO mobilemassages.creditcard (userId, nameOnCard, creditCardNumber, expirationDate, securityCode) VALUES (4, 'ErGouzi', 3687985452, '02.9.18', 123);
INSERT INTO mobilemassages.creditcard (userId, nameOnCard, creditCardNumber, expirationDate, securityCode) VALUES (5, 'ShiLezhi', 3158865664, '01.3.08', 123);
INSERT INTO mobilemassages.creditcard (userId, nameOnCard, creditCardNumber, expirationDate, securityCode) VALUES (6, 'DomaUmaru', 384585665, '05.1.14', 123);
INSERT INTO mobilemassages.creditcard (userId, nameOnCard, creditCardNumber, expirationDate, securityCode) VALUES (7, 'HoppouSeiki', 45552156121, '97.2.12', 123);
INSERT INTO mobilemassages.creditcard (userId, nameOnCard, creditCardNumber, expirationDate, securityCode) VALUES (8, 'Alex.Mercer', 1684451, '91.3.21', 123);
INSERT INTO mobilemassages.creditcard (userId, nameOnCard, creditCardNumber, expirationDate, securityCode) VALUES (9, 'Ada.Wang', 1564584, '02.2.20', 123);
INSERT INTO mobilemassages.creditcard (userId, nameOnCard, creditCardNumber, expirationDate, securityCode) VALUES (10, 'ChuXuan', 38451451566, '96.9.02', 123);


INSERT INTO mobilemassages.address (userId, streetAddress, province, postCode, parkingInstructions) VALUES (1, '112C Shining Street', 'M78 Nebula', 'X3564', NULL);
INSERT INTO mobilemassages.address (userId, streetAddress, province, postCode, parkingInstructions) VALUES (2, '221B Baker Street', 'London', 15343, NULL);
INSERT INTO mobilemassages.address (userId, streetAddress, province, postCode, parkingInstructions) VALUES (3, 'VDNH', 'Moscow Metro', 49850, NULL);
INSERT INTO mobilemassages.address (userId, streetAddress, province, postCode, parkingInstructions) VALUES (4, 'Living Room in Talos', 'Unknown', 111111, NULL);
INSERT INTO mobilemassages.address (userId, streetAddress, province, postCode, parkingInstructions) VALUES (5, 'No 10 Downing Street', 'London', 99855, NULL);
INSERT INTO mobilemassages.address (userId, streetAddress, province, postCode, parkingInstructions) VALUES (6, '1-2-1101 Fengqing Street', 'Zhejiang', 33150, NULL);
INSERT INTO mobilemassages.address (userId, streetAddress, province, postCode, parkingInstructions) VALUES (7, '2-2-103 Dafu Street', 'Hunan', 33564, NULL);
INSERT INTO mobilemassages.address (userId, streetAddress, province, postCode, parkingInstructions) VALUES (8, '96A Augustus Street', 'Octavius', 88524, NULL);
INSERT INTO mobilemassages.address (userId, streetAddress, province, postCode, parkingInstructions) VALUES (9, '331C Gaius Street', 'Julius', 963422, NULL);
INSERT INTO mobilemassages.address (userId, streetAddress, province, postCode, parkingInstructions) VALUES (10, '153C Licinius Street', 'Crassus', 33221, NULL);
