# API Lecture
# API is used for communicate between 2 softwares
## postman is used for API testing
## flask is library

from flask import Flask

app = Flask(__name__)  # Define 'app' properly

@app.route('/hello', methods=['GET', 'POST'])  # sytnax
def hello_world():
    return "Hello, World! My name is Avinash "

if __name__ == '__main__':
    app.run(debug=True)  
