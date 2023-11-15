namespace BE
{
    public class BEUsuarios
    {
        public int id { get; set; }
        public string? DNI { get; set; }    
        public string? dni2 { get; set; }    
        public string? nombres { get; set; }    
        public string? apellidos { get; set; }    
        public string? celular { get; set; }    
        public string? contraseña { get; set; }
        public int tipo { get; set; }
        public int estado { get; set; }
        public DateTime fechaCreacion { get; set; }
        public string? correo { get; set; }

        //
        public decimal balance { get; set; }
        public int tipoTransaccion { get; set; }
        public decimal monto { get; set; }
        public DateTime fechaUltimaTransaccion { get; set; }

        //
        public string? textestado { get; set; }
        public string? texttipoTransaccion { get; set; }
        public string? textidentificacion { get; set; }
        public string? textcontraseña { get; set; }
        public string? txtfechaUltimaTransaccion { get; set; }
    }
}