
SET SERVEROUTPUT ON;

DECLARE
v_message VARCHAR2(50) :='HelloWorld';

        
BEGIN
DBMS_OUTPUT.PUT_LINE(v_message);

END;
/

EXEC HelloWorld;

CREATE OR REPLACE PROCEDURE addNumbers(num1 INT,num2 INT)
IS

v_num1 INT:=num1;
v_num2 INT:=num2;
v_Results INT;

BEGIN
     v_Results :=v_num1+v_num2; 
     dbms_output.put_line(v_Results);
     
 END;
 /
 EXEC addNumbers(100/10)
 
 
 
CREATE OR REPLACE PROCEDURE SArea(L INT, W INT)
IS

v_Length INT:=L;
v_Width INT :=W;
v_Area INT;

BEGIN
     v_Results :=v_num1+v_num2; 
     dbms_output.put_line(v_Area);
     
 END;
 /
 EXEC SArea(20/10)
 
 
 SELECT add_two_numbers(100/10)as answer
 FROM Dual;
 EXEC preform_operation(100/10,result);
 
 
 