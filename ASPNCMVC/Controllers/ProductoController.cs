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
    public class ProductoController : ControllerBase
    {
        

        private readonly ILogger<ProductoController> _logger;
       
        
        public ProductoController(ILogger<ProductoController> logger)
        {
            _logger = logger;
            
        }
        [Authorize]
        [HttpGet(Name = "Producto")]
        [SwaggerOperation(Summary ="Obtener productos",Description ="Obtiene todos los productos opcionalmente filtrados por el id.")]
        public IEnumerable<ProductoModel> Get(int codigo)
        {
            List<ProductoModel> listaProductos = new List<ProductoModel>();
            using (var connection = new MySqlConnection("Server=localhost;Database=gpabd;User Id=root;Password=;"))
            {
                listaProductos = connection.Query<ProductoModel>("SELECT * FROM productos").ToList();
            }

            
            return (codigo==0? listaProductos : listaProductos.Where(x=>x.IdProducto == codigo));
        }

        [Authorize]
        [HttpPut(Name = "CrearProducto")]
        [SwaggerOperation(Summary = "Crear producto", Description = "Crear producto con el modelo de producto")]
        public long Put(ProductoModel producto)
        {

            using (var connection = new MySqlConnection("Server=localhost;Database=gpabd;User Id=root;Password=;"))
            {
                List<ProductoModel> lpm = new List<ProductoModel>();
                lpm.Add(producto);
                return connection.Insert<ProductoModel>(producto);
                
            }
            return 0;
        }
        [Authorize]
        [HttpPost(Name = "UpdateProducto")]
        [SwaggerOperation(Summary = "Actualizar producto", Description = "Actualizar producto con el modelo de producto")]
        public bool Post(ProductoModel producto)
        {

            using (var connection = new MySqlConnection("Server=localhost;Database=gpabd;User Id=root;Password=;"))
            {
                List<ProductoModel> lpm = new List<ProductoModel>();
                lpm.Add(producto);
                return connection.Update<ProductoModel>(producto);
               
            }
            return false;
        }
    }
}