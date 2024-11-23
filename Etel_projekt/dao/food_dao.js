const db = require('../config/db');

class FoodDAO{

    async getFoods(){
        //TODO
    }

    async getFoodsByCategory(category) {
        //TODO
    }

    async deleteFood(foodId){
        //TODO
    }

    async deleteFoodFromMenu(foodID) {
        //TODO
    }

    async createFood(name, description, category, price, image_path){
        //TODO
    }

    async getMenus(){
        //TODO
    }

};

module.exports = FoodDAO;