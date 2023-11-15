var tablaReportesTransaccion;
var tablaReportesBalance;
$(document).ready(function () {
    tablaReportesTransaccion = $('#tablaTransaccion').DataTable({
        "ajax": {
            "url": "ListarTransacciones",
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            { "data": "id" },
            { "data": "txtNombre" },
            { "data": "descripcionTipo" },
            { "data": "montoSoles", },
            { "data": "txtFechaCreacion" },
            //$.fn.dataTable.render.number( ',', '.', 2) 
            
        ],

        "language": {
            decimal: ',',
            thousands: '.',
        },


        "columnDefs": [
            /*            {
                        targets: [4],
                        render: $.fn.dataTable.render.moment('YYYY-MM-DDTHH:mm:ss.SSS', 'DD/MM/YYYY HH:mm:ss'),
                    },*/
            {
                //targets: [5],
                //render: $.fn.dataTable.render.number(',', '.', 2, 'S/. '),
            },
            {
                "targets": [0, 2],
                "className": "text-center",
            }
        ],
        "order": [[0, 'desc']],

    });
    //new $.fn.dataTable.FixedHeader( tablaUsuarios );
    tablaReportesBalance = $('#tablaBalance').DataTable({
        "ajax": {
            "url": "ListarBalance",
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            { "data": "id" },
            { "data": "txtNombre" },
            { "data": "txtBalance" },
            //$.fn.dataTable.render.number( ',', '.', 2) 

        ],

        "language": {
            decimal: ',',
            thousands: '.',
        },


        "columnDefs": [
            /*            {
                        targets: [4],
                        render: $.fn.dataTable.render.moment('YYYY-MM-DDTHH:mm:ss.SSS', 'DD/MM/YYYY HH:mm:ss'),
                    },*/
            {
                //targets: [5],
                //render: $.fn.dataTable.render.number(',', '.', 2, 'S/. '),
            },
            {
                "targets": [0, 2],
                "className": "text-center",
            }
        ],
        "order": [[0, 'desc']],

    });

    $("#btnDownloadExcel1").click(function () {
        window.location.href = "/Panel/CreateExcelTransacciones"; 
    });

    $("#btnDownloadExcel2").click(function () {
        window.location.href = "/Panel/CreateExcelBalance";
    });
});
