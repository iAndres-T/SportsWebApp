const MODELO_BASE = {
    partidosJugados: 0,
    goles: 0,
    asistencias: 0,
    amarillas: 0,
    rojas: 0
};

$(document).ready(function () {
    getTabla();
});

let tablaData;
function getTabla() {

    tablaData = $("#tbdata").DataTable({
        responsive: true,
        ajax: {
            url: "/Estadistica/Lista",
            type: "GET",
            datatype: "json"
        },
        columns: [
            { data: "nombre" },
            { data: "documento" },
            {
                defaultContent:
                    '<button class="btn btn-success btn-ver btn-sm"><i class="fas fa-eye"></i></button>',
                orderable: false,
                searchable: false,
                width: "80px",
            },
        ],
        order: [[0, "desc"]],
        dom: "Bfrtip",
        buttons: ["pageLength"],
        language: {
            url: "https://cdn.datatables.net/plug-ins/1.11.5/i18n/es-ES.json",
        },
    });
}

let editar = 0;
function mostrarModal(modelo, jugador) {
    $("#txtNombre").val(jugador.nombre);
    $("#txtDocumento").val(jugador.documento);
    $("#txtPartidos").val(modelo.partidosJugados);
    $("#txtGoles").val(modelo.goles);
    $("#txtAsistencias").val(modelo.asistencias);
    $("#txtAmarillas").val(modelo.amarillas);
    $("#txtRojas").val(modelo.rojas);
    $("#txtGolesProm").val((modelo.goles / modelo.partidosJugados).toFixed(2));
    $("#txtAsistenciasProm").val((modelo.asistencias / modelo.partidosJugados).toFixed(2));
    $("#txtAmarillasProm").val((modelo.amarillas / modelo.partidosJugados).toFixed(2));
    $("#txtRojasProm").val((modelo.rojas / modelo.partidosJugados).toFixed(2));
    editar = modelo.partidosJugados;

    if (editar > 0) {
        $("#btnInforme").attr("href", `/Estadistica/MostrarPDFJugador?documento=${jugador.documento}`);
        $("#btnInforme").show();
    }
    else {
        $("#btnInforme").hide();
    }

    $("#modalData").modal("show");
}

let filaSeleccionada;
$("#tbdata tbody").on("click", ".btn-ver", function () {
    if ($(this).closest("tr").hasClass("child")) {
        filaSeleccionada = $(this).closest("tr").prev();
    } else {
        filaSeleccionada = $(this).closest("tr");
    }
    const data = tablaData.row(filaSeleccionada).data();

    fetch(`/Estadistica/ObtenerJugador?documento=${data.documento}`,
        {
            method: "GET"
        }
    )
        .then((response) => {
            return response.ok ? response.json() : Promise.reject(response);
        })
        .then((responseJson) => {
            if (responseJson.estado) {
                const modelo = structuredClone(MODELO_BASE);
                modelo["partidosJugados"] = responseJson.objeto.partidosJugados;
                modelo["goles"] = responseJson.objeto.goles;
                modelo["asistencias"] = responseJson.objeto.asistencias;
                modelo["amarillas"] = responseJson.objeto.amarillas;
                modelo["rojas"] = responseJson.objeto.rojas;
                mostrarModal(modelo, data);
            } else {
                mostrarModal(MODELO_BASE, data);
            }
        })
        .catch((error) => {
            console.error("Error:", error);
            swal("Lo sentimos", "Hubo un problema con la solicitud.", "error");
        });


});

$("#btnGuardar").click(function () {
    const inputs = $("input.input-validar").serializeArray();
    const inputs_sin_valor = inputs.filter((item) => item.value.trim() == "");

    if (inputs_sin_valor.length > 0) {
        const mensaje = `Debe completar el campo: "${inputs_sin_valor[0].name}"`;
        toastr.warning("", mensaje);
        $(`input[name="${inputs_sin_valor[0].name}"]`).focus();
        return;
    }

    const modelo = structuredClone(MODELO_BASE);
    modelo["partidosJugados"] = parseInt($("#txtPartidos").val());
    modelo["goles"] = parseInt($("#txtGoles").val());
    modelo["asistencias"] = parseInt($("#txtAsistencias").val());
    modelo["amarillas"] = parseInt($("#txtAmarillas").val());
    modelo["rojas"] = parseInt($("#txtRojas").val());
    modelo["idUsuario"] = parseInt($("#txtDocumento").val());

    const formData = new FormData();
    formData.append("modelo", JSON.stringify(modelo))

    $("#modalData").find("div.modal-content").LoadingOverlay("show");

    if (editar === 0) {
        fetch(
            "/Estadistica/Crear",
            {
                method: "POST",
                body: formData
            }
        )
            .then((response) => {
                $("#modalData").find("div.modal-content").LoadingOverlay("hide");
                return response.ok ? response.json() : Promise.reject(response);
            })
            .then((responseJson) => {
                if (responseJson.estado) {
                    $("#modalData").modal("hide");
                    swal("Estadísticas Guardadas", `${$("#txtNombre").val()}`, "success");
                } else {
                    swal("Lo sentimos", responseJson.mensaje, "error");
                }
            })
            .catch((error) => {
                console.error("Error:", error);
                swal("Lo sentimos", "Hubo un problema con la solicitud.", "error");
            });
    }
    else {
        fetch("/Estadistica/Editar",
            {
                method: "PUT",
                body: formData
            }
        )
            .then((response) => {
                $("#modalData").find("div.modal-content").LoadingOverlay("hide");
                return response.ok ? response.json() : Promise.reject(response);
            })
            .then((responseJson) => {
                if (responseJson.estado) {
                    $("#modalData").modal("hide");
                    swal("Estadísticas Editadas", `${$("#txtNombre").val()}`, "success");
                } else {
                    swal("Lo sentimos", responseJson.mensaje, "error");
                }
            })
            .catch((error) => {
                console.error("Error:", error);
                swal("Lo sentimos", "Hubo un problema con la solicitud.", "error");
            });
    }
});

