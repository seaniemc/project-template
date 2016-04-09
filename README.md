# Irish Constituencies Neo4j Database
###### Sean McGrath, G00316649

## Introduction
The Data base which I created contains a total of 556 nodes and is broken down in the following way, 491 Candidate, 40 Constituency, 19 Party, 5 PoliticalIdeology, 1 Parliament. All the different nodes are interconected with a variety of relationships. The Candidate nodes contain properties about each individual candidate, such as Name, Sex, Sitting_TD, Elected, Party and Constituency. The Constituency node contains information about each Constituency with the properties Name, Seats and Population. All of the candidates are connected to the Constituency nodes with the realationship 
```cypher (N)-[R:RAN_FOR_ELECTION_IN]->(M) ```. The properties Constituency from Candidate and Name from Constituency are used to create the realationship. The Candidates are connected to the Parties with the realationship ```cypher (n)-[r:IS_A_MEMBER_OF]->(ff) ``` 


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
