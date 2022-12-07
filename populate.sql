
-- Populate patients table

UPDATE patient SET p_name='Tiana Atkinson', gender='Female', age=64 WHERE p_id = 'p_00001';
UPDATE patient SET p_name='Liberty Stark', gender='Male', age=52 WHERE p_id = 'p_00002';
UPDATE patient SET p_name='Dillan Bentley', gender='Male', age=81 WHERE p_id = 'p_00003';
UPDATE patient SET p_name='Arielle Valdez', gender='Female', age=24 WHERE p_id = 'p_00004';
UPDATE patient SET p_name='Mauricio Bray', gender='Male', age=16 WHERE p_id = 'p_00005';
UPDATE patient SET p_name='Halle Bond', gender='Male', age=35 WHERE p_id = 'p_00006';
UPDATE patient SET p_name='Emma Schwartz', gender='Female', age=47 WHERE p_id = 'p_00007';
UPDATE patient SET p_name='Wendy Landry', gender='Female', age=26 WHERE p_id = 'p_00008';
UPDATE patient SET p_name='Sofia Rice', gender='Female', age=71 WHERE p_id = 'p_00009';

-- Populate doctors table

INSERT INTO Doctor(d_id, d_name, h_id, speciality)
VALUES('69375', 'Kimora Fowler', '010006', 'Emergency/Trauma');
INSERT INTO Doctor(d_id, d_name, h_id, speciality)
VALUES('57272', 'Tony Macdonald', '010001', 'Family/General');
INSERT INTO Doctor(d_id, d_name, h_id, speciality)
VALUES('82347', 'Atticus Davies', '010006', 'Cardiology');
INSERT INTO Doctor(d_id, d_name, h_id, speciality)
VALUES('89608', 'Bella Campos', '010011', 'Nephrology');
INSERT INTO Doctor(d_id, d_name, h_id, speciality)
VALUES('24091', 'Alexzander Russell', '010008', 'Emergency/Trauma');

-- Populate appointments table

INSERT INTO Appointment(app_id, d_id, p_id, a_date, cabinet)
VALUES('197029140', '57272', 'p_00005', '2016-04-29', 39);
INSERT INTO Appointment(app_id, d_id, p_id, a_date, cabinet)
VALUES('163571946', '89608', 'p_00007', '2016-04-29', 34);
INSERT INTO Appointment(app_id, d_id, p_id, a_date, cabinet)
VALUES('256497366', '82347', 'p_00009', '2016-04-25', 15);
INSERT INTO Appointment(app_id, d_id, p_id, a_date, cabinet)
VALUES('289891212', '82347', 'p_00001', '2016-04-25', 70);
INSERT INTO Appointment(app_id, d_id, p_id, a_date, cabinet)
VALUES('81873900', '57272', 'p_00001', '2016-04-29', 39);
INSERT INTO Appointment(app_id, d_id, p_id, a_date, cabinet)
VALUES('48391902', '82347', 'p_00003', '2016-04-27', 63);
INSERT INTO Appointment(app_id, d_id, p_id, a_date, cabinet)
VALUES('130669056', '24091', 'p_00005', '2016-04-27', 1);
INSERT INTO Appointment(app_id, d_id, p_id, a_date, cabinet)
VALUES('313193054', '24091', 'p_00006', '2016-04-27', 1);
