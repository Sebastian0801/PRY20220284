namespace API_SMS_WALLET
{
    public class Mensajeria
    {
        public int id { get; set; }
        public string? emisor { get; set; }
        public string? receptor { get; set; }
        public string? body { get; set; }
        public int id_flujo { get; set; }
        public DateTime fechaCreacion { get; set; }
        public string? numeroContacto { get; set; }
    }
}
