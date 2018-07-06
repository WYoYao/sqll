

[安装教程](https://www.cnblogs.com/laumians-notes/p/9069498.html)

**安装my.ini的时候注意使用ansi保存**

## 1 创建数据库
> 创建数据库
> my_db 需要创建的数据库名称
> 如果创建重名的数据库不会进行覆盖,会返回信息已竟存在数据库。

```
CREATE DATABASE my_db;
```

## 2 创建表

### 2.1 创建表

> 通过CREATE TABLE 表名 (
>    列名称   类型        是否为空   自增,
>)
> 创建表

> 如果创建重名的表不会进行覆盖,会返回信息已竟存在表。

```sql
CREATE TABLE student (
-- 列名称   类型        是否为空   自增
    id      int         NOT NULL AUTO_INCREMENT,
    name    char(50)    NOT NULL,
    age    char(50)    NOT NULL DEFAULT 1,
    sex    char(50)    NOT NULL,
    play    char(50)    NOT NULL,
    address    char(50)    NOT NULL,
    email    char(50)    NOT NULL,
    PRIMARY KEY(id) -- 绑定主键
) ENGINE=InnoDB;
```

### NULL and NOT NULL

> NULL值就是没有值或缺值。允许NULL值的列也允许在插入行时不给出该列的值。不允许NULL值的列不接受该列没有值的行，换句话说，在插入或更新行时，该列必须有值。

### 主键 PRIMARY KEY

> 迄今为止我们看到的CREATE TABLE例子都是用单个列作为主键。

```
PRIMARY KEY (id)
```

> 也可以通过 多个列组成主键
> 主键可以在创建表时定义（如这里所示），或者在创建表之后定义。

```
PRIMARY KEY(id,name)
```

> AUTO_INCREMENT告诉MySQL，本列每当增加一行时自动增量。每次执行一个INSERT操作时，MySQL自动对该列增量（从而才有这个关键字AUTO_INCREMENT），给该列赋予下一个可用的值。这样给每个行分配一个唯一的id，从而可以用作主键值。

> 每个表只允许一个AUTO_INCREMENT列，而且它必须被索引.

### 默认值

> 如果在插入行时没有给出值，MySQL允许指定此时使用的默认值。默认值用CREATE TABLE语句的列定义中的DEFAULT关键字指定。
> **不允许函数**与大多数DBMS不一样，MySQL不允许使用函数作为默认值，它只支持常量。
> **使用默认值而不是NULL值**许多数据库开发人员使用默认值而不是NULL列，特别是对用于计算或数据分组的列更是如此。

### 3.2 选择数据库

> 关键字(key  word)  作为MySQL语言组成部分的一个保留字。决不要用关键字命名一个表或列。
> **每行语句必须有分号结尾**

```
# 查询所有的数据库
show databases;

# 选择数据库
use mysql;

# 获得一个数据库内的表的列表
show tables; 

# 获取一个表的列集合
show columns from user;

# describe 获取一个表的列集合(另一种方式)
describe user;

# 用于显示广泛的服务器状态信息
show status;

# 用来显示授权的用户
show grants;

# 显示所有的 show能执行的操作
help show;
```

## 4 Select

### 4.1 Select 语句

> 为了使用SELECT检索表数据，必须至少给出两条信息——想选择什么，以及从什么地方选择。

### 4.2 检索单个列

> **结束SQL语句** 如果你使用的是mysql命令行，必须加上分号来结束SQL语句。
> **大小写**SQL语句不区分大小写，因此SELECT与select是相同的。
> 对所有SQL关键字使用大写，而对所有列和表名使用小写，这样做使代码更易于阅读和调试。
> **空格**在处理SQL语句时，其中所有空格都被忽略。SQL语句可以在一行上给出，也可以分成许多行。多数SQL开发人员认为将SQL语句分成多行更容易阅读和调试。

```
select User from user;
```

### 4.3 检索多个列

> 要想从一个表中检索多个列，使用相同的SELECT语句。唯一的不同是必须在SELECT关键字后给出多个列名，列名之间必须以逗号分隔。

```
select User,Host from User;
```

### 4.4 检索所有的列

> SELECT语句还可以检索所有的列而不必逐个列出它们。这可以通过在实际列名的位置使用星号（*）通配符来达到

```
select * from User;
```

### 4.5 检索不同的行

> DISTINCT关键字，此关键字指示MySQL只返回不同的值。
> 不能部分使用DISTINCT  DISTINCT关键字应用于所有列而不仅是前置它的列。如果给出SELECT DISTINCT vend_id,prod_price，除非指定的两个列都不同，否则所有行都将被检索出来。

```
select distinct Host from User;
select distinct Host,User from User;
```

### 4.6 限制结果

> SELECT语句返回所有匹配的行，它们可能是指定表中的每个行。为了返回第一行或前几行，可使用LIMIT子句。
> 带一个值的LIMIT总是从第一行开始，给出的数为返回的行数。带两个值的LIMIT可以指定从行号为第一个值的位置开始
> select Host,User from User limit 返回行数;
> select Host,User from User limit 开始行数,返回行数;

```
# 返回前两行
select Host,User from User limit 2;
# 从第二(n+1)行开始2行
select Host,User from User limit 1,2;
```

## 5 数据排序

### 5.1 排序数据

> 如果不排序，数据一般将以它在底层表中出现的顺序显示。这可以是数据最初添加到表中的顺序。但是，如果数据后来进行过更新或删除，则此顺序将会受到MySQL重用回收存储空间的影响。因此，如果不明确控制的话，不能（也不应该）依赖该排序顺序。

> 为了明确地排序用SELECT语句检索出的数据，可使用ORDER BY子句。ORDER BY子句取一个或多个列的名字，据此对输出进行排序。
> 并按其中两个列对结果进行排序——首先按password_last_changed，然后再按User排序。

```
select User,Host,password_last_changed from User order by password_last_changed,User;
```

### 5.2 指定排序方向

> 数据排序不限于升序排序（从A到Z）。这只是默认的排序顺序，还可以使用ORDER BY子句以降序（从Z到A）顺序排序。为了进行降序排序，必须指定DESC关键字。

```
select User,Host,password_last_changed from User order by password_last_changed DESC,User;
```

> 在多个列上降序排序