$("#btnInforme").click(function () {
    swal("Informe Descargado", `${$("#txtNombre").val()}`, "success");
});

$("#btnDashboard").click(function () {
    $("#modalData").find("div.modal-content").LoadingOverlay("show");
    $("#modalData").find("div.modal-content").LoadingOverlay("hide");
    mostrarModalDashboard();
});

let myBarChart;
let myPieChart;
function mostrarModalDashboard() {

    const data = tablaData.row(filaSeleccionada).data();

    fetch(
        `/Estadistica/ObtenerJugador?documento=${data.documento}`,
        {
            method: "GET"
        }
    )
        .then((response) => {
            return response.ok ? response.json() : Promise.reject(response);
        })
        .then((responseJson) => {
            if (responseJson.estado) {
                //Mostrar tarjetas            
                const modelo = [];
                modelo["goles"] = responseJson.objeto.goles;
                modelo["asistencias"] = responseJson.objeto.asistencias;
                modelo["amarillas"] = responseJson.objeto.amarillas;
                modelo["rojas"] = responseJson.objeto.rojas;

                $("#totalAsistencias").text(modelo.asistencias);
                $("#totalGoles").text(modelo.goles);
                $("#totalAmarillas").text(modelo.amarillas);
                $("#totalRojas").text(modelo.rojas);
                $("#barTitle").text("Partidos Jugados: " + responseJson.objeto.partidosJugados);

                function capitalizeFirstLetter(string) {
                    return string.charAt(0).toUpperCase() + string.slice(1);
                }

                // Crear las etiquetas de la gráfica con la primera letra en mayúscula
                const barchart_labels = Object.keys(modelo).map(label => capitalizeFirstLetter(label));
                const barchart_data = Object.values(modelo);

                if (myBarChart && myPieChart) {
                    myBarChart.destroy();
                    myPieChart.destroy();
                }

                // Bar chart
                let controlPartidos = document.getElementById("chartPartidos");
                myBarChart = new Chart(controlPartidos, {
                    type: "bar",
                    data: {
                        labels: barchart_labels,
                        datasets: [
                            {
                                label: "Cantidad",
                                backgroundColor: "#4e73df",
                                hoverBackgroundColor: "#2e59d9",
                                borderColor: "#4e73df",
                                data: barchart_data,
                            },
                        ],
                    },
                    options: {
                        maintainAspectRatio: false,
                        legend: {
                            display: false,
                        },
                        scales: {
                            xAxes: [
                                {
                                    gridLines: {
                                        display: false,
                                        drawBorder: false,
                                    },
                                    maxBarThickness: 50,
                                },
                            ],
                            yAxes: [
                                {
                                    ticks: {
                                        min: 0,
                                        maxTicksLimit: 5,
                                    },
                                },
                            ],
                        },
                    },
                });

                // Pie Chart Example
                let controlGrafico = document.getElementById("chartGrafico");
                myPieChart = new Chart(controlGrafico, {
                    type: "doughnut",
                    data: {
                        labels: barchart_labels,
                        datasets: [
                            {
                                data: barchart_data,
                                backgroundColor: [
                                    "#1cc88a",
                                    "#4e73df",
                                    "#FFDD00",
                                    "#e1301e",
                                ],
                                hoverBackgroundColor: [
                                    "#1cc88a",
                                    "#4e73df",
                                    "#FFDD00",
                                    "#e1301e",
                                ],
                                hoverBorderColor: "rgba(234, 236, 244, 1)",
                            },
                        ],
                    },
                    options: {
                        maintainAspectRatio: false,
                        tooltips: {
                            backgroundColor: "rgb(255,255,255)",
                            bodyFontColor: "#858796",
                            borderColor: "#dddfeb",
                            borderWidth: 1,
                            xPadding: 15,
                            yPadding: 15,
                            displayColors: false,
                            caretPadding: 10,
                        },
                        legend: {
                            display: true,
                        },
                        cutoutPercentage: 80,
                    },
                });

                $("#modalDataDashboard").modal("show");
            }
            else {
                swal("Lo sentimos", "El jugador no cuenta con estadisticas", "error");
            }
        });

}
