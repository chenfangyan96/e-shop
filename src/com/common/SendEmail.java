package com.common;

import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

public class SendEmail {
	public static final String HOST = "smtp.qq.com";
	public static final String PROTOCOL = "smtp";
	public static final String FROM = "825222912@qq.com";// 发件人的email
	public static final String PWD = "tcmwmyrwytenbfjj";// 发件人授权码

	private static Session getSession() throws GeneralSecurityException, MessagingException {
		Properties props = new Properties();
//		props.setProperty("mail.debug", "true"); // 开启debug调试
		// 设置邮件服务器主机名
		props.setProperty("mail.host", HOST);
		// 发送服务器需要身份验证
		props.setProperty("mail.smtp.auth", "true");
		// 发送邮件协议名称
		props.setProperty("mail.transport.protocol", PROTOCOL);

		// 开启SSL加密，否则会失败
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.socketFactory", sf);

		// 创建session
		Session session = Session.getInstance(props);

		return session;
	}

	public static boolean send(String toEmail, String content) throws GeneralSecurityException, MessagingException {
		Session session = getSession();
		// 通过session得到transport对象
		Transport ts = session.getTransport();
		// 连接邮件服务器：邮箱类型，帐号，授权码代替密码（更安全）
		ts.connect(HOST, FROM, PWD);// 后面的字符是授权码
		try {
			Message msg = new MimeMessage(session);
			// 设置发件人
			msg.setFrom(new InternetAddress(FROM));
			// 设置收件人
			msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(FROM));
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			// 设置头信息
			msg.setSubject("账号激活邮件");
			msg.setSentDate(new Date());
			msg.setContent(content, "text/html;charset=utf-8");
			// Send the message
			// 发送邮件
			ts.sendMessage(msg, msg.getAllRecipients());
			ts.close();
			return true;
		} catch (MessagingException mex) {
			mex.printStackTrace();
			return false;
		}
	}
}
