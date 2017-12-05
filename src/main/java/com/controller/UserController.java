package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.PageInfo;
import com.httpModel.ResultJson;
import com.httpModel.SessionInfo;
import com.model.User;
import com.service.UserServiceI;
import com.utils.IpUtil;
import com.utils.ResourceUtil;

@Controller
@RequestMapping("userController")
public class UserController {

	@Autowired
	private UserServiceI uServiceI;
	
	/*****************************查找单个用户**************************************/
	@RequestMapping("getUser/{id}")
	@ResponseBody
	public User getUser(@PathVariable Integer id,HttpServletRequest request){
		User user = uServiceI.findUserById(id);
		request.setAttribute("user", user);
		System.out.println(user.toString());
		return user;
	}
	
	/*****************************查找所有的用户**************************************/
	
	@RequestMapping("getAllUser")
	@ResponseBody
	public List<User> getAllUser(HttpServletRequest request){
		List<User> lsus = uServiceI.findAll();
		request.setAttribute("lsus", lsus);
		System.out.println(lsus);
		return lsus;
	}

	
	@RequestMapping(value = "list", method = {RequestMethod.GET, RequestMethod.POST},produces="text/html;charset=UTF-8")
    @ResponseBody
    public PageInfo<?> findUser(PageInfo<?> pageInfo, User user,int rows) {
		System.out.println("findUser---sxh");
		System.out.println("user.getName---sxh"+user.getName());
		System.out.println("user.getIdentity---sxh"+user.getIdentity());
		System.out.println("user.getPhon---sxh"+user.getPhon());
		
		uServiceI.findUser(pageInfo, user ,rows);
        return pageInfo;
    }
	
	
	/******************************添加用户******************************************/
	@RequestMapping("addUser")
	@ResponseBody
	public ResultJson addUser(User user,HttpServletRequest request){
		System.out.println("======addUser=======");
		System.out.println(user.toString());
		ResultJson rj = new ResultJson();
		boolean add_boolean = uServiceI.add(user);
		if (add_boolean) {
			rj.setSuccess(add_boolean);
			rj.setMsg("注册成功!"); 
		}else{
			rj.setSuccess(add_boolean);
			rj.setMsg("注册失败!");
		}
		System.out.println("add_boolean="+add_boolean);
		return rj;
	}
	
	/******************************检查用户名是否存在******************************************/
	@RequestMapping("checkUserName")
	@ResponseBody
	public ResultJson checkUserName(String name,HttpServletRequest request){
		System.out.println("=======checkUserName========");
		ResultJson rj = new ResultJson();
		boolean checkname=uServiceI.checkUserName(name);
		if (checkname) {
			rj.setSuccess(checkname);
			rj.setMsg("1");
			rj.setObj("1");
		}else{
			rj.setSuccess(checkname);
			rj.setMsg("0");
			rj.setObj("0");
		}
		return rj;
	}
	
	/******************************更新用户******************************************/
	@RequestMapping("updateUser")
	@ResponseBody
	public ResultJson updateUser(User user,HttpServletRequest request){
		System.out.println("======updateUser=======");
		ResultJson rj = new ResultJson();
		boolean upbl = uServiceI.updateUser(user);
		if(upbl){
			rj.setSuccess(upbl);
			rj.setMsg("1");
			rj.setObj("1");
		}else{
			rj.setSuccess(upbl);
			rj.setMsg("0");
			rj.setObj("0");
		}
		System.out.println("updateUser="+upbl);
		return rj;
	}

	/******************************删除用户****************************************/
	/**
	 * 用代码遍历删除
	 * @param ids 前台传回来的值
	 * @param request
	 * @return
	 */
	@RequestMapping("delUser")
	@ResponseBody
	public ResultJson delUser(String ids,HttpServletRequest request){
		System.out.println("======delUser=======");
		ResultJson rj = new ResultJson();
		boolean debl = uServiceI.delByIds(ids);

		if(debl){
			rj.setSuccess(debl);
			rj.setMsg("1");
			rj.setObj("1");
		}else{
			rj.setSuccess(debl);
			rj.setMsg("0");
			rj.setObj("0");
		}
		System.out.println("delUser="+debl);
		return rj;
	}
	
	/**
	 * 在SQL中批量删除
	 * @param ids 前台传回来的值
	 * @param request
	 * @return
	 */
	@RequestMapping("delUsersBatch")
	@ResponseBody
	public ResultJson delUsersBatch(String ids,HttpServletRequest request){
		System.out.println("======delUser=======");
		ResultJson rj = new ResultJson();
		boolean debl = uServiceI.delUsersBatch(ids);
		
		if(debl){
			rj.setSuccess(debl);
			rj.setMsg("1");
			rj.setObj("1");
		}else{
			rj.setSuccess(debl);
			rj.setMsg("0");
			rj.setObj("0");
		}
		System.out.println("delUser="+debl);
		return rj;
	}
	
	
	/*****************************初始化界面******************************************/
	@RequestMapping("index")
	public String index(HttpServletRequest request) {
		System.out.println(request.getContextPath());
		return "index";
	}
	@RequestMapping("home")
	public String homePage(HttpServletRequest request) {
		System.out.println(request.getContextPath());
		return "/WEB-INF/jsp/home";
	}
	
	@RequestMapping(params ="north")
	public String north() {
		System.out.println(2222);
		return "/layout/north";
	}

	@RequestMapping(params ="west")
	public String west() {
		System.out.println(333);
		return "/layout/west";
	}

	@RequestMapping(params = "center")
	public String center() {
		System.out.println(444);
		return "/layout/center";
	}

	@RequestMapping(params ="south")
	public String south() {
		System.out.println(555);
		return "/layout/south";
	}
	
	@RequestMapping(params ="authmsg")
	public String authMsg() {
		System.out.println("authmsg--->登录失败");
		return "/error/authMsg";
	}
	
	@RequestMapping(value="login",method = {RequestMethod.GET, RequestMethod.POST},produces="text/html;charset=UTF-8")
	@ResponseBody
	public ResultJson login(String name,String password,HttpSession session, HttpServletRequest request){
		System.out.println("login");
		ResultJson rj = new ResultJson();
		User u = uServiceI.login(name,password);
		if (u != null) {
			rj.setSuccess(true);
			rj.setMsg("登录成功!"); 

			u.setIp(IpUtil.getIpAddr(request));
			SessionInfo sessionInfo = new SessionInfo();
			sessionInfo.setUser(u);
			session.setAttribute(ResourceUtil.getSessionInfoName(), sessionInfo);
//			session.setAttribute("name", name); 
			rj.setObj(u);
		} else {
			rj.setMsg("用户名或密码错误!");
		}	
		return rj;
	}
	
	
	/**
	 * @param session
	 * @return
	 */
	@RequestMapping(params = "logout")
	@ResponseBody
	public ResultJson logout(HttpSession session) {
		ResultJson j = new ResultJson();
		if (session != null) {
			session.invalidate();
		}
		j.setSuccess(true);
		return j;
	}
	
	@RequestMapping("tree")
	public String gettree(HttpServletRequest request) {
		return "index_mtree";
	}
	
	@RequestMapping("indexPage")
	public String indexPage(HttpServletRequest request) {
		return "page/hello";
	}
	
	@RequestMapping("getUsers")
	public String getUsers() {
		System.out.println(444);
		return "/layout/center";
	}
	
	@RequestMapping("getCarTrajectory")
	public String getCarTrajectory() {
		System.out.println(444);
		return "page/CarTrajectory";
	}

	
}

