const { createOneTimeCode } = require('../dao/oneTimeCode_dao'); 
const UserDAO = require('../dao/user_dao'); 
const { sendEmail } = require('../config/emailConfig'); 


async function sendValidationEmail(email) {
  try {
    const userId = await new UserDAO().getUserByEmail(email); 
    const code = await createOneTimeCode(userId); 
    const validationUrl = `https://projectgallery.hu/validate?code=${code}`;
    
    const subject = 'Fiok aktiválás';
    const text = `A fiokját aktiválhatja valahol itt: ${validationUrl}`;
    
    await sendEmail(email, subject, text); 
  } catch (error) {
    console.error('Error in sending validation email:', error);
    throw error; 
  }
}


async function sendPasswordResetEmail(email) {
  try {
    const userId = await new UserDAO().getUserByEmail(email); 
    const code = await createOneTimeCode(userId); 
    const resetUrl = `https://projectgallery.hu/reset-password?code=${code}`;
    
    const subject = 'Elfelejtett jelszó';
    const text = `Ha új jelszót szeretne, kattintson a linkre: ${resetUrl}`;
    
    await sendEmail(email, subject, text); 
  } catch (error) {
    console.error('Error in sending password reset email:', error);
    throw error; 
  }
}

module.exports = { sendValidationEmail, sendPasswordResetEmail };
