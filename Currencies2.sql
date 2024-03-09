ID	NUMBER
CURRENCY_ID	NUMBER
PRODUCT_NAME	VARCHAR2(100)
TERM	NUMBER(4)
?NTEREST_RATE	NUMBER(10,2)


Create table cb_currencies 
      (id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
      currency_id NUMBER, 
      product_name	VARCHAR2(100),
      term	NUMBER(4),
      interest_rate	NUMBER(10,2));
      
create or replace procedure
    cb_currencies_insert (p_currency_id number, p_product_name varchar2, p_term number, p_interest_rate number) is
begin
   insert into cb_currencies (currency_id, product_name, term, interest_rate) 
   values (p_currency_id, p_product_name, p_term, p_interest_rate ); 
   commit;
end;

create or replace procedure
    cb_currencies_update (p_id number, p_currency_id number default null, p_term number default null, p_interest_rate number  default null) is
begin
   update cb_currencies set
        currency_id=nvl(p_currency_id, currency_id),
        term=nvl(p_term, term),
        interest_rate=nvl(p_interest_rate, interest_rate)
  where id=p_id;
  commit;
  end;
  
  begin
     cb_currencies_insert ('1', '10');
  end;
