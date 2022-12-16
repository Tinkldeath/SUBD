import pymysql
from app import app
from config import mysql
from flask import jsonify
from flask import request


@app.route('/logs/', methods=['GET'])
def get_logs():
    # GET: http://127.0.0.1:5000/logs/
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        sqlQuery = "CALL getLogs();"
        cursor.execute(sqlQuery)
        results = cursor.fetchall()
        conn.commit()
        response = jsonify(results)
        response.status_code = 200
        return response
    except Exception as e:
        print(e)
        app.errorhandler(e)
    finally:
        cursor.close()
        conn.close()
