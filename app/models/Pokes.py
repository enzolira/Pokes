from app.config.mysqlconnection import connectToMySQL
from datetime import datetime
import math

class Poke:
    db_name = 'pokes'
    def __init__(self,db_data):
        self.id = db_data['id']
        self.poked_id = db_data['poked_id']
        self.user_id = db_data['user_id']
        self.created_at = db_data['created_at']
        self.updated_at = db_data['updated_at']



    # 1) READ COUNT

    @classmethod
    def resume_count(cls,data):
        query = "SELECT users.alias, touchs.user_id, COUNT(*) AS numb_pokes FROM touchs JOIN users ON touchs.user_id = users.id WHERE poked_id = %(id)s GROUP BY user_id ORDER BY COUNT(*) DESC;"
        results = connectToMySQL(cls.db_name).query_db(query,data)
        counts = []
        for result in results:
            counts.append(result)
        return counts
    
    # 2) CREATE POKE

    @classmethod
    def save(cls,data):
        query = "INSERT INTO touchs (poked_id,user_id, created_at, updated_at) VALUES (%(poked_id)s,%(user_id)s, NOW(), NOW());"
        results = connectToMySQL(cls.db_name).query_db(query,data)
        return results
    
    # 3) TOTAL POKES

    @classmethod
    def total_pokes(cls):
        query = "SELECT user_id, COUNT(*) AS total FROM touchs GROUP BY user_id;"
        results = connectToMySQL(cls.db_name).query_db(query)
        history = []
        for result in results:
            history.append(result)
        return history
