namespace API_SMS_WALLET
{
    public class APIUsuarios
    {
        public int id { get; set; }
        public string? DNI { get; set; }
        public string? nombres { get; set; }
        public string? apellidos { get; set; }
        public string? celular { get; set; }
        public string? contraseña { get; set; }
        public int tipo { get; set; }
        public int estado { get; set; }
        public DateTime fechaCreacion { get; set; }
        public string? correo { get; set; }
        public decimal balance { get; set; }
    }
}
