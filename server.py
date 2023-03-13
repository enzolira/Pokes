from flask import Flask
from app import app
from app.controllers import UserControllers


if __name__=='__main__':
    app.run(debug=True)