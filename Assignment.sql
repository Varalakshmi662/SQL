
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| emp                |
| information_schema |
| matrimony          |
| mysql              |
| performance_schema |
| sakila             |
| school             |
| sys                |
| trv11              |
| world              |
| xworkz             |
+--------------------+
11 rows in set (0.02 sec)

mysql> use emp;
Database changed

mysql> show tables;
+---------------+
| Tables_in_emp |
+---------------+
| dept          |
+---------------+
1 row in set (0.09 sec)

mysql> desc dept;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| deptno   | int         | NO   | PRI | NULL    |       |
| dname    | varchar(50) | NO   |     | NULL    |       |
| location | varchar(50) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)


mysql> create table emp(
    -> empno int not null primary key,
    -> ename varchar(50) not null,
    -> job varchar(50) not null,
    -> mgr int,
    -> hiredate date,
    -> sal decimal(10,2),
    -> comm decimal(10,2),
    -> deptno int not null,
    -> foreign key(deptno) references dept(deptno));
Query OK, 0 rows affected (1.97 sec)

mysql> desc emp;
+----------+---------------+------+-----+---------+-------+
| Field    | Type          | Null | Key | Default | Extra |
+----------+---------------+------+-----+---------+-------+
| empno    | int           | NO   | PRI | NULL    |       |
| ename    | varchar(50)   | NO   |     | NULL    |       |
| job      | varchar(50)   | NO   |     | NULL    |       |
| mgr      | int           | YES  |     | NULL    |       |
| hiredate | date          | YES  |     | NULL    |       |
| sal      | decimal(10,2) | YES  |     | NULL    |       |
| comm     | decimal(10,2) | YES  |     | NULL    |       |
| deptno   | int           | NO   | MUL | NULL    |       |
+----------+---------------+------+-----+---------+-------+
8 rows in set (0.07 sec)

mysql> insert into dept values (10,'Accounting','New York');
Query OK, 1 row affected (0.23 sec)

mysql>  insert into dept values (20,'Research','Dallas'),
    -> (30,'Sales','Chicago'),
    -> (40,'Operation','Baston');
Query OK, 3 rows affected (0.16 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from dept;
+--------+------------+----------+
| deptno | dname      | location |
+--------+------------+----------+
|     10 | Accounting | New York |
|     20 | Research   | Dallas   |
|     30 | Sales      | Chicago  |
|     40 | Operation  | Baston   |
+--------+------------+----------+
4 rows in set (0.00 sec)

mysql>  insert into dept values (50,'Production','India'),
    -> (60,'Marketing','Bangalore'),
    -> (70,'Finance','Mumbai');
Query OK, 3 rows affected (0.11 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from dept;
+--------+------------+-----------+
| deptno | dname      | location  |
+--------+------------+-----------+
|     10 | Accounting | New York  |
|     20 | Research   | Dallas    |
|     30 | Sales      | Chicago   |
|     40 | Operation  | Baston    |
|     50 | Production | India     |
|     60 | Marketing  | Bangalore |
|     70 | Finance    | Mumbai    |
+--------+------------+-----------+
7 rows in set (0.03 sec)

mysql> insert into emp values (7000,'Jhon','Manager',7698,'2020-06-18',2500.00,NULL,50);
Query OK, 1 row affected (0.13 sec)

mysql> select * from emp;
+-------+-------+---------+------+------------+---------+------+--------+
| empno | ename | job     | mgr  | hiredate   | sal     | comm | deptno |
+-------+-------+---------+------+------------+---------+------+--------+
|  7000 | Jhon  | Manager | 7698 | 2020-06-18 | 2500.00 | NULL |     50 |
+-------+-------+---------+------+------------+---------+------+--------+
1 row in set (0.00 sec)

mysql> insert into emp values (7002,'Sham','Manager',7698,'2020-06-18',2500.00,NULL,50),
    -> (7004,'Ravi','Clerk',7782,'2000-12-12',500.00,NULL,50),
    -> (7369,'SMITH','CLERK',7902,'1993-06-13',800,0.00,20),
    -> (7499,'ALLEN','SALESMAN',7698,'1998-08-15',1600.00,300.00,30),
    -> (7521,'WARD','SALESMAN',7698,'1996-03-26',1250.00,500.00,30),
    -> (7566,'JONES','MANAGER',7839,'1995-10-31',2975.00,NULL,20),
    -> (7654,'MARTIN','SALESMAN',7698,'1998-12-05',1250.00,1400.00,30),
    -> (7698,'BLAKE','MANAGER',7839,'1992-06-11',2850.00,NULL,30),
    -> (7782,'CLARK','MANAGER',7839,'1993-05-14',2450.00,NULL,10),
    -> (7788,'SCOTT','ANALYST',7566,'1996-03-05',3000.00,NULL,20),
    -> (7839,'KING','PRESIDENT',NULL,'1990-06-09',5000.00,0.00,10),
    -> (7844,'TURNER','SALESMAN',7698,'1995-06-04',1500.00,0.00,30),
    -> (7876,'ADAMS','CLERK',7788,'1999-06-04',1100.00,NULL,20),
    -> (7900,'JAMES','CLERK',7698,'2000-06-23',950.00,NULL,30),
    -> (7902,'FORD','ANALYST',7566,'1997-12-05',3000.00,NULL,20),
    -> (7934,'MILLER','CLERK',7782,'2000-01-21',1300.00,NULL,10);
Query OK, 16 rows affected (0.16 sec)
Records: 16  Duplicates: 0  Warnings: 0

mysql> select * from emp;
+-------+--------+-----------+------+------------+---------+---------+--------+
| empno | ename  | job       | mgr  | hiredate   | sal     | comm    | deptno |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7000 | Jhon   | Manager   | 7698 | 2020-06-18 | 2500.00 |    NULL |     50 |
|  7002 | Sham   | Manager   | 7698 | 2020-06-18 | 2500.00 |    NULL |     50 |
|  7004 | Ravi   | Clerk     | 7782 | 2000-12-12 |  500.00 |    NULL |     50 |
|  7369 | SMITH  | CLERK     | 7902 | 1993-06-13 |  800.00 |    0.00 |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1998-08-15 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1996-03-26 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1995-10-31 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1998-12-05 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1992-06-11 | 2850.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1993-05-14 | 2450.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1996-03-05 | 3000.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1990-06-09 | 5000.00 |    0.00 |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1995-06-04 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1999-06-04 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 2000-06-23 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1997-12-05 | 3000.00 |    NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 2000-01-21 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------+------------+---------+---------+--------+
17 rows in set (0.00 sec)

