create or replace package customer_manager as
    function get_total_purchase(c_id in number) return number;
    procedure assign_gifts_to_all;
end customer_manager;
/

create or replace package body customer_manager as

    function get_total_purchase(c_id in number)
    return number
    is
        v_total_purchase number;
    begin 
        select sum(oi.quantity * oi.unit_price) into v_total_purchase
          from customers cu 
          join orders o on cu.customer_id = o.customer_id
          join order_items oi on o.order_id = oi.order_id
         where cu.customer_id = c_id;
        
        return v_total_purchase;
    end get_total_purchase;

    function choose_gift_package(p_total_purchase in number) 
    return number
    is
        v_gift_id number;
    begin
        v_gift_id := case 
                        when 1000000 <= p_total_purchase then 5
                        when 100000 <= p_total_purchase then 4
                        when 10000 <= p_total_purchase then 3
                        when 1000 <= p_total_purchase then 2
                        when 100 <= p_total_purchase then 1
                        else null
                     end;
        
        return v_gift_id;
    end choose_gift_package;


end customer_manager;
/


    -- need cursor to grab customer ids from customers
    -- pipe the data into the the function
    -- pipe data into the procedure
        -- get value to be able to insert
    -- insert values into customer_rewards 
        -- customer_email, gift_id, and reward date