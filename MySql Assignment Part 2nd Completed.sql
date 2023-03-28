use assignments;
SELECT * FROM employee
WHERE deptno = 10 and salary > 3000;

#Q2
select *,
	   CASE
			WHEN marks BETWEEN 40 AND 49.99 THEN 'Third Class'
            WHEN marks BETWEEN 50 AND 59.99 THEN 'First Class'
            WHEN marks BETWEEN 60 AND 79.99 THEN 'Second Class'
            WHEN marks BETWEEN 80 AND 100 THEN 'Distinction'
            ELSE 'Failed'
		END as Grade        
	from students;
   select* from students;
   
#Q2 A)
ALTER TABLE students
ADD COLUMN Grade varchar(20) after marks;


UPDATE students
	SET Grade = 
	   CASE
			WHEN marks BETWEEN 40 AND 49.99 THEN 'Third Class'
            WHEN marks BETWEEN 50 AND 59.99 THEN 'First Class'
            WHEN marks BETWEEN 60 AND 79.99 THEN 'Second Class'
            WHEN marks BETWEEN 80 AND 100 THEN 'Distinction'
            ELSE 'Failed'
		END;
        
select count(Grade) as 'Students graduated with First Class'
from students
where Grade regexp 'First';

#Q2) B)
select count(Grade) as 'Students graduated with Distinction'
from students
where Grade regexp 'Dist';
        
#Q3)
SELECT distinct city FROM station 
WHERE id %2=0;
    
#Q4)
select count(city) as 'Total no of Cities'
from station;

select count(distinct city) as 'No of Distinct Cities'
from station;
    
select count(city) - count( distinct city) as 'Difference Between Number of Distinct and All Cities'
from station;

#Q5)
#A)
select city
FROM station
where city regexp '^a|^e|^i|^o|^u'
GROUP BY city
order by city;

#B)
select city
FROM station
where city regexp '^a|^e|^i|^o|^u' AND
city regexp 'a$|e$|i$|o$|u$'
GROUP BY city
order by city;
                
#C)
select city
FROM station
where city Not regexp '^a|^e|^i|^o|^u'
GROUP BY city
order by city;
			
#D)
select city
FROM station
where city not regexp '^a|^e|^i|^o|^u' AND
city not regexp 'a$|e$|i$|o$|u$'
GROUP BY city
order by city;

#Q6)

select concat(first_name,'  ',last_name) as employee_name,
 salary,hire_date,
timestampdiff (MONTH, hire_date, current_date()) as 'Total_Months_Joined'
from emp
where salary >2000
having Total_Months_Joined<36
order by salary desc;
   

#Q7)
    
select deptno,sum(salary)    
from employee 
group by deptno;    

#Q8)

select count(*)from city 
where population > 100000;

#Q9)

select district , sum(population) as total_population
from city  
where district= 'california'
group by district;  

#Q10)

select * from city;
select  district, avg(population) as avg_population 
from city
group by district;

#Q11)

select o.ordernumber, 
       o.status, 
       o.customernumber, 
       c.customername, 
       o.comments
from customers c 
JOIN orders o USING (customernumber)
Where o.status = 'Disputed';


SET SQL_SAFE_UPDATES =0 ;
SET GLOBAL log_bin_trust_function_creators = 1; 