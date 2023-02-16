create table produksi
(
id varchar(10) not null,
name varchar(100),
description varchar(100),
price int,
quantity int,
created_at timestamp not null default current_timestamp
);

select * from produksi;
describe produksi;

insert into produksi(id,name,price,quantity)
values('P008', 'Kerupuk', 1000,70)

update produksi 
set price=18000
where id='P002'

alter table produksi
add column category varchar(100)
after name

update produksi
set category = 'Lainnya'
where id='P008'

#Aggregate function 
select sum(quantity) as 'Produk tersedia' from produksi
select count(id) as 'Total Produk' from produksi
select max(price) as 'Harga Termahal' from produksi

#Menggunakan group by(merge baris yang memiliki kategori sama)
select category, count(id) as 'Total Produk' from produksi
group by category
select category, max(price) as 'Harga Termahal' from produksi
group by category

##Having clause (untuk memfilter hasil aggregate function, krn gbs pake where)
select category, count(id) as 'Total' from produksi
group by category having Total>3
select category, sum(quantity) as 'Stok' from produksi 
group by category having Stok>500


##Membuat tabel dengan unique constraint 
create table costumers
(
id int not null auto_increment,
email varchar(100) not null,
first_name varchar(100) not null,
last_name varchar(100),
primary key(id),
unique key email_unique(email)
)

##Menambah/menghapus unique constraint
alter table costumers 
drop constraint email_unique; 
alter table costumers 
add constraint email_unique unique (email); 

insert into costumers(email,first_name,last_name)
values('eko@gmail.com','eko','sasino')
('eko@gmail.com','rizka','idarti') #tak bisa, karena email harus unique

##Menambah/menghapus check constraint
alter table produksi
add constraint price_check check (price>0)
alter table produksi
drop constraint price_check

insert into produksi(id,price)
values('P009',0)

alter table produksi
add primary key(id);

#Membuat tabel dengan foreign key
create table wishlist
(
id INT not null auto_increment,
id_product varchar(10) not null,
description text,
primary key(id),
constraint fk_wishlist_product foreign key (id_product) references produksi(id)
)

##menambah atau menghapus foreign key
alter table wishlist 
drop constraint fk_wishlist_product;
alter table wishlist 
add constraint fk_wishlist_product foreign key (id_product) references produksi(id)

insert into wishlist(id_product, description)
values('P001','Makanan kesukaan')


insert into wishlist(id_product, description)
values('P011','Makanan kesukaan') #error karena di table reference tak ada id P011

delete from produksi 
where id = 'P001'; #error karena di table sudah saling berelasi jdi table reference gblh di apus

#Mengubah behavior menghapus relasi
alter table wishlist
add constraint fk_wishlist_product foreign key(id_product) references produksi(id)
on delete cascade on update cascade 

insert into produksi(id, name, category,price)
values('Pxxx','Bala-bala','Lainnya',2000)

insert into wishlist(id_product,description)
values('Pxxx','Lainnya kesukaan')

delete from produksi
where id='Pxxx'  #sukses didelete karena behavior relasi di ubah

describe wishlist 
describe costumers 
select * from costumers
select * from produksi
select * from wishlist 
show create table produksi





