using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class BESolicitud
    {
        public int id { get; set; }
        public decimal monto { get; set; }
        public int idUsuario { get; set; } 
        public int estado { get; set; }
        public DateTime fechaCreacion { get; set; }

        public string? txtEstado { get; set; }
        public string? txtFechaCreacion { get; set; }
    }
}
