use bank;

#Query1
select account_id from account
where district_id=1
limit 5;

#Query2
select max(client_id) from client
where district_id=72;


#Query3
select amount from loan
order by amount 
limit 3; 


#Query4
select status,count(*) from loan
group by status
order by status;


#Query5
select loan_id,payments from loan
order by payments desc
limit 1;


#Query6
select account_id,amount from loan
order by account_id 
limit 5;

#Query7
select account_id from loan
where duration = 60 
order by amount
limit 5;


#Query8
select DISTINCT k_symbol from bank.order;


#Query9
SELECT order_id FROM bank.order
where account_id=34;

#Query10
SELECT account_id,count(*) FROM bank.order
WHERE order_id > 29540 AND order_id <= 29560 
group by account_id;


#Query11
select amount from bank.order
where account_to=30067122;


#Query12
select trans_id, date, type, amount from trans
where account_id=793
limit 10;


#Query13
select district_id,count(*) from client
where district_id<10
group by district_id;


#Query14
select type, count(*) as 'num' from card
Group by type;


#Query15
select loan_id, sum(amount) from loan
group by loan_id
limit 10;

#Query16
select date, count(*) from loan
where date <930907
group by date
order by date DESC;

#Query17
select date,duration, count(loan_id) as 'num'  from loan
WHERE date >= 971201 AND date <= 971230
group by date, duration
order by date, duration;

#Query18

select account_id, sum(amount) as 'total_amount' ,type from trans
where account_id=396 
group by type;

#Query19
select account_id, round(sum(amount),0)as 'total_amount',
case
 WHEN type='VYDAJ' THEN 'Outgoing'
 WHEN type='PRIJEM' THEN 'Incoming'
end as transaction_type
from trans
where account_id=396 
group by type;

#Query20
select account_id, 
floor(sum(if(type = 'PRIJEM',amount,null))) as 'Income', 
floor(sum(if(type = 'VYDAJ',amount,null))) as 'out',
floor(sum(if(type = 'PRIJEM',amount,null))) - floor(sum(if(type = 'VYDAJ',amount,null))) as 'difference' 
from trans
where account_id = 396;



#Query21
select account_id, 
floor(sum(if(type = 'PRIJEM',amount,null))) - floor(sum(if(type = 'VYDAJ',amount,null))) as 'difference' 
from trans
group by account_id
order by difference desc
limit 10;

