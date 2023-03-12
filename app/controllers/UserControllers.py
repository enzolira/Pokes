from flask import Flask, render_template, redirect, request, session, flash
from app import app
from app.models.Users import User
from app.models.Pokes import Poke
from app.controllers import PokeControllers
from flask_bcrypt import Bcrypt

bcrypt = Bcrypt(app)


# -------- index -----------


@app.route('/')
def index():
    return render_template('index.html')




# -------- Register -----------




@app.route('/register', methods=['POST'])
def register():

    if not User.validate_register(request.form):
        return redirect('/')
    
    data = {
        'first_name': request.form['first_name'],
        'alias': request.form['alias'],
        'email': request.form['email'],
        'password': bcrypt.generate_password_hash(request.form["password"]),
        'date_of_birth': request.form['date_of_birth']
    }
    print(data)
    id = User.save(data)
    session['user_id'] = id

    return redirect('/')




# -------- Login -----------



@app.route('/login',methods=['POST'])
def login():
    user = User.get_by_email(request.form)

    if not user:
        flash("Invalid Email","login")
        return redirect('/')
    if not bcrypt.check_password_hash(user.password, request.form['password']):
        flash("Invalid Password","login")
        return redirect('/')
    session['user_id'] = user.id
    return redirect('/home')


@app.route('/home')
def login_in():
    if 'user_id' not in session:
        return redirect('/')
    data = {
        'id': session['user_id']
    }
    name = User.get_one(data)
    users = User.get_all()
    count = Poke.resume_count(data)
    total = len(count)
    historys = Poke.total_pokes()
    # summary = historys[0]['COUNT(*)']
    print(count)
    print(len(count))
    print(historys)
    # print(historys[0]['COUNT(*)'])

    return render_template('pokes.html', name=name.first_name, users=users, count=count, total=total, historys=historys)


# -------- Logout -----------



@app.route('/logout')
def logout():
    session.clear()
    return redirect('/')

