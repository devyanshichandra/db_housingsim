use housing;

DELIMITER $$
# add students
create procedure add_student
(
	student_id_p varchar(9),
    first_name_p varchar(30),
	last_name_p varchar(30),
	s_class_standing_p varchar(11),
    selection_num_p int
)
begin
	if exists (select * from student where student_id = student_id_p) then
		select student_id_p, "is already in a rooming group." as message;
	else
		insert into student values(student_id_p, first_name_p, last_name_p, s_class_standing_p, selection_num_p, null);
    end if;

end $$
delimiter ;

# gets selection num of a student from id
delimiter $$
create function get_selection_num
(
	student_id_p varchar(9)
)
returns int
deterministic
begin 
	declare selection_num_var int;
    
    if (student_id_p is null) then 
		return 9999;
	else
		select selection_num into selection_num_var from student
			where student_id = student_id_p;
	end if;
	
    return selection_num_var;
end $$
delimiter ;

# gets lowest selection num
delimiter $$
create function get_rooming_group_selection_num
(
	student_1_selection_num varchar(9),
    student_2_selection_num varchar(9),
    student_3_selection_num varchar(9),
    student_4_selection_num varchar(9),
    student_5_selection_num varchar(9),
    student_6_selection_num varchar(9),
    student_7_selection_num varchar(9),
    student_8_selection_num varchar(9)
)
returns int
deterministic
begin 
	declare selection_num_var int;
    
    select least(student_1_selection_num, student_2_selection_num, student_3_selection_num, 
    student_4_selection_num, student_5_selection_num, student_6_selection_num, student_7_selection_num, student_8_selection_num) into selection_num_var;
	
    return selection_num_var;
end $$
delimiter ;

# gets class standing from student id
delimiter $$
create function get_class_standing
(
	student_id_p varchar(11)
)
returns int
deterministic
begin 
	declare standing_var int;
    
    if (student_id_p is null) then 
		return 2;
	else
		select s_class_standing into standing_var from student
			where student_id = student_id_p;
	end if;
	
    return standing_var;
end $$
delimiter ;

# gets highest class standing from group
delimiter $$
create function get_rooming_group_class_standing
(
	student_1_class_standing varchar(11),
    student_2_class_standing varchar(11),
    student_3_class_standing varchar(11),
    student_4_class_standing varchar(11),
    student_5_class_standing varchar(11),
    student_6_class_standing varchar(11),
    student_7_class_standing varchar(11),
    student_8_class_standing varchar(11)
)
returns int
deterministic
begin 
	declare class_standing_var int;
    
    select greatest(student_1_class_standing, student_2_class_standing, student_3_class_standing, student_4_class_standing,
    student_5_class_standing, student_6_class_standing, student_7_class_standing, student_8_class_standing) into class_standing_var;
	
    return class_standing_var;
end $$
delimiter ;

