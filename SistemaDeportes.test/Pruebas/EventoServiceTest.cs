using Moq;
using SistemaDeportes.BLL.Implementacion;
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
    public class EventoServiceTest
    {
        private readonly Mock<IGenericRepository<Evento>> _mockRepository;
        private readonly BLL.Interfaces.IEventoService _eventoService;

        public EventoServiceTest()
        {
            _mockRepository = new Mock<IGenericRepository<Evento>>();
            _eventoService = new EventoService(_mockRepository.Object);
        }

        [Fact]
        public async Task Crear_EventoNuevo_DeberiaCrearEvento()
        {
            // Arrange
            var nuevoEvento = new Evento { Id = 1, Descripcion = "Evento de prueba", Fecha = DateTime.Now, IdUsuario = 1234567890 };
            _mockRepository.Setup(r => r.Obtener(It.IsAny<Expression<Func<Evento, bool>>>())).ReturnsAsync((Evento)null);
            _mockRepository.Setup(r => r.Crear(It.IsAny<Evento>())).ReturnsAsync(nuevoEvento);

            // Act
            var resultado = await _eventoService.Crear(nuevoEvento);

            // Assert
            Assert.NotNull(resultado);
            Assert.Equal(nuevoEvento.Id, resultado.Id);
            _mockRepository.Verify(r => r.Crear(It.IsAny<Evento>()), Times.Once);
        }

        [Fact]
        public async Task Crear_EventoExistente_DeberiaLanzarExcepcion()
        {
            // Arrange
            var eventoExistente = new Evento { Id = 1, Descripcion = "Evento de prueba", Fecha = DateTime.Now, IdUsuario = 1234567890 };
            _mockRepository.Setup(r => r.Obtener(It.IsAny<Expression<Func<Evento, bool>>>())).ReturnsAsync(eventoExistente);

            // Act & Assert
            await Assert.ThrowsAsync<TaskCanceledException>(() => _eventoService.Crear(eventoExistente));
        }

        [Fact]
        public async Task Eliminar_EventoExistente_DeberiaEliminarEvento()
        {
            // Arrange
            var eventoExistente = new Evento { Id = 1, Descripcion = "Evento de prueba", Fecha = DateTime.Now, IdUsuario = 1 };
            _mockRepository.Setup(r => r.Obtener(It.IsAny<Expression<Func<Evento, bool>>>())).ReturnsAsync(eventoExistente);
            _mockRepository.Setup(r => r.Eliminar(It.IsAny<Evento>())).ReturnsAsync(true);

            // Act
            var resultado = await _eventoService.Eliminar(eventoExistente.Id);

            // Assert
            Assert.True(resultado);
            _mockRepository.Verify(r => r.Eliminar(It.IsAny<Evento>()), Times.Once);
        }

    }
}