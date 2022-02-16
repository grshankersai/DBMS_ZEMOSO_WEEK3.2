-- FINAL Assignment

-- Sol-1:
select EventPlan.eventno, dateheld , COUNT(*) as EVENTPLANSCOUNT 
from EVENTREQUEST inner join EventPlan on EVENTREQUEST.eventno = EventPlan.eventno
where  EventPlan.workdate between '2018-12-01' and '2018-12-31'
group by EventPlan.eventno
having count(*)>1;

-- Sol-2
select * from eventplan;
select planno ,  eventplan.eventno , workdate , activity from eventplan inner join EventRequest on eventplan.eventno = EventRequest.eventno 
inner join Facility on facility.facno = EventRequest.facno
where workdate between '2018-12-01' and '2018-12-31' and Facility.facname = 'Basketball arena';

-- Sol-3
select EventRequest.eventno , dateheld , status , estcost 
from EventRequest inner join EventPlan on EventRequest.eventno = EventPlan.eventno inner join Employee on Employee.empno = Eventplan.empno
inner join Facility on Facility.facno = EventRequest.facno where Employee.empname = 'Mary Manager' and EventRequest.dateheld between '2018-10-01' and '2018-12-31';

-- Sol-4:
select EventPlanLine.planno , lineno , ResourceTbl.resname , numberfld , location.locname , timestart , timeend 
from EventPlanLine inner join Location on EventPlanLine.locno = Location.locno inner join ResourceTbl on ResourceTbl.resno = EventPlanLine.resno
inner join Facility on Facility.facno = Location.facno inner join EventPlan on EventPlan.planno = EventPlanLine.planno where (Facility.facname = 'Basketball arena') and 
(EventPlan.activity = 'Operation') and (EventPlan.workdate between '2018-10-01' and '2018-12-31');

-- Insert Queries..

-- Sol-1
insert into Facility Values ('F104' , 'Swimming Pool');

-- sol-2
insert into location values ('L107', 'F104','Door');

-- sol-3
insert into location values ('L108', 'F104','Locker ROOm');

-- sol-4
SET SQL_SAFE_UPDATES = 0;
UPDATE location set locname = 'Gate' where locno = 'L107';
SET SQL_SAFE_UPDATES = 1;
select * from location;

-- sol-5
delete from location where locno = 'L108';

-- Error Rectification::
SELECT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, facility, eventplan
WHERE (estaudience > 5000)
  AND (eventplan.empno = employee.empno )
  AND (eventrequest.facno = facility.facno)
  AND (facname = 'Football stadium') 
  AND (empname = 'Mary Manager');


-- 2
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, eventplan
WHERE estaudience > 4000
  AND eventplan.eventno = eventrequest.eventno ;
  
-- 3
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, facility, eventplan
WHERE estaudience > 5000
  AND eventplan.empno = employee.empno 
  AND eventrequest.facno = facility.facno
  AND eventplan.eventno = eventrequest.eventno 
  AND facname = 'Football stadium' ;
  
  -- 4
  SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, facility, eventplan
WHERE estaudience > 5000
 
  AND eventrequest.facno = facility.facno
  AND eventplan.eventno = eventrequest.eventno 
  AND facname = 'Football stadium' ;
-- 5
SELECT eventplan.planno, lineno, resname, numberfld, timestart, timeend
    FROM eventrequest, facility, eventplan, 
eventplanline, resourcetbl
     WHERE estaudience = '10000'
AND( eventplan.planno = eventplanline.planno)
 AND (eventrequest.facno = facility.facno)
 AND (facname = 'Basketball arena')
 AND  (eventplanline.resno = resourcetbl.resno)
AND (eventrequest.eventno = eventplan.eventno );































