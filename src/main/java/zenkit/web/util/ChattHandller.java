package zenkit.web.util;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component("chatHandler")
public class ChattHandller extends TextWebSocketHandler{
	// 접속한 사용자들에 대한 정보를 저장하는 전역변수
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionEstablished(session);
		log(session.getId()+"님 접속합니다.");
		// 접속한 id와 session을 누적 처리;
		users.put(session.getId(), session);
	}
	// 메세지를 보낼때 :
		// 1) 접속한 사용자 중에서 메세지를 보낼 때(메세지 수신)
		// 2) 접속한 사용자들에게 메세지를 전송(메세지 발송)
		// 접속한 사용자를 전역변수로 선언하여 할당 처리..
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		super.handleTextMessage(session, message);
		System.out.println(session.getId()+"가 보낸 메세지:"+message.getPayload());
		for(WebSocketSession ws : users.values()) {
			ws.sendMessage(message);
			log(ws.getId()+"에게 메세지 전송");
		}
	}
	
	// 접속 종료 후
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		log(session.getId() + "접속을 종료합니다.");
		users.remove(session.getId()); //접속한 사용자에서 제외 처리.
	}
	
	// 예외 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		super.handleTransportError(session, exception);
		log(session.getId() + "사용자 에러 발생" + exception.getMessage());
	}
	
	// 시간표시 로그 처리
	private void log(String msg) {
		System.out.println(new Date() + ":" + msg);
	}
	
}
