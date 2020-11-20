package f5074.spring.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AdminFilter
 */
public class AdminFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletResponse res= (HttpServletResponse) response;
		HttpServletRequest req=(HttpServletRequest) request;
		
		HttpSession session=req.getSession();
		String sid=(String) session.getAttribute("sid");
		//session에 sid가 없으면 login.jsp로 이동
		if(sid==null){
			session.setAttribute("adminMsg", "관리자 전용 메뉴입니다.");
			res.sendRedirect("/spring/index");
		}else if(!sid.equals("admin")){
			session.setAttribute("adminMsg", "관리자 전용 메뉴입니다.");
			res.sendRedirect("/spring/index");
		}
		
		chain.doFilter(request, response);	
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}
	public void destroy() {
		
	}

}
