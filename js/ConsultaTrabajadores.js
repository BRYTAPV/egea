let infoForm = {};// para la tabla.
let tabla = document.getElementById("lol")
function agregarcontacto() {
  console.log("Probando")
  const v_Nombre = document.getElementById('nombre').value
  const v_Apellido = document.getElementById('apellido').value
  const v_Edad = document.getElementById('edad').value
  const v_Profesion = document.getElementById('profesion').value
  const v_Telefono = document.getElementById('telefono').value

  axios({
    method: 'POST',
    url: 'http://127.0.0.1:3000/add_contact',
    data: {
      Nombre: v_Nombre,
      Apellido: v_Apellido,
      Edad: v_Edad,
      Profesion: v_Profesion,
      Telefono: v_Telefono
    },
  }).then(function (response) {
    alert("Trabajador registrado")
    window.location.href = '../html/perfilTrab.html';
  }).catch(err => console.log('Error: ', err))

}

function consultar_total() {
  axios({
    method: 'GET',
    url: 'http://127.0.0.1:3000/getTrab',

  }).then(function (response) {

    console.log(response)
    for (let i = 0; i < response.data.length; i++) {
      let nuevaFila= tabla.insertRow(tabla.length);
      console.log("response")
      cell0 = nuevaFila.insertCell(0);
      cell0.innerHTML = response.data[i].Id; /// primer elemento
      console.log("response1")
      cell1 = nuevaFila.insertCell(1);
      cell1.innerHTML = response.data[i].Nombre; /// segundo elemento

      cell2 = nuevaFila.insertCell(2);
      cell2.innerHTML = response.data[i].Apellido;  /// tercer elemento

      cell3 = nuevaFila.insertCell(3);
      cell3.innerHTML = response.data[i].Edad;

      cell4 = nuevaFila.insertCell(4);
      cell4.innerHTML = response.data[i].Profesion;

      cell5 = nuevaFila.insertCell(5);
      cell5.innerHTML = response.data[i].Telefono;
      
      cell6  = nuevaFila.insertCell(6);
      cell6.innerHTML =   `<a class="btn btn-primary mx-5 " onClick="onEdit(this)">Edit</a>
          <a class= "btn btn-danger " onClick="onDelete(this)">Delete</a>`;

    }

  }).catch(err => console.log('Error: ', err))

}


