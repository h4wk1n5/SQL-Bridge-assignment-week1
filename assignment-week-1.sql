use flights;


/*  1. The furthest distance away is Honolulu Intl 
Honolulu Intl	HNL	4983
*/

select  a.name,f.dest,max(distance) from flights f join airports a on f.dest = a.faa
group by 1,2
order by 3 desc
limit 1;

/* 2.  different number of engines: the different numbers of engines are 1 to 4 
1
2
3
4
*/

select distinct engines from planes order by 1 ;

/*2. Most number of seats per engine number

# engines, max(seats)
'1', '16'
'3', '379'
'2', '400'
'4', '450'

 */

select engines, max(seats) from planes
group by engines
order by 2;

/* 3. total number of flights
# count(*)
'336776'

*/

select count(*) from flights;

/* 4.  total number of flights by airline (carrier) 

# carrier, count(*)
'9E', '18460'
'AA', '32729'
'AS', '714'
'B6', '54635'
'DL', '48110'
'EV', '54173'
'F9', '685'
'FL', '3260'
'HA', '342'
'MQ', '26397'
'OO', '32'
'UA', '58665'
'US', '20536'
'VX', '5162'
'WN', '12275'
'YV', '601'

 */

select carrier, count(*) from flights group by carrier;

/* 5.   airlines, ordered by number of flights in descending order. 

# name, carrier, count(*)
'United Air Lines Inc.\r', 'UA', '58665'
'JetBlue Airways\r', 'B6', '54635'
'ExpressJet Airlines Inc.\r', 'EV', '54173'
'Delta Air Lines Inc.\r', 'DL', '48110'
'American Airlines Inc.\r', 'AA', '32729'
'Envoy Air\r', 'MQ', '26397'
'US Airways Inc.\r', 'US', '20536'
'Endeavor Air Inc.\r', '9E', '18460'
'Southwest Airlines Co.\r', 'WN', '12275'
'Virgin America\r', 'VX', '5162'
'AirTran Airways Corporation\r', 'FL', '3260'
'Alaska Airlines Inc.\r', 'AS', '714'
'Frontier Airlines Inc.\r', 'F9', '685'
'Mesa Airlines Inc.\r', 'YV', '601'
'Hawaiian Airlines Inc.\r', 'HA', '342'
'SkyWest Airlines Inc.\r', 'OO', '32'



 */

select a.name,f.carrier, count(*) from  flights f join airlines a on f.carrier = a.carrier  group by carrier order by 3 desc;

/* 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.

# name, carrier, count(*)
'United Air Lines Inc.\r', 'UA', '58665'
'JetBlue Airways\r', 'B6', '54635'
'ExpressJet Airlines Inc.\r', 'EV', '54173'
'Delta Air Lines Inc.\r', 'DL', '48110'
'American Airlines Inc.\r', 'AA', '32729'


*/

select a.name,f.carrier, count(*) from  flights f join airlines a on f.carrier = a.carrier  group by carrier order by 3 desc limit 5;

/*  7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
flights in descending order.  

# name, carrier, count(*)
'United Air Lines Inc.\r', 'UA', '41135'
'JetBlue Airways\r', 'B6', '30022'
'Delta Air Lines Inc.\r', 'DL', '28096'
'American Airlines Inc.\r', 'AA', '23583'
'ExpressJet Airlines Inc.\r', 'EV', '6248'



*/

select a.name, f.carrier, count(*) from  flights f join airlines a on f.carrier = a.carrier where  distance >= 1000 group by carrier  order by 3 desc limit 5;


/* 8. What is the average departure delay per carrier originating from Newark Airport EWR 

# name, carrier, avg(dep_delay)
'Alaska Airlines Inc.\r', 'AS', '5.8048'
'American Airlines Inc.\r', 'AA', '10.0354'
'Delta Air Lines Inc.\r', 'DL', '12.0846'
'Endeavor Air Inc.\r', '9E', '5.9517'
'Envoy Air\r', 'MQ', '17.4673'
'ExpressJet Airlines Inc.\r', 'EV', '20.1649'
'JetBlue Airways\r', 'B6', '13.1003'
'SkyWest Airlines Inc.\r', 'OO', '20.8333'
'Southwest Airlines Co.\r', 'WN', '17.8644'
'United Air Lines Inc.\r', 'UA', '12.5229'
'US Airways Inc.\r', 'US', '3.7351'
'Virgin America\r', 'VX', '11.9274'


*/

select a.name,f.carrier,avg(dep_delay) from flights f join airlines a on f.carrier = a.carrier where origin like 'EWR'
group by 1,2;