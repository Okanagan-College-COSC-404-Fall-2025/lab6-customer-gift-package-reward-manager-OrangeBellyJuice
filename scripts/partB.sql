drop table customer_rewards;

create table customer_rewards (
    reward_id      number generated always as identity not null primary key,
    customer_email varchar2(255) not null,
    gift_id        number,
    reward_date    date not null,
    constraint fk_gift_id foreign key(gift_id) references 
        gift_catalog(gift_id)
);