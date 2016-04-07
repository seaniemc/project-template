MATCH (N:Candidate {Constituency: "Dublin North-West"}), (M:Constituency {Name: "Dublin NorthWest"})
CREATE
	(N)-[R:RAN_FOR_ELECTION_IN]->(M)
RETURN
	(R)