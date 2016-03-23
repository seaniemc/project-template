MATCH (N:Candidate {Constituency: "GalwayWest"}), (M:Constituency {Name: "GalwayWest"})
CREATE
	(N)-[R:RAN_FOR_ELECTION_IN]->(M)
RETURN
	(R)