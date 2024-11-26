using Moq;
using SistemaDeportes.BLL.Implementacion;
using SistemaDeportes.BLL.Interfaces;
using SistemaDeportes.DAL.Interfaces;
using SistemaDeportes.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace SistemaDeportes.test.Pruebas
{
    public class InventarioServiceTest
    {
        private readonly Mock<IGenericRepository<Elemento_Inventario>> _mockRepository;
        private readonly IInventarioService _inventarioService;

        public InventarioServiceTest()
        {
            _mockRepository = new Mock<IGenericRepository<Elemento_Inventario>>();
            _inventarioService = new InventarioService(_mockRepository.Object);
        }

        [Fact]
        public async Task Crear_Elemento_Inventario_Exitoso()
        {
            var elemento = new Elemento_Inventario { Codigo = 1, Nombre = "Balón", Marca = "Nike", Cantidad = 10, IdUsuario = 1 };

            _mockRepository.Setup(r => r.Obtener(It.IsAny<Expression<Func<Elemento_Inventario, bool>>>())).ReturnsAsync((Elemento_Inventario)null);
            _mockRepository.Setup(r => r.Crear(It.IsAny<Elemento_Inventario>())).ReturnsAsync(elemento); 

            var result = await _inventarioService.Crear(elemento);

            Assert.NotNull(result);
            Assert.Equal(1, result.Codigo);
        }

        [Fact]
        public async Task Editar_Elemento_Inventario_Exitoso()
        {
            var elemento = new Elemento_Inventario { Codigo = 1, Nombre = "Balón", Marca = "Nike", Cantidad = 10, IdUsuario = 1 };

            _mockRepository.Setup(r => r.Consultar(It.IsAny<Expression<Func<Elemento_Inventario, bool>>>())).ReturnsAsync((new List<Elemento_Inventario> { elemento }).AsQueryable());
            _mockRepository.Setup(r => r.Editar(It.IsAny<Elemento_Inventario>())).ReturnsAsync(true);

            var result = await _inventarioService.Editar(elemento);

            Assert.NotNull(result);
            Assert.Equal("Balón", result.Nombre);
        }

        [Fact]
        public async Task Eliminar_Elemento_Inventario_Exitoso()
        {
            var elemento = new Elemento_Inventario { Codigo = 1, Nombre = "Balón", Marca = "Nike", Cantidad = 10, IdUsuario = 1 };

            _mockRepository.Setup(r => r.Obtener(It.IsAny<Expression<Func<Elemento_Inventario, bool>>>())).ReturnsAsync(elemento);
            _mockRepository.Setup(r => r.Eliminar(It.IsAny<Elemento_Inventario>())).ReturnsAsync(true);

            var result = await _inventarioService.Eliminar(1);

            Assert.True(result);
        }
    }
}
