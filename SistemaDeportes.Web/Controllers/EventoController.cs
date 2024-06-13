using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using SistemaDeportes.BLL.Interfaces;
using SistemaDeportes.Entity;
using SistemaDeportes.Web.Models.ViewModel;
using SistemaDeportes.Web.Utilidades.Response;
using System.Security.Claims;

namespace SistemaDeportes.Web.Controllers
{
    public class EventoController : Controller
    {
        private readonly IMapper _mapper;
        private readonly IEventoService _eventoService;

        public EventoController(IMapper mapper, IEventoService eventoService)
        {
            _mapper = mapper;
            _eventoService = eventoService;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult EventoJugador()
        {
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> Lista()
        {
            List<VMEvento> vmListaEvento = _mapper.Map<List<VMEvento>>(await _eventoService.Lista());
            return StatusCode(StatusCodes.Status200OK, new { data = vmListaEvento });
        }

        [HttpPost]
        public async Task<IActionResult> Crear([FromForm] string modelo)
        {
            GenericResponse<VMEvento> gResponse = new GenericResponse<VMEvento>();

            try
            {
                VMEvento vmEvento = JsonConvert.DeserializeObject<VMEvento>(modelo);

                ClaimsPrincipal claimUser = HttpContext.User;
                string? idusuario = "";
                if (claimUser.Identity.IsAuthenticated)
                {
                    idusuario = claimUser.Claims
                        .Where(c => c.Type == ClaimTypes.NameIdentifier)
                        .Select(c => c.Value).SingleOrDefault();
                }

                vmEvento.IdUsuario = int.Parse(idusuario);

                Evento evento_creado = await _eventoService.Crear(_mapper.Map<Evento>(vmEvento));

                vmEvento = _mapper.Map<VMEvento>(evento_creado);

                gResponse.Estado = true;
                gResponse.Objeto = vmEvento;
            }
            catch (Exception ex)
            {
                gResponse.Estado = false;
                gResponse.Mensaje = ex.Message;
            }

            return StatusCode(StatusCodes.Status200OK, gResponse);
        }

        [HttpDelete]
        public async Task<IActionResult> Eliminar(int id)
        {
            GenericResponse<string> gResponse = new GenericResponse<string>();

            try
            {
                gResponse.Estado = await _eventoService.Eliminar(id);
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
