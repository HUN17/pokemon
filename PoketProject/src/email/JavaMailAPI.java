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
	
String to = email; 				//hyunna7044@naver.com �޴»��
String from = "sisth3team2test@gmail.com";	//�����»��
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
  message.setSubject("����� ����Ʈ �����Դϴ�.");
  message.setText("�ȳ��ϼ���? ����� �̿����ּż� �����մϴ�.\n"
		  			+"���忡�� ���� ��ȣ�� �����帮�� ����Ͻø� �˴ϴ�.\n"
		  			+ "���� ��ȣ: SI"+((int)(Math.random()*10000)+1)+"ST");
  // Send message
  Transport.send(message);

  System.out.println("�޼����� ���������� ���������ϴ�.");

     } catch (MessagingException e) {
        throw new RuntimeException(e);
     }
  
}

/*public static void main(String[] args){
new JavaMailAPI();
}*/

}
