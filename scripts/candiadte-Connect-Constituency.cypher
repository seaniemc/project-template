MATCH (N:Candidate {Constituency: "Louth"}), (M:Constituency {Name: "Louth"})
CREATE
	(N)-[R:RAN_FOR_ELECTION_IN]->(M)
RETURN
	(R)