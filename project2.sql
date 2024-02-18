--project 
--in this project, you will work on converting a relational design that enlists various
--users, their roles, user accounts and their statuses into different tables in SQL
--Server and insert data into them. Having at least two rows in each of the tables,
--you have to ensure that you have created respective foreign keys.
--Tasks To Be Performed:
--? Define relations/attributes
--? Define primary keys
--? Create foreign keys

create table role
(
id int primary key,
role_name varchar(100)
)

create table user_has_role
(
id int primary key,
role_state_time datetime,
role_end_time datetime not null,
user_account_id int foreign key references role(id),
role_id int foreign key references role(id)
);
 create table user_account
 (
 id int primary key ,
 user_name varchar(100),
 email varchar(254),
 password varchar(200),
 password_salt varchar(50) not null,
 password_hash_algorithm varchar(50),
 user_has_role_id int
 )

 create table user_has_status
 (
 id int primary key,
 status_start_time datetime,
 status_end_time datetime not null,
 user_account_id int foreign key references user_account(id),
 status_id int foreign key references user_account(id)
 );

 create table status
 (
 id int primary key,
 status_name varchar(200),
 is_user_working float,
 user_has_status_id int
 )