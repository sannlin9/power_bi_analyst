-- Databricks notebook source
-- MAGIC %md
-- MAGIC
-- MAGIC # Desafio de projeto 
-- MAGIC
-- MAGIC Este notebook faz parte de um dos desafios do bootcamp de engenharia de dados com python - DIO
-- MAGIC
-- MAGIC Originalmente o desafio foi proposto em Azure porém adaptei o codigo para databricks.

-- COMMAND ----------

-- DBTITLE 1,Criação database

create database if not exists azure_company;
use azure_company;


-- COMMAND ----------

-- DBTITLE 1,Criação da tabela 'employee'
CREATE TABLE IF NOT EXISTS employee(
  Fname STRING NOT NULL,
  Minit CHAR(1),
  Lname STRING NOT NULL,
  Ssn STRING NOT NULL,
  Bdate DATE,
  Address STRING,
  Sex CHAR(1),
  Salary DECIMAL(10, 2),
  Super_ssn STRING,
  Dno INT NOT NULL
)

-- COMMAND ----------

-- DBTITLE 1,criação da tabela departament
CREATE TABLE IF NOT EXISTS departament(
    Dname STRING NOT NULL,
    Dnumber INT NOT NULL,
    Mgr_ssn STRING NOT NULL,
    Mgr_start_date DATE, 
    Dept_create_date DATE
    
)


-- COMMAND ----------

-- DBTITLE 1,criação da tabela dept_locations
CREATE TABLE IF NOT EXISTS dept_locations(
    Dnumber INT NOT NULL,
    Dlocation STRING NOT NULL
)

-- COMMAND ----------

-- DBTITLE 1,criação da tabela project
CREATE TABLE IF NOT EXISTS project(
    Pname STRING NOT NULL,
    Pnumber INT NOT NULL,
    Plocation STRING,
    Dnum INT NOT NULL)

-- COMMAND ----------

-- DBTITLE 1,criação da tabela works_on
CREATE TABLE IF NOT EXISTS works_on(
    Essn STRING NOT NULL,
    Pno INT NOT NULL,
    Hours DECIMAL(3,1) NOT NULL)

-- COMMAND ----------

-- DBTITLE 1,criação da tabela dependent
DROP TABLE IF EXISTS dependent;
CREATE TABLE IF NOT EXISTS dependent(
    Essn STRING NOT NULL,
    Dependent_name STRING NOT NULL,
    Sex CHAR(1),
    Bdate DATE,
    Relationship CHAR(8))

-- COMMAND ----------

-- DBTITLE 1,checagem da criação das tabelas
show tables in azure_company

-- COMMAND ----------

-- DBTITLE 1,Inserção dos dados
insert into
  employee
values
  (
    'John',
    'B',
    'Smith',
    123456789,
    '1965-01-09',
    '731-Fondren-Houston-TX',
    'M',
    30000,
    333445555,
    5
  ),
  (
    'Franklin',
    'T',
    'Wong',
    333445555,
    '1955-12-08',
    '638-Voss-Houston-TX',
    'M',
    40000,
    888665555,
    5
  ),
  (
    'Alicia',
    'J',
    'Zelaya',
    999887777,
    '1968-01-19',
    '3321-Castle-Spring-TX',
    'F',
    25000,
    987654321,
    4
  ),
  (
    'Jennifer',
    'S',
    'Wallace',
    987654321,
    '1941-06-20',
    '291-Berry-Bellaire-TX',
    'F',
    43000,
    888665555,
    4
  ),
  (
    'Ramesh',
    'K',
    'Narayan',
    666884444,
    '1962-09-15',
    '975-Fire-Oak-Humble-TX',
    'M',
    38000,
    333445555,
    5
  ),
  (
    'Joyce',
    'A',
    'English',
    453453453,
    '1972-07-31',
    '5631-Rice-Houston-TX',
    'F',
    25000,
    333445555,
    5
  ),
  (
    'Ahmad',
    'V',
    'Jabbar',
    987987987,
    '1969-03-29',
    '980-Dallas-Houston-TX',
    'M',
    25000,
    987654321,
    4
  ),
  (
    'James',
    'E',
    'Borg',
    888665555,
    '1937-11-10',
    '450-Stone-Houston-TX',
    'M',
    55000,
    NULL,
    1
  );
insert into
  dependent
values
  (
    333445555,
    'Alice',
    'F',
    '1986-04-05',
    'Daughter'
  ),
  (333445555, 'Theodore', 'M', '1983-10-25', 'Son'),
  (333445555, 'Joy', 'F', '1958-05-03', 'Spouse'),
  (987654321, 'Abner', 'M', '1942-02-28', 'Spouse'),
  (123456789, 'Michael', 'M', '1988-01-04', 'Son'),
  (
    123456789,
    'Alice',
    'F',
    '1988-12-30',
    'Daughter'
  ),
  (
    123456789,
    'Elizabeth',
    'F',
    '1967-05-05',
    'Spouse'
  );
insert into
  departament
values
  (
    'Research',
    5,
    333445555,
    '1988-05-22',
    '1986-05-22'
  ),
  (
    'Administration',
    4,
    987654321,
    '1995-01-01',
    '1994-01-01'
  ),
  (
    'Headquarters',
    1,
    888665555,
    '1981-06-19',
    '1980-06-19'
  );
insert into
  dept_locations
values
  (1, 'Houston'),
  (4, 'Stafford'),
  (5, 'Bellaire'),
  (5, 'Sugarland'),
  (5, 'Houston');
insert into
  project
values
  ('ProductX', 1, 'Bellaire', 5),
  ('ProductY', 2, 'Sugarland', 5),
  ('ProductZ', 3, 'Houston', 5),
  ('Computerization', 10, 'Stafford', 4),
  ('Reorganization', 20, 'Houston', 1),
  ('Newbenefits', 30, 'Stafford', 4);
insert into
  works_on
values
  (123456789, 1, 32.5),
  (123456789, 2, 7.5),
  (666884444, 3, 40.0),
  (453453453, 1, 20.0),
  (453453453, 2, 20.0),
  (333445555, 2, 10.0),
  (333445555, 3, 10.0),
  (333445555, 10, 10.0),
  (333445555, 20, 10.0),
  (999887777, 30, 30.0),
  (999887777, 10, 10.0),
  (987987987, 10, 35.0),
  (987987987, 30, 5.0),
  (987654321, 30, 20.0),
  (987654321, 20, 15.0),
  (888665555, 20, 0.0);
