summer of sql
python charmers

-- ​murder​ ​Jan.15, 2018​ ​SQL City​.
select *
from crime_scene_report
where type = 'murder' and city = "SQL City" and date = 20180115

//Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". 
The second witness, named Annabel, lives somewhere on "Franklin Ave".

select 
name,
address_number,
address_street_name,
ssn
from person 
where name like 'Annabel Miller'
limit 10

-- Annabel SSN = 318771143
-- id = 14887


select 
name,
address_number,
address_street_name,
ssn
from person 
where address_street_name like 'Northwestern Dr'
Order by address_number DESC
limit 10

--Morty SSN = 111564949
--id = 16371

select * 
from interview
where person_id = 14887 or person_id = 16371
limit 10

--membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".
--I recognized the killer from my gym when I was working out last week on January the 9th.

--Joe Germuska = 48Z7A
--Jermey Bowers = 48Z55

select *
from get_fit_now_member as gf
inner join person as p on p.id = gf.person_id
inner join drivers_license as dl on dl.id = p.license_id
where gf.id like '48Z%'
and plate_number like '%H42W%'
limit 10

--killer person id = 67318

--5'5 woman
--red hair
--tesla model S
--SQL Symphony Concert Dec 2017

with concert as (
select *,
count(*) as sql_visits
from facebook_event_checkin
where date between 20171201 and 20171231
and event_name = 'SQL Symphony Concert'
group by person_id
having count(*) = 3
)

select *
from concert as c
inner join person as p
on p.id = c.person_id 
inner join drivers_license as dl on dl.id = p.license_id
where car_make = 'Tesla' and car_model = 'Model S'




              
              



              
