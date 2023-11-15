using Microsoft.AspNetCore.Mvc;
using API_SMS_WALLET.Data;
using API_SMS_WALLET.Logic;

namespace API_SMS_WALLET.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class MensajeriaController : Controller
    {
        private readonly DAMensajeria _DAMensajeria = new DAMensajeria();
        private readonly BLMensajeria _BLMensajeria = new BLMensajeria();

        private readonly ILogger<MensajeriaController> _logger;

        public MensajeriaController(ILogger<MensajeriaController> logger)
        {
            _logger = logger;
        }

        [HttpPost("Mensaje")]
        public IActionResult UltimoMensaje(APIMensajeria apimensajeria)
        {
            var rpta = _DAMensajeria.UltimoMensajeXEmisor(apimensajeria.emisor);
            if (rpta == null)
            {
                string respuestaBody = "Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta";

                Mensajeria mensajeriaInicial = new Mensajeria();
                mensajeriaInicial.id_flujo = 0;
                mensajeriaInicial.body = respuestaBody;
                mensajeriaInicial.emisor = apimensajeria.emisor;
                mensajeriaInicial.receptor = apimensajeria.receptor;

                var rptabody = _BLMensajeria.RegistrarMensajeFlujoExistente(apimensajeria, mensajeriaInicial);
                return Json(respuestaBody);
            }
            else
            {
                var rptabody = _BLMensajeria.RegistrarMensajeFlujoExistente(apimensajeria, rpta);
                return Json(rptabody);
            }
        }

        [HttpPost("FlujoAdicional")]
        public IActionResult ObtenerFlujo(APIFlujoSaliente apiflujosaliente)
        {
            var rpta = _DAMensajeria.ObtenerFlujoXID(apiflujosaliente.idFlujo);

            Mensajeria objmensajeria = new Mensajeria();
            objmensajeria.emisor = apiflujosaliente.emisor;
            objmensajeria.receptor = apiflujosaliente.receptor;
            objmensajeria.id_flujo = apiflujosaliente.idFlujo;
            objmensajeria.body = rpta.mensaje;
            objmensajeria.numeroContacto = apiflujosaliente.receptor;

            var rptaRegis=_DAMensajeria.RegistrarMensajeria(objmensajeria);
            return Json(objmensajeria.body);
        }
    }
}
