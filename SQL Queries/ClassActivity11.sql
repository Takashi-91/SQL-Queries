
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
 
 
 
CREATE OR REPLACE PROCEDURE HelloWorld
IS
v_message VARCHAR2(50):='HelloWorld';

BEGIN

dbms_output.put_line(v_message);
END;
/
EXEC HelloWorld;


 
 --etermine the radius of a circle. Let's assume it's equal to 14 cm.
--Substitute this value to the formula for circumference: C = 2 * ? * R = 2 * ? * 14 = 87.9646 cm.
--You can also use it to find the area of a circle: A = ? * R² = ? * 14² = 615.752 cm².
--Finally, you can find the diameter - it is simply double the radius: D = 2 * R = 2 * 14 = 28 cm.
--Use our circumference calculator to find the radius when you only have the circumference or area of a circle.

CREATE OR REPLACE PROCEDURE circum(raduis in decimal)
IS
v_Circle INT:=14;
v_Pi INT:=3.142;
v_Circumference INT:=2*3.142*14;
v_Area INT :=3.142*14*2;

BEGIN 
dbms_output.put_line(v_Circle);
dbms_output.put_line(v_Pi);
dbms_output.put_line(v_Circumference);
dbms_output.put_line(v_Area);

END;
/

EXEC circum; 


 
 