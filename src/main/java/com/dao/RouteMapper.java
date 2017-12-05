package com.dao;

import java.util.List;
import com.model.Route;

public interface RouteMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Route record);

    int insertSelective(Route record);

    Route selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Route record);

    int updateByPrimaryKey(Route record);
    
    List<Route> selectBygetRoute();
}