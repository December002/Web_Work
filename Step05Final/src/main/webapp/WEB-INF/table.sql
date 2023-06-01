CREATE TABLE users(
	id VARCHAR2(100) PRIMARY KEY,
	pwd VARCHAR2(100) NOT NULL,
	email VARCHAR2(100),
	profile VARCHAR2(100),
	regdate DATE
);

--업로드된 파일의 정보를 저장할 테이블
CREATE TABLE board_file(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100) NOT NULL,
	title VARCHAR2(100) NOT NULL,
	orgFileName VARCHAR2(100) not null, --원본 파일 명
	saveFileName varchar2(100) not null, -- 서버에 실제로 저장된 파일명
	fileSize NUMBER not null, -- 파일의 크기
	regdate DATE
);

CREATE sequence board_file_seq;
