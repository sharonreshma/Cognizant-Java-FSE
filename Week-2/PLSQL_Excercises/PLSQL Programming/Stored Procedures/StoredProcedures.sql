 
 DROP TABLE Accounts CASCADE CONSTRAINTS;
DROP TABLE Employees CASCADE CONSTRAINTS;
 
CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    AccountType VARCHAR2(20),
    Balance NUMBER,
    LastModified DATE
);


INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (1, 1, 'Savings', 5000, SYSDATE);

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (2, 1, 'Savings', 3000, SYSDATE);


CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Position VARCHAR2(50),
    Salary NUMBER,
    Department VARCHAR2(50),
    HireDate DATE
);


INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
VALUES (1, 'Alice', 'Manager', 60000, 'IT', TO_DATE('2018-01-01', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
VALUES (2, 'Bob', 'Analyst', 50000, 'HR', TO_DATE('2019-01-01', 'YYYY-MM-DD'));

 
 
 CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
  FOR acc IN (
    SELECT AccountID, Balance
    FROM Accounts
    WHERE AccountType = 'Savings'
  ) LOOP
    UPDATE Accounts
    SET Balance = Balance + (acc.Balance * 0.01)
    WHERE AccountID = acc.AccountID;

    DBMS_OUTPUT.PUT_LINE('Interest applied for Account ID: ' || acc.AccountID);
  END LOOP;
END;
/
BEGIN
  ProcessMonthlyInterest;
END;
/
SELECT * FROM Accounts;


CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
  deptName IN VARCHAR2,
  bonusPercent IN NUMBER
) IS
BEGIN
  FOR emp IN (
    SELECT EmployeeID, Salary
    FROM Employees
    WHERE Department = deptName
  ) LOOP
    UPDATE Employees
    SET Salary = Salary + (emp.Salary * (bonusPercent / 100))
    WHERE EmployeeID = emp.EmployeeID;

    DBMS_OUTPUT.PUT_LINE('Bonus applied to Employee ID: ' || emp.EmployeeID);
  END LOOP;
END;
/
BEGIN
  UpdateEmployeeBonus('IT', 10); 
END;
/
SELECT * FROM Employees;


CREATE OR REPLACE PROCEDURE TransferFunds(
  fromAccount IN NUMBER,
  toAccount IN NUMBER,
  amount IN NUMBER
) IS
  fromBal NUMBER;
BEGIN
  SELECT Balance INTO fromBal FROM Accounts WHERE AccountID = fromAccount FOR UPDATE;

  IF fromBal >= amount THEN
    UPDATE Accounts
    SET Balance = Balance - amount
    WHERE AccountID = fromAccount;

    UPDATE Accounts
    SET Balance = Balance + amount
    WHERE AccountID = toAccount;

    DBMS_OUTPUT.PUT_LINE('Transferred ' || amount || ' from ' || fromAccount || ' to ' || toAccount);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Insufficient funds in account: ' || fromAccount);
  END IF;
END;
/
BEGIN
  TransferFunds(1, 2, 1000); 
END;
/

select * from Accounts;
