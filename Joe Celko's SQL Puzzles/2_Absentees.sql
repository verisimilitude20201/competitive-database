/**
This problem was presented on  Compuserve's MS Access forum. We have a table to track absentees of employees: 

CREATE TABLE ABSENTEEISM
(
    emp_id NOT NULL REFERENCES Personnel(emp_id),
    absentee_date DATE NOT NULL,
    reason_code CHAR(40) NOT NULL REFERENCES Excuselist(reason_code)
    severity_points INTEGER NOT NULL CHECK (severity_points BETWEEN 1 AND 4),
    PRIMARY KEY(emp_id, absentee_date)

)

The problem is to write queries for the below two business rules

1. If an employee accrues over 40-severity points in a one-year period, he will be discharged off his duties
2. If an employee is absent for more than one day in a row, its termed as a long-term illness. He/She does not accrue any point for the second, third and later days nor do they
count towards his absenteeism.

We can do whatever changes that seem fit to the schema to support these business rules.

**/

===>

/** 
    1. The  schema change that we need here is to change the range of severity_points from 0 to 4 instead of 1 to 4 in the CHECK clause. This is to account for 0 severity points for 
    long-term illness.

**/

CREATE TABLE ABSENTEEISM
(
    emp_id NOT NULL REFERENCES Personnel(emp_id),
    absentee_date DATE NOT NULL,
    reason_code CHAR(40) NOT NULL REFERENCES Excuselist(reason_code)
    severity_points INTEGER NOT NULL CHECK (severity_points BETWEEN 0 AND 4),
    PRIMARY KEY(emp_id, absentee_date)

)

/** Now to writing the SQL for the business rules **/

/*** 2. If an employee accrues over 40-severity points in a one-year period, he will be discharged off his duties  **/

DELETE FROM Personnel WHERE emp_id IN (
    SELECT ABSENTEEISM.emp_id
    FROM ABSENTEEISM INNER JOIN Personnel ON ABSENTEEISM.emp_id = Personnel.emp_id
    WHERE absentee_date BETWEEN DATE(NOW() - interval '1 YEAR') AND DATE(NOW())
    GROUP BY ABSENTEEISM.emp_id
    HAVING SUM(severity_points) >= 40
)

/* 
Above query does not disregard weekends or calendar holidays. If an employee takes a sick leave that overlaps with a weekend, the weekend also gets counted in the sick
leave. To prevent that, let's assume that there is a calendar table 
*/

/* 2.1 Calendar table tracks the days of an year and holidays and weekends. */

CREATE TABLE calendar (
    cal_date DATE NOT NULL PRIMARY KEY,
    date_type CHAR(20) CHECK (date_type IN 'WEEKEND', 'WORK-DAY', 'HOLIDAY')
);

DELETE FROM Personnel WHERE emp_id IN (
    SELECT ABSENTEEISM.emp_id
    FROM ABSENTEEISM INNER JOIN calendar ON ABSENTEEISM.cal_date = calendar.cal_date
    WHERE absentee_date BETWEEN DATE(NOW() - interval '1 YEAR') AND DATE(NOW()) AND calendar.date_type='WORK-DAY'
    GROUP BY ABSENTEEISM.emp_id
    HAVING SUM(severity_points) >= 40
)

/*** 
3. If an employee is absent for more than one day in a row, its termed as a long-term illness. He/She does not accrue any point for the second, third and later days nor do they
count towards his absenteeism.  
**/

UPDATE ABSENTEEISM SET severity_points=0, reason_code='long-term illness'
WHERE EXISTS (
    SELECT * FROM ABSENTEEISM A1, ABSENTEEISM A2 
    WHERE A1.emp_id = A2.emp_id AND A1.absentee_date = A2.absentee_date - INTERVAL '1 DAY'
);

/* 
Above query does not disregard weekends or calendar holidays. If an employee takes a sick leave that overlaps with a weekend, the weekend also gets counted in the sick
leave. To prevent that, let's assume that there is a calendar table 
*/

/* 3.1 Calendar table tracks the days of an year and holidays and weekends. */

CREATE TABLE calendar (
    cal_date DATE NOT NULL PRIMARY KEY,
    date_type CHAR(20) CHECK (date_type IN 'WEEKEND', 'WORK-DAY', 'HOLIDAY')
);

UPDATE ABSENTEEISM SET severity_points=0, reason_code='long-term illness'
WHERE EXISTS (
    SELECT * FROM ABSENTEEISM A1, calendar C1 
    WHERE  A1.absentee_date = C1.cal_date - INTERVAL '1 DAY' AND C1.date_type='WORK-DAY'
);

/** 
4. We need to add on ON DELETE CASCADE to Personnel table. This is because in the delete query in point 2, we are deleting data from personnel table for offending employees
but we are not deleting their child records for eg in Absenteeism. 

**/


CREATE TABLE ABSENTEEISM
(
    emp_id NOT NULL REFERENCES Personnel(emp_id) ON DELETE CASCADE,
    absentee_date DATE NOT NULL,
    reason_code CHAR(40) NOT NULL REFERENCES Excuselist(reason_code)
    severity_points INTEGER NOT NULL CHECK (severity_points BETWEEN 0 AND 4),
    PRIMARY KEY(emp_id, absentee_date)

)