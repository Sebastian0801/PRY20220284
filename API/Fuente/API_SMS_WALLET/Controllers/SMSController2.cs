using API_SMS_WALLET.Data;
using API_SMS_WALLET.Logic;
using Microsoft.AspNetCore.Mvc;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Threading;

namespace API_SMS_WALLET.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class SMSController2 : Controller
    {
        private readonly DAMensajeria _DAMensajeria = new DAMensajeria();
        private readonly BLMensajeria _BLMensajeria = new BLMensajeria();

        [HttpPost("Mensaje")]
        public IActionResult UltimoMensaje(APIMensajeria apimensajeria)
        {
            string mensajeEnviar = "";
            //Flujo inicial
            var rpta = _DAMensajeria.UltimoMensajeXEmisor(apimensajeria.emisor);
            if (rpta == null)
            {
                mensajeEnviar = "Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta";

                Mensajeria mensajeriaInicial = new Mensajeria();
                mensajeriaInicial.id_flujo = 0;
                mensajeriaInicial.body = mensajeEnviar;
                mensajeriaInicial.emisor = apimensajeria.emisor;
                mensajeriaInicial.receptor = apimensajeria.receptor;

                _BLMensajeria.Entrante(apimensajeria, 1);
                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 1);

                return Json(mensajeEnviar);
            }
            else
            {
                switch (rpta.id_flujo)
                {
                    case 1:
                        _BLMensajeria.Entrante(apimensajeria, 2);
                        if (apimensajeria.body=="1"||apimensajeria.body=="2"||apimensajeria.body== "3")
                        {
                            if (apimensajeria.body == "1")
                            {
                                mensajeEnviar = "Por favor, responda a los siguientes campos para poder registrarlo.";
                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 3);
                            }
                            else if (apimensajeria.body == "2")
                            {
                                mensajeEnviar = "Ingrese su DNI:";
                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 10);
                            }
                        }
                        else
                        {
                            mensajeEnviar = "Por favor introduzca una opción válida.";
                            _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 2);
                        }
                        return Json(mensajeEnviar);
                    case 2:
                        _BLMensajeria.Entrante(apimensajeria, 2);
                        if (apimensajeria.body == "1" || apimensajeria.body == "2" || apimensajeria.body == "3")
                        {
                            if (apimensajeria.body == "1")
                            {
                                mensajeEnviar = "Por favor, responda a los siguientes campos para poder registrarlo.";
                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 3);
                            }
                            else if (apimensajeria.body == "2")
                            {
                                mensajeEnviar = "Ingrese su DNI:";
                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 10);
                            }
                        }
                        else
                        {
                            mensajeEnviar = "Por favor introduzca una opción válida.";
                            _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 2);
                        }
                        return Json(mensajeEnviar);
                    case 4:
                        mensajeEnviar = "Fecha de nacimiento DDMMAAAA(01012001):";
                        _BLMensajeria.Entrante(apimensajeria, 4);
                        _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 5);
                        return Json(mensajeEnviar);
                    case 5:
                        mensajeEnviar = "Nombre del padre:";
                        _BLMensajeria.Entrante(apimensajeria, 5);
                        _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 6);
                        return Json(mensajeEnviar);
                    case 6:
                        mensajeEnviar = "Introduzca su contraseña en la llamada.";
                        _BLMensajeria.Entrante(apimensajeria, 6);
                        _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 7);
                        return Json(mensajeEnviar);
                    case 8:
                        _BLMensajeria.Entrante(apimensajeria, 8);
                        string codigo = _DAMensajeria.BuscarCodigoXNumero(apimensajeria.emisor);
                        codigo = codigo.ToUpper();
                        apimensajeria.body=codigo.ToUpper();

                        if (codigo == apimensajeria.body)
                        {
                            var datos = _DAMensajeria.BuscarDatosNuevoUsuario(apimensajeria.emisor);

                            var existeUsuario = _DAMensajeria.BuscarUsuario(datos[0]);
                            if (existeUsuario != 0)
                            {
                                mensajeEnviar = "Ya existe una cuenta registrada con esos datos.";
                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 9);
                                _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                                return Json(mensajeEnviar);
                            }

                            //datos[3] = Crypt.Encrypt(datos[3]);
                            var valRegistro = _DAMensajeria.RegistrarUsuario(datos, apimensajeria.emisor);
                            if (valRegistro)
                            {
                                mensajeEnviar = "Registrado correctamente.";
                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 9);
                                _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                                return Json(mensajeEnviar);
                            }
                            else
                            {
                                mensajeEnviar = "Ocurrió un error.";
                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 9);
                                _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                                return Json(mensajeEnviar);
                            }
                        }
                        else
                        {
                            mensajeEnviar = "El código ingresado no es el correcto.";
                            return Json(mensajeEnviar);
                        }
                    /*
                    mensajeEnviar = "Introduzca su contraseña en la llamada.";
                    _BLMensajeria.Entrante(apimensajeria, 6);
                    _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 7);
                    return Json(mensajeEnviar);
                    */
                    case 10:
                        mensajeEnviar = "Introduzca su contraseña en la llamada.";
                        _BLMensajeria.Entrante(apimensajeria, 10);
                        _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 11);
                        return Json(mensajeEnviar);
                    case 12:
                        _BLMensajeria.Entrante(apimensajeria, 13);
                        if (apimensajeria.body == "1" || apimensajeria.body == "2" || apimensajeria.body == "3")
                        {
                            if (apimensajeria.body == "1")
                            {
                                mensajeEnviar = "Ingrese el número de celular al que desea transferir.";
                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 14);
                            }
                            else if(apimensajeria.body == "2")
                            {
                                var datosCuenta = _DAMensajeria.ObtenerUsuarioXCelular(apimensajeria.emisor);
                                mensajeEnviar = "Balance general: "+datosCuenta.balance;

                                var transaccionesCuenta = _DAMensajeria.Ultimos3Movimientos(datosCuenta.id);
                                foreach (var item in transaccionesCuenta)
                                {
                                    mensajeEnviar += "/n " + item.monto + " -> " + item.texttipoTransaccion;
                                }

                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 18);
                                _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                            }
                        }
                        else
                        {
                            mensajeEnviar = "Por favor introduzca una opción válida.";
                            _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 13);
                        }
                        return Json(mensajeEnviar);
                    case 13:
                        _BLMensajeria.Entrante(apimensajeria, 13);
                        if (apimensajeria.body == "1" || apimensajeria.body == "2" || apimensajeria.body == "3")
                        {
                            if (apimensajeria.body == "1")
                            {
                                mensajeEnviar = "Ingrese el número de celular al que desea transferir:";
                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 14);
                            }
                            else if (apimensajeria.body == "2")
                            {
                                var datosCuenta = _DAMensajeria.ObtenerUsuarioXCelular(apimensajeria.emisor);
                                mensajeEnviar = "Balance general: " + datosCuenta.balance;

                                var transaccionesCuenta = _DAMensajeria.Ultimos3Movimientos(datosCuenta.id);
                                foreach (var item in transaccionesCuenta)
                                {
                                    mensajeEnviar += "/n " + item.monto + " -> " + item.texttipoTransaccion;
                                }

                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 18);
                                _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                            }
                        }
                        else
                        {
                            mensajeEnviar = "Por favor introduzca una opción válida.";
                            _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 13);
                        }
                        return Json(mensajeEnviar);
                    case 14:
                        mensajeEnviar = "Monto a enviar:";
                        _BLMensajeria.Entrante(apimensajeria, 14);
                        _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 15);
                        return Json(mensajeEnviar);
                    case 15:
                        _BLMensajeria.Entrante(apimensajeria, 15);
                        var datosATransferir = _DAMensajeria.BuscarDatosMontoATransferir(apimensajeria.emisor);
                        var datosDeLaCuentaPrincipal = _DAMensajeria.ObtenerUsuarioXCelular(apimensajeria.emisor);
                        var datosDeLaCuentaSecundaria = _DAMensajeria.ObtenerUsuarioXCelular(datosATransferir[0]);

                        CultureInfo cultura = new CultureInfo("en-US");
                        decimal balanceCuentaPrincipal = decimal.Parse(datosATransferir[1], cultura);
                        decimal transferenciaAEfectuar = decimal.Parse(apimensajeria.body, cultura);

                        if (datosDeLaCuentaPrincipal != null)
                        {
                            if (datosDeLaCuentaPrincipal.balance >= balanceCuentaPrincipal)
                            {
                                mensajeEnviar = "Transferencia realizada correctamente.";
                                _DAMensajeria.RegistrarTransaccionTransferenciaEnviada(datosDeLaCuentaPrincipal.id, 3, transferenciaAEfectuar);
                                _DAMensajeria.RegistrarTransaccionTransferenciaRecibida(datosDeLaCuentaSecundaria.id, 4, transferenciaAEfectuar);
                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 16);
                                _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                            }
                            else
                            {
                                mensajeEnviar = "El monto ingresado es mayor al saldo de su cuenta.";
                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 16);
                                _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                            }
                        }
                        else
                        {
                            mensajeEnviar = "La cuenta a transferir no se encuentra registrada.";
                            _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 16);
                            _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                        }
                        return Json(mensajeEnviar);
                    default:
                        mensajeEnviar = "Ocurrió un error.";
                        return Json(mensajeEnviar);
                }
            }
        }

        [HttpPost("FlujoAdicional")]
        public IActionResult ObtenerFlujo(APIFlujoSaliente apiflujosaliente)
        {
            string mensajeEnviar = "";
            APIMensajeria obj = new APIMensajeria();
            switch (apiflujosaliente.idFlujo)
            {
                case 1:
                    IWebDriver driver = new ChromeDriver();
                    try
                    {
                        driver.Navigate().GoToUrl("https://serviciosweb.reniec.gob.pe/aip/");

                        Thread.Sleep(5000);

                        IWebElement dni = driver.FindElement(By.Id("numero"));
                        dni.SendKeys("76530684");
                        Thread.Sleep(2000);

                        IWebElement fecnac = driver.FindElement(By.Id("fenac"));
                        fecnac.SendKeys("08052001");
                        Thread.Sleep(2000);

                        IWebElement nompadre = driver.FindElement(By.Id("nompadre"));
                        nompadre.SendKeys("RICHARD");
                        Thread.Sleep(2000);

                        IWebElement nommadre = driver.FindElement(By.Id("nommadre"));
                        nommadre.SendKeys("MARIA");
                        Thread.Sleep(2000);

                        IWebElement lugnac = driver.FindElement(By.Id("s2id_ubigeonac"));
                        lugnac.Click();
                        Thread.Sleep(2000);

                        IWebElement lugnac2 = driver.FindElement(By.ClassName("select2-input"));
                        lugnac2.SendKeys("LIMA/LIMA/ASS");
                        Thread.Sleep(4000);
                        lugnac2.SendKeys(Keys.Enter);
                        Thread.Sleep(2000);

                        IWebElement readDNI = driver.FindElement(By.Id("readDNI"));
                        readDNI.Click();
                        Thread.Sleep(5000);

                        IWebElement divElement = driver.FindElement(By.Id("resultado"));
                        var spanElements = divElement.FindElements(By.TagName("p"));
                        string testMnsj = spanElements[0].Text;
                        driver.Quit();
                    }
                    catch(Exception ex)
                    {
                        string mens = ex.Message;
                        driver.Quit();
                    }
                    
                    //readDNI
                    return Json("DNI:");
                case 4:
                    mensajeEnviar = "DNI:";
                    obj.emisor = apiflujosaliente.receptor;
                    obj.receptor = apiflujosaliente.emisor;
                    obj.body = "DNI";
                    _BLMensajeria.Salida(obj, mensajeEnviar, 4);
                    return Json("DNI:");
                case 8:
                    obj.emisor = apiflujosaliente.receptor;
                    obj.receptor = apiflujosaliente.emisor;

                    _DAMensajeria.GenerarCodigo(obj.emisor);
                    string codigo = _DAMensajeria.BuscarCodigoXNumero(obj.emisor);
                    _BLMensajeria.EnviarCodigo(obj.emisor, codigo);

                    mensajeEnviar = "Introduzca el codigo de seguridad enviado:";
                    obj.body = mensajeEnviar;
                    _BLMensajeria.Salida(obj, mensajeEnviar, 8);
                    return Json(mensajeEnviar);
                case 11:
                    obj.emisor = apiflujosaliente.receptor;
                    obj.receptor = apiflujosaliente.emisor;
                    var lst = _DAMensajeria.BuscarDatosValidarUsuario(obj.emisor);
                    var validar = _DAMensajeria.ValidarUsuario(lst[0], lst[1]);
                    if (validar != 0)
                    {
                        mensajeEnviar = "Seleccione la operación que desea hacer:/n 1.Transferir dinero /n 2.Estado de la cuenta /n 3.Actualizar datos";
                        _BLMensajeria.Salida(obj, mensajeEnviar, 12);
                        return Json(mensajeEnviar);
                    }
                    else
                    {
                        mensajeEnviar = "Error al validar las credenciales";
                        _BLMensajeria.Salida(obj, mensajeEnviar, 12);
                        _DAMensajeria.CerrarFlujo(obj.emisor);
                        return Json(mensajeEnviar);
                    }
                default:
                    mensajeEnviar = "Ocurrió un error.";
                    return Json(mensajeEnviar);
            }       
        }
    }
}
