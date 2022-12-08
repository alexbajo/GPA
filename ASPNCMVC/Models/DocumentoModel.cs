namespace ASPNCMVC.Models
{
    public class DocumentoModel
    {
        public int IdDocumento { get; set; }
        public int NumeroDocumento { get; set; }
        public string SerieDocumento { get; set; }
        public DateTime FechaRegistro { get; set; }
        public DateTime FechaVencimiento { get; set; }
        public int IdCliente { get; set; }
        public int IdProyecto { get; set; }
        public string TipoDocumento { get; set; }
        public string Estado { get; set; }
    }
}
