/*
Haciendo ejercicios de los JOINS

Utilizaremos la bd de banco
https://www.notion.so/Ejercicio-Joins-42dffd0d8add4f6fba8f4620450047a2

*/

--1. Seleccionar todos los registros de usuarios con las siguientes columnas **(id, first_name, last_name, email)** y obtener las cuentas sin importar si tiene o no cuentas creadas en el banco y mostrar las columnas de **(account_no y balance)**
select c.id, c.first_name ,
    c.last_name ,c.email ,
    a.account_no ,a.balance
from clients c left join accounts a 
    on c.id =a.client_id ;

--2. Seleccionar todas las **cuentas** y el **tipo de cuenta** al que corresponde el registro de cuenta. 
select a.account_no ,a.client_id as "id cliente",
at2."name" as "tipo de cuenta" 
from accounts a left join account_types at2 on
a."type"  =at2.id;

--3. Selecciona todas las transacciones realizadas, su monto y el tipo de transacción
select t.id as "transaccion",
t.amount "monto",tt."name" as "tipo de transaccion" 
from transactions t left join transactions_types tt
on t.transaction_type =tt.id;

--4. Selecciona todas las transacciones realizadas, su monto y todos los tipos de transacciones que coincidan con la transacción realizar 
create view "tabla_coincidencias"
as
select t.id "transaccion",
t.amount "monto",tt."name" "tipo de transaccion"
from transactions t left join transactions_types tt
on t.transaction_type  =tt.id 
where t.id=t.transaction_type
select t.id "transaccion", tc."monto" , tc."tipo de transaccion"  from transactions t left join tabla_coincidencias tc on t.id =tc.transaccion;


--5. 5. Crear una vista por cada una de las consultas realizadas en los puntos 1, 2, 3 y 4:

--1
create view "v_clients_accounts"
as
select c.id, c.first_name ,
    c.last_name ,c.email ,
    a.account_no ,a.balance
from clients c left join accounts a 
    on c.id =a.client_id ;

--2
create view "v_accounts_types"
as
select a.account_no ,a.client_id as "id cliente",
at2."name" as "tipo de cuenta" 
from accounts a left join account_types at2 on
a."type"  =at2.id;


--3
create view "v_transactions_detail"
as
select t.id as "transaccion",
t.amount "monto",tt."name" as "tipo de transaccion" 
from transactions t left join transactions_types tt
on t.transaction_type =tt.id;

--4
create view "v_transations_types_detail" 
as
select t.id "transaccion", tc."monto" , tc."tipo de transaccion"  from transactions t left join tabla_coincidencias tc on t.id =tc.transaccion;
