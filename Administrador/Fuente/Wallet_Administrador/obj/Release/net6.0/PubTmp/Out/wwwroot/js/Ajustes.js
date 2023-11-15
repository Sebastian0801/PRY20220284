function validarCampos(){
    let dni = document.getElementById("DNI").value;
    let nombres = document.getElementById("nombres").value;
    let apellidos = document.getElementById("apellidos").value;
    let contraseña = document.getElementById("contraseña").value;
    let correo = document.getElementById("correo").value;
    let celular = document.getElementById("celular").value;

    console.log(dni);
    console.log(nombres);
    console.log(apellidos);
    console.log(contraseña);
    console.log(correo);
    console.log(celular);
    if(dni!=''||nombres!=''||apellidos!=''||contraseña!=''||correo!=''||celular!=''){

        let formData = new FormData();

        formData.append("dni", dni);
        formData.append("nombres", nombres);
        formData.append("apellidos", apellidos);
        formData.append("contraseña", contraseña);
        formData.append("correo", correo);
        formData.append("celular", celular);

        $.ajax({
            type: "POST",
            url: "ActualizarAjustes",
            processData: false,
            contentType: false,
            data: formData,
                    success:function(rpta){
                        if(rpta==true){
                            Swal.fire({
                                title: '¡Listo!',
                                text: ' Los datos fueron actualizados.',
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