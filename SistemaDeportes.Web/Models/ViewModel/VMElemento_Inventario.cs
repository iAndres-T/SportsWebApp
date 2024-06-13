namespace SistemaDeportes.Web.Models.ViewModel
{
    public class VMElemento_Inventario
    {
        public int Codigo { get; set; }
        public string Nombre { get; set; } = null!;
        public string Marca { get; set; } = null!;
        public int Cantidad { get; set; }
        public int IdUsuario { get; set; }
    }
}
