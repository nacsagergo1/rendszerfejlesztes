document.addEventListener("DOMContentLoaded", function() {
    const calendarElement = document.getElementById("calendar");

    const maxTablesPerDay = 10; // Maximális asztalszám egy napra

    function generateRandomReservations() {
        let events = [];
        for (let day = 1; day <= 30; day++) {
            const date = moment().startOf('month').add(day - 1, 'days');
            const tablesBooked = Math.floor(Math.random() * maxTablesPerDay);
            const tablesAvailable = maxTablesPerDay - tablesBooked;

            events.push({
                title: `Szabad: ${tablesAvailable}, Foglalt: ${tablesBooked}`,
                start: date.format("YYYY-MM-DD"),
                color: tablesAvailable > 0 ? 'green' : 'red',
                extendedProps: {
                    tablesAvailable: tablesAvailable,
                    tablesBooked: tablesBooked
                }
            });
        }
        return events;
    }

    const calendar = new FullCalendar.Calendar(calendarElement, {
        initialView: 'dayGridMonth',
        locale: 'hu',
        events: generateRandomReservations(),
        eventClick: function(info) {
            const { tablesAvailable, tablesBooked } = info.event.extendedProps;
            alert(`Ezen a napon ${tablesAvailable} szabad és ${tablesBooked} foglalt asztal van.`);
        }
    });

    calendar.render();
});
