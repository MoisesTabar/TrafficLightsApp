import os
from flask import Flask
from flask.json import jsonify
from src.controller import *

app = Flask(__name__)

@app.route('/status') 
def init():
	status = getSemaphoreStates()
	return jsonify(status)

if __name__ == 'main':
	port = int(os.environ.get('PORT', 5000))
	app.run(debug=False, host="0.0.0.0", port=port)