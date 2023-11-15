var tablaUsuarios;
$(document).ready( function () {
    tablaUsuarios = $('#tablaUsuarios').DataTable({
        "ajax": {
            "url": "ListarSolicitudXID",
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            { "data": "id" },
            { "data": "monto" },
            { "data": "txtEstado" },
            { "data": "txtFechaCreacion",},
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
            targets: [ 1 ],
            render: $.fn.dataTable.render.number( ',', '.', 2, 'S/. '),
          },
          {
            "targets": [ 0, 2 ],
            "className": "text-center",
          }
        ],
        "order": [[0, 'desc']],
        
    });
    //new $.fn.dataTable.FixedHeader( tablaUsuarios );
});

function validarRetiro() {

    let tipoMetodo = document.getElementById('metodo2').value;

    if(tipoMetodo==1){
        retiroYape()
    }
}

function retiroYape(){
    $.ajax({
        url: 'ValidarMetodoRecarga',
        success: function (data) {
            if(data==0){
                $('#modalYapeRetiro').modal('show');
            }else{
                Swal.fire({
                    title: '¡Validación en curso!',
                    text: 'Estimado usuario, por favor espere unos minutos para realizar la recarga.',
                    icon: 'warning',
                    confirmButtonText: 'Ok'
                });
            }
        },
        error: function (error) {
            Swal.fire({
                    title: '¡Error!',
                    text: 'Ocurrió un error al validar.',
                    icon: 'error',
                    confirmButtonText: 'Ok'
                });
        }
    });
}

function validarYapeRetiro(){
    let montoYape = document.getElementById('montoYape2').value;

    var formData = new FormData();
    formData.append("montoYape", montoYape);

    $.ajax({
        type: "POST",
        url: "ValidarYapeRetiro",
        processData: false,
        contentType: false,
        data: formData,
        success: function (rpta) {
            if (rpta == true) {
                Swal.fire({
                    title: '¡Validación en curso!',
                    text: 'Estimado usuario, por favor espere unos minutos para que se actualice el estado de su cuenta.',
                    icon: 'success',
                    confirmButtonText: 'Ok'
                });
            } else {
                Swal.fire({
                    title: '¡Error!',
                    text: 'Ocurrió un error al validar.',
                    icon: 'error',
                    confirmButtonText: 'Ok'
                });
            }
        }

    });
}

function validarMetodo() {

    let tipoMetodo = document.getElementById('metodo').value;

    if(tipoMetodo==1){
        metodoYape()
    }
}

function metodoYape(){
    $.ajax({
        url: 'ValidarMetodoRecarga',
        success: function (data) {
            if(data==0){
                $('#modalYape').modal('show');
            }else{
                Swal.fire({
                    title: '¡Validación en curso!',
                    text: 'Estimado usuario, por favor espere unos minutos para realizar la recarga.',
                    icon: 'warning',
                    confirmButtonText: 'Ok'
                });
            }
        },
        error: function (error) {
            Swal.fire({
                    title: '¡Error!',
                    text: 'Ocurrió un error al validar.',
                    icon: 'error',
                    confirmButtonText: 'Ok'
                });
        }
    });
}

function validarYape(){
    let montoYape = document.getElementById('montoYape').value;

    var formData = new FormData();
    formData.append("montoYape", montoYape);

    $.ajax({
        type: "POST",
        url: "ValidarYapeRecarga",
        processData: false,
        contentType: false,
        data: formData,
        success: function (rpta) {
            if (rpta == true) {
                Swal.fire({
                    title: '¡Validación en curso!',
                    text: 'Estimado usuario, por favor espere unos minutos para que se actualice el estado de su cuenta.',
                    icon: 'success',
                    confirmButtonText: 'Ok'
                });
            } else {
                Swal.fire({
                    title: '¡Error!',
                    text: 'Ocurrió un error al validar.',
                    icon: 'error',
                    confirmButtonText: 'Ok'
                });
            }
        }

    });
}