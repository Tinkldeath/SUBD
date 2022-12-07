import pymysql
from app import app
from config import mysql
from flask import jsonify
from flask import request

@app.route('/playlist', methods=['GET'])
def get_playlists():
    # GET: http://127.0.0.1:5000/playlist
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        if request.method == 'GET':
            results = "CALL getPlaylists();"
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


@app.route('/playlist/<id>', methods=['GET'])
def get_playlist(id):
    # GET: http://127.0.0.1:5000/playlist/1
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        if request.method == 'GET':
            results = "CALL tracksForPlaylist(%s);"
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


@app.route('/playlist/add', methods=['POST'])
def add_playlist():
    # POST: http://127.0.0.1:5000/playlist/add
    # BODY: {"title": "asdads", "ownerId": 1}
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        _json = request.json
        _title = _json['title']
        _owner = _json['ownerId']
        if _title and _owner and request.method == 'POST':
            results = "CALL willCreatePlaylist(%s, %s);"
            binData = (_title, _owner)
            cursor.execute(results, binData)
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


@app.route('/playlist/<id>', methods=['PUT'])
def update_playlist(id):
    # PUT: http://127.0.0.1:5000/playlist/1
    # BODY: {"title": "asdads"}
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        _json = request.json
        _title = _json['title']
        if _title and request.method == 'PUT':
            results = "CALL willUpdatePlaylist(%s, %s);"
            binData = (id, _title)
            cursor.execute(results, binData)
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


@app.route('/playlist/<id>', methods=['DELETE'])
def delete_playlist(id):
    # DELETE: http://127.0.0.1:5000/playlist/1
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        if request.method == 'DELETE':
            results = "CALL willDeletePlaylist(%s);"
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


@app.route('/playlist/<id>/track/<id_track>', methods=['DELETE'])
def delete_playlist_track(id, id_track):
    # DELETE: http://127.0.0.1:5000/playlist/1/track/1
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        if request.method == 'DELETE':
            results = "CALL willDeleteTrackFromPlaylist(%s, %s);"
            binData = (id, id_track)
            cursor.execute(results, binData)
            response.status_code = 200
            conn.commit()
            return response
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()


@app.route('/playlist/<id>/track/<id_track>', methods=['PUT'])
def add_playlist_track(id, id_track):
    # PUT: http://127.0.0.1:5000/playlist/1/track/1
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        if request.method == 'PUT':
            results = "CALL willAddTrackToPlaylist(%s, %s);"
            binData = (id, id_track)
            cursor.execute(results, binData)
            response.status_code = 200
            conn.commit()
            return response
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()

