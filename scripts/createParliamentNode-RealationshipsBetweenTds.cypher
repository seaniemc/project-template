CREATE
(par:Parliament {Name:"Dáil Éireann"})

MATCH
(par:Parliament), (c:Candidate{Elected:"True"})
CREATE
(c)-[r:IS_AN_ELECTED_MEMBER_OF_PARLIAMENT]->(par)
RETURN
(r)

MATCH
(c)-[r:IS_AN_ELECTED_MEMBER_OF_PARLIAMENT]->(par)
WHERE c.Sitting_TD = True AND c.Sex = 'Female'
RETURN  (c)

MATCH
(c:Candidate)
WHERE c.Sitting_TD = 'True' AND c.Elected = 'False' AND c.Party = 'Labour'
RETURN (c)

MATCH
(par:Parliament), (c:Candidate)
WHERE
c.Constituency = 'Limerick County' AND c.Elected = 'True'
CREATE
(c)-[r:IS_AN_ELECTED_MEMBER_OF_PARLIAMENT]->(par)
RETURN
(r)
