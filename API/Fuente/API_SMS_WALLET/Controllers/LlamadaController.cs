using Microsoft.AspNetCore.Mvc;
using Twilio.TwiML;
using System.Xml.Linq;
using Twilio.AspNet.Core;
using Twilio.Types;
using System.Xml;
using Newtonsoft.Json;
using API_SMS_WALLET.Logic;

namespace API_SMS_WALLET.Controllers
{
    public class LlamadaController : Controller
    {
        private readonly BLMensajeria _BLMensajeria = new BLMensajeria();

        [HttpGet]
        [Route("/procesar-digitos/{tipo}")]
        public IActionResult ProcesarDigitos(string tipo)
        {
            var xmlDoc = new XmlDocument();

            if (tipo == "1")
            {
                xmlDoc.LoadXml("<?xml version=\"1.0\" encoding =\"utf-8\"?>" +
                "<Response>\r\n\t" +
                //"<Gather language=\"es-MX\" timeout =\"10\" action =\"https://apiregistro.adexperu.org.pe/procesar-digitos2\" method=\"POST\" numDigits=\"6\">" +
                "<Gather language=\"es-MX\" timeout =\"10\" action =\"http://3.90.241.191/procesar-digitos2\" method=\"POST\" numDigits=\"6\">" +
                "<Say language=\"es-MX\" voice=\"alice\">Por favor, ingresa seis dígitos y presiona la tecla de numeral.</Say>" +
                //"<Message method=\"POST\" content-type=\"application/json\"><![CDATA[{{" + objSerializado + "}}]]></Message>" +
                "</Gather>\r\n\t" +
                "\r\n</Response>");
            }
            else if (tipo == "2")
            {
                xmlDoc.LoadXml("<?xml version=\"1.0\" encoding =\"utf-8\"?>" +
                "<Response>\r\n\t" +
                //"<Gather language=\"es-MX\" timeout =\"10\" action =\"https://apiregistro.adexperu.org.pe/procesar-digitos3\" method=\"POST\" numDigits=\"6\">" +
                "<Gather language=\"es-MX\" timeout =\"10\" action =\"http://3.90.241.191/procesar-digitos3\" method=\"POST\" numDigits=\"6\">" +
                "<Say language=\"es-MX\" voice=\"alice\">Por favor, ingresa seis dígitos y presiona la tecla de numeral.</Say>" +
                //"<Message method=\"POST\" content-type=\"application/json\"><![CDATA[{{" + objSerializado + "}}]]></Message>" +
                "</Gather>\r\n\t" +
                "\r\n</Response>");
            }
            else if (tipo == "3")
            {
                xmlDoc.LoadXml("<?xml version=\"1.0\" encoding =\"utf-8\"?>" +
                "<Response>\r\n\t" +
                //"<Gather language=\"es-MX\" timeout =\"10\" action =\"https://apiregistro.adexperu.org.pe/procesar-digitos4\" method=\"POST\" numDigits=\"6\">" +
                "<Gather language=\"es-MX\" timeout =\"10\" action =\"http://3.90.241.191/procesar-digitos4\" method=\"POST\" numDigits=\"6\">" +
                "<Say language=\"es-MX\" voice=\"alice\">Por favor, ingresa seis dígitos y presiona la tecla de numeral.</Say>" +
                //"<Message method=\"POST\" content-type=\"application/json\"><![CDATA[{{" + objSerializado + "}}]]></Message>" +
                "</Gather>\r\n\t" +
                "\r\n</Response>");
            }
            else if (tipo == "4")
            {
                xmlDoc.LoadXml("<?xml version=\"1.0\" encoding =\"utf-8\"?>" +
                "<Response>\r\n\t" +
                //"<Gather language=\"es-MX\" timeout =\"10\" action =\"https://apiregistro.adexperu.org.pe/procesar-digitos5\" method=\"POST\" numDigits=\"6\">" +
                "<Gather language=\"es-MX\" timeout =\"10\" action =\"http://3.90.241.191/procesar-digitos5\" method=\"POST\" numDigits=\"6\">" +
                "<Say language=\"es-MX\" voice=\"alice\">Por favor, ingresa seis dígitos y presiona la tecla de numeral.</Say>" +
                //"<Message method=\"POST\" content-type=\"application/json\"><![CDATA[{{" + objSerializado + "}}]]></Message>" +
                "</Gather>\r\n\t" +
                "\r\n</Response>");
            }

            // Establece los encabezados de la respuesta HTTP
            Response.ContentType = "application/xml";

            // Retorna el contenido XML como una respuesta HTTP
            return Content(xmlDoc.OuterXml.ToString(), "application/xml");
        }

