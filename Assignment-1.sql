-- Assignment-1
-- sol-1
select EventRequest.eventno, EventRequest.dateheld ,EventRequest.custno , Customer.custname , EventRequest.facno , Facility.facname  
from EventRequest , Customer , Facility
where (EventRequest.facno = Facility.facno and EventRequest.custno = Customer.custno) and
(Customer.city = 'Boulder') and (EventRequest.dateheld between '2018-01-01' and '2018-12-31');

-- sol-2
select Customer.custno , custname,eventno,dateheld,Facility.facno,facname,(estcost/estaudience) as EstimatedAudienceCostPerPerson
from EventRequest , Customer , Facility
where (EventRequest.facno = Facility.facno and EventRequest.custno = Customer.custno) and
(EventRequest.dateheld between '2018-01-01' and '2018-12-31') and ((estcost/estaudience)<0.2);

-- sol-3
select Customer.custno,custname,sum(estcost) as EstCostForApprovedEVE 
from Customer inner join EventRequest on Customer.custno = EventRequest.custno
where Status = 'Approved'
group by Customer.custno , custname;

-- sol - 4
insert into customer values ('C9999999', 'Michael Mannino', '123 Any Street', 'Y', 'Self', '720000','Denver', 'CO', '80204');
select * from customer;
-- sol-5:
SET SQL_SAFE_UPDATES = 0;
update ResourceTbl set rate = rate*1.1 where resname='nurse';
SET SQL_SAFE_UPDATES = 1;

-- sol-6:
DELETE FROM Customer WHERE CustNo = 'C9999999';

               
               



