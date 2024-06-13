namespace SistemaDeportes.Web.Models.ViewModel
{
    public class VMEvento
    {
        public int Id { get; set; }
        public string Descripcion { get; set; } = null!;
        public DateTime Fecha { get; set; }
        public int IdUsuario { get; set; }
    }
}
