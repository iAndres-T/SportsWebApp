using Microsoft.EntityFrameworkCore;
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
    public class InventarioService : IInventarioService
    {
        private readonly IGenericRepository<Elemento_Inventario> _repository;

        public InventarioService(IGenericRepository<Elemento_Inventario> repository)
        {
            _repository = repository;
        }

        public async Task<Elemento_Inventario> Crear(Elemento_Inventario entidad)
        {
            Elemento_Inventario elemento = await _repository.Obtener(u => u.Codigo == entidad.Codigo);

            if (elemento != null)
            {
                throw new TaskCanceledException("El elemento ya existe");
            }

            try
            {
                Elemento_Inventario elemento_creado = await _repository.Crear(entidad);

                if (elemento_creado.Codigo == 0)
                    throw new TaskCanceledException("No se pudó agregar el elemento");


                IQueryable<Elemento_Inventario> query = await _repository.Consultar(u => u.Codigo == elemento_creado.Codigo);

                return elemento_creado;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<Elemento_Inventario> Editar(Elemento_Inventario entidad)
        {
            try
            {
                IQueryable<Elemento_Inventario> queryElemento = await _repository.Consultar(u => u.Codigo == entidad.Codigo);

                Elemento_Inventario elemento_editar = queryElemento.First();

                elemento_editar.Nombre = entidad.Nombre;
                elemento_editar.Marca = entidad.Marca;
                elemento_editar.Cantidad = entidad.Cantidad;
                elemento_editar.IdUsuario = entidad.IdUsuario;


                bool respuesta = await _repository.Editar(elemento_editar);

                if (!respuesta)
                    throw new TaskCanceledException("Error al editar el usuario");

                return elemento_editar;
            }
            catch (Exception)
            {
                throw;
            }
        }


        public async Task<List<Elemento_Inventario>> Lista()
        {
            IQueryable<Elemento_Inventario> query = await _repository.Consultar();
            return query.ToList();
        }

        public async Task<bool> Eliminar(int codigo)
        {
            try
            {
                Elemento_Inventario encontrado = await _repository.Obtener(u => u.Codigo == codigo);

                if (encontrado == null)
                    throw new TaskCanceledException("El elemento no existe");

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
