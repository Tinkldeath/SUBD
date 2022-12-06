import pymysql
from app import app
from config import mysql
from flask import jsonify
from flask import flash, request


@app.route('/user/add', methods=['POST'])
def create_user():
    # POST: http://127.0.0.1:5000/user/add
    # BODY: {"login": "asdas", "password": "asdasdsa", "permission": 1}
    try:
        _json = request.json
        _login = _json['login']
        _password = _json['password']
        _permission = _json['permission']
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        if _login and _password and _permission and request.method == 'POST':
            exists = "SELECT Login FROM User WHERE Login = %s;"
            bindExists = (_login)
            sqlQuery = "CALL willCreateUser(%s, %s, %s);"
            bindData = (_login, _password, _permission)
            cursor.execute(exists, bindExists);
            exist = cursor.fetchone()
            if exist:
                response = jsonify("Please select another login");
                response.status_code = 400
                return response
            else:
                cursor.execute(sqlQuery, bindData)
                respone = jsonify("Created")
                respone.status_code = 201
                conn.commit()
                return respone
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()


@app.route('/user/login', methods=['POST'])
def login():
    # POST: http://127.0.0.1:5000/user/login
    # BODY: {"login": "asdas", "password": "asdasdsa"}
    try:
        _json = request.json
        _login = _json['login']
        _password = _json['password']
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        if _login and _password and request.method == 'POST':
            findUser = "SELECT Login, Password, Permission FROM User WHERE Login = %s;"
            bindFind = (_login)
            cursor.execute(findUser, bindFind)
            found = cursor.fetchone()
            if found:
                if _password == found['Password']:
                    response = jsonify(found)
                    response.status_code = 202
                    return response
                else:
                    response = jsonify("Incorrect password")
                    response.status_code = 401
                    return response
        response = jsonify("User is not exist")
        response.status_code = 401
        return response

    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()
