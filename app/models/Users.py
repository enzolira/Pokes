from app.config.mysqlconnection import connectToMySQL
from flask import flash

import re
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$') 


class User:
    db_name = 'pokes'
    def __init__(self,db_data):
        self.id = db_data['id']
        self.first_name = db_data['first_name']
        self.alias = db_data['alias']
        self.email = db_data['email']
        self.password = db_data['password']
        self.date_of_birth = db_data['date_of_birth']
        self.created_at = db_data['created_at']
        self.updated_at = db_data['updated_at']

    @classmethod
    def get_all(cls):
        query = "SELECT * FROM users;"
        results = connectToMySQL(cls.db_name).query_db(query)
        users = []
        for user in results:
            users.append(cls(user))
        return users
    
    @classmethod
    def get_one(cls,data):
        query = "SELECT * FROM users WHERE id = %(id)s;"
        results = connectToMySQL(cls.db_name).query_db(query,data)
        if len(results) < 1:
            return False
        user = cls(results[0])
        return user

    @classmethod
    def get_by_email(cls,data):
        query = "SELECT * FROM users WHERE email = %(email)s;"
        results = connectToMySQL(cls.db_name).query_db(query,data)
        print(results)
        if len(results) < 1:
            return False
        user = cls(results[0])
        return user
    

    # Create User
    @classmethod
    def save(cls,data):
        query = "INSERT INTO users (first_name,alias,email,password,date_of_birth,created_at,updated_at) VALUES(%(first_name)s,%(alias)s,%(email)s,%(password)s,%(date_of_birth)s,NOW(),NOW())"
        results = connectToMySQL(cls.db_name).query_db(query,data)
        return results
    

    # Validate User

    @staticmethod
    def validate_register(user):
        is_valid = True
        query = "SELECT * FROM users WHERE email = %(email)s;"
        results = connectToMySQL(User.db_name).query_db(query,user)
        if len(results) >= 1:
            flash("Email already taken.","register")
            is_valid=False
        if not EMAIL_REGEX.match(user['email']):
            flash("Invalid Email!!!","register")
            is_valid=False
        if len(user['first_name']) < 3:
            flash("First Name must be at least 3 characters","register")
            is_valid= False
        if len(user['alias']) < 2:
            flash("Alias Name must be at least 2 characters","register")
            is_valid= False
        if len(user['password']) < 8:
            flash("Password must be at least 8 characters","register")
            is_valid= False
        if user['password'] != user['confirm_password']:
            flash("Confirm Passwords don't match","register")
            is_valid= False
        return is_valid