# adds a group to the rooming group table
DELIMITER $$
create procedure add_group
(
	student_1_id_p varchar(9),
    student_2_id_p varchar(9),
    student_3_id_p varchar(9),
    student_4_id_p varchar(9),
    student_5_id_p varchar(9),
    student_6_id_p varchar(9),
    student_7_id_p varchar(9),
    student_8_id_p varchar(9)
)
begin
	declare selection_1 int;
    declare selection_2 int;
    declare selection_3 int;
    declare selection_4 int;
    declare selection_5 int;
    declare selection_6 int;
    declare selection_7 int;
    declare selection_8 int;
    declare standing_1 int;
    declare standing_2 int;
    declare standing_3 int;
    declare standing_4 int;
    declare standing_5 int;
    declare standing_6 int;
    declare standing_7 int;
    declare standing_8 int;
    declare group_selection_num int;
    declare group_class_standing int;
    
    select get_selection_num(student_1_id_p) into selection_1;
    select get_selection_num(student_2_id_p) into selection_2;
    select get_selection_num(student_3_id_p) into selection_3;
    select get_selection_num(student_4_id_p) into selection_4;
    select get_selection_num(student_5_id_p) into selection_5;
    select get_selection_num(student_6_id_p) into selection_6;
    select get_selection_num(student_7_id_p) into selection_7;
    select get_selection_num(student_8_id_p) into selection_8;
    
    select get_class_standing(student_1_id_p) into standing_1;
    select get_class_standing(student_2_id_p) into standing_2;
    select get_class_standing(student_3_id_p) into standing_3;
    select get_class_standing(student_4_id_p) into standing_4;
    select get_class_standing(student_5_id_p) into standing_5;
    select get_class_standing(student_6_id_p) into standing_6;
    select get_class_standing(student_7_id_p) into standing_7;
    select get_class_standing(student_8_id_p) into standing_8;

	select get_rooming_group_selection_num(selection_1, selection_2, selection_3, selection_4, 
		selection_5, selection_6, selection_7, selection_8) into group_selection_num;
	select get_rooming_group_class_standing(standing_1, standing_2, standing_3, standing_4, 
		standing_5, standing_6, standing_7, standing_8) into group_class_standing;
        
	insert into rooming_group (selection_num, g_class_standing, student_1_id, student_2_id, student_3_id, 
    student_4_id, student_5_id, student_6_id, student_7_id, student_8_id) 
    values(group_selection_num, group_class_standing, student_1_id_p, student_2_id_p, student_3_id_p, 
    student_4_id_p, student_5_id_p, student_6_id_p, student_7_id_p, student_8_id_p);

		
end $$
DELIMITER ;

# updates every students rooming_group_id
delimiter $$
create trigger update_student_group_id
	after update on rooming_group
    for each row
begin
	declare group_id int;
    
    select new.rooming_group_id into group_id;

    update student 
		set s_rooming_group_id = group_id
		where s_rooming_group_id is null;

end $$
delimiter ;

# adds a preference to the table
delimiter $$
create procedure add_preference(
building_id_p varchar(9),
p_price_cat_p varchar(10),
location_p varchar(60),
rooming_group_id_p int
)
begin
	insert into preferences (building_id, p_price_cat, location, rooming_group_id)
    values (building_id_p, p_price_cat_p, location_p, rooming_group_id_p);
end $$
delimiter ;

# gets the rooming_group_id from a student
delimiter $$
create function get_rooming_group_id(
	student_id_p varchar(9)
)
returns int
deterministic
begin
	declare rooming_id int;
    
    select s_rooming_group_id into rooming_id from student where student_id = student_id_p;
    
    return rooming_id;
end $$
delimiter ;

# deletes a student from students and the rooming group
delimiter $$
create procedure delete_student(
student_id_p varchar(9)
)
begin

declare rooming_id int;

select get_rooming_group_id(student_id_p) into rooming_id;

if (select count(student_1_id) from rooming_group where student_1_id = student_id_p) = 1
then update rooming_group set student_1_id = null where rooming_group_id = rooming_id;
end if;
if (select count(student_2_id) from rooming_group where student_2_id = student_id_p) = 1
then update rooming_group set student_2_id = null where rooming_group_id = rooming_id;
end if;
if (select count(student_3_id) from rooming_group where student_3_id = student_id_p) = 1
then update rooming_group set student_3_id = null where rooming_group_id = rooming_id;
end if;
if (select count(student_4_id) from rooming_group where student_4_id = student_id_p) = 1
then update rooming_group set student_4_id = null where rooming_group_id = rooming_id;
end if;
if (select count(student_5_id) from rooming_group where student_5_id = student_id_p) = 1
then update rooming_group set student_5_id = null where rooming_group_id = rooming_id;
end if;
if (select count(student_6_id) from rooming_group where student_6_id = student_id_p) = 1
then update rooming_group set student_6_id = null where rooming_group_id = rooming_id;
end if;
if (select count(student_7_id) from rooming_group where student_7_id = student_id_p) = 1
then update rooming_group set student_7_id = null where rooming_group_id = rooming_id;
end if;
if (select count(student_8_id) from rooming_group where student_8_id = student_id_p) = 1
then update rooming_group set student_8_id = null where rooming_group_id = rooming_id;
end if;

