/* Ex1 */
SELECT count(*) as totalFlights FROM usairlineflights2.flights;

/*Ex2*/
SELECT flights.origin, avg(flights.ArrDelay) as prom_arribades , avg(DepDelay) as prom_Ret_Sortides FROM flights group by flights.origin;

/*Ex3*/
SELECT flights.Origin, flights.colYear, flights.colMonth, avg(flights.ArrDelay) as prom_Ret_Sortides FROM flights  group by flights.Origin, flights.colYear, flights.colMonth order by Origin;

/*Ex4*/
SELECT usairports.Airport, flights.colYear, flights.colMonth, avg(flights.ArrDelay) as prom_Ret_Sortides FROM flights, usairports  group by flights.Origin, flights.colYear, flights.colMonth order by flights.Origin, flights.colYear, flights.colMonth;

/*Ex5*/  
SELECT carriers.CarrierCode, flights.colYear, flights.colMonth, avg(flights.ArrDelay) as prom_Ret_Sortides,
		sum(flights.Cancelled) as total_cancelled
	FROM flights, carriers
    where flights.Cancelled=1 and carriers.CarrierCode=flights.UniqueCarrier
    group by flights.Origin, flights.colYear, flights.colMonth 
    order by flights.Origin, flights.colYear, flights.colMonth;

SELECT carriers.CarrierCode, flights.colYear, flights.colMonth, avg(flights.ArrDelay) as prom_Ret_Sortides,
		sum(flights.Cancelled) as total_cancelled
	FROM flights, carriers
    where flights.Cancelled=1 and carriers.CarrierCode=flights.UniqueCarrier
    group by flights.UniqueCarrier, flights.colYear, flights.colMonth 
    order by flights.Origin, flights.colYear, flights.colMonth;


/*Ex6*/
select flights.tailnum, SUM(flights.distance) as total_distance
	from flights
     where flights.tailnum<>'' 
      group by flights.TailNum 
    order by total_distance desc
    limit 10
    ;

    
/*Ex7*/
/*select carriers.CarrierCode, avg(flights.ArrDelay) as prom_Ret_Sortides	
	FROM flights, carriers  
    where carriers.CarrierCode=flights.UniqueCarrier
    group by carriers.CarrierCode
    ;  */
select carriers.CarrierCode, avg(flights.ArrDelay) as prom_Ret_Sortides	
	FROM flights, carriers 
    where carriers.CarrierCode=flights.UniqueCarrier 
    group by carriers.CarrierCode
    having prom_Ret_Sortides > 10
    order by prom_Ret_Sortides desc
    ; 

