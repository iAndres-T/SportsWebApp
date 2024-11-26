using Moq;
using SistemaDeportes.BLL.Implementacion;
using SistemaDeportes.BLL.Interfaces;
using SistemaDeportes.DAL.Interfaces;
using SistemaDeportes.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Xunit;

namespace SistemaDeportes.test.Pruebas
{
    public class UsuarioServiceTest
    {
        private readonly Mock<IGenericRepository<Usuario>> _mockRepository;
        private readonly Mock<IUtilidadesService> _mockUtilidadesService;
        private readonly UsuarioService _usuarioService;

        public UsuarioServiceTest()
        {
            _mockRepository = new Mock<IGenericRepository<Usuario>>();
            _mockUtilidadesService = new Mock<IUtilidadesService>();
            _usuarioService = new UsuarioService(_mockRepository.Object, _mockUtilidadesService.Object);
        }

        [Fact]
        public async Task Crear_DeberiaRegistrarUsuarioCorrectamente()
        {
            // Arrange
            var usuario = new Usuario
            {
                Documento = 1134567890,
                Nombre = "Juan Perez",
                Estado = true,
                Clave = "1134567890Cc",
                IdRol = 1,
                ElementoInventarios = new HashSet<Elemento_Inventario>(),
                Estadisticas = new HashSet<Estadistica>(),
                Eventos = new HashSet<Evento>()
            };

            _mockRepository.Setup(r => r.Obtener(It.IsAny<Expression<Func<Usuario, bool>>>()))
                .ReturnsAsync((Usuario)null);

            _mockRepository.Setup(r => r.Crear(It.IsAny<Usuario>()))
                .ReturnsAsync(usuario);

            _mockUtilidadesService.Setup(u => u.ConvertirSha256(It.IsAny<string>()))
                .Returns("1134567890Cc");

            _mockRepository.Setup(r => r.Consultar(It.IsAny<Expression<Func<Usuario, bool>>>()))
                .ReturnsAsync(new List<Usuario> { usuario }.AsQueryable());

            // Act
            var resultado = await _usuarioService.Crear(usuario);

            // Assert
            Assert.NotNull(resultado);
            Assert.Equal(usuario.Documento, resultado.Documento);
            Assert.Equal(usuario.Nombre, resultado.Nombre);
            Assert.Equal("1134567890Cc", resultado.Clave);
            _mockRepository.Verify(r => r.Crear(It.IsAny<Usuario>()), Times.Once);
        }

        [Fact]
        public async Task Desactivar_DeberiaDesactivarUsuarioCorrectamente()
        {
            // Arrange
            var usuario = new Usuario
            {
                Documento = 1234567890,
                Estado = false
            };

            _mockRepository.Setup(r => r.Consultar(It.IsAny<Expression<Func<Usuario, bool>>>()))
                .ReturnsAsync(new List<Usuario> { usuario }.AsQueryable());

            _mockRepository.Setup(r => r.Editar(It.IsAny<Usuario>()))
                .ReturnsAsync(true);

            // Act
            var resultado = await _usuarioService.Desactivar(usuario);

            // Assert
            Assert.NotNull(resultado);
            Assert.False(resultado.Estado);
            _mockRepository.Verify(r => r.Editar(It.IsAny<Usuario>()), Times.Once);
        }

        [Fact]
        public async Task ObtenerPorCredenciales_DeberiaRetornarUsuarioCorrecto()
        {
            // Arrange
            var usuario = new Usuario
            {
                Documento = 1234567890,
                Clave = "1234567890Cc"
            };

            _mockUtilidadesService.Setup(u => u.ConvertirSha256(It.IsAny<string>()))
                .Returns("1234567890Cc");

            _mockRepository.Setup(r => r.Obtener(It.IsAny<Expression<Func<Usuario, bool>>>()))
                .ReturnsAsync(usuario);

            // Act
            var resultado = await _usuarioService.ObtenerPorCredenciales(1234567890, "1234567890Cc");

            // Assert
            Assert.NotNull(resultado);
            Assert.Equal(usuario.Documento, resultado.Documento);
        }
    }
}
