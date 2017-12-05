package com.dao;

import java.util.List;
import com.model.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User> selectAll();
    
    User login(String name,String password);
    
	List<?> findUserByParams(User user);
	
	List<?> checkUserName(String name);

	int delUsersBatch(List<Integer> lsId);
}