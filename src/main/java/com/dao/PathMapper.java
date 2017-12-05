package com.dao;

import java.util.List;

import com.model.Path;

public interface PathMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Path record);

    int insertSelective(Path record);

    Path selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Path record);

    int updateByPrimaryKey(Path record);
    
    List<Path> selectAllRoute();
}