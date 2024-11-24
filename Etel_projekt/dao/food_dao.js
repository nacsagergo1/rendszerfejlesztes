const db = require('../config/db');

class FoodDAO{

    async getFoods(){
        try{
            const [foods] = await db.query('SELECT * FROM food');
            return foods;
        } catch (error){
            console.log("Hiba az ételek lekérdezésekor.", error);
            return null;
        }
    }

    async getFoodsByCategory(category) {
        try{
            const [categoryFoods] = await db.query('SELECT * FROM food WHERE Category = ?', [category]);
            return categoryFoods;
        } catch (error) {
            console.log("Hiba az ételek kategória szerinti lekérdezésekor.", error);
            return null;
        }
        
    }

    async deleteFood(foodId){
        try{
            const [result] = await db.query('DELETE FROM food WHERE ID = ?', [foodID]);

            if(result && result.affectedRows === 1){
                return true;
            } else {
                return false;
            }
        } catch (error){
            console.log("Hiba az étel törlésekor: ", error);
            return false;
        }
    }

    async deleteFoodFromMenu(foodID) {
        try{
            const [result] = await db.query('DELETE FROM food_menus WHERE Food_ID = ?', [foodID]);

            if(result){
                return true;
            } else {
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
        const query = `SELECT m.ID AS menu_id, m.Name AS menu_name, m.Active_From AS menu_from, m.Active_Until AS menu_until, 
                        f.ID AS food_id, f.Name AS food_name, f.Description AS food_description, f.Category AS food_category, f.Price AS food_price, f.Imge_path AS food_image
                        FROM menus m
                        LEFT JOIN food_menus fm ON m.ID = fm.Menu_ID
                        LEFT JOIN food f ON fm.Food_ID = f.ID
                        ORDER BY m.ID, f.ID;`;
        
        try{
            const [rows] = await db.query(query);

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
                            description: row.food_description,
                            category: row.food_category,
                            price: row.food_price,
                            image: row.food_image
                        });
                    }
                });

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