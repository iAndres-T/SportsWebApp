using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaDeportes.DAL.DBContext;
using SistemaDeportes.DAL.Interfaces;
using SistemaDeportes.DAL.Implementacion;
using SistemaDeportes.BLL.Interfaces;
using SistemaDeportes.BLL.Implementacion;

namespace SistemaDeportes.IOC
{
    public static class Dependencia
    {
        public static void InyectarDependencia(this IServiceCollection services, IConfiguration Configuration)
        {
            services.AddDbContext<dbdeportesContext>(options =>
            {
                options.UseSqlServer(Configuration.GetConnectionString("CadenaSQL"));
            });

            services.AddTransient(typeof(IGenericRepository<>), typeof(GenericRepository<>));

            services.AddScoped<IUtilidadesService, UtilidadesService>();

            services.AddScoped<IRolService, RolService>();
            
            services.AddScoped<IUsuarioService, UsuarioService>();

            services.AddScoped<IInventarioService, InventarioService>();

            services.AddScoped<IEventoService, EventoService>();

            services.AddScoped<IEstadisticaService, EstadisticaService>();

            services.AddScoped<IMenuService, MenuService>();
        }
    }
}
