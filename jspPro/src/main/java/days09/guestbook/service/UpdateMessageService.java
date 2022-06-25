package days09.guestbook.service;

import java.sql.Connection;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import days09.guestbook.domain.Message;
import days09.guestbook.persistence.MessageImpl;

public class UpdateMessageService {
   
   // 1. 싱글톤
   private static UpdateMessageService instance = new UpdateMessageService();
   public static UpdateMessageService getInstance() {
      return instance;
   }
   private UpdateMessageService() { }
   
   //
   public int update(Message message){
      Connection conn = null;
      try{
         conn = ConnectionProvider.getConnection();
         MessageImpl dao =  MessageImpl.getInstance();
         
         return dao.update(conn, message); // 코딩 
         
      }catch(Exception e){
         throw new ServiceException("메시지 수정 실패 : "+ e.getMessage(),e   );
      }finally{
         JdbcUtil.close(conn);
      }
   }

}