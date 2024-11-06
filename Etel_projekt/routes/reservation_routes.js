const express = require("express");
const router = express.Router();
const ReservationController = require('./config/reservationController');
const resCont = new ReservationController();

router.get('/free-space', async (req, res) => {
    if (!req.session.user) {
        return res.redirect('/login');
    }

    const unformedDate = req.query.date; // free-space?date=2024-11-06

    try {
        const freeSpaces = await resCont.getFreeSpaceNumber(unformedDate);
        res.render('free-space', { freeSpaces });
    } catch (error) {
        res.status(500).send('Error occurred');
    }
});

router.post('/reserve', async (req, res) => {
    if (!req.session.user) {
        return res.redirect('/login');
    }

    const { numberOfSpaces, unformedDate } = req.body;

    try {
        const reservationSuccess = await resCont.reserveTables(numberOfSpaces, unformedDate);
        
        if (reservationSuccess) {
            res.render('reservation-success');
        } else {
            res.render('reservation-failed', { error: 'Nincs elérhető asztal a kívánt időpontban!' });
        }
    } catch (error) {
        console.error("Hiba történt a foglalás során:", error);
        res.status(500).send('Hiba történt a foglalás során');
    }
});

module.exports = router;
