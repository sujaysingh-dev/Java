drop user medanta cascade
/
create user medanta identified by medanta
/
grant dba to medanta
/
conn medanta/medanta
/
create table clinic
(
        clinic_id                    nvarchar2(10),
        clinic_doctor_id        nvarchar2(10),
        clinic_type                nvarchar2(10),
        clinic_desc                nvarchar2(40),
        clinic_name               nvarchar2(40),
        clinic_place                nvarchar2(10),
        clinic_add                  nvarchar2(10)
)
/
create table patient
(
        patient_id             nvarchar2(10),
        patient_name       nvarchar2(40),
        patient_mobile     nvarchar2(10),
        patient_address    nvarchar2(40),
        patient_email        nvarchar2(30)
)
/
create table doctors
(
        doctors_id            nvarchar2(10),
        doctors_name      nvarchar2(40),
        doctors_mobile    nvarchar2(10),
        doctors_email      nvarchar2(30),
        doctors_address  nvarchar2(40)
)
/
create table appoint
(
        appoint_id               nvarchar2(10),
        appoint_number     nvarchar2(10),
        appoint_type           nvarchar2(20),
        appoint_describ       nvarchar2(20),
        appoint_date           nvarchar2(10),
        appoint_doctor        nvarchar2(10)
)
/
create table test
(
        test_id                    nvarchar2(10),
        test_name              nvarchar2(20),
        test_type                nvarchar2(20),
        test_describ            nvarchar2(20),
        test_patient_id        nvarchar2(10),
        test_cost                 nvarchar2(10),
        test_report              nvarchar2(10)
)
/
create table login
(
        id nvarchar2(10),
        pwd nvarchar2(10)
)
/
insert into login values('medanta','medanta')
/
commit
/