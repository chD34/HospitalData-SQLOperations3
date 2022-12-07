-- Create hospitals table
CREATE TABLE Hospital
(
  h_id      char(20)  NOT NULL ,
  h_name    char(50)  NOT NULL 
);

-- Create doctors table 
CREATE TABLE Doctor
(
  d_id  char(20)          NOT NULL ,
  h_id  char(20)          NOT NULL ,
  d_name char(50)         NOT NULL ,
  speciality char(20)     NOT NULL 
);

-- Create patients table

CREATE TABLE Patient
(
  p_id    char(20)          NOT NULL ,
  p_name  char(50)          NULL ,
  gender  char(20)          NULL ,
  age     int               NULL 
);

-- Create appointments table

CREATE TABLE Appointment
(
  app_id    char(20)      NOT NULL ,
  d_id      char(20)      NOT NULL ,
  p_id      char(20)      NOT NULL ,
  a_date   date       NOT NULL ,
  cabinet  int          NOT NULL 
);

-- Define primary keys

ALTER TABLE Hospital ADD PRIMARY KEY (h_id);
ALTER TABLE Doctor ADD PRIMARY KEY (d_id);
ALTER TABLE Patient ADD PRIMARY KEY (p_id);
ALTER TABLE Appointment ADD PRIMARY KEY (app_id);

-- Define foreign keys

ALTER TABLE Doctor ADD CONSTRAINT FK_Doctor_Hospital FOREIGN KEY (h_id) REFERENCES Hospital (h_id);
ALTER TABLE Appointment ADD CONSTRAINT FK_Appointment_Doctor FOREIGN KEY (d_id) REFERENCES Doctor (d_id);
ALTER TABLE Appointment ADD CONSTRAINT FK_Appointment_Patient FOREIGN KEY (p_id) REFERENCES Patient (p_id);
