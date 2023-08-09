############# importar librerias o recursos#####
from flask import Flask, request, jsonify
from flask_mysqldb import MySQL
from flask_cors import CORS, cross_origin

# initializations
app = Flask(__name__)
CORS(app)

app.config['MYSQL_HOST'] = 'localhost' 
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'saph_datos'
mysql = MySQL(app)

app.secret_key = "mysecretkey"


@cross_origin()
@app.route('/getCompare', methods=['POST'])
def getCompare():
    try:       
        v_Correo= request.json['Correo']
        v_Password=request.json['Password']
        cur = mysql.connection.corsor()
        cur.execute('SELECT Correo, Password FROM trabajadores where Correo =%s AND Password = %s',(v_Correo, v_Password))
        rv = cur.fetchall()
        cur.close()
        payload = []
        content = {}

        for result in rv:
            content = {'Correo': result[0], 'Password': result[1], 'id': result[2] }
            payload.append(content)
            content = {}
        return jsonify(payload)
    except Exception as e:
        print(e)
        return jsonify({"informacion":e})


@cross_origin()
@app.route('/getTrab', methods=['GET'])
def getTrab():
    try:
        cur = mysql.connection.cursor()
        cur.execute('SELECT * FROM trabajadores')
        rv = cur.fetchall()
        cur.close()
        payload = []
        content = {}
        for result in rv:
            content = {'Id': result[0], 'Nombre': result[1], 'Apellido': result[2], 'Edad': result[3], 'Profesion':result[4], 'Telefono':result[5], 'Correo':result[5], 'Contraseña':result[6]}
            payload.append(content)
            content = {}
        return jsonify(payload)
    except Exception as e:
        print(e)
        return jsonify({"informacion":e})
    


@cross_origin()
@app.route('/add_Trab', methods=['POST'])
def add_Trab():
    try:
        if request.method == 'POST':
            Nombre= request.json['Nombre']
            Apellido= request.json['Apellido']
            Edad=request.json['Edad']
            Profesion=request.json['Profesion']
            Telefono=request.json['Telefono']
            Correo = request.json['Correo']
            Password = request.json['Password']
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO trabajadores (Nombre, Apellido,Edad,Profesion,Telefono,Correo,Password) VALUES (%s,%s,%s,%s,%s,%s,%s)", (Nombre, Apellido, Edad, Profesion, Telefono,Correo,Password))
            mysql.connection.commit()
            return jsonify({"informacion":"Registro exitoso"})
    except Exception as e:
        print(e)
        return jsonify({"informacion":e})

@cross_origin()
@app.route('/add_Usu', methods=['POST'])
def add_Usu():
    try:
        if request.method == 'POST':
            Nombre= request.json['Nombre']
            Apellido= request.json['Apellido']
            Edad=request.json['Edad']
            Telefono=request.json['Telefono']
            Correo = request.json['Correo']
            Password = request.json['Password']
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO usuarios (Nombre, Apellido,Edad,Telefono,Correo,Password) VALUES (%s,%s,%s,%s,%s,%s)", (Nombre, Apellido, Edad,Telefono,Correo,Password))
            mysql.connection.commit()
            return jsonify({"informacion":"Registro exitoso"})
    except Exception as e:
        print(e)
        return jsonify({"informacion":e})

@cross_origin()
@app.route('/getAllById/<id>', methods=['GET'])
def getAllById(id):
    try:
        cur = mysql.connection.corsor()
        cur.execute('SELECT * FROM trabajadoresWHERE id = %s', (id))
        rv = cur.fetchall()
        cur.close()
        payload = []
        content = {}
        for result in rv:
            content = {'Id': result[0], 'Nombre': result[1], 'Apellido': result[2], 'Edad': result[3], 'Profesion':result[4], 'Telefono':result[5]}
            payload.append(content)
            content = {}
        return jsonify(payload)
    except Exception as e:
        print(e)
        return jsonify({"informacion":e})







    
@cross_origin()
@app.route('/getUsuario', methods=['GET'])
def getUsuario():
    try:
        cur = mysql.connection.corsor()
        cur.execute('SELECT * FROM usuario')
        rv = cur.fetchall()
        cur.close()
        payload = []
        content = {}
        for result in rv:
            content = {'Id_usuario': result[0], 'Nombre': result[1], 'Apellido': result[2], 'Edad': result[3], 'Telefono':result[5]}
            payload.append(content)
            content = {}
        return jsonify(payload)
    except Exception as e:
        print(e)
        return jsonify({"informacion":e})
    


    
@cross_origin()
@app.route('/getAdmin', methods=['GET'])
def getAdmin():
    try:
        cur = mysql.connection.corsor()
        cur.execute('SELECT * FROM usuario')
        rv = cur.fetchall()
        cur.close()
        payload = []
        content = {}
        for result in rv:
            content = {'identificacion': result[0], 'Nombre': result[1], 'correo': result[2], 'apellido': result[3], 'contraseña':result[4]}
            payload.append(content)
            content = {}
        return jsonify(payload)
    except Exception as e:
        print(e)
        return jsonify({"informacion":e})
    
    
@cross_origin()
@app.route('/getCalificacion', methods=['GET'])
def getCalificacion():
    try:
        cur = mysql.connection.corsor()
        cur.execute('SELECT * FROM usuario')
        rv = cur.fetchall()
        cur.close()
        payload = []
        content = {}
        for result in rv:
            content = {'Id_calificacion': result[0], 'Id_trabajador': result[1], 'Estrella': result[2], 'Id_usuario': result[3]}
            payload.append(content)
            content = {}
        return jsonify(payload)
    except Exception as e:
        print(e)
        return jsonify({"informacion":e})

    
@cross_origin()
@app.route('/getUsuarios', methods=['GET'])
def getUsuarios():
    try:
        cur = mysql.connection.corsor()
        cur.execute('SELECT * FROM usuario')
        rv = cur.fetchall()
        cur.close()
        payload = []
        content = {}
        for result in rv:
            content = {'id': result[0], 'nombre': result[1], 'correo': result[2], 'contraseña': result[3], 'rol':result[4]}
            payload.append(content)
            content = {}
        return jsonify(payload)
    except Exception as e:
        print(e)
        return jsonify({"informacion":e})

@cross_origin()
@app.route('/login_trabajador', methods=['POST'])
def login_trabajador():
    try:
        if request.method == 'POST':
            correo = request.json['correo']
            contrasena = request.json['contrasena']
            return jsonify({"message": "Inicio de sesión de trabajador exitoso"})
    except Exception as e:
        print(e)
        return jsonify({"informacion": e})

if __name__ == "__main__":
    app.run(port=3000, debug=True)