MATCH (N:Candidate {Constituency: "Dún Laoghaire"}), (M:Constituency {Name: "Dún Laoghaire"})
CREATE
	(N)-[R:RAN_FOR_ELECTION_IN]->(M)
RETURN
	(R)