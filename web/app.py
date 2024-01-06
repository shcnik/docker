from flask import Flask, request, render_template
import mariadb

app = Flask(__name__)

@app.route('/health')
def check_health():
  return {
    "status": "OK"
  }

@app.route('/')
def get_data():
  conn = mariadb.connect(
    host='db',
    port=3306,
    user='shcnik',
    password='disco_sovenok'
  )
  cur = conn.cursor()
  cur.execute('SELECT name, age FROM data.data')
  persons = []
  for (name, age) in cur:
    persons.append({
      "name": name,
      "age": age
    })
  conn.close()
  return persons

if __name__ == '__main__':

  app.run(debug=True,host='0.0.0.0')
