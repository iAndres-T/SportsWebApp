using SistemaDeportes.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaDeportes.BLL.Interfaces
{
    public interface IEventoService
    {
        Task<List<Evento>> Lista();
        Task<Evento> Crear(Evento entidad);
        Task<bool> Eliminar(int id);
    }
}
