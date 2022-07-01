package scott.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import scott.domain.DeptDTO;
import scott.domain.EmpDTO;
import scott.service.ListDeptService;
import scott.service.ListEmpJsonService;
import scott.service.ListEmpService;

public class ListEmpJsonHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ListEmpJsonService empJsonService = ListEmpJsonService.getInstance();
		List<EmpDTO> empList = empJsonService.selectEmpList();
		request.setAttribute("empList", empList);
				
		// ArrayList가 넘어가고 있음
		return "/days00/scott/empjson.jsp"; // 포워딩
		
	}

}