        [HttpPost]
        [Route("/procesar-digitos2")]
        public IActionResult ProcesarDigitosPost2()
        {
            APIMensajeria obj = new APIMensajeria();
            obj.receptor = Convert.ToString(Request.Form["To"]);
            obj.emisor = Convert.ToString(Request.Form["From"]);
            var digitos = Request.Form["Digits"]; // Obtén los dígitos ingresados por el usuario
            digitos = Crypt.Encrypt(digitos);//Encrypt

            _BLMensajeria.Salida(obj, digitos, 9);
            var xmlDoc = new XmlDocument();
            xmlDoc.LoadXml("<?xml version=\"1.0\" encoding =\"utf-8\"?>" +
                "<Response>\r\n\t" +
                "<Say language=\"es-MX\" voice=\"alice\">Gracias.</Say>" +
                "\r\n</Response>");

            // Establece los encabezados de la respuesta HTTP
            Response.ContentType = "application/xml";

            // Retorna el contenido XML como una respuesta HTTP
            return Content(xmlDoc.OuterXml.ToString(), "application/xml");
        }

        [HttpPost]
        [Route("/procesar-digitos3")]
        public IActionResult ProcesarDigitosPost3()
        {
            APIMensajeria obj = new APIMensajeria();
            obj.receptor = Convert.ToString(Request.Form["To"]);
            obj.emisor = Convert.ToString(Request.Form["From"]);
            var digitos = Request.Form["Digits"]; // Obtén los dígitos ingresados por el usuario
            digitos = Crypt.Encrypt(digitos);//Encrypt

            _BLMensajeria.SalidaAUX(obj, digitos, 21);
            var xmlDoc = new XmlDocument();
            xmlDoc.LoadXml("<?xml version=\"1.0\" encoding =\"utf-8\"?>" +
                "<Response>\r\n\t" +
                "<Say language=\"es-MX\" voice=\"alice\">Gracias.</Say>" +
                "\r\n</Response>");

            // Establece los encabezados de la respuesta HTTP
            Response.ContentType = "application/xml";

            // Retorna el contenido XML como una respuesta HTTP
            return Content(xmlDoc.OuterXml.ToString(), "application/xml");
        }

        [HttpPost]
        [Route("/procesar-digitos4")]
        public IActionResult ProcesarDigitosPost4()
        {
            APIMensajeria obj = new APIMensajeria();
            obj.receptor = Convert.ToString(Request.Form["To"]);
            obj.emisor = Convert.ToString(Request.Form["From"]);
            var digitos = Request.Form["Digits"]; // Obtén los dígitos ingresados por el usuario
            digitos = Crypt.Encrypt(digitos);//Encrypt

            _BLMensajeria.Salida(obj, digitos, 41);
            var xmlDoc = new XmlDocument();
            xmlDoc.LoadXml("<?xml version=\"1.0\" encoding =\"utf-8\"?>" +
                "<Response>\r\n\t" +
                "<Say language=\"es-MX\" voice=\"alice\">Gracias.</Say>" +
                "\r\n</Response>");

            // Establece los encabezados de la respuesta HTTP
            Response.ContentType = "application/xml";

            // Retorna el contenido XML como una respuesta HTTP
            return Content(xmlDoc.OuterXml.ToString(), "application/xml");
        }

        [HttpPost]
        [Route("/procesar-digitos5")]
        public IActionResult ProcesarDigitosPost5()
        {
            APIMensajeria obj = new APIMensajeria();
            obj.receptor = Convert.ToString(Request.Form["To"]);
            obj.emisor = Convert.ToString(Request.Form["From"]);
            var digitos = Request.Form["Digits"]; // Obtén los dígitos ingresados por el usuario
            digitos = Crypt.Encrypt(digitos);//Encrypt

            _BLMensajeria.Salida(obj, digitos, 42);
            var xmlDoc = new XmlDocument();
            xmlDoc.LoadXml("<?xml version=\"1.0\" encoding =\"utf-8\"?>" +
                "<Response>\r\n\t" +
                "<Say language=\"es-MX\" voice=\"alice\">Gracias.</Say>" +
                "\r\n</Response>");

            // Establece los encabezados de la respuesta HTTP
            Response.ContentType = "application/xml";

            // Retorna el contenido XML como una respuesta HTTP
            return Content(xmlDoc.OuterXml.ToString(), "application/xml");
        }

    }
}
