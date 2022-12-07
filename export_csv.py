import csv
import psycopg2

username = 'chernetskadaiana'
password = 'playmarket'
database = 'Hospital Administration'
host = 'localhost'
port = '5432'

OUTPUT_FILE_T = 'export_DB.csv'

TABLES = [
    'hospital',
    'patient',
    'doctor',
    'appointment'
]

conn = psycopg2.connect(user=username, password=password, dbname=database)

with conn:
    cur = conn.cursor()
    with open(OUTPUT_FILE_T, 'w') as outfile:
        for table_name in TABLES:
            cur.execute('SELECT * FROM ' + table_name)
            fields = [x[0] for x in cur.description]
            writer = csv.writer(outfile)
            writer.writerow(fields)
            for row in cur:
                writer.writerow([str(x) for x in row])