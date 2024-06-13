using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using SistemaDeportes.BLL.Implementacion;
using SistemaDeportes.BLL.Interfaces;
using SistemaDeportes.Entity;
using SistemaDeportes.Web.Models.ViewModel;
using SistemaDeportes.Web.Utilidades.Response;
using System.Security.Claims;

namespace SistemaDeportes.Web.Controllers
{
    public class InventarioController : Controller
    {

        private readonly IMapper _mapper;
        private readonly IInventarioService _inventarioService;

        public InventarioController(IMapper mapper, IInventarioService inventarioService)
        {
            _mapper = mapper;
            _inventarioService = inventarioService;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> Lista()
        {
            List<VMElemento_Inventario> vmListaElemento = _mapper.Map<List<VMElemento_Inventario>>(await _inventarioService.Lista());
            return StatusCode(StatusCodes.Status200OK, new { data = vmListaElemento });
        }

        [HttpPost]
        public async Task<IActionResult> Crear([FromForm] string modelo)
        {
            GenericResponse<VMElemento_Inventario> gResponse = new GenericResponse<VMElemento_Inventario>();

            try
            {
                VMElemento_Inventario vmElemento = JsonConvert.DeserializeObject<VMElemento_Inventario>(modelo);

                ClaimsPrincipal claimUser = HttpContext.User;
                string? idusuario = "";
                if (claimUser.Identity.IsAuthenticated)
                {
                    idusuario = claimUser.Claims
                        .Where(c => c.Type == ClaimTypes.NameIdentifier)
                        .Select(c => c.Value).SingleOrDefault();
                }

                vmElemento.IdUsuario = int.Parse(idusuario);

                Elemento_Inventario elemento_creado = await _inventarioService.Crear(_mapper.Map<Elemento_Inventario>(vmElemento));

                vmElemento = _mapper.Map<VMElemento_Inventario>(elemento_creado);

                gResponse.Estado = true;
                gResponse.Objeto = vmElemento;
            }
            catch (Exception ex)
            {
                gResponse.Estado = false;
                gResponse.Mensaje = ex.Message;
            }

            return StatusCode(StatusCodes.Status200OK, gResponse);
        }

        [HttpPut]
        public async Task<IActionResult> Editar([FromForm] string modelo)
        {
            GenericResponse<VMElemento_Inventario> gResponse = new GenericResponse<VMElemento_Inventario>();

            try
            {
                VMElemento_Inventario vmElemento = JsonConvert.DeserializeObject<VMElemento_Inventario>(modelo);

                ClaimsPrincipal claimUser = HttpContext.User;
                string? idusuario = "";
                if (claimUser.Identity.IsAuthenticated)
                {
                    idusuario = claimUser.Claims
                        .Where(c => c.Type == ClaimTypes.NameIdentifier)
                        .Select(c => c.Value).SingleOrDefault();
                }

                vmElemento.IdUsuario = int.Parse(idusuario);

                Elemento_Inventario elemento_editado = await _inventarioService.Editar(_mapper.Map<Elemento_Inventario>(vmElemento));

                vmElemento = _mapper.Map<VMElemento_Inventario>(elemento_editado);

                gResponse.Estado = true;
                gResponse.Objeto = vmElemento;
            }
            catch (Exception ex)
            {
                gResponse.Estado = false;
                gResponse.Mensaje = ex.Message;
            }

            return StatusCode(StatusCodes.Status200OK, gResponse);
        }

        [HttpDelete]
        public async Task<IActionResult> Eliminar(int codigo)
        {
            GenericResponse<string> gResponse = new GenericResponse<string>();

            try
            {
                gResponse.Estado = await _inventarioService.Eliminar(codigo);
            }
            catch (Exception ex)
            {
                gResponse.Estado = false;
                gResponse.Mensaje = ex.Message;
            }

            return StatusCode(StatusCodes.Status200OK, gResponse);
        }
    }
}
