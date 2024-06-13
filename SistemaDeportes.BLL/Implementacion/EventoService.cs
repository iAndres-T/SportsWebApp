using SistemaDeportes.BLL.Interfaces;
using SistemaDeportes.DAL.Interfaces;
using SistemaDeportes.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaDeportes.BLL.Implementacion
{
    public class EventoService : IEventoService
    {
        private readonly IGenericRepository<Evento> _repository;

        public EventoService(IGenericRepository<Evento> repository)
        {
            _repository = repository;
        }

        public async Task<Evento> Crear(Evento entidad)
        {
            Evento evento = await _repository.Obtener(u => u.Id == entidad.Id);

            if (evento != null)
            {
                throw new TaskCanceledException("Ya existe un evento");
            }

            try
            {
                Evento evento_creado = await _repository.Crear(entidad);

                if (evento_creado.Id == 0)
                    throw new TaskCanceledException("No se pudó crear el evento");


                IQueryable<Evento> query = await _repository.Consultar(u => u.Id == evento_creado.Id);

                return evento_creado;
            }
            catch (Exception)
            {
                throw;
            }
        }


        public async Task<List<Evento>> Lista()
        {
            IQueryable<Evento> query = await _repository.Consultar();
            return query.ToList();
        }

        public async Task<bool> Eliminar(int id)
        {
            try
            {
                Evento encontrado = await _repository.Obtener(u => u.Id == id);

                if (encontrado == null)
                    throw new TaskCanceledException("El evento no existe");

                bool respuesta = await _repository.Eliminar(encontrado);

                return true;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
