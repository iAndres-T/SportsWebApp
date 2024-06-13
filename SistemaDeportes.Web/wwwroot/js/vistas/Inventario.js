const MODELO_BASE = {
    codigo: 0,
    marca: "",
    nombre: "",
    cantidad: 0,
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
            url: "/Inventario/Lista",
            type: "GET",
            datatype: "json"
        },
        columns: [
            { data: "codigo" },
            { data: "marca" },
            { data: "nombre" },
            { data: "cantidad" },
            {
                defaultContent:
                    '<button class="btn btn-primary btn-editar btn-sm mr-2"><i class="fas fa-pencil-alt"></i></button>' +
                    '<button class="btn btn-danger btn-eliminar btn-sm"><i class="fas fa-trash"></i></button>',
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
let temp;
function mostrarModal(modelo = MODELO_BASE) {
    $("#txtCodigo").val(modelo.codigo !== 0 ? modelo.codigo : "");

    if (modelo.codigo !== 0) {
        $("#txtCodigo").attr("readonly", true);
    } else {
        $("#txtCodigo").removeAttr("readonly");
    }

    $("#txtMarca").val(modelo.marca);
    $("#txtNombre").val(modelo.nombre);
    $("#txtCantidad").val(modelo.cantidad !== 0 ? modelo.cantidad : "");
    editar = modelo.codigo;
    temp = modelo.idUsuario;
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
    modelo["codigo"] = parseInt($("#txtCodigo").val());
    modelo["marca"] = $("#txtMarca").val();
    modelo["nombre"] = $("#txtNombre").val();
    modelo["cantidad"] = parseInt($("#txtCantidad").val());
    modelo["idUsuario"] = temp;

    const formData = new FormData();
    formData.append("modelo", JSON.stringify(modelo))

    $("#modalData").find("div.modal-content").LoadingOverlay("show");

    if (editar === 0) {

        fetch("/Inventario/Crear",
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
                    swal("Listo!", "Elemento guardado", "success");
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
        fetch("/Inventario/Editar",
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
                    getTabla();
                    filaSeleccionada = null;
                    $("#modalData").modal("hide");
                    swal("Listo!", "Elemento editado", "success");
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

$("#tbdata tbody").on("click", ".btn-eliminar", function () {
    let fila;
    if ($(this).closest("tr").hasClass("child")) {
        fila = $(this).closest("tr").prev();
    } else {
        fila = $(this).closest("tr");
    }

    const data = tablaData.row(fila).data();

    const formData = new FormData();
    formData.append("modelo", JSON.stringify(data))

    swal(
        {
            title: "¿Está Seguro?",
            text: `Eliminar el elemento`,
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Si, eliminar",
            cancelButtonText: "No, cancelar",
            closeOnConfirm: false,
            closeOnCancel: true,
        },
        function (respuesta) {
            if (respuesta) {
                $(".showSweetAlert").LoadingOverlay("show");

                fetch(
                    `/Inventario/Eliminar?codigo=${data.codigo}`,
                    {
                        method: "DELETE"
                    }
                )
                    .then((response) => {
                        $(".showSweetAlert").LoadingOverlay("hide");
                        return response.ok ? response.json() : Promise.reject(response);
                    })
                    .then((responseJson) => {
                        if (responseJson.estado) {
                            tablaData.row(fila).remove().draw();
                            swal("Listo!", "Elemento eliminado", "success");
                        } else {
                            swal("Lo sentimos", responseJson.mensaje, "error");
                        }
                    });
            }
        }
    );
});

let filaSeleccionada;
$("#tbdata tbody").on("click", ".btn-editar", function () {
    if ($(this).closest("tr").hasClass("child")) {
        filaSeleccionada = $(this).closest("tr").prev();
    } else {
        filaSeleccionada = $(this).closest("tr");
    }

    const data = tablaData.row(filaSeleccionada).data();

    mostrarModal(data);
});
