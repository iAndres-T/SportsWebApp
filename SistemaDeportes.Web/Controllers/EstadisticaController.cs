using AutoMapper;
using DinkToPdf;
using DinkToPdf.Contracts;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using SistemaDeportes.BLL.Interfaces;
using SistemaDeportes.Entity;
using SistemaDeportes.Web.Models.ViewModel;
using SistemaDeportes.Web.Utilidades.Response;
using System.Security.Claims;

namespace SistemaDeportes.Web.Controllers
{
    public class EstadisticaController : Controller
    {
        private readonly IMapper _mapper;
        private readonly IEstadisticaService _estadisticaService;
        private readonly IConverter _converter;

        public EstadisticaController(IMapper mapper, IEstadisticaService estadisticaService, IConverter converter)
        {
            _mapper = mapper;
            _estadisticaService = estadisticaService;
            _converter = converter;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult EstadisticaJugador()
        {
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> Lista()
        {
            List<VMUsuario> vmListaUser = _mapper.Map<List<VMUsuario>>(await _estadisticaService.Lista());
            return StatusCode(StatusCodes.Status200OK, new { data = vmListaUser });
        }
        
        [HttpGet]
        public async Task<IActionResult> ObtenerJugador(int documento)
        {
            GenericResponse<VMEstadistica> gResponse = new GenericResponse<VMEstadistica>();

            try
            {
                if(documento == 0)
                {
                    ClaimsPrincipal claimUser = HttpContext.User;
                    string? idusuario = "";
                    if (claimUser.Identity.IsAuthenticated)
                    {
                        idusuario = claimUser.Claims
                            .Where(c => c.Type == ClaimTypes.NameIdentifier)
                            .Select(c => c.Value).SingleOrDefault();
                    }

                    documento = int.Parse(idusuario);
                }

                Estadistica jugador = await _estadisticaService.ObtenerJugador(documento);
                if (jugador != null)
                {
                    gResponse.Estado = true;
                    gResponse.Objeto = _mapper.Map<VMEstadistica>(jugador);
                }
            }
            catch (Exception ex)
            {
                gResponse.Estado = false;
                gResponse.Mensaje = ex.Message;
            }

            return StatusCode(StatusCodes.Status200OK, gResponse);
        }

        [HttpPost]
        public async Task<IActionResult> Crear([FromForm] string modelo)
        {
            GenericResponse<VMEstadistica> gResponse = new GenericResponse<VMEstadistica>();

            try
            {
                VMEstadistica vmEstadistica = JsonConvert.DeserializeObject<VMEstadistica>(modelo);

                Estadistica estadistica_creado = await _estadisticaService.Crear(_mapper.Map<Estadistica>(vmEstadistica));

                vmEstadistica = _mapper.Map<VMEstadistica>(estadistica_creado);

                gResponse.Estado = true;
                gResponse.Objeto = vmEstadistica;
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
            GenericResponse<VMEstadistica> gResponse = new GenericResponse<VMEstadistica>();

            try
            {
                VMEstadistica vmEstadistica = JsonConvert.DeserializeObject<VMEstadistica>(modelo);

                Estadistica estadistica_editado = await _estadisticaService.Editar(_mapper.Map<Estadistica>(vmEstadistica));

                vmEstadistica = _mapper.Map<VMEstadistica>(estadistica_editado);

                gResponse.Estado = true;
                gResponse.Objeto = vmEstadistica;
            }
            catch (Exception ex)
            {
                gResponse.Estado = false;
                gResponse.Mensaje = ex.Message;
            }

            return StatusCode(StatusCodes.Status200OK, gResponse);
        }

        public IActionResult MostrarPDFJugador(int documento)
        {
            string urlPlantillaVista = $"{this.Request.Scheme}://{this.Request.Host}/PDF/PDFEstadistica?documento={documento}";

            var pdf = new HtmlToPdfDocument()
            {
                GlobalSettings = new GlobalSettings()
                {
                    PaperSize = PaperKind.A4,
                    Orientation = Orientation.Portrait,
                },
                Objects =
                {
                    new ObjectSettings()
                    {
                        Page = urlPlantillaVista
                    }
                }
            };

            var archivoPDF = _converter.Convert(pdf);

            return File(archivoPDF, "application/pdf");
        }
    }
}
