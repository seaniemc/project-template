// This query calculates the Average number of people represented by each dail seat
//
// First we MATCH the nodes Constituency, then we use the built in function avg() to sum all the instances the property 
// of Population And Seats and return there Overall Average. We then Divide the 2 results by each other the get the 
//The average number of people per Dàil seat.


MATCH 
    (n:Constituency)
RETURN 
    avg(n.Population) / avg(n.Seats) AS AveragePeoplePerDailSeat