delete from student where student_id = student_id_p;

end $$
delimiter ;

# trigger that updates the rooming group selection number and the class standing after delete
DELIMITER $$
create trigger update_group_after_delete
	after delete on rooming_group
    for each row
begin
    declare selection_1 int;
    declare selection_2 int;
    declare selection_3 int;
    declare selection_4 int;
    declare selection_5 int;
    declare selection_6 int;
    declare selection_7 int;
    declare selection_8 int;
	declare standing_1 int;
    declare standing_2 int;
    declare standing_3 int;
    declare standing_4 int;
    declare standing_5 int;
    declare standing_6 int;
    declare standing_7 int;
    declare standing_8 int;
    declare new_group_selection_num int;
    declare new_group_class_standing int;
    
    select get_selection_num(student_id_1) into selection_1 from rooming_group where selection_num = old.selection_num;
    select get_selection_num(student_id_2) into selection_2 from rooming_group where selection_num = old.selection_num;
    select get_selection_num(student_id_3) into selection_3 from rooming_group where selection_num = old.selection_num;
    select get_selection_num(student_id_4) into selection_4 from rooming_group where selection_num = old.selection_num;
    select get_selection_num(student_id_5) into selection_5 from rooming_group where selection_num = old.selection_num;
    select get_selection_num(student_id_6) into selection_6 from rooming_group where selection_num = old.selection_num;
    select get_selection_num(student_id_7) into selection_7 from rooming_group where selection_num = old.selection_num;
    select get_selection_num(student_id_8) into selection_8 from rooming_group where selection_num = old.selection_num;
    select get_class_standing(student_id_1) into standing_1 from rooming_group where selection_num = old.selection_num;
    select get_class_standing(student_id_2) into standing_2 from rooming_group where selection_num = old.selection_num;
    select get_class_standing(student_id_3) into standing_3 from rooming_group where selection_num = old.selection_num;
    select get_class_standing(student_id_4) into standing_4 from rooming_group where selection_num = old.selection_num;
    select get_class_standing(student_id_5) into standing_5 from rooming_group where selection_num = old.selection_num;
    select get_class_standing(student_id_6) into standing_6 from rooming_group where selection_num = old.selection_num;
    select get_class_standing(student_id_7) into standing_7 from rooming_group where selection_num = old.selection_num;
    select get_class_standing(student_id_8) into standing_8 from rooming_group where selection_num = old.selection_num;
    
    select get_rooming_group_selection_num(selection_1, selection_2, selection_3, selection_4, selection_5, selection_6,
    selection_7, selection_8) into new_group_selection_num;
    
    select get_rooming_group_class_standing(standing_1, standing_2, standing_3, standing_4, standing_5, standing_6,
    standing_7, standing_8) into new_group_class_standing;
    
	update rooming_group
		set selection_num = new_group_selection_num
        where selection_num = old.selection_num;
	update rooming_group
		set g_class_standing = new_group_class_standing
        where selection_num = old.selection_num;
end $$
delimiter ;

