As a challenge to keep growing my SQL Skills I wanted to attempt the SQL Murder Mystery

The aim is to help detectives solve a fictional crime using SQL skills. The 'murder' took place on Jan 15th 2018 in SQL City.

-- ​murder​ ​Jan.15, 2018​ ​SQL City​.
select 
  * 
from 
  crime_scene_report 
where 
  type = 'murder' 
  and city = "SQL City" 
  and date = 20180115


select 
  name, 
  address_number, 
  address_street_name, 
  ssn 
from 
  person 
where 
  name like 'Annabel Miller' 
limit 
  10

  By iterating the query I was able to helped me narrow down to Annabel Miller as the first witness, now for the second one.

select 
  name, 
  address_number, 
  address_street_name, 
  ssn 
from 
  person 
where 
  address_street_name like 'Northwestern Dr' 
Order by 
  address_number DESC 
limit 
  10

This then gave me Morty as the second witness. 

After this it was time to view the interview statements, this was taken from this query.

select * 
from interview
where person_id = 14887 or person_id = 16371
limit 10

These gave us these key bits of infomation which were;
'membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".'
and
'I recognized the killer from my gym when I was working out last week on January the 9th.'

select 
  * 
from 
  get_fit_now_member as gf 
  inner join person as p on p.id = gf.person_id 
  inner join drivers_license as dl on dl.id = p.license_id 
where 
  gf.id like '48Z%' 
  and plate_number like '%H42W%' 
limit 
  10

Of gold members with '48Z..' this gave us two options of '
Joe Germuska or Jermey Bowers 

Narrowing down further led to Jeremy Bowers being the killer. 

There was then more infomation, which could led us to the person who hired Jeremy. 
The interview gave us the info of 
5'5 woman
red hair
tesla model S
Attended SQL Symphony Concert 3 times in Dec 2017

with concert as (
  select 
    *, 
    count(*) as sql_visits 
  from 
    facebook_event_checkin 
  where 
    date between 20171201 
    and 20171231 
    and event_name = 'SQL Symphony Concert' 
  group by 
    person_id 
  having 
    count(*) = 3
) 
select 
  * 
from 
  concert as c 
  inner join person as p on p.id = c.person_id 
  inner join drivers_license as dl on dl.id = p.license_id 
where 
  car_make = 'Tesla' 
  and car_model = 'Model S'

This finally led us to the leader, which was Miranda Priestly.





