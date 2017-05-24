SELECT to_char(SYSDATE, 'Dy DD.Mon.YYYY') FROM dual
SELECT to_char(SYSDATE, 'YYYY-MM-DD') FROM dual;
SELECT to_char(SYSDATE, 'DD.MM HH24:MI') FROM dual;
SELECT 'Es ist jetzt ' || to_char(SYSDATE, 'HH24') || ' Uhr und ' ||
      to_char(SYSDATE, 'MI') || ' Minuten' FROM dual;
      SELECT 'In ' || (to_date('24.12', 'DD.MM') - to_date(to_char(SYSDATE, 'DD.MM'), 'DD.MM'))
                     || ' Tagen ist Weihnachten' FROM dual;
