package com.service;

import java.util.List;

import com.common.PageInfo;

import com.model.User;


public interface UserServiceI {

	public boolean add(User user);

	/**
	 * 删除单个对象
	 */
	public boolean delById(Integer id);

	public boolean updateUser(User user);
	
	public User findUserById(Integer id);
	
	public List<User> findAll();
	
	/**
	 * 登录
	 * @param name 用户名
	 * @param password 密码
	 * @return 
	 */
	public User login(String name,String password);

	/**
	 * @param pageInfo 分页的相关
	 * @param user 为空查找所有的用户，不为空，查找指定的用户
	 * @param rows 返回到页面的条数
	 */
	public void findUser(@SuppressWarnings("rawtypes") PageInfo pageInfo, User user,int rows);

	
	/**
	 *检查数据库中是否存在该用户名 
	 */
	public boolean checkUserName(String name);
	
	
	/**
	 * 通过代码遍历删除
	 * @param ids 前台传回来的用户的id，可以是单个用户也可以是许多用户
	 * @return 是否删除成功
	 */
	public boolean delByIds(String ids);
	
	
	/**
	 * 在SQL中批量删除
	 * @param ids 前台传回来的用户的id，可以是单个用户也可以是许多用户
	 * @return 是否删除成功
	 */
	public boolean delUsersBatch(String ids);
}
