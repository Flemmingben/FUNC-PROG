create table books(
    id int auto_increment primary key, 
    isbn varchar(20), 
    title varchar(128), 
    author varchar(128));
--;;
insert into books(isbn, title, author) 
    values ('978-0-13-521064-2', 'Engineering Software Products', 'Ian Sommerville');