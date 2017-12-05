package com.service.impl;

import java.util.LinkedList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.PathMapper;
//import com.dao.RouteMapper;
import com.model.Path;
import com.model.Route;
import com.service.RouteServiceI;

@Service("routeServiceImpl")
public class RouteServiceImpl implements RouteServiceI {
	
	Log logger = LogFactory.getLog(RouteServiceImpl.class);
	
//	@Autowired
//	private RouteMapper rmapper;
	@Autowired
	private PathMapper pathMapper;
	/*public RouteMapper getRmapper() {
		return rmapper;
	}

	public void setRmapper(RouteMapper rmapper) {
		this.rmapper = rmapper;
	}*/

	@Override
	public List<Route> getRoute() {
		
		return getallrouteList();
	}

	public List<Route> getallrouteList() {
		List<Path> lspath = pathMapper.selectAllRoute();// 此类lspath包含id，name，jingdu，weidu属性//按name排序

		System.out.println("===========================================");
		System.out.println("路线名字\t经度\t纬度");
		for (int i = 0; i < lspath.size(); i++) {
			System.out.println(lspath.get(i).getName()+"\t"+lspath.get(i).getLongitude()+"\t"+lspath.get(i).getLatitude());
		}
		System.out.println("===========================================");
		
		List<Route> routelist = new LinkedList<>();//此类Route的集合包含id,name,List<List<String>>path 属性path为多个经纬度; 

		Route route = new Route();

		for (Path path : lspath) {
			//null ==route|| !route.getName().equals(path.getName())
			if (route.equals("")||route==null||route.getName()==null||route.getName().equals("")) {
				route.setId(path.getId());
				route.setName(path.getName());
				List<List<Float>> pathlist = new LinkedList<>();
				List<Float> paths = new LinkedList<>();

				paths.add(path.getLongitude());//经度
				paths.add(path.getLatitude());//纬度
				pathlist.add(paths);
				route.setPath(pathlist);
				routelist.add(route);
			} else {
				List<List<Float>> pathList = route.getPath();
				List<Float> paths = new LinkedList<>();
				paths.add(path.getLongitude());//经度
				paths.add(path.getLatitude());//纬度
				pathList.add(paths);
			}
		}
		return routelist;
	}
	
	
}
