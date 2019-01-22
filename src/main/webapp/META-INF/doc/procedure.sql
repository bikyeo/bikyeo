DROP PROCEDURE IF EXISTS bikyeo.cyclereset;

CREATE DEFINER = `bikyeo` @`%`
PROCEDURE bikyeo.cyclereset ()
   LANGUAGE SQL
   DETERMINISTIC
   CONTAINS SQL
   SQL SECURITY DEFINER
BEGIN
   UPDATE cycle
      SET c_Move = p_Num
    WHERE p_Num != c_Move AND c_Status = 0;
END;