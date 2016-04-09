MATCH
(c:Candidate{Elected: "True", Constituency: "Dublin Bay South" })
RETURN
(c)

 MATCH
(N)-[R:RAN_FOR_ELECTION_IN]->(M)
WHERE
N.Constituency = 'Limerick County' AND M.Name = 'Limerick County'
RETURN 
(R)

MATCH
(c:Constituency), (b:Constituency1)
DETACH DELETE c, b
