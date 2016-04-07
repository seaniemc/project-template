MATCH
(c:Candidate{Elected: "True", Constituency: "Dublin Bay South" })
RETURN
(c)

 MATCH
(N)-[R:RAN_FOR_ELECTION_IN]->(M)
WHERE
N.Constituency = 'Dublin North-West' AND M.Name = 'Dublin NorthWest'
RETURN 
(R)