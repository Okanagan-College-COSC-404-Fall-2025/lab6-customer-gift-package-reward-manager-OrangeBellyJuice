create table customer_rewards (
    reward_id      number not null primary key,
    customer_email varchar2(255) not null,
    gift_id        number not null,
    reward_date    date default sysdate,
    constraint fk_gift_id foreign key(gift_id) references 
        gift_catalog(gift_id)
);
