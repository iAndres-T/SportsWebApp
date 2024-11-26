using Moq;
using SistemaDeportes.BLL.Implementacion;
using SistemaDeportes.BLL.Interfaces;
using SistemaDeportes.DAL.Interfaces;
using SistemaDeportes.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaDeportes.test.Pruebas
{
    public class EstadisticasServiceTest
    {
        private readonly Mock<IGenericRepository<Estadistica>> _mockRepoEstadistica;
        private readonly Mock<IGenericRepository<Usuario>> _mockRepoUsuario;
        private readonly IEstadisticaService _estadisticaService;

        public EstadisticasServiceTest()
        {
            _mockRepoEstadistica = new Mock<IGenericRepository<Estadistica>>();
            _mockRepoUsuario = new Mock<IGenericRepository<Usuario>>();
            _estadisticaService = new EstadisticaService(_mockRepoUsuario.Object, _mockRepoEstadistica.Object);
        }

        [Fact]
        public async Task Crear_Estadistica_Returns_Estadistica()
        {
            // Arrange
            var estadistica = new Estadistica { Id = 1, PartidosJugados = 10, Goles = 5, Asistencias = 3, Amarillas = 1, Rojas = 0, IdUsuario = 1 };
            _mockRepoEstadistica.Setup(repo => repo.Crear(It.IsAny<Estadistica>())).ReturnsAsync(estadistica);

            // Act
            var result = await _estadisticaService.Crear(estadistica);

            // Assert
            Assert.NotNull(result);
            Assert.Equal(estadistica.Id, result.Id);
        }

        [Fact]
        public async Task Lista_Jugadores_Returns_ListOfJugadores()
        {
            // Arrange
            var usuarios = new List<Usuario>
                {
                    new Usuario { Documento = 1456789023, Nombre = "Juan", Estado = true, Clave = "1456789023Cc", IdRol = 3 },
                    new Usuario { Documento = 1456789023, Nombre = "Pedro", Estado = true, Clave = "1456789023Cc", IdRol = 3 }
                }.AsQueryable();

            _mockRepoUsuario.Setup(repo => repo.Consultar(null)).ReturnsAsync(usuarios);

            // Act
            var result = await _estadisticaService.Lista();

            // Assert
            Assert.NotNull(result);
            Assert.Equal(2, result.Count);
        }
    }
}
