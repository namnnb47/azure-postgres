from flask import Flask, render_template, request, redirect
from config import SQLALCHEMY_DATABASE_URI, SQLALCHEMY_TRACK_MODIFICATIONS
from models import db, Employee

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = SQLALCHEMY_DATABASE_URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = SQLALCHEMY_TRACK_MODIFICATIONS

db.init_app(app)

# Tạo bảng trong DB khi app khởi động
with app.app_context():
    db.create_all()

@app.route('/')
def index():
    employees = Employee.query.all()
    return render_template('index.html', employees=employees)

@app.route('/add', methods=['POST'])
def add_employee():
    name = request.form['name']
    position = request.form['position']
    salary = request.form['salary']
    new_emp = Employee(name=name, position=position, salary=int(salary))
    db.session.add(new_emp)
    db.session.commit()
    return redirect('/')

if __name__ == '__main__':
    app.run(debug=True)
