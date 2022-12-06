from routes.album import *
from routes.artist import *
from routes.genre import *
from routes.playlist import *
from routes.track import *
from routes.user import *


@app.errorhandler(404)
def show_message(error=None):
    message = {
        'status': 404,
        'message': 'Request not found: ' + request.url,
    }
    respone = jsonify(message)
    respone.status_code = 404
    return respone


@app.errorhandler(500)
def show_error(error=None):
    message = {
        'status': 500,
        'message': 'Bad request: ' + request.url + '. Check log for more details.',
    }
    respone = jsonify(message)
    respone.status_code = 500
    return respone


if __name__ == "__main__":
    app.run()