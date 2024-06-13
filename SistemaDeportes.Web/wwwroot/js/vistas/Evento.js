const MODELO_BASE = {
    Id: 0,
    Descripcion: "",
    Fecha: "",
    idUsuario: 0
};

$(document).ready(function () {
    getTabla();
});

let tablaData;
function getTabla() {
    if (tablaData) {
        tablaData.destroy();
    }

    tablaData = $("#tbdata").DataTable({
        responsive: true,
        ajax: {
            url: "/Evento/Lista",
            type: "GET",
            datatype: "json"
        },
        columns: [
            { data: "descripcion" },
            {
                data: "fecha",
                render: function (data, type, row) {
                    if (type === 'display' || type === 'filter') {
                        if (data) {
                            const datePart = data.split('T')[0];
                            const [year, month, day] = datePart.split('-');
                            return `${day}/${month}/${year}`;
                        }
                        return "";
                    }
                    return data;
                } },
            {
                defaultContent:
                    '<button class="btn btn-danger btn-cancelar btn-sm"><i class="fas fa-calendar-times"></i></button>',
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

function mostrarModal(modelo = MODELO_BASE) {
    $("#txtDescripcion").val(modelo.Descripcion);
    $("#txtFecha").val(modelo.Fecha);

    $("#modalData").modal("show");
}

$("#btnNuevo").click(function () {
    mostrarModal();
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
    modelo["Descripcion"] = $("#txtDescripcion").val();
    modelo["Fecha"] = $("#txtFecha").val();
    modelo["Id"] = parseInt($("#txtFecha").val().split("-").join(""));

    const formData = new FormData();
    formData.append("modelo", JSON.stringify(modelo))

    $("#modalData").find("div.modal-content").LoadingOverlay("show");

    fetch("/Evento/Crear",
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
                getTabla();
                $("#modalData").modal("hide");
                swal("Evento programado", `${modelo.Fecha}`, "success");
            }
            else {
                swal("Lo sentimos", responseJson.mensaje, "error");
            }
        })
        .catch((error) => {
            console.error("Error:", error);
            swal("Lo sentimos", "Hubo un problema con la solicitud.", "error");
        });

});

$("#tbdata tbody").on("click", ".btn-cancelar", function () {

    let fila;
    if ($(this).closest("tr").hasClass("child")) {
        fila = $(this).closest("tr").prev();
    } else {
        fila = $(this).closest("tr");
    }

    const data = tablaData.row(fila).data();
    data.id = data.fecha.split('T')[0].replace(/-/g, "");
    
    swal(
        {
            title: "¿Está Seguro?",
            text: `Cancelar evento`,
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Si, cancelar",
            cancelButtonText: "No, volver",
            closeOnConfirm: false,
            closeOnCancel: true,
        },
        function (respuesta) {
            if (respuesta) {
                $(".showSweetAlert").LoadingOverlay("show");

                fetch(`/Evento/Eliminar?id=${data.id}`,
                    {
                        method: "DELETE"
                    }
                )
                    .then(response => {
                        $(".showSweetAlert").LoadingOverlay("hide");
                        return response.ok ? response.json() : Promise.reject(response);
                    })
                    .then(responseJson => {
                        if (responseJson.estado) {
                            tablaData.row(fila).remove().draw();
                            swal("Listo!", "Evento cancelado", "success");
                        }
                        else {
                            swal("Lo sentimos", responseJson.mensaje, "error");
                        }
                    });
            }
        }
    );
});
