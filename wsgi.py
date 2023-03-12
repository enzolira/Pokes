from flask import Flask, session
from app import app as application
from app.controllers import UserControllers


if __name__=='__main__':
    application.run()