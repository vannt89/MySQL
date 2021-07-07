-- 1. Tìm tất cả nam giới tuổi dưới 45
SELECT p.name, p.age, p.gender FROM 
(SELECT name, DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),birthdate)), '%Y')+0 AS age, gender 
FROM person) 
AS p 
WHERE p.age < 45 AND p.gender = 'Male' 
ORDER BY p.age DESC;

-- 2. Tìm tất cả nữ giới làm nghề lái xe driver
SELECT * FROM person
WHERE gender = 'Female'
AND job = 'driver';

-- 3. Tính tỉ lệ nam/nữ lập trình viên trong tất cả tập dữ liệu
SELECT t.job, m.malecount/fm.femaleCount as ratioMaleFemale FROM 
(SELECT job, COUNT(*) AS total 
FROM person 
where job = 'developer' 
GROUP BY job) AS t 
JOIN 
(SELECT job, COUNT(*) AS maleCount 
FROM person WHERE gender = 'Male' and job = 'developer' 
GROUP BY job) AS m ON t.job = m.job
JOIN 
(SELECT job, COUNT(*) AS femaleCount 
FROM person WHERE gender = 'Female' and job = 'developer' 
GROUP BY job) AS fm ON t.job = fm.job; 

-- 4. Tìm 5 thành phố có số lượng nữ lớn nhất
SELECT city, gender, COUNT(*) AS femaleCount FROM person GROUP BY city, gender HAVING gender = 'Female' ORDER BY femaleCount DESC LIMIT 5;
