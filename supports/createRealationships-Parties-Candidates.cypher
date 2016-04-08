  MATCH (ff:Party {Name: "Fianna Fáil"}), (n:Candidate)
   WHERE n.Party = 'Fianna Fáil' OR n.Party = 'Finna Fáil'
CREATE
	(n)-[r:IS_A_MEMBER_OF]->(ff)
RETURN
	(r)
    
MATCH (sf:Party {Name: "Sinn Féin"}), (n:Candidate)
WHERE n.Party = 'Sinn Féin' OR n.Party = 'Sinn Fein'
CREATE
	(n)-[r:IS_A_MEMBER_OF]->(sf)
RETURN
	(r)
    
MATCH (aaa:Party {Name: "Anti-Austerity Alliance–People Before Profit"}), (n:Candidate)
WHERE n.Party = 'Anti-Austerity Alliance' OR n.Party = 'People Before Profit' OR n.Party = 'Anti Austerity Alliance' OR n.Name = 
   'Anti-Austerity Alliance–People Before Profit'
CREATE
	(n)-[r:IS_A_MEMBER_OF]->(aaa)
RETURN
	(r)
    
MATCH (ri:Party {Name: "Renua Ireland"}), (n:Candidate)
WHERE n.Party = 'Renua Ireland' 
CREATE
	(n)-[r:IS_A_MEMBER_OF]->(ri)
RETURN
	(r)
    
MATCH (in:Party {Name: "Independents"}), (n:Candidate)
WHERE n.Party = 'Independents' 
CREATE
	(n)-[r:IS_A_MEMBER_OF]->(in)
RETURN
	(r)