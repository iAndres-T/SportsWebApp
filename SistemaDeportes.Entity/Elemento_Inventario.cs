using System;
using System.Collections.Generic;

namespace SistemaDeportes.Entity
{
    public partial class Elemento_Inventario
    {
        public int Codigo { get; set; }
        public string Nombre { get; set; } = null!;
        public string Marca { get; set; } = null!;
        public int Cantidad { get; set; }
        public int IdUsuario { get; set; }

        public virtual Usuario IdUsuarioNavigation { get; set; } = null!;
    }
}
