function Registrar_Trabajador() {
  console.log("Probando");
  const v_Nombre = document.getElementById("nombre").value;
  const v_Apellido = document.getElementById("apellido").value;
  const v_Edad = document.getElementById("edad").value;
  const v_Profesion = document.getElementById("profesion").value;
  const v_Telefono = document.getElementById("telefono").value;
  const v_Correo = document.getElementById("correo").value;
  const v_Password = document.getElementById("password").value;
  const seguridad = document.getElementById("repetir").value;
  if (seguridad == v_Password) {
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
    })
      .then(function (response) {
        alert("Trabajador registrado");
        window.location.href = "../html/perfilTrab.html";
      })
      .catch((err) => console.log("Error: ", err));
  } else {
    alert("Las contraseñas no coinciden");
  }
}
