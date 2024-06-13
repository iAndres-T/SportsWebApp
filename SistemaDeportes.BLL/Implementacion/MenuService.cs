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
    public class MenuService : IMenuService
    {
        private readonly IGenericRepository<Menu> _repositoryMenu;
        private readonly IGenericRepository<RolMenu> _repositoryRol;
        private readonly IGenericRepository<Usuario> _repositoryUser;

        public MenuService(IGenericRepository<Menu> repositoryMenu, IGenericRepository<RolMenu> repositoryRol, IGenericRepository<Usuario> repositoryUser)
        {
            _repositoryMenu = repositoryMenu;
            _repositoryRol = repositoryRol;
            _repositoryUser = repositoryUser;
        }

        public async Task<List<Menu>> ObtenerMenu(int idUsuario)
        {
            IQueryable<Usuario> tbUsuario = await _repositoryUser.Consultar(u => u.Documento == idUsuario);
            IQueryable<RolMenu> tbRol = await _repositoryRol.Consultar();
            IQueryable<Menu> tbMenu = await _repositoryMenu.Consultar();

            IQueryable<Menu> MenuPadre = (from u in tbUsuario
                                          join rm in tbRol on u.IdRol equals rm.IdRol
                                          join m in tbMenu on rm.IdMenu equals m.Id
                                          select m).Distinct().AsQueryable();

            List<Menu> menus = (from mpadre in MenuPadre
                                select new Menu()
                                {
                                    Nombre = mpadre.Nombre,
                                    Icono = mpadre.Icono,
                                    Controlador = mpadre.Controlador,
                                    PaginaAccion = mpadre.PaginaAccion
                                }).ToList();
            return menus;
        }

    }
}
