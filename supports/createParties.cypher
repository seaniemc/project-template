CREATE
    (FG:Party {Name:"Fine Gael", Position:"Centre-right"}),
    (FF:Party {Name:"Fianna Fáil", Position:"Centre-right"}),  
    
    (RI:Party {Name:"Renua Ireland", Position:"Right-Wing"}),
    (DDL:Party {Name:"Direct Democracy Ireland", Position:"Right-wing"}),
    (CD:Party {Name:"Catholic Democrats", Position:"Right-wing"});
    
    (LP:Party {Name: "Labour Party", Position:"Centre-left"}),
    (SD:Party {Name:"Social Democrats", Position:"Centre-left"}),
    (GP:Party {Name:"Green Party", Position:"Centre-left"}),
    
    (SF:Party {Name:"Sinn Féin", Position:"Left-wing"}),
    (WUA:Party {Name:"Workers and Unemployed Action", Position:"Left-wing"}),
    (RSF:Party {Name:"Republican Sinn Féin", Position:"Left-wing"}),
    (FN:Party {Name:"Fís Nua", Position:"Left-wing"}),
    
    (WP:Party {Name:"Workers Party", Position:"Far-left"}),
    (AAA:Party {Name:"Anti-Austerity Alliance–People Before Profit", Position:"Far-Left"}),
    
    (IN:Party {Name:"Independents", Position:""}),
    (I4C:Party {Name:"Independents 4 Change", Position:""}),
    CREATE
    (fl:PoliticalIdeology{Name: "Far-left"}),
    (lw:PoliticalIdeology{Name: "Left-wing"}),
    (lw:PoliticalIdeology{Name: "Centre-left"}),
    (lw:PoliticalIdeology{Name: "Centre-right"}),
    (lw:PoliticalIdeology{Name: "Right-wing"});
    
    
    
 MATCH (p:Party)
 WHERE p.Name = 'Sinn Féin'  AND  p.Name = 'Anti-Austerity Alliance–People Before Profit' 
 AND p.Name = 'Workers and Unemployed Action' AND  p.Name = 'Workers Party' AND  p.Name = 'Republican Sinn Féin' 
 AND  p.Name = 'Fís Nua'  AND  p.Name = 'Fís Nua'
 RETURN p
 
 WHERE p.Position CONTAINS 'Left-wing'  AND p.Position CONTAINS 'Far-left'
 AND p.Position = 'Centre-left'
 
 MATCH (p:Party), (pi:PoliticalIdeology)
 WHERE p.Position = 'Far-left' AND pi.Name = 'Far-left'
 CREATE (p)-[r:SHARE_THE_SAME_IDEOLOGY]->(pi)   
 RETURN r 
 
 WHERE
n.name =~ ".*lvis.*sley.*" AND
m.name =~ ".*evin.*acon.*" AND
o.name =~ ".*ward.*sner.*"
RETURN
n, m, o;


MATCH (c:Candidate), (p:Party)
WHERE c.Elected = 'True' AND p.Position = 'Far-left'
RETURN c

MATCH (n:Candidate), (pi:PoliticalIdeology)
WHERE n.Party = 'Anti-Austerity Alliance'' 
   AND pi.Name = 'Far-left'
CREATE (n)-[r:HAS_A_FAR_LEFT_IDEOLOGY]->(pi)
RETURN r

OR p.Party = 'Sinn Fein'
MATCH (n:Candidate), (pi:PoliticalIdeology)
WHERE n.Party = 'Sinn Fein' 
   AND pi.Name = 'Far-left'
RETURN n,pi

MATCH (n:Candidate)
WHERE n.Party = 'AAA'
RETURN n

MATCH (n)-[r:HAS_A_LEFT_WING_IDEOLOGY]->(pi)
WHERE n.Party = 'Anti-Austerity Alliance' OR n.Party = 'People Before Profit' 
OR n.Party = 'Fine Gael' OR n.Party = 'Fianna Fáil' OR n.Party = 'Finna Fáil' OR n.Party = 'Fianna Fail'
OR n.Party = 'Labour' OR n.Party = 'Green' OR n.Party = 'Social Democrats'
RETURN r


MATCH (n)-[r:HAS_A_LEFT_WING_IDEOLOGY]->(pi)
WHERE n.Party = 'Anti-Austerity Alliance' OR n.Party = 'People Before Profit' 
OR n.Party = 'Fine Gael' OR n.Party = 'Fianna Fáil' OR n.Party = 'Finna Fáil' OR n.Party = 'Fianna Fail'
OR n.Party = 'Labour' OR n.Party = 'Green' OR n.Party = 'Social Democrats'
DELETE r

MATCH (n)-[r:HAS_A_FAR_LEFT_IDEOLOGY]->(pi)
WHERE n.Elected = 'True'
   AND n.Sitting_TD = 'False'
RETURN n