function Registrar_Trabajador() {
  console.log("Probando");
  const v_Nombre = document.getElementById("nombre").value
  const v_Apellido = document.getElementById("apellido").value
  const v_Edad = document.getElementById("edad").value
  const v_Profesion = document.getElementById("profesion").value
  const v_Telefono = document.getElementById("telefono").value
  const v_Correo = document.getElementById("correo").value
  const v_Password = document.getElementById("password").value
  const seguridad = document.getElementById("repetir").value
  if (seguridad == v_Password) {
    if (v_Nombre != "" && v_Apellido != "" && v_Edad != "" && v_Profesion != "" && v_Telefono != "" && v_Correo != "" && v_Password != "") {
      console.log("Datos enviados.");
      try {
        axios({
          method: "POST",
          url: "http://127.0.0.1:3000/add_Trab",
          data: {
            Nombre: v_Nombre,
            Apellido: v_Apellido,
            Edad: v_Edad,
            Profesion: v_Profesion,
            Telefono: v_Telefono,
            Correo: v_Correo,
            Password: v_Password
          }
        }).then (function (response) {
          console.log("hola")
          alert("Registro exitoso");
          window.location.href = "../html/perfilTrab.html";          
        }).catch("2")
      } catch (error) {
        console.log(error);
      }
    } else {
      alert('Campos vacios')
    }
  } else {
    alert(
      "La contraseña no es la misma, porfavor vuelva a ingresar la confirmación"
    )
    console.log(
      "La contraseña no es la misma, porfavor vuelva a ingresar la confirmación"
    );
    const seguridad = (document.getElementById(
      "confirmar contraseña"
    ).value = "");
  }
};

