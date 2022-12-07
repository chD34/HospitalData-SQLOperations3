import psycopg2
import matplotlib.pyplot as plt

username = 'chernetskadaiana'
password = 'playmarket'
database = 'Hospital Administration'
host = 'localhost'
port = '5432'

query_1 = '''
create view DoctorSpecialityVisits AS
select speciality, count(*) as app_num from appointment left join doctor 
on appointment.d_id = doctor.d_id
group by speciality;
'''

query_2 = '''
create view HospitalVisits AS
select h_name, count(app_id) as app_num from hospital left join 
(doctor join appointment ON appointment.d_id = doctor.d_id) 
on doctor.h_id = hospital.h_id
group by h_name;
'''

query_3 = '''
create view DoctorVisits AS
select d_name, count(app_id) from doctor 
left join appointment on appointment.d_id = doctor.d_id 
group by d_name;
'''

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)

with conn:
    cur = conn.cursor()

    cur.execute('DROP VIEW IF EXISTS DoctorSpecialityVisits')

    cur.execute(query_1)

    cur.execute('SELECT * FROM DoctorSpecialityVisits')
    speciality = []
    app_num = []

    for row in cur:
        speciality.append(row[0])
        app_num.append(row[1])

    plt.figure(figsize=(8, 5))
    plt.bar(speciality, app_num, width=0.4, color='violet')
    plt.title('К-сть звернень до лікарів кожної спеціальності')
    plt.show()

    speciality.clear()
    app_num.clear()
    print()
    # -------------------------------------------------
    cur.execute('DROP VIEW IF EXISTS HospitalVisits')

    cur.execute(query_2)

    cur.execute('SELECT * FROM HospitalVisits')
    h_name = []
    app_num = []

    for row in cur:
        if row[1] != 0:
            h_name.append(row[0].strip())
            app_num.append(row[1])
    x, y = plt.subplots()
    y.pie(app_num, labels=h_name, autopct='%1.2f%%')
    plt.title(' К-сть звернень до кожної лікарні')
    plt.show()
    app_num.clear()
    h_name.clear()
# -------------------------------------------------
    cur.execute('DROP VIEW IF EXISTS DoctorVisits')

    cur.execute(query_3)

    cur.execute('SELECT * FROM DoctorVisits')
    d_name = []
    app_num = []

    for row in cur:
        d_name.append(row[0].strip())
        app_num.append(row[1])
    plt.figure(figsize=(8, 5))
    plt.bar(d_name, app_num, width=0.4, color='violet')
    plt.title('K-сть прийомів у кожного лікаря')
    plt.show()


