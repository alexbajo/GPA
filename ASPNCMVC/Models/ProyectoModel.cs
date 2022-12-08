namespace ASPNCMVC.Models
{
    public class ProyectoModel
    {
        public int IdProyecto { get; set; }
        public int IdCliente { get; set; }
        public string NombreProyecto { get; set; }
        public string Descripcion { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public string Estado { get; set; }
    }
}
