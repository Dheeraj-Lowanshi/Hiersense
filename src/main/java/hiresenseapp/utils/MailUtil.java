package hiresenseapp.utils;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {
   public static void sendTextEmail(String recepientEmailId,String subject,String body)throws MessagingException{
	   Session sess=MailConfig.getSession();
	   Message message=new MimeMessage(sess);
	   InternetAddress []addr=InternetAddress.parse(recepientEmailId);
	   message.setRecipients(Message.RecipientType.TO, addr);
       message.setSubject(subject);
       message.setText(body);
       Transport.send(message);   
	   
   }
}
