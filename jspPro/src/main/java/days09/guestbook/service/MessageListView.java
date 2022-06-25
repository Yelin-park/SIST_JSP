package days09.guestbook.service;


import java.util.List;
import days09.guestbook.domain.Message; 

// PageBlock의 list와 pageBlock을 하나로 합쳐서 클래스로 만든 것
public class MessageListView {
	
   // 필드
   private List<Message> messageList; // 방명록 목록을 저장할 ArrayList<> list

   private int messageTotalCount;   // 총 방명록 글 수
   private int pageTotalCount;      // 총페이지 수
   private int currentPageNumber;   // 현재 페이지 번호
   private int messageCountPerPage; // 한 페이지에 출력할 방명록 글 수
   private int firstRow;            // 시작
   private int endRow;              // 끝

   // 생성자
   public MessageListView(
         List<Message> messageList,
         int messageTotalCount, 
         int currentPageNumber,
         int messageCountPerPage, 
         int startRow, int endRow) {

      this.messageList = messageList;
      this.messageTotalCount = messageTotalCount;
      this.currentPageNumber = currentPageNumber;
      this.messageCountPerPage = messageCountPerPage;
      this.firstRow = startRow;
      this.endRow = endRow;

      // 총 페이지수를 계산하는 메소드
      calculatePageTotalCount();
   }

   // 총 페이지수를 계산해서 반환하는 메서드 
   private void calculatePageTotalCount() {
      if (messageTotalCount == 0) {
         pageTotalCount = 0;
      } else {
         /*
          * pageTotalCount = messageTotalCount / messageCountPerPage;
          *  if (messageTotalCount % messageCountPerPage > 0) 
          *  { pageTotalCount++; }
          */
         pageTotalCount =
               (int)( Math.ceil((double)messageTotalCount / messageCountPerPage ));
      }
   }


   public List<Message> getMessageList() {
      return messageList;
   }

   public int getMessageTotalCount() {
      return messageTotalCount;
   }

   public int getPageTotalCount() {
      return pageTotalCount;
   }

   public int getCurrentPageNumber() {
      return currentPageNumber;
   }

   public int getMessageCountPerPage() {
      return messageCountPerPage;
   }

   public int getFirstRow() {
      return firstRow;
   }

   public int getEndRow() {
      return endRow;
   }

   // 추가 
   public boolean isEmpty() {
      return this.messageTotalCount == 0 ;
   }

}
