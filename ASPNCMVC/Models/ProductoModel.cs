using Dapper.Contrib.Extensions;

namespace ASPNCMVC.Models
{
    [Table("productos")]
    public class ProductoModel
    {
        [ExplicitKey]
        public int IdProducto { get; set; }
        public string Producto { get; set; }
        public float Precio { get; set; }
        public string RutaImagen { get; set; }
        public string Iva { get; set; }
        public string CodigoBarras { get; set; }
        public string CodigoQR { get; set; }
        public string Referencia { get; set; }
        public float Tiempo { get; set; }
        public string Estado { get; set; }
    }
   
}
