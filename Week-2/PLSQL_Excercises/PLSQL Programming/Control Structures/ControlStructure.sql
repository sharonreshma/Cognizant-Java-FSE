SET SERVEROUTPUT ON;


BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Loans';
  EXECUTE IMMEDIATE 'DROP TABLE Customers';
EXCEPTION
  WHEN OTHERS THEN
    NULL; 
END;
/

CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    DOB DATE,
    Balance NUMBER,
    LastModified DATE,
    IsVIP VARCHAR2(5)
);

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    LoanAmount NUMBER,
    InterestRate NUMBER,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified, IsVIP)
VALUES (1, 'John Doe', TO_DATE('1955-05-15', 'YYYY-MM-DD'), 12000, SYSDATE, NULL);

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified, IsVIP)
VALUES (2, 'Jane Smith', TO_DATE('1990-07-20', 'YYYY-MM-DD'), 8000, SYSDATE, NULL);

INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (1, 1, 5000, 5, SYSDATE, ADD_MONTHS(SYSDATE, 25));

INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (2, 2, 6000, 7, SYSDATE, ADD_MONTHS(SYSDATE, 10));


BEGIN
  FOR rec IN (
    SELECT c.CustomerID, c.DOB, l.LoanID, l.InterestRate
    FROM Customers c
    JOIN Loans l ON c.CustomerID = l.CustomerID
  ) LOOP
    IF MONTHS_BETWEEN(SYSDATE, rec.DOB) / 12 > 60 THEN
      UPDATE Loans
      SET InterestRate = InterestRate - 1
      WHERE LoanID = rec.LoanID;

      DBMS_OUTPUT.PUT_LINE('1% discount applied for Customer ID: ' || rec.CustomerID);
    END IF;
  END LOOP;
END;
/

BEGIN
  FOR rec IN (SELECT CustomerID, Balance FROM Customers) LOOP
    IF rec.Balance > 10000 THEN
      UPDATE Customers
      SET IsVIP = 'TRUE'
      WHERE CustomerID = rec.CustomerID;

      DBMS_OUTPUT.PUT_LINE('Customer ID ' || rec.CustomerID || ' promoted to VIP');
    END IF;
  END LOOP;
END;
/

BEGIN
  FOR rec IN (
    SELECT c.Name, l.LoanID, l.EndDate
    FROM Loans l
    JOIN Customers c ON l.CustomerID = c.CustomerID
    WHERE l.EndDate <= SYSDATE + 30
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Loan ID ' || rec.LoanID || ' for ' || rec.Name || ' is due on ' || TO_CHAR(rec.EndDate, 'DD-Mon-YYYY'));
  END LOOP;
END;
/
select * from Customers;
select * from Loans;