//This query Returns the shortestPath that connects Deirdre Wadding a Anti-Austerity Alliance People Before Profit 
//Candidate in Wexford with An Taoiseach Enda Kenny.
//The MATCH Statement returns the Candaidate nodes Enda Kenny and Deirdre Wadding which it selected using the name proerty.
//We then use the in built function shortestPath() to dertermine the shortest Path between the nodes. When returning the query,
//it is returned as an integer using LENGTH(RELATIONSHIPS()) Method and finaly we The Label DistanceFromAnTaoiseach using the 
//AS keyword.




MATCH 
(m:Candidate { Name:"Deirdre Wadding" }),(n:Candidate { Name:"Enda Kenny" }), 
p = shortestPath((m)-[*]-(n))
RETURN 
LENGTH(RELATIONSHIPS(p)) AS DistanceFromAnTaoiseach

