import pymysql
from app import app
from config import mysql
from flask import jsonify
from flask import request


@app.route('/artist/add', methods=['POST'])
def add_artist():
    # POST: http://127.0.0.1:5000/artist/add
    # BODY: {"name": "asdas"}
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        _json = request.json
        _name = _json['name']
        if _name and request.method == 'POST':
            sqlQuery = "CALL willCreateArtist(%s);"
            cursor.execute(sqlQuery, _name)
            results = "CALL getArtists();"
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


@app.route('/artist', methods=['GET'])
def get_artists():
    # GET: http://127.0.0.1:5000/artist
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        if request.method == 'GET':
            results = "CALL getArtists();"
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


@app.route('/artist/tracks/<id>', methods=['GET'])
def get_artist_tracks(id):
    # GET: http://127.0.0.1:5000/artist/tracks/1
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        if request.method == 'GET':
            results = "CALL tracksForArtist(%s);"
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


@app.route('/artist/albums/<id>', methods=['GET'])
def get_artist_albums(id):
    # GET: http://127.0.0.1:5000/artist/albums/1
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        if request.method == 'GET':
            results = "CALL albumsForArtist(%s);"
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


@app.route('/artist/<id>', methods=['PUT'])
def update_artist(id):
    # PUT: http://127.0.0.1:5000/artist/1
    # BODY: {"name": "asdas"}
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        _json = request.json
        _name = _json['name']
        if request.method == 'PUT':
            results = "CALL willUpdateArtist(%s, %s);"
            binData = (id, _name)
            cursor.execute(results, binData)
            result = cursor.fetchone()
            response = jsonify(result)
            response.status_code = 200
            conn.commit()
            return response
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()


@app.route('/artist/<id>', methods=['DELETE'])
def delete_artist(id):
    # DELETE: http://127.0.0.1:5000/artist/1
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        if request.method == 'DELETE':
            results = "CALL willDeleteArtist(%s);"
            cursor.execute(results, id)
            cursor.execute("CALL getArtists()");
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
