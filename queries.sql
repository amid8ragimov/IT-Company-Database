--  Hər departamentdə neçə işçi var
SELECT d.name, COUNT(e.id) AS employee_count
FROM Departments d
LEFT JOIN Employees e ON d.id = e.department_id
GROUP BY d.name;

--  Ən yüksək maaş alan TOP 5 işçi
SELECT name, salary
FROM Employees
ORDER BY salary DESC
LIMIT 5;

--  Hər layihə üzrə ümumi işlənmiş saatlar
SELECT p.name, SUM(eip.hours_worked) AS total_hours
FROM Projects p
JOIN Employee_in_Project eip ON p.id = eip.project_id
GROUP BY p.name;

--  Ən bahalı layihələr (TOP 3)
SELECT name, budget
FROM Projects
ORDER BY budget DESC
LIMIT 3;

--  İşçilər və onların layihələrdə rolları
SELECT e.name, p.name AS project, eip.role
FROM Employees e
JOIN Employee_in_Project eip ON e.id = eip.employee_id
JOIN Projects p ON p.id = eip.project_id;

--  Hər işçinin neçə layihədə iştirak etdiyini göstər
SELECT e.name, COUNT(eip.project_id) AS project_count
FROM Employees e
LEFT JOIN Employee_in_Project eip ON e.id = eip.employee_id
GROUP BY e.name
ORDER BY project_count DESC;

--  Hər departament üzrə orta maaş
SELECT d.name, AVG(e.salary) AS avg_salary
FROM Departments d
JOIN Employees e ON d.id = e.department_id
GROUP BY d.name;

--  Ən çox saat işləyən işçi
SELECT e.name, SUM(eip.hours_worked) AS total_hours
FROM Employees e
JOIN Employee_in_Project eip ON e.id = eip.employee_id
GROUP BY e.name
ORDER BY total_hours DESC
LIMIT 1;

--  Heç bir layihədə iştirak etməyən işçilər
SELECT e.name
FROM Employees e
LEFT JOIN Employee_in_Project eip ON e.id = eip.employee_id
WHERE eip.project_id IS NULL;

-- Layihələrdə işləyən işçilərin ümumi maaş xərci
SELECT p.name, SUM(e.salary) AS total_salary_cost
FROM Projects p
JOIN Employee_in_Project eip ON p.id = eip.project_id
JOIN Employees e ON e.id = eip.employee_id
GROUP BY p.name;
