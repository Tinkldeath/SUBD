import pymysql
from app import app
from config import mysql
from flask import jsonify
from flask import request


@app.route('/genre', methods=['GET'])
def get_genres():
    # GET: http://127.0.0.1:5000/genre
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
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
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
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
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
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
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
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
