const pool = require('../config/db'); 


async function createOneTimeCode(userId) {
  const code = Math.floor(Math.random() * Math.pow(10,8)); 
  const query = `INSERT INTO one_time_codes (Code, User_ID, Date) VALUES (?, ?, NOW())`;
  
  try {
    await pool.query(query, [code, userId]); 
    return code; 
  } catch (error) {
    console.error('Error in creating one-time code:', error);
    throw error;
  }
}

async function findCode(code) {
  const query = "SELECT * FROM one_time_codes WHERE Code = ?";
  
  try {
    const [rows] = await pool.query(query, [code]);
    return rows[0] || null;
  } catch (error) {
    console.error('Error in finding code:', error);
    throw error;
  }
}


async function deleteCode(code) {
  const query = "DELETE FROM one_time_codes WHERE Code = ?";
  
  try {
    await pool.query(query, [code]);
  } catch (error) {
    console.error('Error in deleting code:', error);
    throw error;
  }
}



module.exports = {
  findCode,
  deleteCode,
  createOneTimeCode
};