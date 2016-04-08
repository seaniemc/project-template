MATCH (N:Candidate {Constituency: "Limerick County"}), (M:Constituency {Name: "Limerick County"})
CREATE
	(N)-[R:RAN_FOR_ELECTION_IN]->(M)
RETURN
	(R)