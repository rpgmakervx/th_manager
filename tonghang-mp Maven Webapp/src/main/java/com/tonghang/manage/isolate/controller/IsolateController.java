package com.tonghang.manage.isolate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tonghang.manage.isolate.service.IsolateService;

@Controller("isolateContrller")
@RequestMapping("isolate")
public class IsolateController {

	public IsolateService isolateService;
	
}
