# Irish Constituencies Neo4j Database
###### Sean McGrath, G00316649

## Introduction
The Data base which I created contains a total of 556 nodes and is broken down in the following way, 491 Candidate, 40 Constituency, 19 Party, 5 PoliticalIdeology, 1 Parliament. All the different nodes are interconected with a variety of relationships. The Candidate nodes contain properties about each individual candidate, such as Name, Sex, Sitting_TD, Elected, Party and Constituency. The Constituency node contains information about each Constituency with the properties Name, Seats and Population. All of the candidates are connected to the Constituency nodes with the realationship 
```cypher (N)-[R:RAN_FOR_ELECTION_IN]->(M) ```. The Candidates are connected to the Parties with the realationship ```cypher (n)-[r:IS_A_MEMBER_OF]->(ff) ``` The candidates are then connected to the Parliament node once the property Elected = True. 
I wanted to examin the changing attidues in the irish voter and so see what political ideology has taken a greater hold. To achieve this each party has a property Position, which represents there stance on left-right political divide. The nodes PoliticalIdeology are conected to the parties and candidates which hold the same political views. Fine Gael and Fianna Fàil both fall into the category Centre-right and so both parties and candidates are connected through there political views.


## Database
In oroder to create my database, my first port of call was to find the information which would be used to create the nodes. 
####Constituency
The information for The Constituency nodes was found at [Wikipedia](https://en.wikipedia.org/wiki/List_of_political_parties_in_the_Republic_of_Ireland). On finding the information, I then wrote a Create statment and copied the information into a the Cypher files Constituency.xlsx and create-constituency.cypher. From there the queries were copied and pasted into Neo4j, this would be a pattern I would repeat through out the project. Each Constituency has the properties of Name, Popultation and Seats.
```cypher 
CREATE
	(gw:Constituency {Population: "150874",	Seats:"5", Name: "GalwayWest"});
```
####Candidate
The Candidate node was going to be the most important in the Database and would hold the most relevant information. Trying to find to the appropriate information was a bit of a chalange. My search for an API which could be used to pull the data directly into the project, was unsuccessful. So I settled for the manual way of pain stakingly coping and pasting the information into a Cypher files and then into Neo4j. The data which makes up the Candidate nodes was taken from [The Journal](http://www.thejournal.ie/election-2016/constituency/14/) and [Which Candidate](http://www.whichcandidate.ie/events/5/constituencies). The Candidate nodes contain the Proerties Name, Sex, Stting_TD, Elected, Constituency.
```cypher 
CREATE
	(SC:Candidate {Name:"Simon Coveney",Sex: "Male", Sitting_TD: "True",Elected: "True", Party: "Fine Gael",Constituency: "Cork SouthCentral"}),
```
Once the Candidate nodes were in, I ran a query which Matched the Candidate and Constituency based on them both sharing the same data.
```cypher 
MATCH (N:Candidate {Constituency: "Limerick County"}), (M:Constituency {Name: "Limerick County"})
CREATE
	(N)-[R:RAN_FOR_ELECTION_IN]->(M)
RETURN
	(R)
```
####Party
The Party nodes where next to be created, and they contained the properties Name And Position.
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
Next the Realationship was created between each and the Candidate and Party based on the properties Name in Party and Constituency in Candidate. 
```cypher
MATCH (sf:Party {Name: "Sinn Féin"}), (n:Candidate)
WHERE n.Party = 'Sinn Féin' OR n.Party = 'Sinn Fein'
CREATE
	(n)-[r:IS_A_MEMBER_OF]->(sf)
RETURN
	(r)
```
As you can see from the above query there was some inconsistancy with the data entry, so the use or the OR operator was needed to make sure all of the appropreate nodes where connceted. 
####Parliament
The Parliament node was created next and contains the property Name. 
```cypher
CREATE
(par:Parliament {Name:"Dáil Éireann"})
```
Then a query was used to match all the nodes with the Proerty Elected = True and create a realationship Member of Parliament.
```cypher
MATCH
(par:Parliament), (c:Candidate{Elected:"True"})
CREATE
(c)-[r:IS_AN_ELECTED_MEMBER_OF_PARLIAMENT]->(par)
RETURN
(r)
```
## Queries
Summarise your three queries here.
Then explain them one by one in the following sections.

#### Query one title
This query retreives the Bacon number of an actor...
```cypher
MATCH
	(Bacon)
RETURN
	Bacon;
```

#### Query two title
This query retreives the Bacon number of an actor...
```cypher
MATCH
	(Bacon)
RETURN
	Bacon;
```

#### Query three title
This query retreives the Bacon number of an actor...
```cypher
MATCH
	(Bacon)
RETURN
	Bacon;
```

## References
1. [Neo4J website](http://neo4j.com/), the website of the Neo4j database.
2. https://en.wikipedia.org/wiki/List_of_political_parties_in_the_Republic_of_Ireland
3. https://en.wikipedia.org/wiki/Parliamentary_constituencies_in_the_Republic_of_Ireland
4. http://www.whichcandidate.ie/events/5/constituencies
5. http://www.thejournal.ie/election-2016/constituency/14/
6. http://smartvote.ie/
