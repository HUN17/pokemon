package email;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import com.sist.user.*;

public class JavaMailAPI {
public JavaMailAPI(String email){
	
String to = email; 				//hyunna7044@naver.com 받는사람
String from = "sisth3team2test@gmail.com";	//보내는사람
final String username = "sisth3team2test@gmail.com";// your mail
final String password = "sisth3team2"; // your password
String host = "smtp.gmail.com";

Properties props = new Properties();
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.host", host);
props.put("mail.smtp.port", "587");
Session session = Session.getInstance(props,
        new javax.mail.Authenticator() {
           protected PasswordAuthentication getPasswordAuthentication() {
              return new PasswordAuthentication(username, password);
  }
});
try {
  Message message = new MimeMessage(session);
  message.setFrom(new InternetAddress(from));
  message.setRecipients(Message.RecipientType.TO,
              InternetAddress.parse(to));
  message.setSubject("포사모 포인트 쿠폰입니다.");
  message.setText("안녕하세요? 포사모를 이용해주셔서 감사합니다.\n"
		  			+"매장에서 쿠폰 번호를 보여드리고 사용하시면 됩니다.\n"
		  			+ "쿠폰 번호: SI"+((int)(Math.random()*10000)+1)+"ST");
  // Send message
  Transport.send(message);

  System.out.println("메세지가 성공적으로 보내졌습니다.");

     } catch (MessagingException e) {
        throw new RuntimeException(e);
     }
  
}

/*public static void main(String[] args){
new JavaMailAPI();
}*/

}
