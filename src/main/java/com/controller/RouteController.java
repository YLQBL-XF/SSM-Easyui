package com.controller;

//import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Route;
import com.service.RouteServiceI;

@Controller
@RequestMapping("routeController")
public class RouteController {

	@Autowired
	private RouteServiceI rServiceI;
	
	@RequestMapping("getAllRoute")
	@ResponseBody
	public List<Route> getAllRoute(HttpServletRequest request){
		List<Route> lsrs = rServiceI.getRoute();//从数据库中获取的数据
		request.setAttribute("lsus", lsrs);
		System.out.println(lsrs);
		return lsrs;
	}
}
