-- 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS TEST;

-- 생성한 데이터베이스 사용
USE TEST;

-- 테이블 생성
CREATE TABLE IF NOT EXISTS sayhello (
    test CHAR(100) COMMENT 'SAYHELLO',
    count INT COMMENT 'COUNT',
    PRIMARY key (test)
);

-- 데이터 삽입
INSERT INTO sayhello (test, count) VALUES ('hello world!', 0);
