using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class BEBalance
    {
        public int id { get; set; }
        public int id_usuario { get; set; }
        public decimal balance { get; set; }
        public string? txtNombre { get; set; }
        public string? txtBalance { get; set; }
        //
        //public string? txtFechaCreacion { get; set; }
    }
}