# add a student to an existing rooming group
delimiter $$
create procedure add_student_to_existing_group(
	student_id_p varchar(9),
    rooming_group_id_p int
)
add_student_to_existing_group: begin
	if (select student_1_id from rooming_group where rooming_group_id = rooming_group_id_p) is null
    then update rooming_group
			set student_1_id = student_id_p
            where rooming_group_id = rooming_group_id_p;
            leave add_student_to_existing_group;
	end if;
    if (select student_2_id from rooming_group where rooming_group_id = rooming_group_id_p) is null
    then update rooming_group
			set student_2_id = student_id_p
            where rooming_group_id = rooming_group_id_p;
            leave add_student_to_existing_group;
	end if;
    if (select student_3_id from rooming_group where rooming_group_id = rooming_group_id_p) is null
    then update rooming_group
			set student_3_id = student_id_p
            where rooming_group_id = rooming_group_id_p;
            leave add_student_to_existing_group;
	end if;
    if (select student_4_id from rooming_group where rooming_group_id = rooming_group_id_p) is null
    then update rooming_group
			set student_4_id = student_id_p
            where rooming_group_id = rooming_group_id_p;
            leave add_student_to_existing_group;
	end if;
    if (select student_5_id from rooming_group where rooming_group_id = rooming_group_id_p) is null
    then update rooming_group
			set student_5_id = student_id_p
            where rooming_group_id = rooming_group_id_p;
            leave add_student_to_existing_group;
	end if;
    if (select student_6_id from rooming_group where rooming_group_id = rooming_group_id_p) is null
    then update rooming_group
			set student_6_id = student_id_p
            where rooming_group_id = rooming_group_id_p;
            leave add_student_to_existing_group;
	end if;
    if (select student_7_id from rooming_group where rooming_group_id = rooming_group_id_p) is null
    then update rooming_group
			set student_7_id = student_id_p
            where rooming_group_id = rooming_group_id_p;
            leave add_student_to_existing_group;
	end if;
    if (select student_8_id from rooming_group where rooming_group_id = rooming_group_id_p) is null
    then update rooming_group
			set student_8_id = student_id_p
            where rooming_group_id = rooming_group_id_p;
            leave add_student_to_existing_group;
	else 
		select "This rooming group is already full!";
	end if;
    
    
end $$
delimiter ;

# trigger that adds a time slot to the table when a new rooming group is created
delimiter $$
create trigger time_slot_insert
	after insert on rooming_group
	for each row
begin
	declare selection_num_var int;
    
    select selection_num into selection_num_var from rooming_group where rooming_group_id = new.rooming_group_id;
    
    if (selection_num_var between 1000 and 2000)
    then insert into time_slot values (new.rooming_group_id, "2022-07-01 12:00:00" + interval 1 day + interval 1 hour);
    end if;
    if (selection_num_var between 2001 and 3000)
    then insert into time_slot values (new.rooming_group_id, "2022-07-01 12:00:00" + interval 1 day + interval 2 hour);
    end if;
    if (selection_num_var between 3001 and 4000)
    then insert into time_slot values (new.rooming_group_id, "2022-07-01 12:00:00" + interval 1 day + interval 3 hour);
    end if;
    if (selection_num_var between 4001 and 5000)
    then insert into time_slot values (new.rooming_group_id, "2022-07-01 12:00:00" + interval 1 day + interval 4 hour);
    end if;
    if (selection_num_var between 5001 and 6000)
    then insert into time_slot values (new.rooming_group_id, "2022-07-01 12:00:00" + interval 1 day + interval 5 hour);
    end if;
    if (selection_num_var between 6001 and 7000)
    then insert into time_slot values (new.rooming_group_id, "2022-07-01 12:00:00" + interval 1 day + interval 6 hour);
    end if;
    if (selection_num_var between 7001 and 8000)
    then insert into time_slot values (new.rooming_group_id, "2022-07-01 12:00:00" + interval 1 day + interval 7 hour);
    end if;
    if (selection_num_var between 8001 and 9000)
    then insert into time_slot values (new.rooming_group_id, "2022-07-01 12:00:00" + interval 1 day + interval 8 hour);
    end if;
    if (selection_num_var between 9001 and 9999)
    then insert into time_slot values (new.rooming_group_id, "2022-07-01 12:00:00" + interval 1 day + interval 9 hour);
    end if;

end $$
delimiter ;

# views a rooming group
delimiter $$
create procedure view_group(
	rooming_group_id_p int
)
begin
	select * from rooming_group where rooming_group_id = rooming_group_id_p;
end $$
delimiter ;

# testing
call add_student(123456789, "john", "doe", 2, 4829);
call add_student(123456788, "john", "dill", 2, 2829);
call add_student(123456787, "john", "bruh", 2, 1829);

call add_group(123456789, 123456788, 123456787, null, null, null, null, null);

call add_student(123456786, "john", "bro", 4, 4329);

call add_preference(null, null, null, 1);

call add_student_to_existing_group(123456786, 1);

call delete_student(123456789); 

select * from rooming_group;
select * from student;
select * from preferences;
select * from time_slot;
