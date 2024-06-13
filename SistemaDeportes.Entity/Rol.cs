using System;
using System.Collections.Generic;

namespace SistemaDeportes.Entity
{
    public partial class Rol
    {
        public Rol()
        {
            RolMenus = new HashSet<RolMenu>();
            Usuarios = new HashSet<Usuario>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; } = null!;

        public virtual ICollection<RolMenu> RolMenus { get; set; }
        public virtual ICollection<Usuario> Usuarios { get; set; }
    }
}
