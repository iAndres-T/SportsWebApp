namespace SistemaDeportes.Web.Models.ViewModel
{
    public class VMMenu
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = null!;
        public string Icono { get; set; } = null!;
        public string Controlador { get; set; } = null!;
        public string PaginaAccion { get; set; } = null!;
    }
}
