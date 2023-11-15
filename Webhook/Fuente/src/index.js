require('dotenv').config();

const express=require('express');
const MessagingResponse = require('twilio').twiml.MessagingResponse;
const bodyParser = require('body-parser');
const admin=require('firebase-admin');
const a=require('../src/controllers/respuestas.controller');
const respuestasController=require('../src/controllers/mensajeria.controller');
const app=express();
const db = admin.database();

const accountSid = process.env.ACCOUNT_SID;
const authToken = process.env.AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.get('/test',(req,res)=>{
    console.log("test");
    res.send("test");
} );

app.post('/sms',(req,res)=>{

    console.log(req.body.Body);
    respuestasController.Flujo(req.body)
    .then(data => {
        console.log('data= '+data);
      enviarRespuesta(req,res,data);
      //res.send("Ok");
    })
    .catch(error => {
        console.log('error= '+error);
     enviarRespuesta(req,res,error);
     //res.send("Error");
    });
} );

const OTP=(req)=>{
    respuestasController.ObtenerRespuestaXFlujo(req.body,9).then(data => {
        enviarMensaje(req,data);
        console.log(data);
        })
        .catch(error => {
        console.log(error);
        });
}

const anotherFlujo=(req)=>{
    respuestasController.ObtenerRespuestaXFlujo(req.body,9).then(data => {
        enviarMensaje(req,data);
        console.log(data);
      })
      .catch(error => {
        console.log(error);
      });
}


const enviarRespuesta=(req,res,texto)=>{
    console.log('texto= '+texto);
    const twiml = new MessagingResponse();
    twiml.message(texto);
    res.writeHead(200, {'Content-Type': 'text/xml'});
    res.end(twiml.toString());


    if(texto=='Ocurrió un error durante la validacion, por favor vuelva a intentarlo.'){
        enviarMensaje(req,texto);
    }

    //*Seguir flujo con DNI
    if(texto=='Por favor, responda a los siguientes campos para poder registrarlo.'){
        respuestasController.ObtenerRespuestaXFlujo(req.body,4).then(data => {
            enviarMensaje(req,data);
            console.log(data);
          })
          .catch(error => {
            console.log(error);
          });
    }

    //*Llamar al usuario
    if(texto=='Introduzca su contraseña en la llamada.'){

        //enviarMensaje(req,texto);
        //enviarMensaje(req,"Por favor espere.");

        const callTo=req.body.To;
        const callFrom=req.body.From;
        console.log(callTo);
        console.log(callFrom);

        client.calls
                .create({
                url: 'http://3.90.241.191/procesar-digitos/1', // URL de acción del controlador de ASP.NET Core
                //url: 'https://localhost:7095/procesar-digitos', // URL de acción del controlador de ASP.NET Core
                method: 'GET', // Método HTTP utilizado para la solicitud
                //body: JSON.stringify(postData),
                //headers: { 'Content-Type': 'application/json' },
                to: callFrom, // Número de teléfono de destino
                from: callTo, // Número de teléfono de origen (tu número de Twilio)
                statusCallback: 'http://3.90.241.191/procesar-digitos2'
                })
                .then(OTP(req))
                .catch(error => console.error(error));
        
    }

    //*Llamar al usuario LOGUEO
    if(texto=='Ingrese su contraseña en la llamada.'){

        enviarMensaje(req,texto);

        const callTo=req.body.To;
        const callFrom=req.body.From;
        console.log(callTo);
        console.log(callFrom);

        client.calls
                .create({
                url: 'http://3.90.241.191/procesar-digitos/2', // URL de acción del controlador de ASP.NET Core
                //url: 'https://localhost:7095/procesar-digitos', // URL de acción del controlador de ASP.NET Core
                method: 'GET', // Método HTTP utilizado para la solicitud
                //body: JSON.stringify(postData),
                //headers: { 'Content-Type': 'application/json' },
                to: callFrom, // Número de teléfono de destino
                from: callTo, // Número de teléfono de origen (tu número de Twilio)
                statusCallback: 'http://3.90.241.191/procesar-digitos3'
                })
                .catch(error => console.error(error));


                setTimeout(() => {
                    respuestasController.ObtenerRespuestaXFlujo(req.body,21).then(data => {
                        enviarMensaje(req,data);
                        console.log(data);
                      })
                      .catch(error => {
                        console.log(error);
                      });
                  }, 40000);
        
    }
    //*Validacion EQUIFAX OK

    if(texto=='Ingrese su contraseña antigua en la llamada.'){

        enviarMensaje(req,texto);

        const callTo=req.body.To;
        const callFrom=req.body.From;
        console.log(callTo);
        console.log(callFrom);

        client.calls
                .create({
                url: 'http://3.90.241.191/procesar-digitos/3', // URL de acción del controlador de ASP.NET Core
                //url: 'https://localhost:7095/procesar-digitos', // URL de acción del controlador de ASP.NET Core
                method: 'GET', // Método HTTP utilizado para la solicitud
                //body: JSON.stringify(postData),
                //headers: { 'Content-Type': 'application/json' },
                to: callFrom, // Número de teléfono de destino
                from: callTo, // Número de teléfono de origen (tu número de Twilio)
                statusCallback: 'http://3.90.241.191/procesar-digitos4'
                })
                .catch(error => console.error(error));


                setTimeout(() => {
                    respuestasController.ObtenerRespuestaXFlujo(req.body,41).then(data => {
                        enviarMensaje(req,data);
                        console.log(data);
                        callAux(req,callFrom,callTo);
                      })
                      .catch(error => {
                        console.log(error);
                      });
                  }, 40000);
        
    }
};

