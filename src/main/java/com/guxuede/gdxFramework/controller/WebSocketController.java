package com.guxuede.gdxFramework.controller;
//package com.guxuede.myca.controller;
//
//import java.io.IOException;
//import java.net.URLDecoder;
//import java.net.URLEncoder;
//import java.util.HashMap;
//import java.util.Map;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.http.server.ServerHttpRequest;
//import org.springframework.http.server.ServerHttpResponse;
//
//import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
//import org.springframework.util.Assert;
//import org.springframework.util.MultiValueMap;
//import org.springframework.util.StringUtils;
//import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
//import org.springframework.web.servlet.config.annotation.EnableWebMvc;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
//import org.springframework.web.socket.CloseStatus;
//import org.springframework.web.socket.TextMessage;
//import org.springframework.web.socket.WebSocketHandler;
//import org.springframework.web.socket.WebSocketSession;
//import org.springframework.web.socket.adapter.TextWebSocketHandlerAdapter;
//import org.springframework.web.socket.server.HandshakeInterceptor;
//import org.springframework.web.socket.server.config.EnableWebSocket;
//import org.springframework.web.socket.server.config.WebSocketConfigurer;
//import org.springframework.web.socket.server.config.WebSocketHandlerRegistry;
//import org.springframework.web.socket.server.support.WebSocketHttpRequestHandler;
//import org.springframework.web.socket.support.PerConnectionWebSocketHandler;
//import org.springframework.web.util.WebUtils;
//
//import com.guxuede.myca.entity.ChatSession;
//import com.guxuede.myca.entity.Room;
//import com.guxuede.myca.entity.User;
//import com.guxuede.myca.service.ChatService;
//import com.guxuede.myca.service.RobertService;
//import com.guxuede.myca.service.RoomService;
//import com.guxuede.myca.service.UserService;
//import com.guxuede.myca.util.EscapeUnescape;
//
//@Configuration
//@EnableWebSocket
//public class WebSocketController extends WebMvcConfigurerAdapter implements WebSocketConfigurer {
//
//	
//	@Override
//	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
//		registry.addHandler(echoWebSocketHandler(), "/socket.do").addInterceptors(handshakeInterceptor());
//		//registry.addHandler(echoWebSocketHandler(), "/sockjs/echo").withSockJS().setInterceptors(handshakeInterceptor()).setTaskScheduler(taskScheduler());
//	}
//
//	@Bean
//	public WebSocketHandler echoWebSocketHandler() {
//		return new TextWebSocketHandlerAdapter(){
//			private static final String USERKEY="com.socket_user";
//			
//			@Autowired
//			private UserService userService;
//			@Autowired
//			private ChatService chatService;
//			@Autowired
//			private RoomService roomService;
//			@Autowired
//			private RobertService robertService;
//			
//			@Override
//			protected void handleTextMessage(WebSocketSession session,TextMessage message) throws Exception {
//				ChatSession cs=(ChatSession) session.getHandshakeAttributes().get(USERKEY);
//				if(robertService.robertCanResponse(message.getPayload())){
//					robertService.robertDo(cs, message.getPayload());
//				}else{
//					chatService.userSpeack(cs, message.getPayload());
//				}
//			}
//			@Override
//			public void afterConnectionEstablished(WebSocketSession session)throws Exception {
//				Map<String,Object> param=session.getHandshakeAttributes();
//				String name=(String) param.get("name");
//				String avatar=(String) param.get("avatar");
//				String color=(String) param.get("color");
//				String room=(String) param.get("room");
//				User user=userService.createUser(name, avatar,color);
//				ChatSession cs=new ChatSession();
//				Room r=room==null?roomService.getWelcomeRoom():roomService.createOrGetRoom(room);
//				cs.setRoom(r);
//				cs.setUser(user);
//				cs.setSession(session);
//				session.getHandshakeAttributes().put(USERKEY, cs);
//				
//				chatService.createOrJoinForum(r, cs);
//			}
//			@Override
//			public void handleTransportError(WebSocketSession session,Throwable exception) throws Exception {
//				exception.printStackTrace();
//			}
//			@Override
//			public void afterConnectionClosed(WebSocketSession session,CloseStatus status) throws Exception {
//				ChatSession cs=(ChatSession) session.getHandshakeAttributes().get(USERKEY);
//				chatService.userRemove(cs.getRoom(), cs);
//			}
//			
//			
//		};
//	}
//	
//	@Bean
//	public HandshakeInterceptor handshakeInterceptor() {
//		return new HandshakeInterceptor(){
//			@Override
//			public boolean beforeHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler,Map<String, Object> attributes) throws Exception {
//				System.out.println(request.getHeaders());
//				System.out.println(request.getHeaders().getFirst("Cookie"));
//				MultiValueMap<String, String> mparam=WebUtils.parseMatrixVariables(request.getHeaders().getFirst("Cookie"));
//				Map<String,String> param=new HashMap<String,String>();
//				for(String key:mparam.keySet()){
//					param.put(StringUtils.trimWhitespace(key), mparam.getFirst(key));
//				}
//				System.out.println(param);
//				System.out.println(param.keySet());
//				String name=param.get("name");
//				String room=param.get("room");
//				String avatar=param.get("avatar");
//				String color=param.get("color");
//				String JSESSIONID=param.get("JSESSIONID");
//				Assert.hasText(name,"'name' must not empty");
//				name=URLDecoder.decode(name, "utf-8");
//				if(avatar==null){
//					avatar="../resources/img/avatar.jpg";
//				}else{
//					avatar=URLDecoder.decode(avatar,"utf-8");
//				}
//				if(color==null)color="green";
//				if(room!=null)room=URLDecoder.decode(room,"utf-8");
//				attributes.put("name", name);
//				attributes.put("avatar", avatar);
//				attributes.put("room", room);
//				attributes.put("color", color);
//				System.out.println(name+","+room+","+avatar+","+JSESSIONID);
//				return true;
//			}
//
//			@Override
//			public void afterHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler,Exception exception) {
//			}
//			
//		};
//	}
//
//	  @Bean  
//	  public ThreadPoolTaskScheduler taskScheduler() {  
//	    ThreadPoolTaskScheduler taskScheduler = new ThreadPoolTaskScheduler();  
//	    taskScheduler.setThreadNamePrefix("SockJS-");  
//	    return taskScheduler;  
//	  }  
//}
