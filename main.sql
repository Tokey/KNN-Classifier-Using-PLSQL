SET serveroutput ON;

DECLARE
  
BEGIN
  DBMS_OUTPUT.put_line ('Hello world');
  knn.knn_algorithm(3);
END;