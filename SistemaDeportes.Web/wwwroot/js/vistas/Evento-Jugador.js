$(document).ready(function () {
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
                }
            }
        ],
        order: [[0, "desc"]],
        dom: "Bfrtip",
        buttons: ["pageLength"],
        language: {
            url: "https://cdn.datatables.net/plug-ins/1.11.5/i18n/es-ES.json",
        },
    });
});