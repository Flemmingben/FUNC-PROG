create table reviews(
        id int auto_increment primary key,
        book_id int,
        reviewer varchar(64),
        published varchar(10),
        review varchar(512));
--;;
insert into reviews(book_id, reviewer, published, review)
    values (1, 'Chris B', '2020-02-13', 'Shorter than usual from IS. All killer, no filler');
--;;
insert into reviews(book_id, reviewer, published, review) values (1, 'Mary', '2020-02-17', 'Not Bad. Cheap :-)');
--;;
insert into reviews(book_id, reviewer, published, review) values (1, 'Jane', '2020-02-17', 'Expensive');
