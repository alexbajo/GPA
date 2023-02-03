using ASPNCMVC.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Net.Http.Headers;
using MySql.Data.MySqlClient;
using Swashbuckle.AspNetCore.Annotations;
using Dapper;
using Dapper.Contrib.Extensions;

namespace ASPNCMVC.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class DocumentoController : Controller
    {

        private readonly ILogger<DocumentoController> _logger;


        public DocumentoController(ILogger<DocumentoController> logger)
        {
            _logger = logger;

        }
        [Authorize]
        [HttpGet(Name = "Documento")]
        [SwaggerOperation(Summary = "Obtener Documentos", Description = "Obtiene todos los Documentos opcionalmente filtrados por el id.")]
        public IEnumerable<DocumentoModel> Get(int codigo)
        {
            List<DocumentoModel> listaDocumentos = new List<DocumentoModel>();
            using (var connection = new MySqlConnection("server=127.0.0.1;database=gpabd;uid=root;Password=;"))
            {
                listaDocumentos = connection.Query<DocumentoModel>("SELECT * FROM documentos").ToList();
            }

            var std = "";
            return (codigo == 0 ? listaDocumentos : listaDocumentos.Where(x => x.IdDocumento == codigo));
        }

        [Authorize]
        [HttpPut(Name = "CrearDocumento")]
        [SwaggerOperation(Summary = "Crear Documento", Description = "Crear Documento con el modelo de Documento")]
        public long Put(DocumentoModel Documento)
        {

            using (var connection = new MySqlConnection("Server=127.0.0.1;Database=gpabd;User Id=root;Password=;"))
            {
                List<DocumentoModel> lpm = new List<DocumentoModel>();
                lpm.Add(Documento);
                return connection.Insert<DocumentoModel>(Documento);

            }
            return 0;
        }
        [Authorize]
        [HttpPost(Name = "UpdateDocumento")]
        [SwaggerOperation(Summary = "Actualizar Documentos yuhu", Description = "Actualizar Documento con el modelo de Documento")]
        public bool Post(DocumentoModel Documento)
        {

            using (var connection = new MySqlConnection("Server=127.0.0.1;Database=gpabd;User Id=root;Password=;"))
            {
                List<DocumentoModel> lpm = new List<DocumentoModel>();
                lpm.Add(Documento);
                return connection.Update<DocumentoModel>(Documento);

            }
            return false;
        }
    }
}
