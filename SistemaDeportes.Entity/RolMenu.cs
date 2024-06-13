using System;
using System.Collections.Generic;

namespace SistemaDeportes.Entity
{
    public partial class RolMenu
    {
        public int Id { get; set; }
        public int IdRol { get; set; }
        public int IdMenu { get; set; }

        public virtual Menu IdMenuNavigation { get; set; } = null!;
        public virtual Rol IdRolNavigation { get; set; } = null!;
    }
}
