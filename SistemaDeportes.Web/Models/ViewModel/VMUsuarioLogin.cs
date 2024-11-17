using Newtonsoft.Json;

namespace SistemaDeportes.Web.Models.ViewModel
{
    public class VMUsuarioLogin
    {
        [JsonRequired]
        public int Documento { get; set; }
        public string Clave { get; set; } = null!;
    }
}
