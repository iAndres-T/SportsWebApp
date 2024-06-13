using System;
using System.Collections.Generic;

namespace SistemaDeportes.Entity
{
    public partial class Menu
    {
        public Menu()
        {
            RolMenus = new HashSet<RolMenu>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; } = null!;
        public string Icono { get; set; } = null!;
        public string Controlador { get; set; } = null!;
        public string PaginaAccion { get; set; } = null!;

        public virtual ICollection<RolMenu> RolMenus { get; set; }
    }
}
