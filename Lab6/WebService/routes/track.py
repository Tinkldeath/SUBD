import pymysql
from app import app
from config import mysql
from flask import jsonify
from flask import request


@app.route('/track', methods=['GET'])
def get_tracks():
    # GET: http://127.0.0.1:5000/track
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        if request.method == 'GET':
            results = "CALL getTracks();"
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


@app.route('/track/add', methods=['POST'])
def add_track():
    # POST: http://127.0.0.1:5000/track/add
    # BODY : {"title": "sadasdas", "genres": [1,2], "artists": [1,2], "album": 1}
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        _json = request.json
        _title = _json['title']
        _genres = _json['genres']
        _artists = _json['artists']
        _album = _json['album']
        if _title and _genres and _artists and _album and request.method == 'POST':
            results = "CALL willCreateTrack(%s);"
            cursor.execute(results, _title)
            id = cursor.fetchone()
            id = int(id['idTrack'])
            print(id)
            for artist in _artists:
                results = "CALL willAddArtistToTrack(%s, %s);"
                binData = (id, artist)
                cursor.execute(results, binData)
            for genre in _genres:
                results = "CALL willAddGenreToTrack(%s, %s);"
                binData = (id, genre)
                cursor.execute(results, binData)
            results = "CALL willAddAlbumToTrack(%s, %s)"
            binData = (id, _album)
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


@app.route('/track/<id>/add/artist', methods=['POST'])
def add_track_artist(id):
    # POST: http://127.0.0.1:5000/track/1/add/artist
    # BODY: {"idArtist": 1}
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        _json = request.json
        _idArtist = _json['idArtist']
        if _idArtist and request.method == 'POST':
            results = "CALL willAddArtistToTrack(%s, %s);"
            binData = (id, _idArtist)
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


@app.route('/track/<id>/add/genre', methods=['POST'])
def add_track_genre(id):
    # POST: http://127.0.0.1:5000/track/1/add/genre
    # BODY: {"idGenre": 1}
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        _json = request.json
        _idGenre = _json['idGenre']
        if _idGenre and request.method == 'POST':
            results = "CALL willAddGenreToTrack(%s, %s);"
            binData = (id, _idGenre)
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


@app.route('/track/<id>/delete/artist/id_artist', methods=['POST'])
def delete_track_artist(id, id_artist):
    # DELETE: http://127.0.0.1:5000/track/1/delete/artist/1
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        if request.method == 'DELETE':
            results = "CALL willDeleteArtistFromTrack(%s, %s);"
            binData = (id, id_artist)
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


@app.route('/track/<id>/delete/genre/<id_genre>', methods=['POST'])
def delete_track_genre(id, id_genre):
    # DELETE: http://127.0.0.1:5000/track/1/delete/genre/1
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        if request.method == 'DELETE':
            results = "CALL willDeleteGenreFromTrack(%s, %s);"
            binData = (id, id_genre)
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


@app.route('/track/<id>', methods=['PUT'])
def update_track(id):
    # PUT: http://127.0.0.1:5000/track/1
    # BODY: {"title": "asdasdsa"}
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        _json = request.json
        _title = _json['title']
        if _title and request.method == 'PUT':
            results = "CALL willUpdateTrack(%s, %s);"
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


@app.route('/track/delete/<id>', methods=['DELETE'])
def delete_track(id):
    # DELETE: http://127.0.0.1:5000/track/1
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    try:
        if request.method == 'DELETE':
            results = "CALL willDeleteTrack(%s);"
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

