CREATE DATABASE IF NOT EXISTS MONGEUL;

USE MONGEUL;

CREATE TABLE IF NOT EXISTS `User` (
                                      `user_id`	INT	NOT NULL auto_increment,
                                      `name`	VARCHAR(255)	NULL,
                                      `email`	VARCHAR(255)	NULL,
                                      PRIMARY KEY (`user_id`)
);

-- User 테이블 더미 데이터
INSERT INTO `User` (`name`, `email`) VALUES
                                         ('John Doe', 'john@example.com'),
                                         ('Jane Smith', 'jane@example.com');

CREATE TABLE IF NOT EXISTS `baby` (
                                      `baby_id`	INT	NOT NULL auto_increment,
                                      `user_id`	INT	NOT NULL,
                                      `baby_name`	VARCHAR(255)	NULL,
                                      `baby_birthday`	DATETIME	NULL,
                                      PRIMARY KEY (`baby_id`),
                                      FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
);


CREATE TABLE IF NOT EXISTS `Calendar_Photo` (
                                                `calendar_photo_id`    INT    NOT NULL auto_increment,
                                                `user_id`    INT   NULL,
                                                `baby_id`    int   NULL,
                                                `file_path`    VARCHAR(255)    NULL,
                                                `taken_at`    VARCHAR(5)    NULL,
                                                PRIMARY KEY (`calendar_photo_id`),
                                                FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
                                                FOREIGN KEY (`baby_id`) REFERENCES `baby` (`baby_id`)
);



CREATE TABLE IF NOT EXISTS `Calendar` (
                                          `calendar_id`    INT    NOT NULL auto_increment,
                                          `user_id`    INT NULL,
                                          `calendar_photo_id`    INT    NULL,
                                          `baby_id`    int NULL,
                                          `title`    VARCHAR(255)    NULL,
                                          `description`    TEXT    NULL,
                                          `date`    VARCHAR(5)    NULL,
                                          `location`    VARCHAR(255)    NULL,
                                          PRIMARY KEY (`calendar_id`),
                                          FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
                                          FOREIGN KEY (`calendar_photo_id`) REFERENCES `Calendar_Photo` (`calendar_photo_id`),
                                          FOREIGN KEY (`baby_id`) REFERENCES `baby` (`baby_id`)
);

-- Calendar 테이블 더미 데이터 수정

CREATE TABLE IF NOT EXISTS `Today_sum` (
                                           `today_id`    INT    NOT NULL auto_increment,
                                           `user_id`    INT    NOT NULL,
                                           `calendar_id`    INT    NULL,
                                           `generated_date`    VARCHAR(5)    NULL,
                                           `content`    TEXT    NULL,
                                           PRIMARY KEY (`today_id`),
                                           FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
                                           FOREIGN KEY (`calendar_id`) REFERENCES `Calendar` (`calendar_id`)
);

-- Today_sum 테이블 더미 데이터 수정

CREATE TABLE IF NOT EXISTS `Memo` (
                                      `memo_id`    INT    NOT NULL auto_increment,
                                      `today_id`    INT    NULL,
                                      `user_id`    INT    NOT NULL,
                                      `calendar_id`    INT    NULL,
                                      `created_at`    VARCHAR(5)    NULL,
                                      `content`    TEXT    NULL,
                                      PRIMARY KEY (`memo_id`),
                                      FOREIGN KEY (`today_id`) REFERENCES `Today_sum` (`today_id`),
                                      FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
                                      FOREIGN KEY (`calendar_id`) REFERENCES `Calendar` (`calendar_id`)
);

-- Memo 테이블 더미 데이터 수정

CREATE TABLE IF NOT EXISTS `Alim` (
                                      `alim_id`    INT    NOT NULL auto_increment,
                                      `baby_id`    INT    NOT NULL,
                                      `content`    TEXT    NULL,
                                      `created_at`    VARCHAR(5)    NULL,
                                      PRIMARY KEY (`alim_id`),
                                      FOREIGN KEY (`baby_id`) REFERENCES `baby` (`baby_id`)
);

-- Alim 테이블 더미 데이터

CREATE TABLE IF NOT EXISTS `Alim_inf` (
                                          `aliminf_id`    INT    NOT NULL auto_increment,
                                          `alim_id`    INT    NULL,
                                          `today_id`    INT    NULL,
                                          `Field`    VARCHAR(255)    NULL,
                                          PRIMARY KEY (`aliminf_id`),
                                          FOREIGN KEY (`alim_id`) REFERENCES `Alim` (`alim_id`),
                                          FOREIGN KEY (`today_id`) REFERENCES `Today_sum` (`today_id`)
);

-- Alim_inf 테이블 더미 데이터는 변경 없음
