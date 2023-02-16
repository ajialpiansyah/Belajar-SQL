create database basdat;

use basdat;

CREATE TABLE barang
(
kode INT,
nama VARCHAR(100),
harga INT,
jumlah INT
) ENGINE = InnoDB;

show tables;

describe barang; #melihat struktur tabel

insert into barang(kode, nama, harga, jumlah)
values('111', 'Kopi', 10000, 2),
	  ('112', 'Gula', 8000, 2),
	  ('113', 'Garam', 5000, 3);
	 
select * from barang; #melihat isi tabel

insert into barang(kode, nama, harga)
values('114','Merica', 2000);

truncate barang; #Membuat ulang tabel/menghapus isi tabel(tabelnya ga dihapus)

drop table barang; #Menghapus tabel

alter table barang
add column tersedia int;

alter table barang 
drop column tersedia;

alter table barang
modify nama varchar(100) first;

alter table barang
modify nama varchar(100) after kode; #kode | nama

alter table barang
add column tersedia int,
rename column kode to id;

alter table barang
add column via text not null, #not null
drop column tersedia,
modify id int not null; #not null

show create table barang;

#default value
truncate barang; #reset isi table dlu
describe barang; #melihat struktur tabel
alter table barang 
modify id int not null,
modify harga int not null default 0,
modify jumlah int not null default 0;

#default value(dari pembuatan tabel)
drop table barang;#menghapus tabel
show tables; #melihat tabel yang ada di database
create table barang
(
id int not null,
nama varchar(100) not null,
harga int not null default 0,
jumlah int not null default 0
);

#time stamp
alter table barang
add waktu_dibuat timestamp not null default current_timestamp;

create table products
(
id int,
name varchar(100),
category varchar(100),
price int,
quantity int
);

insert into products(id, name, category, price, quantity)
values
('001','Mie Ayam Original','Makanan','10000','100'),
('002','Mie Ayam Bakso','Makanan','12000','95'),
('003','Mie Ayam Ceker','Makanan','15000','75'),
('004','Es Teh','Minuman','5000','100'),
('005','Jus Jambu','Minuman','8000','50');

select * from products

select id, name, price from products

drop table products; 

show tables;

#Menambah primary key ketika membuat tabel
create table products
(
id int,
name varchar(100),
category varchar(100),
price int,
quantity int,
primary key (id)
);

select * from products

#where clause
select id, name, price, quantity from products 
where quantity=100;

select * from products 
where name='Mie Ayam Original';

#Menambah kolom kategori 
alter table products 
add column kategori enum('Makanan','Minuman','Lain-Lain')
after name;

insert into products(kategori)
values
('Makanan'),
('Minuman');

select * from products

#Mengubah satu kolom
update products 
set kategori = 'Makanan'
where id = '001';

update products
set kategori = 'Minuman'
where category = 'Minuman';

create table penjualan
(
id int,
produk varchar(100),
jumlah int,
primary key (id)
)

insert into penjualan(id) 
values (001),(002),(003);

select * from penjualan

#Mengubah beberapa kolom
update penjualan
set produk = 'Rinso', jumlah = 3
where id = 001;

#Mengubah dengan value di kolom
update penjualan 
set jumlah = jumlah + 3 
where id=001 #kedirinya sendiri

#Mengapus data
delete from penjualan 
where id = 001

#Alias untuk kolom
select id as 'kode',
	   produk as 'nama barang',
	   jumlah as 'banyak barang'
from penjualan 

#Alias untuk tabel
select p.id as 'kode',
	   p.produk as 'nama barang',
	   p.jumlah as 'banyak barang'
from penjualan as p;

truncate penjualan

insert into penjualan(id,produk,jumlah) 
values (001,'Rinso',20),(002,'Fiesta',6),(003,'Odonut',15);

#Where operator
select * from penjualan where jumlah>=10;
select * from penjualan where id!=001; #atau bisa menggunakan operator <>


#Mencari data dengan operator DAN
select * from penjualan where produk='Rinso' and jumlah=0; #tidak ada

#Mencari data dengan operator OR
select * from penjualan where produk = 'Rinso' or jumlah>10;

#Prioritas dengan kurung
select * from penjualan where (id=002  and produk='Fiesta') or jumlah>10;

#Mencari menggunakan like operator
select * from penjualan where produk like '%in%';
select * from penjualan where produk like 'F%';
select * from penjualan where produk like '%a';

#Mencari menggunakan NULL OPERATOR
select * from penjualan where produk is null;
select * from penjualan where produk is not null;

#Mencari menggunakan BETWEEN operator
select * from penjualan where jumlah between 1 and 18;

#Mencari menggunakan IN operator
select * from penjualan where id in (001,002)

#Mengurutkan data
select * from penjualan order by jumlah desc;

#Membatasi hasil query
select * from penjualan where jumlah>0 
order by jumlah limit 2;

#Skip hasil  query
select * from penjualan where jumlah>0
order by jumlah limit 1,2 #skip satu, tampilkan 2

#Menghilangkan data duplikat
select distinct produk from penjualan;

#Menggunakan arithmetic operator 
select 10+10 as hasil;
select id, jumlah - 2 as 'jumlah baru' from penjualan

##Menggunakan mathematical function
select pi();
select id, cos(jumlah), sin(jumlah),tan(jumlah) from penjualan p ;