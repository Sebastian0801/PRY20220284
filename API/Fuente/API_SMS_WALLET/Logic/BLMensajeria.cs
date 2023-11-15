using API_SMS_WALLET.Data;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Newtonsoft.Json;
using System.Net.Http;
using System.Data.SqlClient;
using System.Data;

namespace API_SMS_WALLET.Logic
{
    public class BLMensajeria
    {
        private readonly DAMensajeria _DAMensajeria = new DAMensajeria();

        public string RegistrarMensajeFlujoExistente(APIMensajeria apimensajeria, Mensajeria ultimoMensaje)
        {
            string respuesta = "";

            //Enviar Codigo
            if (ultimoMensaje.id_flujo == 7)
            {
                _DAMensajeria.GenerarCodigo(apimensajeria.emisor);
                string codigo = _DAMensajeria.BuscarCodigoXNumero(apimensajeria.emisor);
                if (codigo == "" || codigo == null)
                {
                    return "Error";
                }
                //EnviarCodigo(apimensajeria.emisor, codigo);
            }

            //VALIDAR y CREAR CUENTA
            if (ultimoMensaje.id_flujo == 8)
            {
                RegistrarRespuestaEntrante(apimensajeria, 8);
                string codigo = _DAMensajeria.BuscarCodigoXNumero(apimensajeria.emisor);
                codigo = codigo.ToUpper();
                if (codigo == apimensajeria.body)
                {
                    var datos = _DAMensajeria.BuscarDatosNuevoUsuario(apimensajeria.emisor);

                    var existeUsuario = _DAMensajeria.BuscarUsuario(datos[0]);
                    if(existeUsuario != 0)
                    {   
                        string rpta1 = "Ya existe una cuenta registrada con esos datos.";
                        RegistrarRespuestaSalienteError(apimensajeria, rpta1, 10);
                        _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                        return "";
                    }

                    datos[3] = Crypt.Encrypt(datos[3]);
                    var valRegistro=_DAMensajeria.RegistrarUsuario(datos,apimensajeria.emisor);
                    if (valRegistro)
                    {
                        string resp = RegistrarRespuestaSaliente(apimensajeria, ultimoMensaje, 9);
                        _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                        return resp;
                    }
                    else
                    {
                        string resp = RegistrarRespuestaSaliente(apimensajeria, ultimoMensaje, 10);
                        _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                        return resp;
                    }
                }
                else
                {
                    return "El código ingresado no es el correcto";
                }
            }

            string mnsj = validarRespuesta(ultimoMensaje.id_flujo, apimensajeria);
            if(mnsj!="ok")
            {
                RegistrarRespuestaEntrante(apimensajeria, 2);

                RegistrarRespuestaSalienteError(apimensajeria, mnsj, 2);
                return mnsj;
            }

            int flujosiguiente = ObtenerFlujoSiguiente(ultimoMensaje.id_flujo);
            if (flujosiguiente == 0)
            {
                return "Ocurrió un error al continuar con su solicitud.";
            }

            if (apimensajeria.body == "1")
            {
                RegistrarRespuestaEntrante(apimensajeria, 2);
                respuesta = RegistrarRespuestaSaliente(apimensajeria, ultimoMensaje, 3);
            } 
            else if(apimensajeria.body == "2")
            {
                respuesta = segundoFlujo(apimensajeria, ultimoMensaje);
            }
            else if (flujosiguiente >= 11)
            {
                respuesta = segundoFlujo(apimensajeria, ultimoMensaje);
            }
            else
            {
                RegistrarRespuestaEntrante(apimensajeria, flujosiguiente);
                respuesta = RegistrarRespuestaSaliente(apimensajeria, ultimoMensaje, flujosiguiente);
            }

            

            return respuesta;
        }

