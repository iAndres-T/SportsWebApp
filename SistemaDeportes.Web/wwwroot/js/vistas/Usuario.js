const MODELO_BASE = {
    Documento: 0,
    Nombre: "",
    Estado: 1,
    Clave: "",
    IdRol: 1,
};

$(document).ready(function () {
    fetch(
        "/Usuario/ListaRoles"
    )
        .then((response) => {
            return response.ok ? response.json() : Promise.reject(response);
        })
        .then((responseJson) => {
            if (responseJson.length > 0) {
                responseJson.forEach((item) => {
                    $("#cboRol").append(
                        $("<option>").val(item.id).text(item.nombre)
                    );
                });
            }
        })
        .catch((error) => {
            console.error("Error al obtener la lista de usuarios:", error);
        });

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
            url: "/Usuario/Lista",
            type: "GET",
            datatype: "json"
        },
        columns: [
            { data: "nombre" },
            { data: "documento" },
            { data: "nombreRol" },
            {
                data: "estado",
                render: function (data) {
                    return data == 1
                        ? '<span class="badge badge-info">Activo</span>'
                        : '<span class="badge badge-danger">No Activo</span>';
                },
            },
            {
                defaultContent:
                    '<button class="btn btn-danger btn-desactivar btn-sm"><i class="fas fa-toggle-off"></i></button>',
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
    $("#txtDocumento").val(modelo.Documento !== 0 ? modelo.Documento : "");
    $("#txtNombre").val(modelo.Nombre);
    $("#cboRol").val(modelo.IdRol);
    $("#cboEstado").val(modelo.Estado);
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

    const documento = $("input[name='Documento']").val().trim();
    if (documento.length !== 10 || !/^\d{10}$/.test(documento)) {
        toastr.warning("", "El Documento debe contener 10 dígitos.");
        $("input[name='Documento']").focus();
        return;
    }

    const modelo = structuredClone(MODELO_BASE);
    modelo["Documento"] = parseInt($("#txtDocumento").val());
    modelo["Nombre"] = $("#txtNombre").val();
    modelo["Clave"] = parseInt($("#txtDocumento").val()) + "Cc";
    modelo["IdRol"] = $("#cboRol").val();
    modelo["Estado"] = $("#cboEstado").val();

    const formData = new FormData();
    formData.append("modelo", JSON.stringify(modelo))

    $("#modalData").find("div.modal-content").LoadingOverlay("show");


    fetch("/Usuario/Crear",
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
                swal("Usuario Registrado", `${$("#txtNombre").val()}`, "success");
            } else {
                swal("Lo sentimos", responseJson.mensaje, "error");
            }
        })
        .catch((error) => {
            console.error("Error:", error);
            swal(
                "Lo sentimos",
                "Hubo un problema con la solicitud.",
                "error"
            );
        });
});

let filaSeleccionada;
$("#tbdata tbody").on("click", ".btn-desactivar", function () {
    if ($(this).closest("tr").hasClass("child")) {
        filaSeleccionada = $(this).closest("tr").prev();
    } else {
        filaSeleccionada = $(this).closest("tr");
    }

    const data = tablaData.row(filaSeleccionada).data();
    data["estado"] = 0;    

    const formData = new FormData();
    formData.append("modelo", JSON.stringify(data))

    swal(
        {
            title: "¿Está Seguro?",
            text: `Desactivar al usuario`,
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Si, desactivar",
            cancelButtonText: "No, cancelar",
            closeOnConfirm: false,
            closeOnCancel: true,
        },
        function (respuesta) {
            if (respuesta) {
                $(".showSweetAlert").LoadingOverlay("show");

                fetch("/Usuario/Desactivar",
                    {
                        method: "PUT",
                        body: formData
                    }
                )
                    .then(response => {
                        $(".showSweetAlert").LoadingOverlay("hide");
                        return response.ok ? response.json() : Promise.reject(response);
                    })
                    .then(responseJson => {
                        if (responseJson.estado) {
                            getTabla();
                            filaSeleccionada = null;
                            swal("Usuario desactivado", `${data.nombre}`, "success");
                        }
                        else {
                            swal("Lo sentimos", responseJson.mensaje, "error");
                        }
                    });
            }
        }
    );  
});
