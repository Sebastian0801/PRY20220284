using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
	public class BETransacciones
	{
		public int id { get; set; }
		public int id_usuario { get; set; }
		public int tipo { get; set; }
		public decimal monto { get; set; }
		public DateTime fechaCreacion { get; set; }

		//
		public string? texttipoTransaccion { get; set; }
        public string? nombreUsuario { get; set; }
		//
		public string? descripcionTipo { get; set; }
		public string? NombreCompleto { get; set; }
		public string? montoSoles { get; set; }

        public string? txtFechaCreacion { get; set; }
        public string? txtNombre { get; set; }
    }
}
