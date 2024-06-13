namespace SistemaDeportes.Web.Models.ViewModel
{
    public class VMUsuario
    {
        public int Documento { get; set; }
        public string Nombre { get; set; } = null!;
        public int Estado { get; set; }
        public string Clave { get; set; } = null!;
        public int IdRol { get; set; }
        public string NombreRol { get; set; } = null!;
    }
}
