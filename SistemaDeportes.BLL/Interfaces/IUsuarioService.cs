using SistemaDeportes.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaDeportes.BLL.Interfaces
{
    public interface IUsuarioService
    {
        Task<List<Usuario>> Lista();
        Task<Usuario> Crear(Usuario entidad);
        Task<Usuario> Desactivar(Usuario entidad);
        Task<Usuario> ObtenerPorCredenciales(int documento, string clave);
        Task<Usuario> ObtenerPorId(int idUsuario);

    }
}
