CREATE
(FG:Party {Name:"Fine Gael", Position:"Centre-right"}),
    (LP:Party {Name: "Labour Party", Position:"Centre-left"}),
    (FF:Party {Name:"Fianna Fáil", Position:"Centre-right"}),
    (SF:Party {Name:"Sinn Féin", Position:"Left-wing"}),
    (AAA:Party {Name:"Anti-Austerity Alliance–People Before Profit", Position:"Far-Left"}),
    (RI:Party {Name:"Renua Ireland", Position:"Right-Wing"}),
    (SD:Party {Name:"Social Democrats", Position:"Centre-left"}),
    (WUA:Party {Name:"Workers and Unemployed Action", Position:"Left-wing"}),
    (GP:Party {Name:"Green Party", Position:"Centre-left"}),
    (WP:Party {Name:"Workers Party", Position:"Far-left"}),
    (RSF:Party {Name:"Republican Sinn Féin", Position:"Left-wing"}),
    (IN:Party {Name:"Independents", Position:""}),
    (I4C:Party {Name:"Independents 4 Change", Position:""}),
    (FN:Party {Name:"Fís Nua", Position:"Left-wing"}),
    (DDL:Party {Name:"Direct Democracy Ireland", Position:"Right-wing"}),
    (CD:Party {Name:"Catholic Democrats", Position:"Right-wing"});
    
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
WHERE n.Party = 'People Before Profit' 
   AND pi.Name = 'Far-left'
CREATE (n)-[r:HAS_A_LEFT_WING_IDEOLOGY]->(pi)
RETURN r

MATCH (n:Candidate), (pi:PoliticalIdeology)
WHERE n.Party = 'Anti-Austerity Alliance–People Before Profit'
   AND pi.Name = 'Far-left'
RETURN n,pi

MATCH (n:Candidate)
WHERE n.Party = 'Anti-Austerity Alliance–People Before Profit'
RETURN n