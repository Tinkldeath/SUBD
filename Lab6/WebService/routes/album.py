import pymysql
from app import app
from config import mysql
from flask import jsonify
from flask import request


@app.route('/album/add', methods=['POST'])
def create_album():
    # POST: http://127.0.0.1:5000/album/add
    # BODY: {"title": "asdas", "idArtist": 1}
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        _json = request.json
        _title = _json['title']
        _idArtist = _json['idArtist']
        if _title and _idArtist and request.method == 'POST':
            sqlQuery = "CALL checkAlbumExists(%s, %s);"
            bindData = (_title, _idArtist)
            cursor.execute(sqlQuery, bindData)
            result = cursor.fetchone()
            if result:
                response = jsonify("Album already exists")
                response.status_code = 400
                return response
            else:
                query = "CALL willCreateAlbum(%s, %s);"
                cursor.execute(query, bindData)
                results = "CALL getAlbums();"
                cursor.execute(results)
                result = cursor.fetchall()
                response = jsonify(result)
                response.status_code = 201
                conn.commit()
                return response
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()


@app.route('/album', methods=['GET'])
def get_albums():
    # GET: http://127.0.0.1:5000/album/
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        sqlQuery = "CALL getAlbums();"
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


@app.route('/album/<id>', methods=['GET'])
def get_album(id):
    # GET: http://127.0.0.1:5000/album/1
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        sqlQuery = "CALL tracksForAlbum(%s);"
        cursor.execute(sqlQuery, id)
        results = cursor.fetchall()
        conn.commit()
        response = jsonify(results)
        response.status_code = 200
        return response
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()


@app.route('/album/<id>', methods=['PUT'])
def update_album(id):
    # PUT: http://127.0.0.1:5000/album/1
    # BODY: {"title": "asdas", "idArtist": 1}
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        _json = request.json
        _title = _json['title']
        if _title and request.method == 'PUT':
            sqlQuery = "CALL willUpdateAlbum(%s, %s);"
            bindData = (id, _title)
            cursor.execute(sqlQuery, bindData)
            results = "CALL getAlbums();"
            cursor.execute(results)
            result = cursor.fetchall()
            response = jsonify(result)
            response.status_code = 200
            conn.commit()
            return response
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()


@app.route('/album/<id>', methods=['DELETE'])
def delete_album(id):
    # DELETE: http://127.0.0.1:5000/album/1
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        sqlQuery = "CALL willDeleteAlbum(%s);"
        cursor.execute(sqlQuery, id)
        results = "CALL getAlbums();"
        cursor.execute(results)
        result = cursor.fetchall()
        response = jsonify(result)
        response.status_code = 200
        conn.commit()
        return response
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()
