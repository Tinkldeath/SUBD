import pymysql
from app import app
from config import mysql
from flask import jsonify
from flask import request


@app.route('/genre', methods=['GET'])
def get_genres():
    # GET: http://127.0.0.1:5000/genre
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        if request.method == 'GET':
            results = "CALL getGenres();"
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


@app.route('/genre/tracks/<id>', methods=['GET'])
def get_tracks_for_genre(id):
    # GET: http://127.0.0.1:5000/genre/tracks/1
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        if request.method == 'GET':
            results = "CALL tracksForGenre(%s);"
            cursor.execute(results, id)
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


@app.route('/genre/artists/<id>', methods=['GET'])
def get_artists_for_genre(id):
    # GET: http://127.0.0.1:5000/genre/artists/1
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        if request.method == 'GET':
            results = "CALL artistsForGenre(%s);"
            cursor.execute(results, id)
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


@app.route('/genre/albums/<id>', methods=['GET'])
def get_albums_for_genre(id):
    # GET: http://127.0.0.1:5000/genre/albums/1
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        if request.method == 'GET':
            results = "CALL albumsForGenre(%s);"
            cursor.execute(results, id)
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



@app.route('/genre/add', methods=['POST'])
def add_genre():
    # POST: http://127.0.0.1:5000/genre/add
    # BODY: {"title": "asdasdasd"}
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        _json = request.json
        _title = _json['title']
        if _title and request.method == 'POST':
            query = "CALL willCreateGenre(%s)"
            cursor.execute(query, _title)
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


@app.route('/genre/<id>', methods=['PUT'])
def update_genre(id):
    # PUT: http://127.0.0.1:5000/genre/1
    # BODY: {"title": "asdasdasd"}
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        _json = request.json
        _title = _json['title']
        if _title and request.method == 'PUT':
            results = "CALL willUpdateGenre(%s, %s);"
            binData = (id, _title)
            cursor.execute(results, binData);
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


@app.route('/genre/<id>', methods=['DELETE'])
def delete_genre(id):
    # DELETE: http://127.0.0.1:5000/genre/1
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        if request.method == 'DELETE':
            results = "CALL willDeleteGenre(%s);"
            cursor.execute(results, id)
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