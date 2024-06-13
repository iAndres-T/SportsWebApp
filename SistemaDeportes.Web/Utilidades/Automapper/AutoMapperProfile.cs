using AutoMapper;
using SistemaDeportes.Entity;
using SistemaDeportes.Web.Models.ViewModel;

namespace SistemaDeportes.Web.Utilidades.Automapper
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            #region Rol
            CreateMap<Rol, VMRol>().ReverseMap();
            #endregion Rol

            #region Usuario
            CreateMap<Usuario, VMUsuario>()
                .ForMember(destino =>
                destino.Estado,
                opt => opt.MapFrom(origen => origen.Estado == true ? 1 : 0)
                )
                .ForMember(destino =>
                destino.NombreRol,
                opt => opt.MapFrom(origen => origen.IdRolNavigation.Nombre)
                );

            CreateMap<VMUsuario, Usuario>()
                .ForMember(destino =>
                destino.Estado,
                opt => opt.MapFrom(origen => origen.Estado == 1 ? true : false)
                )
                .ForMember(destino =>
                destino.IdRolNavigation,
                opt => opt.Ignore()
                );
            #endregion Usuario

            #region Estadistica
            CreateMap<Estadistica, VMEstadistica>().ReverseMap();

            #endregion Estadistica

            #region Inventario
            CreateMap<Elemento_Inventario, VMElemento_Inventario>().ReverseMap();
            #endregion Inventario

            #region Evento
            CreateMap<Evento, VMEvento>().ReverseMap();
            #endregion Evento

            #region Menu
            CreateMap<Menu, VMMenu>().ReverseMap();
            #endregion Menu
        }
    }
}
