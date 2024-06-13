using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using SistemaDeportes.BLL.Implementacion;
using SistemaDeportes.BLL.Interfaces;
using SistemaDeportes.Web.Models.ViewModel;

namespace SistemaDeportes.Web.Controllers
{
    public class PDFController : Controller
    {
        private readonly IMapper _mapper;
        private readonly IEstadisticaService _estadisticaService;
        private readonly IUsuarioService _usuarioService;

        public PDFController(IMapper mapper, IEstadisticaService estadisticaService, IUsuarioService usuarioService)
        {
            _mapper = mapper;
            _estadisticaService = estadisticaService;
            _usuarioService = usuarioService;
        }

        public async Task<IActionResult> PDFEstadistica(int documento)
        {
            VMEstadistica vmEstadistica = _mapper.Map<VMEstadistica>(await _estadisticaService.ObtenerJugador(documento));
            VMUsuario vmUsuario = _mapper.Map<VMUsuario>(await _usuarioService.ObtenerPorId(documento));
            VMPDFJugador modelo = new VMPDFJugador();

            modelo.usuario = vmUsuario;
            modelo.estadistica = vmEstadistica;

            return View(modelo);
        }
    }
}