        public string segundoFlujo(APIMensajeria apimensajeria, Mensajeria ultimoMensaje)
        {
            string texto = "";
            string respuesta = "";
            int validar = 0;

            if(apimensajeria.body=="2")
            {
                texto = "Ingrese su DNI.";
                Entrante(apimensajeria, 2);
                Salida(apimensajeria, texto, 12);
            } 
            else if (ultimoMensaje.id_flujo==12)
            {
                texto = "Ingrese su Contraseña.";
                Entrante(apimensajeria, 12);
                Salida(apimensajeria, texto, 13);
            }
            else if (ultimoMensaje.id_flujo == 13)
            {
                texto = "Ingrese su Contraseña.";
                Entrante(apimensajeria, 13);
                //Validacion de usuario SMS.
                var lst = _DAMensajeria.BuscarDatosValidarUsuario(apimensajeria.emisor);
                lst[1] = Crypt.Encrypt(lst[1]);
                validar = _DAMensajeria.ValidarUsuario(lst[0], lst[1]);
                if (validar != 0)
                {
                    texto = "Seleccione la operación que desea hacer:/n 1.Transferir dinero /n 2.Obtener reportes /n 3.Actualizar datos";
                    Salida(apimensajeria, texto, 14);
                }
                else
                {
                    texto = "Error al validar las credenciales";
                    Salida(apimensajeria, texto, 14);
                    _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                }
            }
            return texto;
        }

        public string validarRespuesta(int idFlujo, APIMensajeria apimensajeria)
        {
            switch (idFlujo)
            {
                case 1:
                    if(apimensajeria.body=="1"|| apimensajeria.body == "2"||apimensajeria.body == "3")
                    {
                        return "ok";
                    }
                    else
                    {
                        return "Por favor introduzca una opción válida.";
                    }
                default:
                    return "ok";
            }
        }

        public int ObtenerFlujoSiguiente(int idFlujo)
        {
            if (idFlujo >= 12)
            {
                return idFlujo;
            }
            else
            {
                switch (idFlujo)
                {
                    case 0:
                        return 1;
                    case 1:
                        return 1 + 2;
                    case 2:
                        return 2;
                    case 3:
                        return 4;
                    case 4:
                        return 4;
                    case 5:
                        return 5;
                    case 6:
                        return 6;
                    case 7:
                        return 7;
                    case 8:
                        return 8;
                    default:
                        return 0;
                }
            }
        }

        public bool RegistrarRespuestaEntrante(APIMensajeria apimensajeria, int flujosiguiente)
        {
            bool rpta = true;
            //Mensaje Entrante
            Mensajeria mensajeriaEntrante = new Mensajeria();
            mensajeriaEntrante.id_flujo = flujosiguiente;
            mensajeriaEntrante.body = apimensajeria.body;
            mensajeriaEntrante.emisor = apimensajeria.emisor;
            mensajeriaEntrante.receptor = apimensajeria.receptor;
            mensajeriaEntrante.numeroContacto = apimensajeria.emisor;

            rpta = _DAMensajeria.RegistrarMensajeria(mensajeriaEntrante);

            return rpta;
        }

        public string RegistrarRespuestaSaliente(APIMensajeria apimensajeria, Mensajeria ultimoMensaje, int flujosiguiente)
        {
            if (flujosiguiente >= 4 && flujosiguiente<=8)
            {
                flujosiguiente = flujosiguiente + 1;
            }
            Flujos flujos = _DAMensajeria.ObtenerFlujoXID(flujosiguiente);

            //Mensaje Saliente
            Mensajeria mensajeriaSaliente = new Mensajeria();
            mensajeriaSaliente.id_flujo = flujos.id;
            mensajeriaSaliente.body = flujos.mensaje;
            mensajeriaSaliente.emisor = apimensajeria.receptor;
            mensajeriaSaliente.receptor = apimensajeria.emisor;
            mensajeriaSaliente.numeroContacto = mensajeriaSaliente.receptor;

            bool mensajeSaliente = _DAMensajeria.RegistrarMensajeria(mensajeriaSaliente);

            if(mensajeSaliente)
            {
                return flujos.mensaje;
            }
            else
            {
                return "error";
            }
        }

