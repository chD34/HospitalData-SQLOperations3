import psycopg2
import csv
import decimal

username = 'chernetskadaiana'
password = 'playmarket'
database = 'Hospital Administration'
host = 'localhost'
port = '5432'


INPUT_CSV_FILE = 'hospital.csv'

query_1 = '''
DELETE FROM hospital
'''

query_2 = '''
INSERT INTO hospital (h_id, h_name) VALUES (%s, %s)
'''

conn = psycopg2.connect(user=username, password=password, dbname=database)

with conn:
    cur = conn.cursor()
    cur.execute(query_1)
    with open(INPUT_CSV_FILE, 'r') as inf:
        reader = csv.DictReader(inf)
        n = 0
        for idx, row in enumerate(reader):
            n += 1
            price = decimal.Decimal(row['Provider ID'].lstrip('$'))
            values = (row['Provider ID'], row['Hospital Name'])
            cur.execute(query_2, values)
            if n == 9:
                break

    conn.commit()
