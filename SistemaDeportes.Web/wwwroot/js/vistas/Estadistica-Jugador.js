$(document).ready(function () {
    fetch(
        `/Estadistica/ObtenerJugador?documento=${0}`,
        {
            method: "GET"
        }
    )
        .then((response) => {
            return response.ok ? response.json() : Promise.reject(response);
        })
        .then((responseJson) => {
            if (responseJson.estado) {
                const modelo = [];
                modelo["partidosJugados"] = responseJson.objeto.partidosJugados;
                modelo["goles"] = responseJson.objeto.goles;
                modelo["asistencias"] = responseJson.objeto.asistencias;
                modelo["amarillas"] = responseJson.objeto.amarillas;
                modelo["rojas"] = responseJson.objeto.rojas;

                $("#txtPartidos").val(modelo.partidosJugados);
                $("#txtGoles").val(modelo.goles);
                $("#txtAsistencias").val(modelo.asistencias);
                $("#txtAmarillas").val(modelo.amarillas);
                $("#txtRojas").val(modelo.rojas);
                $("#txtGolesProm").val((modelo.goles / modelo.partidosJugados).toFixed(2));
                $("#txtAsistenciasProm").val((modelo.asistencias / modelo.partidosJugados).toFixed(2));
                $("#txtAmarillasProm").val((modelo.amarillas / modelo.partidosJugados).toFixed(2));
                $("#txtRojasProm").val((modelo.rojas / modelo.partidosJugados).toFixed(2));
            }
        })
        .catch((error) => {
            console.error("Error:", error);
            swal("Lo sentimos", "Hubo un problema al cargar los datos.", "error");
        });
});
