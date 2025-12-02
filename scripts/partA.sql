drop table gift_catalog;

create or replace type gift_type is table of varchar2(64);
/

create table gift_catalog (
	gift_id      number not null primary key,
	min_purchase number not null,
	gifts        gift_type
) nested table gifts store as gifts_tab;
/

insert into gift_catalog values (1, 100, gift_type('Stickers', 'Pen Set'));
insert into gift_catalog values (2, 1000, gift_type('Teddy Bear', 'Mug', 'Perfume Sample'));
insert into gift_catalog values (3, 10000, gift_type('Backpack', 'Thermos Bottle', 'Chocolate Collection'));
insert into gift_catalog values (4, 100000, gift_type('Silver Bar', 'Fountain Pen'));
insert into gift_catalog values (5, 1000000, gift_type('Gold Bar', 'Foo Bar', 'Fee Snack'));

-- select * from GIFT_CATALOG;
