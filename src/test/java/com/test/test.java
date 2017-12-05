package com.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.model.User;
import com.service.UserServiceI;


public class test {

	 UserServiceI iuService;
	 ApplicationContext ac;

	    @Before
	    public void before(){
	        ac=new ClassPathXmlApplicationContext(new String[]{"spring.xml","spring-mybatis.xml"});
	        iuService= (UserServiceI)ac.getBean("userServiceImpl");
	    }
	    
	    @Test
	    public void getUser(){
	        User user = iuService.findUserById(1);
	        System.out.println(user.getIdentity());
	    }
	    
	    @Test 
	    public void delUser(){
	        boolean byId = iuService.delById(1);
	        
	        System.out.println(byId);
	    }
	    
	    
	    
	    @Test
	    public void findAllUser(){
	    	List<User> lsus= iuService.findAll();
	    	
	    	System.out.println(lsus);
	    }
	    
	    
	    @Test
	    public void updateUser(){
	    	iuService.updateUser(new User());
	    	
	    	System.out.println();
	    }
}
