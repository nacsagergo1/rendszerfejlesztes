/*Example:
  const cont = require('./config/reservationController');
  resCont = new cont();
  const dateTest = new Date(2024, 10, 3, 18, 0, 0);
  resCont.getFreeSpaceNumber(dateTest);
*/

const reservationsDAOimp = require('../dao/reservation_dao');

const reservationDAO = new reservationsDAOimp();

class ReservationController{

    constructor() {}
    
    formDate(unformedDate){
        const year = unformedDate.getFullYear();
        const month = String(unformedDate.getMonth() + 1).padStart(2, '0');
        const day = String(unformedDate.getDate()).padStart(2, '0');
        const hours = String(unformedDate.getHours()).padStart(2, '0');
        const minutes = String(unformedDate.getMinutes()).padStart(2, '0');
        const seconds = String(unformedDate.getSeconds()).padStart(2, '0');

        return`${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    }

    async getFreeSpaces(unformedDate){
        const formedDate = this.formDate(unformedDate);
        const freeTables = await reservationDAO.getFreeTables(formedDate);
        const totalCapacity = await freeTables.reduce((sum, table) => sum + table.Capacity, 0);
        return totalCapacity;
    }

    async getFreeSpaceNumber(unformedDate) {
        try {
            const totalCapacity = await this.getFreeSpaces(unformedDate);
            console.log(totalCapacity);
            return totalCapacity;
        } catch (error) {
            console.error('Hiba történt:', error);
        }
    }
}

module.exports = ReservationController;