-- =========================
-- IT Company Database
-- =========================

-- =========================
-- Departments (Отделы)
-- =========================
CREATE TABLE Departments (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    manager_id INT
);

-- =========================
-- Employees (Сотрудники)
-- =========================
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    department_id INT,
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2),
    email VARCHAR(100),
    FOREIGN KEY (department_id) REFERENCES Departments(id) ON DELETE SET NULL
);

-- =========================
-- Projects (Проекты)
-- =========================
CREATE TABLE Projects (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(15,2)
);

-- =========================
-- Employee_in_Project (Сотрудники в проектах)
-- =========================
CREATE TABLE Employee_in_Project (
    employee_id INT NOT NULL,
    project_id INT NOT NULL,
    role VARCHAR(50),
    hours_worked INT,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES Projects(id) ON DELETE CASCADE
);

-- =========================
-- Departments data
-- =========================
INSERT INTO Departments (id, name, manager_id) VALUES
(1, 'Frontend', 1),
(2, 'Backend', 2),
(3, 'QA', 3),
(4, 'HR', 4),
(5, 'DevOps', 5);

-- =========================
-- Employees data (известные актёры)
-- =========================
INSERT INTO Employees (id, name, position, department_id, hire_date, salary, email) VALUES
(1, 'Leonardo DiCaprio', 'Frontend Lead', 1, '2018-03-10', 120000, 'leo.dicaprio@company.com'),
(2, 'Scarlett Johansson', 'Backend Lead', 2, '2017-07-01', 125000, 'scarlett.johansson@company.com'),
(3, 'Denzel Washington', 'QA Lead', 3, '2019-01-15', 110000, 'denzel.washington@company.com'),
(4, 'Emma Stone', 'HR Manager', 4, '2016-10-01', 95000, 'emma.stone@company.com'),
(5, 'Ryan Reynolds', 'DevOps Lead', 5, '2018-06-20', 115000, 'ryan.reynolds@company.com'),
(6, 'Natalie Portman', 'Frontend Developer', 1, '2020-02-10', 85000, 'natalie.portman@company.com'),
(7, 'Chris Hemsworth', 'Backend Developer', 2, '2020-05-18', 90000, 'chris.hemsworth@company.com'),
(8, 'Anne Hathaway', 'QA Engineer', 3, '2021-03-22', 75000, 'anne.hathaway@company.com'),
(9, 'Brad Pitt', 'DevOps Engineer', 5, '2019-11-12', 88000, 'brad.pitt@company.com'),
(10, 'Jennifer Lawrence', 'Frontend Developer', 1, '2021-07-30', 80000, 'jennifer.lawrence@company.com');

-- =========================
-- Projects data
-- =========================
INSERT INTO Projects (id, name, start_date, end_date, budget) VALUES
(1, 'Website Redesign', '2023-01-10', '2023-06-30', 50000),
(2, 'Mobile App v2', '2023-02-15', '2023-08-15', 75000),
(3, 'Automation Testing', '2023-03-01', '2023-09-01', 30000),
(4, 'Cloud Migration', '2023-01-20', '2023-12-31', 120000),
(5, 'Internal Tools Upgrade', '2023-04-01', '2023-10-15', 40000);

-- =========================
-- Employee_in_Project data
-- =========================
INSERT INTO Employee_in_Project (employee_id, project_id, role, hours_worked) VALUES
(1, 1, 'Lead', 120),
(6, 1, 'Developer', 100),
(10, 1, 'Developer', 80),
(2, 2, 'Lead', 140),
(7, 2, 'Developer', 120),
(3, 3, 'Lead', 110),
(8, 3, 'QA', 100),
(5, 4, 'Lead', 200),
(9, 4, 'Engineer', 180),
(4, 5, 'HR Support', 60);
