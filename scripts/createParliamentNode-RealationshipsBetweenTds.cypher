CREATE
(par:Parliament {Name:"Dáil Éireann"})

MATCH
(par:Parliament), (c:Candidate{Elected:"True"})
CREATE
(c)-[r:IS_AN_ELECTED_MEMBER_OF_PARLIAMENT]->(par)
RETURN
(r)