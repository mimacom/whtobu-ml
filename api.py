#!flask/bin/python
from flask import Flask, jsonify, make_response, request, abort, flash
import uuid

app = Flask(__name__)


@app.errorhandler(404)
def not_found(error):
    return make_response(jsonify({'error': 'Not found'}), 404)


@app.route('/analyze', methods=['POST'])
def analyze():
    print(str(request.files))

    if 'file' not in request.files:
        print('No file part')
        abort(400)

    file = request.files['file']

    if file.filename == '':
        print('No selected file')
        abort(400)

    file = request.files['file']

    print(file.filename)

    return jsonify([
        {
            'ASIN': 'ABCDF'
        }
    ])


if __name__ == '__main__':
    app.secret_key = str(uuid.uuid4())
    app.config['SESSION_TYPE'] = 'filesystem'
    app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024

   # sess.init_app(app)

    app.debug = True
    app.run()
