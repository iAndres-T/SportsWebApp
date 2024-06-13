using SistemaDeportes.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaDeportes.BLL.Interfaces
{
    public interface IEstadisticaService
    {
        Task<List<Usuario>> Lista();
        Task<Estadistica> Crear(Estadistica entidad);
        Task<Estadistica> Editar(Estadistica entidad);
        Task<Estadistica> ObtenerJugador(int documento);
    }
}
