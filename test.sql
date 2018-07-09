USE my_db;
CREATE TABLE student (
-- 列名称   类型        是否为空   自增
    id      int         NOT NULL AUTO_INCREMENT,
    name    char(50)    NOT NULL,
    age    char(50)    NOT NULL,
    sex    char(50)    NOT NULL,
    play    char(50)    NOT NULL,
    address    char(50)    NOT NULL,
    email    char(50)    NOT NULL,
    PRIMARY KEY(id) -- 绑定主键
) ENGINE=InnoDB;

CREATE TABLE demo2 (
    id int NOT NULL AUTO_INCREMENT,
    name char(5) NULL,
    sex char(5) NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB;

CREATE TABLE person(
    id int NOT NULL AUTO_INCREMENT,
    name char(50) NULL,
    sex char(5) NULL,
    age char(5) NULL DEFAULT '1',
    play char(50) NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB;

insert into person (name,sex,age,play)
values ("leo1","1","25","sleep"),("leo1","1","25","sleep"),("leo1","1","25","sleep"),("leo1","1","25","sleep")

CREATE TABLE word(
    id int NOT NULL AUTO_INCREMENT,
    address char(50) NULL,
    email char(50) NULL,
    PRIMARY KEY(id)
) ENGINE=InnoDB;

insert into word (address,email)
values ("bj","2016888723"),("bj","2016888723"),("bj","2016888723"),("bj","2016888723");


select name,sex,age,play from person where id=1  select address,email from word;