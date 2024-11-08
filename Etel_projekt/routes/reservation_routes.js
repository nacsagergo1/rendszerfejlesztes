const express = require("express");
const router = express.Router();
const ReservationController = require('../config/reservationController');
const resCont = new ReservationController();
const moment = require('moment');

router.get('/free-space', async (req, res) => {
    if (!req.session.user) {
        return res.redirect('/login');
    }

    const selectedDateInput = req.query.date;
    const selectedDate = moment(selectedDateInput).startOf('day');
    const start = selectedDate.clone().hour(10); // 10:00
    const end = selectedDate.clone().hour(20); // 20:00

    let freeSpaces = [];

    try {
        // Félóránkénti időpontok generálása
        for (let time = start; time.isBefore(end); time.add(30, 'minutes')) {
            const unformedDate = time.toDate(); // Átalakítjuk Date objektummá

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

    const user = req.session.user; // free-space?date=2024-11-06

    try {
        const reservations = await resCont.listReservation(user);
        res.json({ reservations });
    } catch (error) {
        res.status(500).send('Error occurred');
    }
});

router.post('/deleteReservation', async (req, res) => {
    if (!req.session.user) {
        return res.redirect('/login');
    }

    const reservationID = req.query.resID;

    try {
        const deleteSuccess = await deleteReservation(reservationID); 

        if (deleteSuccess) {
            res.json({ success: true });
        } else {
            res.json({ success: false, error: 'Cant find reservation' });
        }
    } catch (error) {
        console.error("An error occured during deletion of reservation", error);
        res.status(500).json({ success: false, error: 'An error occured during deletion of reservation' });
    }
});

router.post('/reserve', async (req, res) => {
    if (!req.session.user) {
        return res.redirect('/login');
    }

    const { numberOfSpaces, unformedDate } = req.body;

    try {
        const reservationSuccess = await resCont.reserveTables(numberOfSpaces, unformedDate, req.session.user);
        
        if (reservationSuccess) {
            res.render('reservation-success'); //TODO: a hiba jelzését visszaküldeni, módját meghatározni: jelenleg ez oldalra irányít
        } else {
            res.render('reservation-failed', { error: 'Nincs elérhető asztal a kívánt időpontban!' });
        }
    } catch (error) {
        console.error("Hiba történt a foglalás során:", error);
        res.status(500).send('Hiba történt a foglalás során');
    }
});

router.post('/modify-reservation', async (req, res) => {
    if (!req.session.user) {
        return res.redirect('/login'); 
    }

    const { numberOfPerson, unformedDate, reservationID } = req.body;

    try {
        const modificationSuccess = await resCont.modifyReservation(numberOfPerson, unformedDate, reservationID);

        if (modificationSuccess) {
            res.render('reservation-success');
        } else {
            res.render('reservation-failed', { error: 'Nem sikerült a foglalás módosítása. Kérjük, próbálja meg újra!' });
        }
    } catch (error) {
        console.error("Hiba történt a foglalás módosítása során:", error);
        res.status(500).send('Hiba történt a foglalás módosítása során');
    }
});

module.exports = router;
