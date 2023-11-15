var tablaUsuarios;
$(document).ready( function () {
    tablaUsuarios = $('#tablaUsuarios').DataTable({
        "ajax": {
            "url": "ListarUsuarios",
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            { "data": "id" },
            { "data": "textidentificacion" },
            { "data": "textestado" },
            { "data": "texttipoTransaccion",},
            { "data": "txtfechaUltimaTransaccion" },
            //$.fn.dataTable.render.number( ',', '.', 2) 
            { "data": "balance"},
            { "data": "id", "render": function (data) {
                return "<button class='btn btn-success' data-toggle='tooltip' data-placement='top' title='Visualizar' style='margin-right: 3px;' type='button' onclick='redirectUsuariosDetalle(" + data + ")'>Visualizar</button>"
                }
            }
        ],

        "language": {
            decimal: ',',
            thousands: '.',
        },
        
        
        "columnDefs": [
/*            {
            targets: [4],
            render: $.fn.dataTable.render.moment('YYYY-MM-DDTHH:mm:ss.SSS', 'DD/MM/YYYY HH:mm:ss'),
        },*/
          {
            targets: [ 5 ],
            render: $.fn.dataTable.render.number( ',', '.', 2, 'S/. '),
          },
          {
            "targets": [ 0, 2, 3, 5, 6 ],
            "className": "text-center",
          }
        ],
        "order": [[0, 'desc']],
        
    });
    //new $.fn.dataTable.FixedHeader( tablaUsuarios );
});

function redirectUsuariosDetalle(id) {
    var redirectToUrl = 'UsuarioDetalle';
    redirectToUrl += '?id=' + id;
    window.location.href = redirectToUrl;
}

function registrarUsuarios(){
    let dni2 = document.getElementById('dni2').value;
    let celular = document.getElementById('celular').value;
    let nombres = document.getElementById('nombres').value;
    let apellidos = document.getElementById('apellidos').value;
    let correo = document.getElementById('correo').value;
    let contraseña = document.getElementById('contraseña').value;
    let tipo = document.getElementById('rol').value;

    const obj = {
        dni2:dni2,
        celular:celular,
        nombres:nombres,
        apellidos:apellidos,
        correo:correo,
        contraseña:contraseña,
        tipo:tipo
    } 
    console.log(obj);

    var formData = new FormData();
    formData.append("dni2", obj.dni2);
    formData.append("celular", obj.celular);
    formData.append("nombres", obj.nombres);
    formData.append("apellidos", obj.apellidos);
    formData.append("correo", obj.correo);
    formData.append("contraseña", obj.contraseña);
    formData.append("tipo", obj.tipo);

    $.ajax({
        type: "POST",
        url: "registrarUsuario",
        processData: false,
        contentType: false,
        data: formData,
        success: function (rpta) {
            if (rpta == true) {
                Swal.fire({
                    title: '¡Listo!',
                    text: ' El usuario fue creado correctamente.',
                    icon: 'success',
                    confirmButtonText: 'Ok'
                });
            } else {
                Swal.fire({
                    title: '¡Error!',
                    text: 'Ocurrió un error al registrar el usuario.',
                    icon: 'error',
                    confirmButtonText: 'Ok'
                });
            }
        }

    });
}