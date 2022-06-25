package days09.guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.util.ConnectionProvider;

import days09.guestbook.domain.Message;
import days09.guestbook.persistence.MessageImpl;

public class WriteMessageService {
   
   // 1. 싱글톤 
      private static WriteMessageService instance = new WriteMessageService();
      private WriteMessageService() { }
      public static WriteMessageService getInstance() {
         return instance;
      }   
      
      // 2. 
      public int write(Message message) {
         Connection con = null;
          int rowCount = 0;
          
          try {
            con = ConnectionProvider.getConnection();
            MessageImpl dao = MessageImpl.getInstance();
            
            rowCount = dao.insert(con, message);
            
         } catch (Exception e) { 
            throw new ServiceException("> 메시지 등록 실패 : " + e.getMessage(), e);
         } finally {
            try {
               con.close();
            } catch (SQLException e) { 
               e.printStackTrace();
            }
         }
          return rowCount;
      }
}