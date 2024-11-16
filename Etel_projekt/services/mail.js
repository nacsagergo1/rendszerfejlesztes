var nodemailer = require('nodemailer');
const pool = require('./db.js');

var transporter = nodemailer.createTransport({
  host: 'mail.projectgallery.hu',
  port: 465,                      
  secure: true,                
  auth: {
    user: 'noreply@projectgallery.hu',  
    pass: 'VpvUhR36YiGT'               
  }
  
  
});

function generateRandomInt() {
    const maxDigits = 10;
    let randomNumber = Math.floor(Math.random() * Math.pow(10, maxDigits)); 
    return randomNumber;
}

async function DoesExists(Code){
    
    const query = "SELECT COUNT(*) as count FROM `one_time_codes` WHERE Code = ?";
    
    try {
        const [rows] = await pool.query(query, [Code]);
        return rows[0].count > 0; 
    } catch (error) {
        throw error; 
    }
}

async function getUserViaEmail(address) {
    const query = "SELECT ID FROM users WHERE Email_Address = ?";
    
    try {
        const [rows] = await pool.query(query, [address]);
        if (rows.length > 0) {
            return rows[0].ID; 
        } else {
            throw new Error("Nincs ilyen User");
        }
    } catch (error) {
        throw error;
    }
}
async function MakeNewRecord(address,pass_reset){
    
    let code;
    try{
        do{
         code = generateRandomInt();
        }while(await DoesExists(code) );
        
        let now = new Date();
        let userid = await getUserViaEmail(address);
        const query = `INSERT INTO one_time_codes (Code, User_ID, Date, For_Password_Reset) VALUES (?,?,?,?)`;
        await pool.query(query,[code,userid,now,pass_reset]);
        
        return code;
    }catch(error){
        throw error
        
    }
    
}

async function SendValidationEmail(address) {
    let code;
    try{
    code = await MakeNewRecord(address,0);
    }catch(error){throw error;}
    
  var mailOptions = {
    from: 'noreply@projectgallery.hu',
    to: address,
    subject: 'Fiok aktiválás',
    text: 'Aktiválja fiokját valahol itt: '+code
  };

  transporter.sendMail(mailOptions, function(error, info) {
    if (error) {
      throw error;
    } else {
      console.log('Email sent: ' + info.response);
    }
  });
}

async function SendPasswordReset(address) {
    let code;
    try{
    code = await MakeNewRecord(address,1);
    }catch(error){throw error;}
    
  var mailOptions = {
    from: 'noreply@projectgallery.hu',
    to: address,
    subject: 'Új jelszó',
    text: 'Új jesztó beállításáért kérem látogassa meg az alábbi oldalt: '+code
  };

  transporter.sendMail(mailOptions, function(error, info) {
    if (error) {
      throw error;
    } else {
      console.log('Email sent: ' + info.response);
    }
  });
}



module.exports = { SendValidationEmail,SendPasswordReset };
