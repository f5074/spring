package f5074.spring.common.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class commonController {
	
	private Logger logger = Logger.getLogger(commonController.class);
	
	@RequestMapping(value = { "/", "/index"}, method = RequestMethod.GET)
	public String index(){
		return "/index";
	}
	
	@RequestMapping(value = { "drawingPage", "user/drawing/drawingPage" }, method = RequestMethod.GET)
	public String drawingPage() {
		return "user/drawing/drawingPage";
	}
	
	@RequestMapping(value = { "equipmentPage", "user/drawing/equipmentPage" }, method = RequestMethod.GET)
	public String equipmentPage() {
		return "user/drawing/equipmentPage";
	}
	
	@RequestMapping(value = { "iconPage", "user/drawing/iconPage" }, method = RequestMethod.GET)
	public String iconPage() {
		return "user/drawing/iconPage";
	}
	
}
