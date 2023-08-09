function iniciar(comprobar, id) {
  console.log('Estás en la página de administrador');
  if (document.title === 'Inicio de sesion') {
    console.log('Estás en la página de administrador2');
    let Usuario = document.getElementById("correo").value;
    let Password = document.getElementById("password").value;
    console.log(id)
    //let encontrado = (usuario)
    let encontrado={usuario, Password, id}//

    miStorage = window.localStorage;
    //No, ya veras,ven para abajo
    if (encontrado) {

      if (active = true) {
        window.localStorage.clear('usuario');
      }

      alert('Sesión Exitosa', ". Bienvenido ", Usuario);

      miStorage.setItem('usuario', JSON.stringify(encontrado));//set colocla, get obtener
      //let usuarios1 = miStorage.getItem("usuario");
      let Usuarios = JSON.parse(miStorage.getItem('usuario'));

      if (comprobar == 'User') {
        window.location.href = "../html/user/user.html";
        var active = true;
      } else if (comprobar == 'Admin') {
        window.location.href = "../html/administrador/Admin.html";
        var active = true
      } else if (comprobar == 'Trabajador') {
        window.location.href = "../html/PerfilTrab.html";
        var active = true;

      } else {
        // El usuario no tiene permisos suficientes
        alert("Usuario no se encuentra registrado")
      }

    } else {
      alert("Usuario o contraseña incorrecto")
      document.getElementById("respuesta").innerHTML = 'Usuario o contraseña incorrecto';
    }
   //Si intenta entrar desde un link y no inicio sesion        
  }
  else {
   
    const Trabajador = ['Trabajador'];
    Trabajador.map(y => {
      if (document.title === y) {
        let Usuarios = JSON.parse(window.localStorage.getItem('usuario'));

        if (!Usuarios || Usuarios.privilegios.moduloadmin || Usuarios.privilegios.modulousuario) {
          alert ("Pagina no disponible, por favor iniciar sesion")
          window.location.href = "../html/";

        }
      }

    });


  }

}

function cerrar() {
  window.localStorage.clear('usuario');
  window.location.href = "../html/Login.html";

}

function LoginTrab() {
  const v_Correo = document.getElementById("correo").value;
  const v_Password = document.getElementById("password").value;
  const valido = false;
  axios({
    method: 'POST',
    url: 'http://127.0.0.1:3000/getCompare',
    data: {
      correo: v_Correo,
      password: v_Password,
      valido: true
    }

  }).then(function (response) {
    console.log(response.data.length)
    console.log(response);

    
    if (response.data.length > 0) {
      var comprobar = response.data[0].Modulo//llamar la id de
      var id = response.data[0].id//
    
      iniciar(comprobar, id)
    }
    else {
      console.log("Usuario no se encuentra registrado")
      alert("Usuario no se encuentra registrado")
      document.getElementById("respuesta").innerHTML = 'El usuario no se encuentra registrado';
    }

    /*    
    for () {
        }
*/
  }).catch(err => console.log('Error: ', err))

}