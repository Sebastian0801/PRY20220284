namespace API_SMS_WALLET
{
    public class APITransacciones
    {
        public int id { get; set; }
        public int id_usuario { get; set; }
        public int tipo { get; set; }
        public decimal monto { get; set; }
        public DateTime fechaCreacion { get; set; }

        //
        public string? texttipoTransaccion { get; set; }
        public string? nombreUsuario { get; set; }
    }
}
