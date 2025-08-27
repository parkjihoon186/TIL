-- 22-one-to-one.sql
USE lecture;

CREATE TABLE employees(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  hire_date DATE NOT NULL
);

CREATE TABLE employee_details(
  emp_id INT PRIMARY KEY,
  social_number VARCHAR(20) UNIQUE,
  address TEXT,
  salary DECIMAL(20),
  FOREIGN KEY (emp_id) REFERENCES employees(id) ON DELETE CASCADE
);

INSERT INTO employees VALUES
(1, '김철수', '2023-01-01'),
(2, '이영희', '2023-02-01'),
(3, '박민수', '2023-03-01');

INSERT INTO employee_details VALUES
(1, '123456-1234567', '서울시 강남구', 5000000),
(2, '234567-2345678', '서울시 서초구', 4500000),
(3, '345678-3456789', '부산시 해운대', 4000000);

select * from employee_details;

#'김철수'의 주소?
-- [직원테이블에서 이름이 '김철수'인 사람과 id]가 같은 ed 테이블 주소 

select address from employee_details 
where emp_id=(select id from employees where name='김철수');

select ed.address
from employees e
inner join employee_detail ed on e.id = ed.emp_id
where name ='김철수'
