const nodemailer = require('nodemailer');


var transporter = nodemailer.createTransport({
  host: 'mail.projectgallery.hu',
  port: 465,                      
  secure: true,                
  auth: {
    user: 'noreply@projectgallery.hu',  
    pass: process.env.MailPass              
  }
  
  
});


async function sendEmail(to, subject, text) {
  const mailOptions = {
    from: 'noreply@projectgallery.hu',
    to: to,
    subject: subject,
    text: text
  };

  try {
    const info = await transporter.sendMail(mailOptions);
    console.log('Email sent: ' + info.response);
  } catch (error) {
    console.error('Error sending email:', error);
    throw error;
  }
}

module.exports = { sendEmail };
