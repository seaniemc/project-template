# Irish Constituencies Neo4j Database
###### Sean McGrath, G00316649

## Introduction
The Data base which I created contains a total of 556 nodes and is broken down in the following way, 491 Candidate, 40 Constituency, 19 Party, 5 PoliticalIdeology, 1 Parliament. All the different nodes are interconected with a variety of relationships. The Candidate nodes contain properties about each individual candidate, such as Name, Sex, Sitting_TD, Elected, Party and Constituency. The Constituency node contains information about each Constituency with the properties Name, Seats and Population. All of the candidates are connected to the Constituency nodes with the realationship 
```cypher (N)-[R:RAN_FOR_ELECTION_IN]->(M) ```. The Candidates are connected to the Parties with the realationship ```cypher (n)-[r:IS_A_MEMBER_OF]->(ff) ``` The candidates are then connected to the Parliament node once the property Elected = True. 
I wanted to examin the changing attidues in the irish voter and so see what political ideology has taken a greater hold. To achieve this each party has a property Position, which represents there stance on left-right political divide. The nodes PoliticalIdeology are conected to the parties and candidates which hold the same political views. Fine Gael and Fianna Fàil both fall into the category Centre-right and so both parties and candidates are connected through there political views.


## Database
Explain how you created your database, and how information is represented in it.

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
