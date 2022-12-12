SELECT * FROM nishu.emp_attrition;

#1 write an sql query to find the details of the employees under attrition having 5+ years of experience in between the age 27-35

select * from nishu.emp_attrition
where emp_age between 27 and 35
and YearsAtCompany > 5;

#2 Fetch the details of employees having max and min salary working in different departments who received less tham 13% hike

select jobrole, max(monthlyrate), min(monthlyrate)
from nishu.emp_attrition
where PercentSalaryHike < 13
group by jobrole
order by max(monthlyrate) desc;

#3 calculate the avg monthly income of all the employees who worked more tham 3 years whose education background is medical

select avg (monthlyrate)
from nishu.emp_attrition
where yearsatcompany > 3
and educationfield = 'medical'
group by educationfield;

#4 identify the total number of male and female employees under attrition whose marital status is married and haven't received promotion in last 2 years

select gender, count(employeenumber) as number_of_employees
from nishu.emp_attrition
where MaritalStatus = 'married'
and YearsSinceLastPromotion = 2 and attrition = 'yes'
group by gender;

#5 employees with max performance rating but no promotion for 4 years and above

select * from nishu.emp_attrition
where PerformanceRating = (select max(PerformanceRating) from nishu.emp_attrition)
and YearsSinceLastPromotion >= 4
order by PerformanceRating;

#6 who has max and min of percentage salary hike

select employeenumber, yearsatcompany, performancerating, yearssincelastpromotion, max(PercentSalaryHike), min(PercentSalaryHike)
from nishu.emp_attrition
group by yearsatcompany, performancerating, YearsSinceLastPromotion
order by max(PercentSalaryHike) desc, min(PercentSalaryHike) asc; 

#7 employees working overtime but given min salary hike and are more than 5years with the company

select * from nishu.emp_attrition
where overtime = 'yes'
and PercentSalaryHike = (select min(PercentSalaryHike)from nishu.emp_attrition)
and YearsAtCompany > 5;

#8 write an SQL query to check the min and max relationship satisfaction of employees

select maritalstatus, max(relationshipsatisfaction), min(relationshipsatisfaction)
from nishu.emp_attrition
group by maritalstatus;





