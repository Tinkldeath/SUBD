from app import app
from flaskext.mysql import MySQL

mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['APPLICATION_ROOT'] = 'musical-player'
app.config['MYSQL_DATABASE_PASSWORD'] = 'dropdead'
app.config['MYSQL_DATABASE_DB'] = 'musical_player'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)