const db = require('../config/db');

class FoodDAO{

    async getFoodsByCategory(category) {
        try{
            const [categoryFoods] = await db.query('SELECT * FROM food WHERE Category = ?', [category]);
            return categoryFoods;
        } catch (error) {
            console.log("Hiba az ételek kategória szerinti lekérdezésekor.", error);
            return null;
        }
        
    }

    async getImagePath(foodId){
        try{
            const [result] = await db.query('SELECT Image_path FROM food WHERE ID = ?', [foodId]);
            return result[0].Image_path;
        } catch (error){
            console.log("Hiba a kép keresése során: ", error);
        }
    }

    async deleteFood(foodId){
        try{
            console.log("deleteFoodDao: eléri a dao-t");
            const [result] = await db.query('DELETE FROM food WHERE ID = ?', [foodId]);

            if(result && result.affectedRows === 1){
                console.log("deleteFoodDao: sikeres törlés");
                return true;
            } else {
                console.log("deleteFoodDao: nem törölte");
                return false;
            }
        } catch (error){
            console.log("deleteFoodDao: Hiba az étel törlésekor: ", error);
            return false;
        }
    }

    async deleteFoodFromMenu(foodID) {
        try{
            console.log("deleteFoodMenuDao: eléri a dao-t");
            const [result] = await db.query('DELETE FROM food_menus WHERE Food_ID = ?', [foodID]);

            if(result){
                console.log("deleteFoodMenuDao: sikeres törlés");
                return true;
            } else {
                console.log("deleteFoodMenuDao: nem törölte");
                return false;
            }
        } catch (error){
            console.log("Hiba a törléskor: ", error);
            return false;
        }
    }

    async createFood(name, description, category, price, image_path){
            try{
                console.log('foodDao: eljut az insertig az új kaja');
                const [result] = await db.query('INSERT INTO food (Name, Description, Category, Price, Image_path) VALUES (?,?,?,?,?)', [name, description, category, price, image_path]);
                console.log('Insert food result:', result);
                if(result && result.affectedRows === 1){
                    console.log('foodDao: létre hozta a kaját');
                    return true;
                } else {
                    console.log('foodDao: nem hozta létre a kaját');
                    return false;
                }
            } catch (error){
                console.log('foodDao: hiba az étel hozzáadásakor');
                console.log("Hiba az étel mentésekor: ", error);
                return false;
            }
    }

    async getMenus(){

        console.log('Eljut a getMenus-be');
        
        try{
            const [rows] = await db.query(`SELECT m.ID AS menu_id, m.Name AS menu_name, m.Active_From AS menu_from, m.Active_Until AS menu_until, f.ID AS food_id, f.Name AS food_name
                                            FROM menus m
                                            LEFT JOIN food_menus fm ON m.ID = fm.Menu_ID
                                            LEFT JOIN food f ON fm.Food_ID = f.ID
                                            ORDER BY m.ID, f.ID;`);

            console.log("Menu lekérdezés eredmény: ", rows);

            if(rows){
                const menus = {};

                rows.forEach(row => {
                    const menuID = row.menu_id;

                    if(!menus[menuID]){
                        menus[menuID] = {
                            menu_id: menuID,
                            name: row.menu_name,
                            active_from: row.menu_from,
                            active_until: row.menu_until,
                            foods: []
                        };
                    }

                    if(row.food_id){
                        menus[menuID].foods.push({
                            food_id: row.food_id,
                            name: row.food_name,
                        });
                    }
                });
                console.log("Menük lekérdezése sikeres");
                return Object.values(menus);

            } else {
                console.log("Hiba a menük lekérdezésekor.");
                return null;
            }
        } catch (error){
            console.log("Hiba a menük lekérdezésekor: ", error);
        }
                        
    }

};

module.exports = new FoodDAO();