package scott.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import scott.domain.DeptDTO;
import scott.domain.EmpDTO;
import scott.service.ListDeptService;
import scott.service.ListEmpService;

public class ListDeptEmpHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ListDeptService deptService = ListDeptService.getInstance();
		List<DeptDTO> deptList = deptService.selectDeptList();
		request.setAttribute("deptList", deptList);
		
		
		// list.do?deptno=10
		// list.do?deptno
		// list.do
		String pdeptno = request.getParameter("deptno"); // 넘겨져오는 부서번호를 가져와서..
		if(pdeptno == null || pdeptno.equals("")) {
			pdeptno = "10";
		} else {
			pdeptno = request.getParameter("deptno");
		}
		
		int deptno = Integer.parseInt(pdeptno);
		
		
		ListEmpService empService = ListEmpService.getInstance();
		List<EmpDTO> empList = empService.selectEmpList(deptno);
		request.setAttribute("empList", empList);
		
		
		return "/days00/scott/list.jsp"; // 포워딩
	}

}
