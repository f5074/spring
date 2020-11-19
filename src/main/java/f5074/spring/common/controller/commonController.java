package f5074.spring.common.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class commonController {
	
	private Logger logger = Logger.getLogger(commonController.class);
	
	@RequestMapping("/")
	public String home(){
		return "/index";
	}
	@RequestMapping("/index")
	public String index(){
		return "/index";
	}
	
	@RequestMapping("user/drawing/drawingPage")
	public String userGrammar() {
		return "user/drawing/drawingPage";
	}
	
	@RequestMapping("user/drawing/equipmentPage")
	public String drawingDesign() {
		return "user/drawing/equipmentPage";
	}
	
}
