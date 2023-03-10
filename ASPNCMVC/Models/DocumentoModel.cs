using Dapper.Contrib.Extensions;


namespace ASPNCMVC.Models
{

    [Table("documentos")]
    public class DocumentoModel
    {
        [ExplicitKey]
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
