/*
The first of Joe Celko's problems asks to consider below table 

create table Fiscal_year (
 fiscal_year int primary key, 
 start_date DATE
 end_date DATE

)

It asks to add all constraints applicable such that this table stores valid US fiscal year data.


*/

====> 

/*** 
A US fiscal year starts on 1st of October and ends on 30th of September of the following year
For example: 

Fiscal year 2016 => 01-10-2015 to 30-09-2016
Fiscal year 2017 => 01-10-2016 to 30-09-2017

So this table will require below constraints

1. NOT NULL constraint for all columns
2. Fiscal year to be primary key
3. Valid start date: This 
    a. Extracts the YEAR of start_date and checks if its one less than the fiscal year. This is because if the fiscal year is 2016, the start_date is of previous year - 01-10-2015
    b. Extracts month of start date and checks if it is equal to 10
    c. Extracts day of start date and checks if its equal to 01

4. Valid end date: 
    a. Extracts the YEAR of end_date and checks if its equal to the fiscal year. This is because if the fiscal year is 2016, the end_date is - 30-09-2016
    b. Extracts month of end_date and checks if it is equal to 09
    c. Extracts day of end_date and checks if its equal to 30

Below is the corresponding table in PostgreSQL with all constraints added :-

***/

create table Fiscal_year (
 fiscal_year int primary key, 
 start_date DATE not null,
 constraint VALID_START_DATE check(fiscal_year = date_part ('year', start_date) + 1 and '10' = date_part('month', start_date) and '01' = date_part('day', start_date)),
 end_date DATE not null,
 constraint VALID_END_DATE check(fiscal_year = date_part('year', end_date) and '09' = date_part('month', end_date) and '30' = date_part('day', end_date))
);

/** First two queries work **/

insert into fiscal_year (fiscal_year, start_date, end_date) values ('2016', '2015-10-01', '2016-09-30');
insert into fiscal_year (fiscal_year, start_date, end_date) values ('2017', '2016-10-01', '2017-09-30');

/** Third INSERT query fails with a constraint violation error since end_date is 30-08-2017 **/
insert into fiscal_year (fiscal_year, start_date, end_date) values ('2017', '2016-10-01', '2017-08-30');

