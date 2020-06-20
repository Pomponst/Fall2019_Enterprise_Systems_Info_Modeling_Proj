-- PART 3
-- A What is the most common apartment number?
SELECT aptno 'Most common apartment numbers'
FROM apartment
GROUP BY aptno
ORDER BY COUNT(aptno) DESC
LIMIT 2;

-- B How many different apartment numbers are there?
SELECT COUNT(DISTINCT aptno) 'No. of Distinct Apartment Numbers'
FROM apartment;

-- C How many different apartments (number and building) are there?
SELECT COUNT(*) 'No. of Distinct Building/Apartment Numbers'
FROM (SELECT buildingid, aptno FROM apartment) As T;

-- D Which apartments (number and building) have no clients in them>
SELECT buildingid
	, aptno
FROM apartment
WHERE CCID IS NULL;

-- E What is the average rent for two-bedroom apartments?
SELECT ROUND(AVG(rent),2) 'Average 2 Bedroom Rent'
FROM apartment
WHERE anoofbedrooms = 2;

-- F How many buildings are there?
SELECT COUNT(DISTINCT buildingid) 'No. of Distinct Buildings'
FROM apartment;

-- G Which building(s) has the widest range in rent prices?
SELECT buildingid 'Building with the widest price range'
FROM apartment
GROUP BY buildingid
ORDER BY MAX(rent) - MIN(rent) DESC
LIMIT 1;

-- H List all the managers (first and last names) with their salaries in order of oldest to youngest.
SELECT mfname
	, mlname
    , msalary
FROM manager
ORDER BY mbdate ASC;

-- I Which manager(s) (first and last names) received the largest bonus? What was it?
SELECT mfname
	, mlname
    , MAX(mbonus)
FROM manager;

-- J Which manager(s) manage(s) the most buildings? How many?
SELECT m.mfname
	, m.mlname
	, COUNT(b.bmanagerid) 'No. of managed buildings'
FROM building b
	, manager m
WHERE b.bmanagerid = m.managerid
GROUP BY bmanagerid
ORDER BY COUNT(bmanagerid) DESC
LIMIT 3;

-- K Who are the manager(s) and their phone numbers of the buildings that were inspected by Bianca?
SELECT m.mfname
	, m.mlname
    , p.mphone
FROM manager m
JOIN building b
	ON m.managerid = b.bmanagerid
JOIN inspecting i
	ON b.buildingid = i.buildingid
JOIN managerphone p
	ON m.managerid = p.managerid
JOIN inspector insp
	ON i.insid = insp.insid
WHERE insp.insname = "Bianca"
GROUP BY m.managerid, b.buildingid;

-- L Which corporate client(s) referred at least one other client, how many did each refer, and which building and apartment do they live in?
SELECT c.ccname, a.buildingid, a.aptno
	, COUNT(c.ccname)
FROM corpclient c
JOIN corpclient r
	ON c.ccid = r.ccidreferredby
JOIN apartment a
	ON c.ccid = a.ccid
GROUP BY c.ccname, a.buildingid, a.aptno;

-- M Which corporate clients were referred by no one?
SELECT ccname 'Non-referred corporate clients'
FROM corpclient
WHERE ccidreferredby IS NULL;

-- N What is the name(s) of the staff member(s) who cleans the fewest apartments?
SELECT s.smembername
	, COUNT(c.smemberid) 'No. of Apartments Cleaned'
FROM cleaning c
	, staffmember s
WHERE c.smemberid = s.smemberid
GROUP BY c.smemberid
ORDER BY COUNT(c.smemberid) ASC
LIMIT 1;

-- O For the staff member(s) who cleans the fewest apartments, which apartments (number and building) does (s)he clean? Include the name(s) of the staff member.
SELECT s.smembername
	, c.buildingid
    , c.aptno
FROM staffmember s
	, cleaning c
WHERE s.smemberid = c.smemberid
	AND s.smembername = "Arthur";