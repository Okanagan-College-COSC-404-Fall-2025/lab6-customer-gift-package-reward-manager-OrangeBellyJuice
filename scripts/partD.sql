set serveroutput on;

create or replace procedure show_first_five_customers
is
    cursor c_recs is 
        select cr.reward_id,
               cr.customer_email,
               gc.min_purchase,
               cr.gift_id,
               gc.gifts,
               cr.reward_date
          from customer_rewards cr
     left join gift_catalog gc on cr.gift_id = gc.gift_id
      order by cr.reward_id
      fetch first 5 rows only;
begin
    for v in c_recs loop
        dbms_output.put_line(
            v.reward_id || ' ' || 'CUSTOMER EMAIL: ' || v.customer_email);
        dbms_output.put_line('  MINIMUM PURCHASE: $' || v.min_purchase);
        dbms_output.put_line('  GIFT ID: ' || v.gift_id);
        dbms_output.put('  GIFTS: ');
        if v.gifts is not null then
            for i in 1..v.gifts.count-1 loop 
                dbms_output.put(v.gifts(i) || ', ');
            end loop;
            dbms_output.put_line(v.gifts(v.gifts.count));
        end if;
        dbms_output.put_line('  REWARD DATE: ' || to_char(v.reward_date, 'YYYY-MM-DD'));
        dbms_output.new_line;
    end loop;
end;
/

-- exec SHOW_FIRST_FIVE_CUSTOMERS;
