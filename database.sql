drop database if exists housing;
create database housing;
use housing;

create table rooming_group (
rooming_group_id int not null primary key auto_increment,
selection_num int check (selection_num between 1000 and 9999),
g_class_standing int not null, -- second year, third year etc.
student_1_id varchar(9),
student_2_id varchar(9),
student_3_id varchar(9),
student_4_id varchar(9),
student_5_id varchar(9),
student_6_id varchar(9),
student_7_id varchar(9),
student_8_id varchar(9)
);

create table student (
student_id varchar(9) not null primary key,
first_name varchar(30) not null,
last_name varchar(30) not null,
s_class_standing int not null check(s_class_standing between 2 and 4), -- second year, third year etc.
selection_num int not null check (selection_num between 1000 and 9999),
s_rooming_group_id int,
foreign key (s_rooming_group_id) references rooming_group(rooming_group_id)
	on update cascade on delete cascade
);

create table building (
building_id varchar(9) not null primary key,
building_name varchar(60) not null,
address varchar(60) not null,
street_name varchar(30) not null,
price_cat varchar(10) not null, -- standard, enhanced, economy
building_class int not null,
capacity int not null
);

create table dorm (
dorm_num varchar(9) not null primary key,
no_of_rooms int not null,
capacity int not null check (capacity between 1 and 8),
building_id varchar(9) not null,
foreign key (building_id) references building(building_id) -- has
	on update cascade on delete cascade
);

create table room (
room_id varchar(9) not null primary key,
capacity int check (capacity between 1 and 3),
dorm_num varchar(9) not null,
foreign key (dorm_num) references dorm(dorm_num) -- has
	on update cascade on delete cascade
);

create table time_slot (
rooming_group_id int not null primary key,
selection_time datetime not null,
foreign key (rooming_group_id) references rooming_group(rooming_group_id)
	on update cascade on delete cascade
);

create table preferences (
preference_id int not null auto_increment primary key,
building_id varchar(9),
p_price_cat varchar(10),
location varchar(60),
rooming_group_id int not null,
foreign key (rooming_group_id) references rooming_group(rooming_group_id) -- has
	on update cascade on delete cascade,
foreign key (building_id) references building(building_id)
	on update cascade on delete cascade
);

