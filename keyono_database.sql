#Creation of the database
DROP DATABASE IF EXISTS keyono;
CREATE DATABASE keyono;

#Creation of the tables
CREATE TABLE ATTACHMENT
(
  id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  TITLE VARCHAR(255),
  note_id BIGINT(20),
  user_id BIGINT(20),
  CONSTRAINT FKhxpeyfd3uk4s708pl4ewvxrra FOREIGN KEY (note_id) REFERENCES NOTE (id),
  CONSTRAINT FKgyc2dqc1dq4ia1f5mx6wyso3m FOREIGN KEY (user_id) REFERENCES USER (id)
);
CREATE INDEX FKgyc2dqc1dq4ia1f5mx6wyso3m ON ATTACHMENT (user_id);
CREATE INDEX FKhxpeyfd3uk4s708pl4ewvxrra ON ATTACHMENT (note_id);
CREATE TABLE COMMENT
(
  id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  CREATION_DATE DATETIME,
  TEXT LONGTEXT,
  note_id BIGINT(20),
  user_id BIGINT(20),
  CONSTRAINT FKt3bcikpt5017itwdmyy5ag8i7 FOREIGN KEY (note_id) REFERENCES NOTE (id),
  CONSTRAINT FKb2ja7paeb2wr0dja38ybmo79o FOREIGN KEY (user_id) REFERENCES USER (id)
);
CREATE INDEX FKb2ja7paeb2wr0dja38ybmo79o ON COMMENT (user_id);
CREATE INDEX FKt3bcikpt5017itwdmyy5ag8i7 ON COMMENT (note_id);
CREATE TABLE NOTE
(
  id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  CREATION_DATE DATE,
  TEXT LONGTEXT,
  TITLE VARCHAR(255),
  user_id BIGINT(20),
  CONSTRAINT FK1mttxxbx596sh6muwyunl48tx FOREIGN KEY (user_id) REFERENCES USER (id)
);
CREATE INDEX FK1mttxxbx596sh6muwyunl48tx ON NOTE (user_id);
CREATE TABLE RATE
(
  id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  note_id BIGINT(20),
  user_id BIGINT(20),
  CONSTRAINT FK2wx9n7biio0g5eldru3d61hc6 FOREIGN KEY (note_id) REFERENCES NOTE (id),
  CONSTRAINT FKj7ceu0ttap0db24mq7aw709j3 FOREIGN KEY (user_id) REFERENCES USER (id)
);
CREATE INDEX FK2wx9n7biio0g5eldru3d61hc6 ON RATE (note_id);
CREATE INDEX FKj7ceu0ttap0db24mq7aw709j3 ON RATE (user_id);
CREATE TABLE TAG
(
  id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  TITLE VARCHAR(255),
  note_id BIGINT(20),
  CONSTRAINT FK6294lg5m88vyjmorofvtq0t67 FOREIGN KEY (note_id) REFERENCES NOTE (id)
);
CREATE INDEX FK6294lg5m88vyjmorofvtq0t67 ON TAG (note_id);
CREATE TABLE USER
(
  id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  BIRTH_DATE DATE,
  CREATION_DATE DATE,
  EMAIL VARCHAR(255),
  FIRST_NAME VARCHAR(255),
  ACTIVE BIT(1),
  LAST_NAME VARCHAR(255),
  LOGIN VARCHAR(255),
  PASSWORD VARCHAR(255),
  SEX VARCHAR(255)
);
CREATE UNIQUE INDEX UK_ejfk3g58oxsgbb4ju3u4fhivk ON USER (EMAIL);
CREATE UNIQUE INDEX UK_m6gjtxi6t4thhq8x960qif5cy ON USER (LOGIN);
CREATE TABLE USER_NOTE
(
  USER_ID BIGINT(20) NOT NULL,
  NOTE_ID BIGINT(20) NOT NULL,
  CONSTRAINT FK9ougl0hr1i3o948oi0ggdnlta FOREIGN KEY (USER_ID) REFERENCES USER (id),
  CONSTRAINT FKagp59pm5ihdnelsyo8ow35dnq FOREIGN KEY (NOTE_ID) REFERENCES NOTE (id)
);
CREATE INDEX FK9ougl0hr1i3o948oi0ggdnlta ON USER_NOTE (USER_ID);
CREATE UNIQUE INDEX UK_fycbh4mnq1fq336305ehguog6 ON USER_NOTE (NOTE_ID);
