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

    async reserveTables(numberOfSpaces, unformedDate, user, onlytable = false) {
        const formedDate = this.formDate(unformedDate);
        const reservationData = await this.calculateTables(numberOfSpaces, unformedDate);
        const User_ID = user.id;

        console.log(reservationData);
    
        if (!reservationData || reservationData.length === 0) {
            console.error("No available tables for reservation");
            return false;
        }
    
        const reservationSuccess = await reservationDAO.createReservation(User_ID, formedDate, numberOfSpaces, false, reservationData, onlytable = false);
        return reservationSuccess;
    }

    async modifyReservation(numberOfPerson, unformedDate, reservationID)
    {
        const resTables = await reservationDAO.getTablesFromReservation(reservationID);
        const totalCapacity = await resTables.reduce((sum, table) => sum + table.Capacity, 0);

        const realPerson = numberOfPerson - totalCapacity;

        const reservation = await reservationDAO.getFreeTables(reservationID);
        const formedDate = this.formDate(unformedDate);

        if(reservation.length === 0){
            return false;
        }

        if(realPerson > 0){
            const reservationDataAllNew = await this.calculateTables(numberOfPerson, unformedDate);
            let reservationDataAdd = null;
            if(reservation[0].Reservation_Date === formedDate){
                reservationDataAdd = await this.calculateTables(realPerson, unformedDate);
            }

            if(reservation[0].Reservation_Date === formedDate && reservationDataAdd.length < reservationDataAllNew){
                const succeedAddTables = await reservationDAO.addTableToReservation(reservationID,reservationDataAdd);
                if(!succeedAddTables){
                    return false;
                }
            }else{
                const succeedDelete = await reservationDAO.deleteTablesFromReservation(reservationID, resTables);
                if(!succeedDelete){
                    return false;
                }
                const succeedAddTables = await reservationDAO.addTableToReservation(reservationID,reservationDataAllNew);
                if(!succeedAddTables){
                    return false;
                }
            }
        }else if(realPerson > 0){
            const sortedTables = resTables.sort((a, b) => a.Capacity - b.Capacity);
            let remainingPlaces = totalCapacity - numberOfPerson;
            const tablesToRemove = [];

            for (let table of sortedTables) {
                if(remainingPlaces <= table.Capacity && remainingPlaces > 0){
                    tablesToRemove.push(table.ID);
                    remainingPlaces -= table.Capacity;
                }

                if (remainingPlaces <= 0) {
                    break;
                }
            }
            const succeedDelete = await reservationDAO.deleteTablesFromReservation(reservationID, tablesToRemove);
            if(!succeedDelete){
                return false;
            }
        }

        const succeedUpdate = await reservationDAO.updateReservation(reservationID, formedDate, numberOfPerson);
        if(!succeedUpdate){
            return false;
        }
        
    }

    async listReservation(user)
    {
        const reservationList = await reservationDAO.listReservation(user);
        return reservationList;
    }

    async deleteReservation(reservationID)
    {
        const deleteSucceed = await reservationDAO.deleteReservation(reservationID);
        return deleteSucceed;
    }

}

module.exports = ReservationController;