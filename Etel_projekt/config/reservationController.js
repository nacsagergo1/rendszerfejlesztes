/*Example for Free places at date:
  const cont = require('./config/reservationController');
  resCont = new cont();
  const dateTest = new Date(2024, 10, 3, 18, 0, 0);
  resCont.getFreeSpaceNumber(dateTest);

Example: reservated tables at date:
  const cont = require('./config/reservationController');
  resCont = new cont();
  const dateTest = new Date(2024, 10, 3, 18, 0, 0);
  resCont.calculateTables(4,dateTest);

Example reserve:
  const cont = require('./config/reservationController');
  resCont = new cont();
  const dateTest = new Date(2024, 10, 3, 19, 0, 0);
  resCont.getFreeSpaceNumber(dateTest)
  resCont.reserveTables(12,dateTest);
*/

const reservationsDAOimp = require('../dao/reservation_dao');

const reservationDAO = new reservationsDAOimp();

class ReservationController{

    freeTables = null;

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

    //returns how many spaces free at date DO NOT USE it's the part of getFreeSpaceNumber function
    async getFreeSpaces(unformedDate){
        const formedDate = this.formDate(unformedDate);
        const freeTables = await reservationDAO.getFreeTables(formedDate);
        this.freeTables = freeTables;
        const totalCapacity = await freeTables.reduce((sum, table) => sum + table.Capacity, 0);
        return totalCapacity;
    }

    //returns how many spaces free at date
    async getFreeSpaceNumber(unformedDate) {
        try {
            const totalCapacity = await this.getFreeSpaces(unformedDate);
            console.log(totalCapacity);
            return totalCapacity;
        } catch (error) {
            console.error('Hiba történt:', error);
        }
    }

    async calculateTables(numberOfSpaces, unformedDate) {
        const numberOfFreeSpaces = await this.getFreeSpaceNumber(unformedDate);
        if (numberOfFreeSpaces < numberOfSpaces) {
            console.log("Returned with -1");
            return { Tables: [] };
        }
    
        if (!this.freeTables || this.freeTables.length === 0) {
            console.error("Nincsenek szabad asztalok.");
            return { Tables: [] };
        }
    
        const result = [[]];
    
        this.freeTables.forEach(table => {
            const newCombinations = result.map(subset => [...subset, table]);
            result.push(...newCombinations);
        });
    
        const allCombinations = result.slice(1);
    
        const resultCombinations = allCombinations.map(combination => {
            const totalCapacity = combination.reduce((sum, table) => sum + table.Capacity, 0);
            const tableNumbers = combination.map(table => table.Table_ID);
            
            return {
                Sum: totalCapacity,
                Tables: tableNumbers
            };
        });

        var diff = numberOfSpaces*-1*10;
        var choosenTables = [];
        resultCombinations.sort((a, b) => {
            if (a.Sum === b.Sum) {
                return a.Tables.length - b.Tables.length;
            }
            return a.Sum - b.Sum;
        });

        for (let i = 0; i < resultCombinations.length; i++) {
            const combination = resultCombinations[i];
            if(numberOfSpaces - combination.Sum > diff && numberOfSpaces - combination.Sum <= 0){
                diff = numberOfSpaces - combination.Sum;
                choosenTables = combination.Tables;
                if(diff == 0){
                    break;
                }
            }
        }

        console.log("Choosen tables:" + choosenTables);

        return choosenTables;
    }

    async reserveTables(numberOfSpaces, unformedDate) {
        const formedDate = this.formDate(unformedDate);
        const reservationData = await this.calculateTables(numberOfSpaces, unformedDate);
        const User_ID = 12;

        console.log(reservationData);
    
        if (!reservationData || reservationData.length === 0) {
            console.error("No available tables for reservation");
            return false;
        }
    
        const reservationSuccess = await reservationDAO.createReservation(User_ID, formedDate, numberOfSpaces, false, reservationData);
        return reservationSuccess;
    }

    async modifyPerson()
    {
        const resTables = await reservationDAO.getTablesFromReservation(formedDate);
        const totalCapacity = await resTables.reduce((sum, table) => sum + table.Capacity, 0);
        //A módosításnál asztal elvételről/ hozzáadásról döntés
    }
}

module.exports = ReservationController;