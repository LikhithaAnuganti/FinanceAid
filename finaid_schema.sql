create database finaid;
use finaid;
show tables;


create table student (
student_id int auto_increment primary key,
student_name varchar(60),
university_enrolled varchar(200),
course_end_year int,
phone_number varchar(100),
registered_email varchar(60),
requirement varchar(50),
university_ranking int
);

alter table student
add column loan_type varchar(50),
add column loan_amt int,
add column loan_interest float;

SET SQL_SAFE_UPDATES = 0;

UPDATE student
SET loan_interest = '13.0'
WHERE course_end_year='2019';

desc student;
select * from student;

create table employees(
employee_id varchar(10) primary key,
employee_name varchar(60),
employee_role varchar(40),
employee_DOJ date,
employee_contact_no varchar(111),
employee_email varchar(100),
employee_address varchar(100)
);

desc employees;
select * from employees;
select distinct(employee_role) from employees;

create table feedback(
feedback_id int primary key,
student_id int,
FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE SET NULL,
status varchar(50),
rating varchar(90),
comments varchar(1000)
);

select * from feedback;
select distinct(status) from feedback;
select distinct(rating) from feedback;

create table inquiry(
inquiry_id int primary key,
student_id int,
FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE SET NULL,
status varchar(60),
reason varchar(500)
);

desc inquiry;
select * from inquiry;
select distinct(status) from inquiry;

create table transactions(
transaction_id varchar(11) primary key,
student_id int,
FOREIGN KEY (student_id) REFERENCES student(student_id) ON DELETE SET NULL,
transaction_amt int,
payment_method varchar(30),
transaction_date date
);

select * from transactions;
select distinct(payment_method) from transactions;

create table screening(
screening_officer_id varchar(10),
student_id int,
status varchar(20),
comments varchar(700),
FOREIGN KEY (screening_officer_id) REFERENCES employees(employee_id),
PRIMARY KEY(screening_officer_id,student_id),
FOREIGN KEY (student_id) REFERENCES student(student_id)
);


ALTER TABLE screening
MODIFY COLUMN status VARCHAR(60);

select * from screening;

select * from employees where employee_role like 'Advisor%';

create table advisors(
advisor_id varchar(10),
student_id int,
availability_status varchar(60),
FOREIGN KEY (advisor_id) REFERENCES employees(employee_id),
PRIMARY KEY(advisor_id,student_id),
FOREIGN KEY (student_id) REFERENCES student(student_id)
);

select * from advisors;

drop table bank_poc;

create table bank_poc(
bank_poc_id int primary key,
bank_name varchar(200),
uni_rank_preference varchar(60),
loan_type_offered varchar(60),
loan_min_interest float
);

select * from bank_poc;
desc bank_poc;

create table bank_onboarding(
bank_onb_offcr_id varchar(10),
bank_name varchar(200) REFERENCES bank_poc(bank_name),
status varchar(50),
primary key(bank_onb_offcr_id,bank_name),
foreign key(bank_onb_offcr_id) references employees(employee_id)
);

select * from bank_onboarding;
select distinct(status) from bank_onboarding;






