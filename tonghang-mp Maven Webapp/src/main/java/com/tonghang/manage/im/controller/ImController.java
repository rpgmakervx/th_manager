package com.tonghang.manage.im.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("imController")
@RequestMapping("business")
public class ImController {

	
	@RequestMapping("im")
	public String index(){
		return "groupChat";
	}
}
