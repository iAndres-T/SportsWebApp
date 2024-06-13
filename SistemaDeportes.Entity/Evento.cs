using System;
using System.Collections.Generic;

namespace SistemaDeportes.Entity
{
    public partial class Evento
    {
        public int Id { get; set; }
        public string Descripcion { get; set; } = null!;
        public DateTime Fecha { get; set; }
        public int IdUsuario { get; set; }

        public virtual Usuario IdUsuarioNavigation { get; set; } = null!;
    }
}
