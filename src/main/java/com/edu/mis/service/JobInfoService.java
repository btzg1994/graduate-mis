package com.edu.mis.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.edu.mis.entity.ChartData;
import com.edu.mis.entity.ColCountEntity;
import com.edu.mis.entity.NameValueEntity;
import com.edu.mis.mapper.JobInfoMapper;
import com.edu.mis.model.JobInfo;
import com.edu.mis.service.base.BaseService;
import com.github.gserv.serv.commons.util.JsonMapper;

@Service
public class JobInfoService extends BaseService<JobInfo>{
	@Resource
	private JobInfoMapper jobInfoMapper;
	
	public ChartData mkChartData(Integer type,Integer instituteId,Integer departmentId){
		String colName="";
		Map map = null;
		ChartData chartData = new ChartData();
		HashMap<Integer, Integer> tmpmap = new HashMap<Integer, Integer>();
		List<NameValueEntity> mixValueArray = new ArrayList<NameValueEntity>();
		List<String> xArray = new ArrayList<String>();
		List<Integer> valueArray = new ArrayList<Integer>();
		List<ColCountEntity> list = new ArrayList<ColCountEntity>();
		switch (type) {
			case 1://job_status
				colName ="status";
				list = jobInfoMapper.selectCountByGroup(colName, instituteId, departmentId);
				map = PublicService.JOB_STATUS;

				chartData.setTitle("毕业生就业状况");
				
				chartData.setLegend(Arrays.asList("人数"));
				
				
				tmpmap.put(1, 0);
				tmpmap.put(2, 0);
				tmpmap.put(3, 0);
				tmpmap.put(4, 0);
				tmpmap.put(5, 0);
				tmpmap.put(6, 0);
				
				break;
			case 2://attitude
				colName = "attitude";
				list = jobInfoMapper.selectCountByGroup(colName, instituteId, departmentId);
				map = PublicService.JOB_ATTITUDE;

				chartData.setTitle("对就业状况的满意度");
				
				chartData.setLegend(Arrays.asList("人数"));
				
				tmpmap.put(1, 0);
				tmpmap.put(2, 0);
				tmpmap.put(3, 0);
				tmpmap.put(4, 0);
				tmpmap.put(5, 0);
				
				break;
			case 3:
				colName = "industry";
				list = jobInfoMapper.selectCountByGroup(colName, instituteId, departmentId);
				map = PublicService.JOB_INDUSTRY;
				
				chartData.setTitle("所属行业");
				
				chartData.setLegend(Arrays.asList("人数"));
				
				
				tmpmap.put(1, 0);
				tmpmap.put(2, 0);
				tmpmap.put(3, 0);
				tmpmap.put(4, 0);
				tmpmap.put(5, 0);
				tmpmap.put(6, 0);
				tmpmap.put(7, 0);
				tmpmap.put(8, 0);
				tmpmap.put(9, 0);
				tmpmap.put(10, 0);
				tmpmap.put(11, 0);
				tmpmap.put(12, 0);
				tmpmap.put(13, 0);
				tmpmap.put(14, 0);
				tmpmap.put(15, 0);
				tmpmap.put(16, 0);
				tmpmap.put(17, 0);
				tmpmap.put(18, 0);
				tmpmap.put(19, 0);
				tmpmap.put(20, 0);
				tmpmap.put(21, 0);
				
				break;
			case 4:
				colName = "area";
				list = jobInfoMapper.selectCountByGroup(colName, instituteId, departmentId);
				map = PublicService.JOB_AREA;
				
				chartData.setTitle("所在地区");
				
				chartData.setLegend(Arrays.asList("人数"));
				
				tmpmap.put(1, 0);
				tmpmap.put(2, 0);
				tmpmap.put(3, 0);
				tmpmap.put(4, 0);
				tmpmap.put(5, 0);
				tmpmap.put(6, 0);
				tmpmap.put(7, 0);
				tmpmap.put(8, 0);
				tmpmap.put(9, 0);
				tmpmap.put(10, 0);
				tmpmap.put(11, 0);
				tmpmap.put(12, 0);
				tmpmap.put(13, 0);
				tmpmap.put(14, 0);
				tmpmap.put(15, 0);
				tmpmap.put(16, 0);
				tmpmap.put(17, 0);
				tmpmap.put(18, 0);
				tmpmap.put(19, 0);
				tmpmap.put(20, 0);
				tmpmap.put(21, 0);
				tmpmap.put(22, 0);
				tmpmap.put(23, 0);
				tmpmap.put(24, 0);
				tmpmap.put(25, 0);
				tmpmap.put(26, 0);
				tmpmap.put(27, 0);
				tmpmap.put(28, 0);
				tmpmap.put(29, 0);
				tmpmap.put(30, 0);
				tmpmap.put(31, 0);
				tmpmap.put(32, 0);
				tmpmap.put(33, 0);
				tmpmap.put(34, 0);
				break;
			case 5:
				colName = "salary";
				list = jobInfoMapper.selectCountByGroup(colName, instituteId, departmentId);
				map = PublicService.JOB_SALARY;
				
				chartData.setTitle("月薪（税前）");
				
				chartData.setLegend(Arrays.asList("人数"));
				
				tmpmap.put(1, 0);
				tmpmap.put(2, 0);
				tmpmap.put(3, 0);
				tmpmap.put(4, 0);
				tmpmap.put(5, 0);
				tmpmap.put(6, 0);
				tmpmap.put(7, 0);
				tmpmap.put(8, 0);
				tmpmap.put(9, 0);
				tmpmap.put(10, 0);
				break;
			default:
				break;
		}
		
		for ( ColCountEntity m: list) {
			Integer col = m.getCol();
			Integer count = m.getCount();
			tmpmap.put(col, count);
		}
		
		for (Entry<Integer, Integer> entry : tmpmap.entrySet()) {
			Integer key = entry.getKey();
			String name = (String) map.get(key);
			Integer value = entry.getValue();
			NameValueEntity nameValueEntity = new NameValueEntity(name, value);
			mixValueArray.add(nameValueEntity);
		}
		chartData.setMixValueArray(mixValueArray);
		
		
		for (NameValueEntity e : mixValueArray) {
			xArray.add(e.getName());
			valueArray.add(e.getValue());
		}				
		
		chartData.setxArray(xArray);
		chartData.setValueArray(valueArray);
		
		return chartData;
	}
}
