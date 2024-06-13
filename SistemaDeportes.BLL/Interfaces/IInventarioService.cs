using SistemaDeportes.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaDeportes.BLL.Interfaces
{
    public interface IInventarioService
    {
        Task<List<Elemento_Inventario>> Lista();
        Task<Elemento_Inventario> Crear(Elemento_Inventario entidad);
        Task<Elemento_Inventario> Editar(Elemento_Inventario entidad);
        Task<bool> Eliminar(int codigo);
    }
}
