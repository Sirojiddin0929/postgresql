create table datatype_test (
    id serial primary key,            
    full_name varchar(50),             
    description text,                   
    age int,                            
    salary numeric(10,2),              
    is_active boolean,                  
    created_at timestamp default now(), 
    birth_date date,                    
    meeting_time time,                  
    uuid_val uuid,                     
    json_data json,                     
    rating real                        
);
insert into datatype_test 
(full_name, description, age, salary, is_active, birth_date, meeting_time, uuid_val, json_data, rating)
values
('Ali Valiyev', 'Test foydalanuvchi', 25, 1234.56, true, '2000-05-12', '14:30:00',
 gen_random_uuid(), '{"lang":"uz","level":"beginner"}', 4.5);
select * from datatype_test