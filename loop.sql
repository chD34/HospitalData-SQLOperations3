DO $$
 DECLARE
     patient_id   patient.p_id%TYPE;
     
 BEGIN
     patient_id := 'p_0000';
     FOR counter IN 1..9
         LOOP
            INSERT INTO patient (p_id)
             VALUES (patient_id || '0000' + counter);
         END LOOP;
 END;
 $$
 ;

