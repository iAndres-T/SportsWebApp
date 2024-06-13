using Microsoft.EntityFrameworkCore;
using SistemaDeportes.BLL.Interfaces;
using SistemaDeportes.DAL.Implementacion;
using SistemaDeportes.DAL.Interfaces;
using SistemaDeportes.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaDeportes.BLL.Implementacion
{
    public class EstadisticaService : IEstadisticaService
    {
        private readonly IGenericRepository<Estadistica> _repositoryEstadistica;
        private readonly IGenericRepository<Usuario> _repositoryUsuario;

        public EstadisticaService(IGenericRepository<Usuario> repositoryUsuario, IGenericRepository<Estadistica> repositoryEstadistica)
        {
            _repositoryUsuario = repositoryUsuario;
            _repositoryEstadistica = repositoryEstadistica;
        }

        public async Task<Estadistica> Crear(Estadistica entidad)
        {
            try
            {
                Estadistica estadistica_creado = await _repositoryEstadistica.Crear(entidad);

                if (estadistica_creado.Id == 0)
                    throw new TaskCanceledException("No se pudó crear las estadísticas");

                return estadistica_creado;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<Estadistica> Editar(Estadistica entidad)
        {
            try
            {
                IQueryable<Estadistica> queryUser = await _repositoryEstadistica.Consultar(u => u.IdUsuario == entidad.IdUsuario);

                Estadistica editar = queryUser.First();

                editar.PartidosJugados = entidad.PartidosJugados;
                editar.Goles = entidad.Goles;
                editar.Asistencias = entidad.Asistencias;
                editar.Amarillas = entidad.Amarillas;
                editar.Rojas = entidad.Rojas;

                bool respuesta = await _repositoryEstadistica.Editar(editar);

                if (!respuesta)
                    throw new TaskCanceledException("Error al editar las estadísticas");

                return editar;
            }
            catch (Exception)
            {
                throw;
            }
        }


        public async Task<List<Usuario>> Lista()
        {
            IQueryable<Usuario> query = await _repositoryUsuario.Consultar();
            return query.Include(r => r.IdRolNavigation).Where(u => u.IdRol == 3 && u.Estado).ToList();
        }

        public async Task<Estadistica> ObtenerJugador(int documento)
        {
            IQueryable<Estadistica> query = await _repositoryEstadistica.Consultar();
            Estadistica jugador = query.Where(u => u.IdUsuario == documento).First();
            return jugador;
        }
    }
}
