from flask import Flask, render_template, session, redirect, request

from app import app
from app.models.Users import User
from app.controllers import UserControllers
from app.models.Pokes import Poke

@app.route('/action' ,methods=['POST'])
def action():
    if 'user_id' not in session:
        return redirect('/')

    data = {
        'poked_id': request.form['poked_id'],
        'user_id': request.form['user_id']
    }

    Poke.save(data)
    
    return redirect('/home')
