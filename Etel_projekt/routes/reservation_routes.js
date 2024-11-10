const express = require("express");
const router = express.Router();
const ReservationController = require('../config/reservationController');
const resCont = new ReservationController();

router.get('/free-space', async (req, res) => {
    if (!req.session.user) {
        return res.redirect('/login');
    }

    const selectedDateInput = req.query.date;
    const selectedDate = new Date(selectedDateInput); // Az inputból Date objektumot hozunk létre
    selectedDate.setHours(0, 0, 0, 0); // A nap kezdetére állítjuk (00:00:00)

    const start = new Date(selectedDate); // 10:00
    start.setHours(10, 0, 0, 0);

    const end = new Date(selectedDate); // 20:00
    end.setHours(20, 0, 0, 0);

    let freeSpaces = [];

    try {
        // Félóránkénti időpontok generálása
        for (let time = new Date(start); time < end; time.setMinutes(time.getMinutes() + 30)) {
            const unformedDate = new Date(time); // Átalakítjuk Date objektummá

            // Továbbadjuk a Date objektumot a getFreeSpaceNumber funkciónak
            const freeSpace = await resCont.getFreeSpaceNumber(unformedDate);
            freeSpaces.push(freeSpace);
        }

        res.json({ freeSpaces }); // JSON válasz
    } catch (error) {
        res.status(500).json({ error: 'Error occurred' }); // Ha hiba van, JSON válasz hibával
    }
});

router.get('/list-reservations', async (req, res) => {
    if (!req.session.user) {
        return res.redirect('/login');
    }

    const user = req.session.user;

    try {
        const reservations = await resCont.listReservation(user);

        // A pontos jelenlegi dátum és idő meghatározása
        const now = Date.now();

        // Jövőbeli foglalások szűrése
        const futureReservations = reservations.filter(reservation => new Date(reservation.Reservation_Date).getTime() >= now);
        const pastReservations = reservations.filter(reservation => new Date(reservation.Reservation_Date).getTime() < now);

        // A jövőbeli foglalások hozzárendelése a user objektum bookings mezőjéhez
        user.bookings = futureReservations;
        user.pastBookings = pastReservations;


        // Válasz küldése JSON formában
        res.json({ user });
    } catch (error) {
        res.status(500).send('Error occurred');
    }
});

router.post('/deleteReservation', async (req, res) => {
    if (!req.session.user) {
        return res.redirect('/login');
    }

    const reservationID = req.body.resID;

    try {
        console.log("ID:" + reservationID);
        const deleteSuccess = await resCont.deleteReservation(reservationID); 

        if (deleteSuccess) {
            res.json({ success: true });
        } else {
            res.json({ success: false, error: 'Cant find reservation' });
        }
    } catch (error) {
        console.error("An error occurred during deletion of reservation", error);
        res.status(500).json({ success: false, error: 'An error occurred during deletion of reservation' });
    }
});

router.post('/reserve', async (req, res) => {
    if (!req.session.user) {
        return res.status(401).json({ success: false, message: 'Bejelentkezés szükséges.' });
    }

    let { numberOfSpaces, unformedDate } = req.body;
    unformedDate = new Date(unformedDate);

    try {
        const reservationSuccess = await resCont.reserveTables(numberOfSpaces, unformedDate, req.session.user);
        
        if (reservationSuccess) {
            return res.json({ success: true });
        } else {
            return res.json({ success: false, error: 'Nincs elérhető asztal a kívánt időpontban!' });
        }
    } catch (error) {
        console.error("Hiba történt a foglalás során:", error);
        res.status(500).json({ success: false, error: 'Hiba történt a foglalás során' });
    }
});

router.post('/modify-reservation', async (req, res) => {
    if (!req.session.user) {
        return res.redirect('/login');
    }

    const { numberOfPerson, unformedDate, reservationID } = req.body;
    
    const reservationDate = new Date(unformedDate); 
    console.log('Modosított dátum:', reservationDate);

    try {
        const modificationSuccess = await resCont.modifyReservation(numberOfPerson, reservationDate, reservationID);

        if (modificationSuccess) {
            res.json({ success: true }); // Sikeres módosítás
        } else {
            res.json({ success: false, error: 'Nem sikerült a foglalás módosítása. Kérjük, próbálja meg újra!' });
        }
    } catch (error) {
        console.error("Hiba történt a foglalás módosítása során:", error);
        res.status(500).send('Hiba történt a foglalás módosítása során');
    }
});

module.exports = router;
