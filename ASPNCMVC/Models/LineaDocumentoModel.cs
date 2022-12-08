namespace ASPNCMVC.Models
{
    public class LineaDocumentoModel
    {
        public int IdLinea { get; set; }
        public int IdDocumento { get; set; }
        public int IdSerie { get; set; }
        public int IdCliente { get; set; }
        public int IdProyecto { get; set; }
        public string TipoDocumento { get; set; }
        public int IdProducto { get; set; }
        public string NombreProducto { get; set; }
        public float Cantidad { get; set; }
        public float PrecioUnitario { get; set; }
        public float Descuento { get; set; }
        public int Iva { get; set; }
        public float Pendiente { get; set; }
        public float Total { get; set; }
    }
}
