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