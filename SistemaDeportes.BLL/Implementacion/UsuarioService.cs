using Microsoft.EntityFrameworkCore;
using SistemaDeportes.BLL.Interfaces;
using SistemaDeportes.DAL.Interfaces;
using SistemaDeportes.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace SistemaDeportes.BLL.Implementacion
{
    public class UsuarioService : IUsuarioService
    {
        private readonly IGenericRepository<Usuario> _repository;
        private readonly IUtilidadesService _utilidadesService;

        public UsuarioService(IGenericRepository<Usuario> repository, IUtilidadesService utilidadesService)
        {
            _repository = repository;
            _utilidadesService = utilidadesService;
        }

        public async Task<Usuario> Crear(Usuario entidad)
        {
            Usuario usuario = await _repository.Obtener(u => u.Documento == entidad.Documento);

            if (usuario != null)
            {
                throw new TaskCanceledException("El usuario ya existe");
            }

            try
            {
                entidad.Clave = _utilidadesService.ConvertirSha256(entidad.Clave);

                Usuario usuario_creado = await _repository.Crear(entidad);

                if (usuario_creado.Documento == 0)
                    throw new TaskCanceledException("No se pudo crear el usuario");


                IQueryable<Usuario> query = await _repository.Consultar(u => u.Documento == usuario_creado.Documento);
                usuario_creado = query.Include(r => r.IdRolNavigation).First();

                return usuario_creado;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<Usuario> Desactivar(Usuario entidad)
        {
            try
            {
                IQueryable<Usuario> queryUser = await _repository.Consultar(u => u.Documento == entidad.Documento);

                Usuario usuario_editar = queryUser.First();

                usuario_editar.Estado = entidad.Estado;

                bool respuesta = await _repository.Editar(usuario_editar);

                if (!respuesta)
                    throw new TaskCanceledException("Error al desactivar el usuario");

                Usuario editado = queryUser.Include(r => r.IdRolNavigation).First();

                return editado;
            }
            catch (Exception)
            {
                throw;
            }
        }


        public async Task<List<Usuario>> Lista()
        {
            IQueryable<Usuario> query = await _repository.Consultar();
            return query.Include(r => r.IdRolNavigation).ToList();
        }

        public async Task<Usuario> ObtenerPorCredenciales(int documento, string clave)
        {
            string encriptada = _utilidadesService.ConvertirSha256(clave);

            Usuario encontrado = await _repository.Obtener(u => u.Documento == documento && u.Clave.Equals(encriptada));

            return encontrado;
        }

        public async Task<Usuario> ObtenerPorId(int idUsuario)
        {
            IQueryable<Usuario> query = await _repository.Consultar(u => u.Documento == idUsuario);

            Usuario resultado = query.Include(r => r.IdRolNavigation).FirstOrDefault();

            return resultado;
        }
    }
}
