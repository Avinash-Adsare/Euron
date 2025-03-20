from flask import Flask,jsonify,request
app = Flask(__name__)

user = [{"id": "1","name":"Avinash","email":"avinash@gmail.com"},{"id":"2","name":"Ram","email":"ram24@gmail.com"}]

@app.route("/get_user",methods=['GET'])

def get_user():
    return user


if __name__ == '__main__':
    app.run(debug = True)
