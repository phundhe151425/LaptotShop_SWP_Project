/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author DUC THINH
 */
public class SendMailRegister {
    private static final String alpha = "abcdefjhijklmnopqrstuvwxyz";
    private static final String alphaUpperCase = alpha.toUpperCase();
    private static final String digits = "0123456789";
    private static final String ALPHA_NUMERIC= alpha + alphaUpperCase + digits;
    
    private static Random generator = new Random();
    
    public static int randomNumber(int min,int max){
        return generator.nextInt((max-min+1)+min);
    }
    
    public String randomAlphaNumeric(int numOfChar){
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < numOfChar; i++) {
            int number = randomNumber(0, ALPHA_NUMERIC.length()-1);
            char ch = ALPHA_NUMERIC.charAt(number);
            sb.append(ch);   
        }
        return sb.toString();
    }
    
    private String user = "ndt97hy@gmail.com";
    private String pass = "ucajdrjcjnpkhqbu";

    public String getUser() {
        return user;
    }

    public String getPass() {
        return pass;
    }

    public SendMailRegister() {
    }
    
     public static void send(String to, String sub, String msg,
             final String user, final String pass){
         Properties props = new Properties();
         props.put("mail.smtp.host", "smtp.gmail.com");
         props.put("mail.smtp.port", "587");
         props.put("mail.smtp.auth", "true");
         props.put("mail.smtp.starttls.enable", "true");
         
         Session session = Session.getInstance(props, new javax.mail.Authenticator(){
             @Override
             protected PasswordAuthentication getPasswordAuthentication(){
                 return new PasswordAuthentication(user, pass);
             }
         });
         try{
             MimeMessage message = new MimeMessage(session);
             message.setFrom(new InternetAddress(user));
             message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
             message.setSubject(sub);
             message.setContent(msg, "text/html");
             Transport.send(message);
             
         }catch(MessagingException ex){
             System.out.println(ex);
         }
     }
    
}