        public string RegistrarRespuestaSalienteError(APIMensajeria apimensajeria, string error, int flujosiguiente)
        {
            //Flujos flujos = _DAMensajeria.ObtenerMensajeXFlujo(apimensajeria.emisor);
            Flujos flujos = _DAMensajeria.ObtenerFlujoXID(flujosiguiente);

            //Mensaje Saliente
            Mensajeria mensajeriaSaliente = new Mensajeria();
            mensajeriaSaliente.id_flujo = flujos.id;
            mensajeriaSaliente.body = error;
            mensajeriaSaliente.emisor = apimensajeria.receptor;
            mensajeriaSaliente.receptor = apimensajeria.emisor;
            mensajeriaSaliente.numeroContacto = mensajeriaSaliente.receptor;

            bool mensajeSaliente = _DAMensajeria.RegistrarMensajeria(mensajeriaSaliente);

            if (mensajeSaliente)
            {
                return flujos.mensaje;
            }
            else
            {
                return "error";
            }
        }

        public void EnviarCodigo(string para, string mensaje)
        {
            //string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
            string accountSid = "AC22f637a234b081e4725a79b3220552e7";
            //string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
            string authToken = "e9d43d926682e4d427c1b4c8c9a9406b";

            TwilioClient.Init(accountSid, authToken);

            var message = MessageResource.Create(
                body: mensaje,
                from: new Twilio.Types.PhoneNumber("+18252519546"),
                to: new Twilio.Types.PhoneNumber(para)
            );
        }

        public void Entrante(APIMensajeria apimensajeria, int flujo)
        {
            Mensajeria mensajeriaEntrante = new Mensajeria();
            mensajeriaEntrante.id_flujo = flujo;
            mensajeriaEntrante.body = apimensajeria.body;
            mensajeriaEntrante.emisor = apimensajeria.emisor;
            mensajeriaEntrante.receptor = apimensajeria.receptor;
            mensajeriaEntrante.numeroContacto = apimensajeria.emisor;

            _DAMensajeria.RegistrarMensajeria(mensajeriaEntrante);
        }

        public void Salida(APIMensajeria apimensajeria, string texto, int flujo)
        {
            Mensajeria mensajeriaSaliente = new Mensajeria();
            mensajeriaSaliente.id_flujo = flujo;
            mensajeriaSaliente.body = texto;
            mensajeriaSaliente.emisor = apimensajeria.receptor;
            mensajeriaSaliente.receptor = apimensajeria.emisor;
            mensajeriaSaliente.numeroContacto = mensajeriaSaliente.receptor;

            //if (flujo == 9)
            //{
            //    mensajeriaSaliente.numeroContacto = mensajeriaSaliente.emisor;
            //}

            //if (flujo == 21)
            //{
            //    mensajeriaSaliente.numeroContacto = mensajeriaSaliente.emisor;
            //}

            //if (flujo == 41)
            //{
            //    mensajeriaSaliente.numeroContacto = mensajeriaSaliente.emisor;
            //}

            if (mensajeriaSaliente.numeroContacto.StartsWith("+1"))
            {
                mensajeriaSaliente.numeroContacto = mensajeriaSaliente.emisor;
            }

            _DAMensajeria.RegistrarMensajeria(mensajeriaSaliente);
        }

        public void SalidaAUX(APIMensajeria apimensajeria, string texto, int flujo)
        {
            Mensajeria mensajeriaSaliente = new Mensajeria();
            mensajeriaSaliente.id_flujo = flujo;
            mensajeriaSaliente.body = texto;
            mensajeriaSaliente.emisor = apimensajeria.receptor;
            mensajeriaSaliente.receptor = apimensajeria.emisor;
            mensajeriaSaliente.numeroContacto = mensajeriaSaliente.receptor;

            //if (flujo == 9)
            //{
            //    mensajeriaSaliente.numeroContacto = mensajeriaSaliente.emisor;
            //}

            //if (flujo == 21)
            //{
            //    mensajeriaSaliente.numeroContacto = mensajeriaSaliente.emisor;
            //}

            //if (flujo == 41)
            //{
            //    mensajeriaSaliente.numeroContacto = mensajeriaSaliente.emisor;
            //}

            //if (flujo == 42)
            //{
            //    mensajeriaSaliente.numeroContacto = mensajeriaSaliente.emisor;
            //}

            if (mensajeriaSaliente.numeroContacto.StartsWith("+1"))
            {
                mensajeriaSaliente.numeroContacto = mensajeriaSaliente.emisor;
            }

            _DAMensajeria.RegistrarMensajeria(mensajeriaSaliente);
        }

