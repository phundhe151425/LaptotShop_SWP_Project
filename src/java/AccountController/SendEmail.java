/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AccountController;

import static controller.SendMailRegister.randomNumber;
import static java.awt.Color.red;
import java.text.NumberFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
import java.util.Random;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Account;
import model.Cart;
import model.OrderDetail;

/**
 *
 * @author MSI
 */
public class SendEmail {

    private static final String alpha = "abcdefjhijklmnopqrstuvwxyz";
    private static final String alphaUpperCase = alpha.toUpperCase();
    private static final String digits = "0123456789";
    private static final String ALPHA_NUMERIC = alpha + alphaUpperCase + digits;

    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    public String randomAlphaNumeric(int numOfChar) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < numOfChar; i++) {
            int number = randomNumber(0, ALPHA_NUMERIC.length() - 1);
            char ch = ALPHA_NUMERIC.charAt(number);
            sb.append(ch);
        }
        return sb.toString();
    }

    //send email to the user email
    public boolean sendResetPass(Account a, String pass) {

        boolean test = false;

        String toEmail = a.getEmail();
        String fromEmail = "phunguyen06072001@gmail.com";
        String password = "sgepfdmvyltodmvo";

        //create an instance of Properties Class   
        Properties prop = new Properties();

        /* Specifies the IP address of your default mail server
     	   for e.g if you are using gmail server as an email sever
           you will pass smtp.gmail.com as value of mail.smtp host. 
           As shown here in the code. 
           Change accordingly, if your email id is not a gmail id
         */
//        prop.put("mail.smtp.host", "smtp.gmail.com");
//        prop.put("mail.smtp.port", "587");
//        prop.put("mail.smtp.auth", "true");
//        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");

//        prop.setProperty("mail.smtp.host", "smtp.mail.com");
//        prop.setProperty("mail.smtp.port", "587");
//        prop.setProperty("mail.smtp.auth", "true");
//        prop.setProperty("mail.smtp.starttls.enable", "true");
//        prop.put("mail.smtp.socketFactory.port", "587");
//        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        /* Pass Properties object(props) and Authenticator object   
           for authentication to Session instance 
         */
        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {

            /* Create an instance of MimeMessage, 
 	      it accept MIME types and headers 
             */
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("Request to reset password");
            message.setSentDate(new Date());
//            message.setText("Hi "+a.getName()+",\n\n"
//                    + "This message is in response to your request to reset your account password.\n\n"
//                    + "Your password: <font color=red>" + pass +"</font>\n\n"
//                    + "Thanks,\n"
//                    + "Ngu team");
            String mess = "Hi <b>" + a.getName() + "</b>,<br><br>"
                    + "This message is in response to your request to reset your account password.<br><br>"
                    + "Your password: <b><font color=green>" + pass + "</font></b><br><br>"
                    + "Login at this link: http://localhost:40180/OnlineShop/login <br>"
                    + "Change Password at this link: http://localhost:40180/OnlineShop/changepass <br><br>"
                    + "Best Regard!"
                    + "<br>"
                    + "<font color=blue>Laptot team</font>";
            message.setContent(mess, "text/html");

            /* Transport class is used to deliver the message to the recipients */
            Transport.send(message);

            test = true;

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return test;
    }

    public boolean sendCartCompletion(Account a, int orderID, String toEmail, String name, String phone,
            String address, List<OrderDetail> list) {

        boolean test = false;

        String fromEmail = "phunguyen06072001@gmail.com";
        String password = "sgepfdmvyltodmvo";

        //create an instance of Properties Class   
        Properties prop = new Properties();

        /* Specifies the IP address of your default mail server
     	   for e.g if you are using gmail server as an email sever
           you will pass smtp.gmail.com as value of mail.smtp host. 
           As shown here in the code. 
           Change accordingly, if your email id is not a gmail id
         */
//        prop.put("mail.smtp.host", "smtp.gmail.com");
//        prop.put("mail.smtp.port", "587");
//        prop.put("mail.smtp.auth", "true");
//        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");

//        prop.setProperty("mail.smtp.host", "smtp.mail.com");
//        prop.setProperty("mail.smtp.port", "587");
//        prop.setProperty("mail.smtp.auth", "true");
//        prop.setProperty("mail.smtp.starttls.enable", "true");
//        prop.put("mail.smtp.socketFactory.port", "587");
//        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        /* Pass Properties object(props) and Authenticator object   
           for authentication to Session instance 
         */
        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {

            /* Create an instance of MimeMessage, 
 	      it accept MIME types and headers 
             */
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("Confirm Invoice Information");
            message.setSentDate(new Date());
//            message.setText("Hi "+a.getName()+",\n\n"
//                    + "This message is in response to your request to reset your account password.\n\n"
//                    + "Your password: <font color=red>" + pass +"</font>\n\n"
//                    + "Thanks,\n"
//                    + "Ngu team");
            String mess = "Hi <b>" + a.getName() + "</b>,"
                    + "<br><br>"
                    + "Thank you for ordering at <b>Laptot</b>!"
                    + "<br>"
                    + "Your order has been received, we will contact you."
                    + "<br><br>"
                    + "<b>Invoice information:</b>"
                    + "<br><br>"
                    + "Your Order ID: " + orderID
                    + "<br>Name: " + name
                    + "<br>Phone: " + phone
                    + "<br>Address: " + address
                    + "<br><br><br>";

            Locale localeVN = new Locale("vi", "VN");
            NumberFormat vn = NumberFormat.getInstance(localeVN);

            for (OrderDetail o : list) {

                String priceFormat = vn.format(o.getPrice());
                mess += "Product Name: " + o.getNameProduct() + "<br>"
                        + "Price: " + priceFormat + " VND<br>"
                        + "Quantity: " + o.getQuantity() + "<br>"
                        + "<img style=\"width: 200px; height: 200px\" src=\"" + o.getImgURL() + "\" >"
                        + "<br>";

            }
            mess += "Best Regard!"
                    + "<br>"
                    + "<font color=blue>Laptot team</font>";
            message.setContent(mess, "text/html");


            /* Transport class is used to deliver the message to the recipients */
            Transport.send(message);

            test = true;

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return test;
    }

    public static void main(String[] args) {
//        SendEmail send = new SendEmail();
//        System.out.println(send.sendResetPass("phundhe151425@fpt.edu.vn", "sdfasdf"));
    }

}
