# Irish Constituencies Neo4j Database
###### Sean McGrath, G00316649

## Introduction
The Data base which I created contains a total of 556 nodes and is broken down in the following way, 491 Candidate, 40 Constituency, 19 Party, 5 PoliticalIdeology, 1 Parliament. All the different nodes are interconnected with a variety of relationships. The Candidate nodes contain properties about each individual candidate, such as Name, Sex, Sitting_TD, Elected, Party and Constituency. The Constituency node contains information about each Constituency, with the properties Name, Seats and Population. All of the candidates are connected to the Constituency nodes with the relationship 
```cypher (N)-[R:RAN_FOR_ELECTION_IN]->(M) ```. The Candidates are connected to the Parties with the relationship ```cypher (n)-[r:IS_A_MEMBER_OF]->(ff) ``` The candidates are then connected to the Parliament node once the property Elected = True. 
I wanted to examine the changing attitudes in the Irish voter and to see what political ideology has taken a greater hold. To achieve this each party has a property Position, which represents there stance on left-right political divide. The nodes, PoliticalIdeology are connected to the parties and candidates, which hold the same political views. Fine Gael and Fianna Fàil both fall into the category Centre-right and so both parties and candidates are connected through their political views.


## Database
In order to create my database, my first port of call was to find the information which would be used to create the nodes. Apon finding the informarion, I applied it in the following way.
####Constituency
The information for The Constituency nodes was found at [Wikipedia](https://en.wikipedia.org/wiki/List_of_political_parties_in_the_Republic_of_Ireland). On finding the information, I then wrote a Create statement and copied the information into the files Constituency.xlsx and create-constituency.cypher. From there the queries were copied and pasted into Neo4j, this would be a pattern I would repeat through-out the project. Each Constituency has the properties of Name, Population and Seats.
```cypher 
CREATE
	(gw:Constituency {Population: "150874",	Seats:"5", Name: "GalwayWest"});
```
####Candidate
The Candidate node was going to be the most important in the Database, as it would hold the most relevant information. Trying to find to the appropriate information was a bit of a challenge. My search for an API which could be used to pull the data directly into the project, was unsuccessful. So I settled for the manual pain staking way, of coping and pasting the information into a Cypher files and then into Neo4j. The data which makes up the Candidate nodes was taken from [The Journal](http://www.thejournal.ie/election-2016/constituency/14/) and [Which Candidate](http://www.whichcandidate.ie/events/5/constituencies). The Candidate nodes contain the Proerties Name, Sex, Stting_TD, Elected, Constituency.
```cypher 
CREATE
	(SC:Candidate {Name:"Simon Coveney",Sex: "Male", Sitting_TD: "True",Elected: "True", Party: "Fine Gael",Constituency: "Cork SouthCentral"}),
```
Once the Candidate nodes were in, I ran a query which matched the Candidate and Constituency based on them both sharing the same data.
```cypher 
MATCH (N:Candidate {Constituency: "Limerick County"}), (M:Constituency {Name: "Limerick County"})
CREATE
	(N)-[R:RAN_FOR_ELECTION_IN]->(M)
RETURN
	(R)
```
####Party
The Party nodes where next to be created, and they contained the properties Name and Position. The Information used was taken from [Wikipedia](https://en.wikipedia.org/wiki/List_of_political_parties_in_the_Republic_of_Ireland)
```cypher 
CREATE
    (FG:Party {Name:"Fine Gael", Position:"Centre-right"}),
    (FF:Party {Name:"Fianna Fáil", Position:"Centre-right"}),  
    (RI:Party {Name:"Renua Ireland", Position:"Right-Wing"}),
    (DDL:Party {Name:"Direct Democracy Ireland", Position:"Right-wing"}),
    (CD:Party {Name:"Catholic Democrats", Position:"Right-wing"});
    (LP:Party {Name: "Labour Party", Position:"Centre-left"}),
    (SD:Party {Name:"Social Democrats", Position:"Centre-left"}),
```
Next the Relationship was created between each and the Candidate and Party based on the properties Name in Party and Constituency in Candidate. 
```cypher
MATCH (sf:Party {Name: "Sinn Féin"}), (n:Candidate)
WHERE n.Party = 'Sinn Féin' OR n.Party = 'Sinn Fein'
CREATE
	(n)-[r:IS_A_MEMBER_OF]->(sf)
RETURN
	(r)
```
As you can see from the above query there was some inconsistency with the data entry, so the use or the OR operator was needed to make sure all of the appropriate nodes were connected. 
####Parliament
The Parliament node was created next and contains the property Name. 
```cypher
CREATE
(par:Parliament {Name:"Dáil Éireann"})
```
Then a query was used to match all the nodes with the Property Elected = True and create a relationship Member of Parliament.
```cypher
MATCH
(par:Parliament), (c:Candidate{Elected:"True"})
CREATE
(c)-[r:IS_AN_ELECTED_MEMBER_OF_PARLIAMENT]->(par)
RETURN
(r)
```
####PoliticalIdeology
The PoliticalIdeology node is used to add different relationships which go beyond Party and Constituency. It is based on the Political position each individual party is aligned to. Firstly the node was created using.
```cypher
CREATE
    (fl:PoliticalIdeology{Name: "Far-left"}),
    (lw:PoliticalIdeology{Name: "Left-wing"}),
    (lw:PoliticalIdeology{Name: "Centre-left"}),
    (lw:PoliticalIdeology{Name: "Centre-right"}),
    (lw:PoliticalIdeology{Name: "Right-wing"});
```
We use the properties Name from Party and Name from PoliticalIdeology to connect the nodes. 
```cypher
 MATCH 
 (p:Party), (pi:PoliticalIdeology)
 WHERE 
 p.Position = 'Far-left' AND pi.Name = 'Far-left'
 CREATE 
 (p)-[r:SHARE_THE_SAME_IDEOLOGY]->(pi)   
 RETURN 
 r 
```
And finally we connect each candidate to a political ideology.
```cypher
 MATCH 
 (c:Candidate), (pi:PoliticalIdeology)
 WHERE 
 c.Party = 'Sinn Fèin' AND pi.Name = 'Left-wing'
 CREATE 
 (c)-[r:HAVE_A_LEFT_WING_IDEOLOGY]->(pi)   
 RETURN 
 r 
```
## Queries
My three queries examine the different capabilities that Neo4j has to offer. My first query was based around relationships and how you can retrieve different information based on a variety of parameters. The second looks at Aggregation functions provided by Neo4j. The query returns an average population per Dàil seat. Finally, the third looks at the Shortestpath() function. 

#### Changing attitudes in the Irish Voter
This query matches the candidates who’s party has a Centre-left political ideology and where the candidates where elected members of Dàil Eireann and Lost their seats in the General election. 
The point of the Query, is to highlight the huge losses the labour party suffered in the general election. The MATCH statement, matches any candiadtes with the realtionship ```cypher (n)-[r:HAS_A_CENTRE_LEFT_IDEOLOGY]->(pi) ``` Where they were sitting TD's but were not relected. And returns the query as an interger value with the Label Seatslost. 
The second Query is in the same vain but it highlights the shift in political views from Centre-left to Far-left. The query is also returned as a integer with the Label Seatswon.

```cypher
MATCH (n)-[r:HAS_A_CENTRE_LEFT_IDEOLOGY]->(pi)
WHERE n.Sitting_TD = 'True' AND n.Elected = 'False'
RETURN count(n) AS SeatsLost;

MATCH (c)-[r:HAS_A_FAR_LEFT_IDEOLOGY]->(pi)
WHERE c.Sitting_TD = 'False' AND c.Elected = 'True'
RETURN count(c) AS SeatsWon;
```

#### Average People per Dàil seat
This query calculates the Average number of people represented by each dail seat...
First we MATCH the nodes Constituency, then we use the built in function avg() to sum all the instances the property 
of Population And Seats and return their Overall Average. We then Divide the 2 results by each other the get the 
The average number of people per Dàil seat.
```cypher
MATCH 
    (n:Constituency)
RETURN 
    avg(n.Population) / avg(n.Seats) AS AveragePeoplePerDailSeat
```
<http://neo4j.com/docs/stable/query-aggregation.html>
#### Distance from An Taoiseach
This query Returns the shortestPath that connects Deirdre Wadding a unelcted Anti-Austerity Alliance People Before Profit 
Candidate in Wexford, with An Taoiseach Enda Kenny.
The MATCH Statement returns the Candidate nodes Enda Kenny and Deirdre Wadding which it selected using the name property.
We then use the in built function shortestPath() to dertermine the shortest Path between the nodes. When returning the query,
it is returned as an integer using LENGTH(RELATIONSHIPS()) Method and finally we The Label DistanceFromAnTaoiseach using the 
AS keyword.

```cypher
MATCH 
(m:Candidate { Name:"Deirdre Wadding" }),(n:Candidate { Name:"Enda Kenny" }), 
p = shortestPath((m)-[*]-(n))
RETURN 
LENGTH(RELATIONSHIPS(p)) AS DistanceFromAnTaoiseach;
```
<http://neo4j.com/docs/milestone/query-match.html>
## References
2. <https://en.wikipedia.org/wiki/List_of_political_parties_in_the_Republic_of_Ireland>
3. <https://en.wikipedia.org/wiki/Parliamentary_constituencies_in_the_Republic_of_Ireland>
4. <http://www.whichcandidate.ie/events/5/constituencies>
5. <http://www.thejournal.ie/election-2016/constituency/14/>
6. <http://smartvote.ie/>
7. <http://neo4j.com/docs/milestone/query-match.html>
8. <http://neo4j.com/docs/stable/query-aggregation.html>
