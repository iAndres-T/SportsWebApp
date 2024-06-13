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
    public class RolService : IRolService
    {
        private readonly IGenericRepository<Rol> _repository;

        public RolService(IGenericRepository<Rol> repository)
        {
            _repository = repository;
        }

        public async Task<List<Rol>> Lista()
        {
            IQueryable<Rol> query = await _repository.Consultar();
            return query.ToList();
        }
    }
}