const callAux=(req,callFrom,callTo)=>{

    console.log("callAux");

    client.calls
    .create({
    url: 'http://3.90.241.191/procesar-digitos/4', // URL de acción del controlador de ASP.NET Core
    //url: 'https://localhost:7095/procesar-digitos', // URL de acción del controlador de ASP.NET Core
    method: 'GET', // Método HTTP utilizado para la solicitud
    //body: JSON.stringify(postData),
    //headers: { 'Content-Type': 'application/json' },
    to: callFrom, // Número de teléfono de destino
    from: callTo, // Número de teléfono de origen (tu número de Twilio)
    statusCallback: 'http://3.90.241.191/procesar-digitos5'
    })
    .catch(error => console.error(error));


    setTimeout(() => {
        respuestasController.ObtenerRespuestaXFlujo(req.body,42).then(data => {
            enviarMensaje(req,data);
            console.log(data);
          })
          .catch(error => {
            console.log(error);
          });
      }, 40000);
}

const enviarMensaje=(req,data)=>{
    //const accountSid = process.env.ACCOUNT_SID;
    //const authToken = process.env.AUTH_TOKEN;

    const client=require('twilio')(accountSid, authToken);
    
    console.log('req: '+req);
    console.log('data: '+data);
    console.log('req.body.From: '+req.body.From);



    client.messages.create({
        to: req.body.From,
        from: '+15075805071',
        body: data
    })
        .then(message => console.log(message.sid)); 
}

/*

const registrarRespuestaRecibida=(res,texto)=>{
    const twiml = new MessagingResponse();
    twiml.message(texto);
    res.writeHead(200, {'Content-Type': 'text/xml'});
    res.end(twiml.toString());
}

const registrarRespuestaEnviada=(res,texto)=>{
    const twiml = new MessagingResponse();
    twiml.message(texto);
    res.writeHead(200, {'Content-Type': 'text/xml'});
    res.end(twiml.toString());
}
*/



app.listen(4000,()=>{
    console.log('Server on port 4000');
} )

//./ngrok http 4000
/* Enviar Mensajes
require('dotenv').config();

const accountSid = process.env.ACCOUNT_SID;
const authToken = process.env.AUTH_TOKEN;

const client=require('twilio')(accountSid, authToken);

client.messages.create({
    to: process.env.MY_PHONE_NUMBER,
    from: '+15075805071',
    body: 'Test node js'
})
    .then(message => console.log(message.sid)); 
*/