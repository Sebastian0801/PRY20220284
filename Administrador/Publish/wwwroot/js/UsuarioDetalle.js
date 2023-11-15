function transaccionCuenta(){

    let trans = document.getElementById("trans").value;
    let monto = document.getElementById("monto").value;

    let patron = /^\d+(\.\d{1,2})?$/;
    let esValido = patron.test(monto);
    if(!esValido){
        Swal.fire({
            title: '¡Error!',
            text: 'El monto debe de tener máximo dos decimales.',
            icon: 'error',
            confirmButtonText: 'Ok'
        });
        return;
    }

    if(monto!=''){
        let searchParams = new URLSearchParams(window.location.search);
        let id = searchParams.get('id');

        let formData = new FormData();

        formData.append("id", id);
        formData.append("trans", trans);
        formData.append("monto", monto);

        $.ajax({
            type: "POST",
            url: "RealizarTransaccion",
            processData: false,
            contentType: false,
            data: formData,
                    success:function(rpta){
                        if(rpta==true){
                            Swal.fire({
                                title: '¡Listo!',
                                text: ' La transacción fue realizada.',
                                icon: 'success',
                                confirmButtonText: 'Ok'
                            });
                        }else{
                            Swal.fire({
                                title: '¡Error!',
                                text: 'Ocurrió un error.',
                                icon: 'error',
                                confirmButtonText: 'Ok'
                            });
                        }
                    }
    
        });

    }else{
        Swal.fire({
            title: '¡Error!',
            text: 'Los campos no deben de ser nulos.',
            icon: 'error',
            confirmButtonText: 'Ok'
        });
    }
}

function actualizarDatos() {

    let DNI = document.getElementById("DNI").value;
    let nombres = document.getElementById("nombres").value;
    let apellidos = document.getElementById("apellidos").value;
    let celular = document.getElementById("celular").value;
    let estado = document.getElementById("estado").value;

    let searchParams = new URLSearchParams(window.location.search);
    let id = searchParams.get('id');

    let formData = new FormData();

    formData.append("id", id);
    formData.append("DNI", DNI);
    formData.append("nombres", nombres);
    formData.append("apellidos", apellidos);
    formData.append("celular", celular);
    formData.append("estado", estado);

    $.ajax({
        type: "POST",
        url: "ActualizarDatos",
        processData: false,
        contentType: false,
        data: formData,
        success: function (rpta) {
            if (rpta == true) {
                Swal.fire({
                    title: '¡Listo!',
                    text: 'Se actualizó exitosamente al usuario.',
                    icon: 'success',
                    confirmButtonText: 'Ok'
                });
            } else {
                Swal.fire({
                    title: '¡Error!',
                    text: 'Ocurrió un error.',
                    icon: 'error',
                    confirmButtonText: 'Ok'
                });
            }
        }

    });
}