using System;
using System.Collections.Generic;

namespace SistemaDeportes.Entity
{
    public partial class Estadistica
    {
        public int Id { get; set; }
        public int PartidosJugados { get; set; }
        public int Goles { get; set; }
        public int Asistencias { get; set; }
        public int Amarillas { get; set; }
        public int Rojas { get; set; }
        public int IdUsuario { get; set; }

        public virtual Usuario IdUsuarioNavigation { get; set; } = null!;
    }
}
