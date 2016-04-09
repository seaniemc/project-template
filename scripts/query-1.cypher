// This query matches the candidates whos party has a centre right political ideology and where the candidates where elected members of 
// Dàil Eireann and Lost there seats in the General election. The result set is returned as a number.
// The point of the Query is to highlight the huge losses the labour party suffered in the general election. 
//The second Query is in the same vain but it highlights the shift in political views from centre left to Far-left


MATCH (n)-[r:HAS_A_CENTRE_LEFT_IDEOLOGY]->(pi)
WHERE n.Sitting_TD = 'True' AND n.Elected = 'False'
RETURN count(n) AS SeatsLost;

MATCH (c)-[r:HAS_A_FAR_LEFT_IDEOLOGY]->(pi)
WHERE c.Sitting_TD = 'False' AND c.Elected = 'True'
RETURN count(c) AS SeatsWon;

