CREATE TABLE users
(id int auto_increment primary key,
 first_name VARCHAR(30),
 last_name VARCHAR(30),
 email VARCHAR(30),
 admin BOOLEAN,
 last_login TIMESTAMP,
 is_active BOOLEAN,
 pass VARCHAR(300));

--;;
insert into users (first_name, last_name, email, pass)
values ('Fred', 'Williams', 'fred@fred.com', 'fred123');

--;;
insert into users (first_name, last_name, email, pass)
values('Mary', 'ONeill', 'mary@shu.co', 'mary123');