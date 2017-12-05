package com.model;

import java.util.List;

public class Route {
    private Integer id;

    private String name;

	private List<List<Float>> path;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /************************************************/
	public List<List<Float>> getPath() {
		return path;
	}

	public void setPath(List<List<Float>> path) {
		this.path = path;
	}
	/************************************************/
    
}