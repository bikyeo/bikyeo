
CREATE EVENT bikyeo.cyclereset
   ON SCHEDULE EVERY 24 HOUR
      STARTS STR_TO_DATE('2019-01-22 12:00:00 AM', '%Y-%m-%d %r')
   ON COMPLETION PRESERVE
   ENABLE
   DO
      BEGIN
         CALL bikyeo.cyclereset();
      END

      
# MySql event_scheduler 사용 여부 확인

show variables like 'event%' ;



# Mysql event_scheduler 활성화

SET GLOBAL event_scheduler = ON ;



# MySql EVENT 목록 보기

SHOW EVENTS ;

