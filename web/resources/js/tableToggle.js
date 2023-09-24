/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
// Проверяем, есть ли сохраненное состояние в localStorage
var tableStates = localStorage.getItem('tableStates');
if (tableStates) {
    tableStates = JSON.parse(tableStates);
} else {
    // Если состояния нет, устанавливаем начальное состояние
    tableStates = {
        usersTable: false,
        housesTable: false
    };
}

function toggleTable(tableId) {
    var table = document.getElementById(tableId);

    // Прячем все таблицы перед отображением выбранной
    for (var key in tableStates) {
        if (key !== tableId) {
            var otherTable = document.getElementById(key);
            otherTable.style.display = "none";
            tableStates[key] = false;
        }
    }

    if (tableStates[tableId]) {
        table.style.display = "none";
        tableStates[tableId] = false;
    } else {
        table.style.display = "table";
        tableStates[tableId] = true;
    }

    // Сохраняем обновленное состояние в localStorage
    localStorage.setItem('tableStates', JSON.stringify(tableStates));
}

// Вызываем функцию для восстановления состояния при загрузке страницы
window.addEventListener('load', function() {
    for (var tableId in tableStates) {
        if (tableStates[tableId]) {
            var table = document.getElementById(tableId);
            table.style.display = "table";
        }
    }
});


