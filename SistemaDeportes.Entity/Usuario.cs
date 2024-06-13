using System;
using System.Collections.Generic;

namespace SistemaDeportes.Entity
{
    public partial class Usuario
    {
        public Usuario()
        {
            ElementoInventarios = new HashSet<Elemento_Inventario>();
            Estadisticas = new HashSet<Estadistica>();
            Eventos = new HashSet<Evento>();
        }

        public int Documento { get; set; }
        public string Nombre { get; set; } = null!;
        public bool Estado { get; set; }
        public string Clave { get; set; } = null!;
        public int IdRol { get; set; }

        public virtual Rol IdRolNavigation { get; set; } = null!;
        public virtual ICollection<Elemento_Inventario> ElementoInventarios { get; set; }
        public virtual ICollection<Estadistica> Estadisticas { get; set; }
        public virtual ICollection<Evento> Eventos { get; set; }
    }
}
