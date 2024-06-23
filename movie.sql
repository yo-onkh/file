DROP DATABASE IF EXISTS movie;

-- 데이터베이스 생성
CREATE DATABASE movie;

-- 데이터베이스 선택
USE movie;

-- 테이블 생성 : 극장 (theater)
CREATE TABLE IF NOT EXISTS theater (
    theaterNum INTEGER PRIMARY KEY,
    theaterName VARCHAR(20),
    theaterLocation VARCHAR(20)
);

-- 테이블 생성 : 고객 (Users)
CREATE TABLE IF NOT EXISTS users (
    userNum INTEGER PRIMARY KEY,
    userName VARCHAR(20),
    userAddress VARCHAR(20)
);

-- 테이블 생성 : 상영관 (Cinema)
CREATE TABLE IF NOT EXISTS cinema (
    theaterNum INTEGER NOT NULL,
    cinemaNum INTEGER PRIMARY KEY,
    movieName VARCHAR(20),
    price INTEGER,
    seat INTEGER,
    FOREIGN KEY (theaterNum)
        REFERENCES theater (theaterNum)
);

-- 테이블 생성 : 예약 (reservation)
CREATE TABLE IF NOT EXISTS reservation (
    theaterNum INTEGER NOT NULL,
    cinemaNum INTEGER NOT NULL,
    userNum INTEGER NOT NULL,
    seatNum INTEGER,
    date DATE,
    FOREIGN KEY (theaterNum)
        REFERENCES theater (theaterNum),
    FOREIGN KEY (cinemaNum)
        REFERENCES cinema (cinemaNum),
    FOREIGN KEY (userNum)
        REFERENCES users (userNum)
);

-- 테이블 데이터 생성 : 극장 (theater)
INSERT INTO theater(theaterNum, theaterName, theaterLocation) 
    VALUES(1, "롯데", "잠실");
INSERT INTO theater(theaterNum, theaterName, theaterLocation) 
    VALUES(2, "메가", "강남");
INSERT INTO theater(theaterNum, theaterName, theaterLocation) 
    VALUES(3, "대한", "잠실");
    
-- 테이블 데이터 생성 : 상영관 (cinema)
INSERT INTO cinema(theaterNum, cinemaNum, movieName, price, seat)
    VALUES(1, 1, "어려운 영화", 15000, 48);
INSERT INTO cinema(theaterNum, cinemaNum, movieName, price, seat)
    VALUES(3, 3, "멋진 영화", 7500, 120);
INSERT INTO cinema(theaterNum, cinemaNum, movieName, price, seat)
    VALUES(3, 2, "재밌는 영화", 8000, 110);
    
-- 테이블 데이터 생성 : 고객 (users)
INSERT INTO users(userNum, userName, userAddress)
    VALUES(3, "홍길동", "강남");
INSERT INTO users(userNum, userName, userAddress)
    VALUES(4, "김철수", "잠실");
INSERT INTO users(userNum, userName, userAddress)
    VALUES(9, "박영희", "강남");
    
-- 테이블 데이터 생성 : 예약 (reservation)
INSERT INTO reservation(theaterNum, cinemaNum, userNum, seatNum, date)
    VALUES(3, 2, 3, 15, "2024-09-01");
INSERT INTO reservation(theaterNum, cinemaNum, userNum, seatNum, date)
    VALUES(3, 3, 4, 16, "2024-09-01");
INSERT INTO reservation(theaterNum, cinemaNum, userNum, seatNum, date)
    VALUES(1, 1, 9, 48, "2024-09-01");