        public string ValidarDatosRENIEC(APIMensajeria apimensajeria)
        {
            string mensaje = "";
            var datos = _DAMensajeria.BuscarDatosValidaciónRENIEC(apimensajeria.emisor);

            IWebDriver driver = new ChromeDriver();
            try
            {
                driver.Navigate().GoToUrl("https://serviciosweb.reniec.gob.pe/aip/");

                Thread.Sleep(5000);

                IWebElement dni = driver.FindElement(By.Id("numero"));
                dni.SendKeys(datos[0]);
                Thread.Sleep(2000);

                IWebElement fecnac = driver.FindElement(By.Id("fenac"));
                fecnac.SendKeys(datos[1]);
                Thread.Sleep(2000);

                IWebElement nompadre = driver.FindElement(By.Id("nompadre"));
                nompadre.SendKeys(datos[2]);
                Thread.Sleep(2000);

                IWebElement nommadre = driver.FindElement(By.Id("nommadre"));
                nommadre.SendKeys(datos[3]);
                Thread.Sleep(2000);

                IWebElement lugnac = driver.FindElement(By.Id("s2id_ubigeonac"));
                lugnac.Click();
                Thread.Sleep(2000);

                IWebElement lugnac2 = driver.FindElement(By.ClassName("select2-input"));
                lugnac2.SendKeys(datos[4]);
                Thread.Sleep(4000);
                lugnac2.SendKeys(Keys.Enter);
                Thread.Sleep(2000);

                IWebElement readDNI = driver.FindElement(By.Id("readDNI"));
                readDNI.Click();
                Thread.Sleep(5000);

                IWebElement divElement = driver.FindElement(By.Id("resultado"));
                var spanElements = divElement.FindElements(By.TagName("p"));
                mensaje = spanElements[0].Text;
                driver.Quit();
            }
            catch (Exception ex)
            {
                mensaje = ex.Message;
                driver.Quit();
            }

            if(mensaje== "Mediante el uso del presente Módulo, los ciudadanos tienen la opción de generar de manera virtual, desde cualquier punto del país, las 24 horas del día y durante los 365 días del año, las solicitudes de acceso a la Información Pública ante el RENIEC, sin la necesidad de acercarse para tal fin a nuestras sedes, oficinas o agencias.")
            {
                mensaje = "Introduzca su contraseña en la llamada.";
            }

            return mensaje;
        }

        public APIConsulta CallAPI(string DNI)
        {
            APIUsuarios cslt = new APIUsuarios();

            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri("https://validaciondocumentos.adexperu.org.pe/");

            string json = JsonConvert.SerializeObject(cslt);

            StringContent httpContent = new StringContent(json, System.Text.Encoding.UTF8, "application/json");
            string url = "https://validaciondocumentos.adexperu.org.pe/Api/ConsultDni" + "?dni=" + DNI;
            HttpResponseMessage response = client.PostAsync(url, httpContent).Result;
            if (response.IsSuccessStatusCode)
            {
                //var dto = response.Content.ReadAsAsync<est.Messages>().Result;
                var dto = response.Content.ReadAsStringAsync();
                var est1 = dto.Exception;
                var est21 = dto.Result;
                //var est2 = dto.Result.ElementAt(1);

                var test = JsonConvert.DeserializeObject<APIConsulta>(est21);

                return test;
            }
            else
            {
                return null;
            }
        }

        public bool RegistrarUsuario(List<string> datos, string numero)
        {
            bool rpta = true;

            var APIDNI = CallAPI(datos[0]);

            if (APIDNI == null)
            {
                return false;
            }

            datos[1] = APIDNI.data.nombreSoli;
            datos[2] = APIDNI.data.apePatSoli+" "+APIDNI.data.apeMatSoli;

            rpta = _DAMensajeria.RegistrarUsuario(datos, numero);

            return rpta;
        }
    }
}
