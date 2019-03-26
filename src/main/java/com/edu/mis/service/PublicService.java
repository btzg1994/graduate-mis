package com.edu.mis.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

@Service
public class PublicService {
	public static HashMap<Integer,String> JOB_STATUS =  new HashMap<Integer, String>();
	public static HashMap<Integer,String> JOB_ATTITUDE =  new HashMap<Integer, String>();
	public static HashMap<Integer,String> JOB_INDUSTRY =  new HashMap<Integer, String>();
	public static HashMap<Integer,String> JOB_AREA =  new HashMap<Integer, String>();
	public static HashMap<Integer,String> JOB_SALARY =  new HashMap<Integer, String>();
	
	public PublicService() {
		super();
		JOB_STATUS.put(1, "已工作");
		JOB_STATUS.put(2, "已创业");
		JOB_STATUS.put(3, "确定或已升学");
		JOB_STATUS.put(4, "确定或已出国");
		JOB_STATUS.put(5, "求职中");
		JOB_STATUS.put(6, "暂不就业");
		
		JOB_ATTITUDE.put(1, "非常满意");
		JOB_ATTITUDE.put(2, "满意");
		JOB_ATTITUDE.put(3, "一般");
		JOB_ATTITUDE.put(4, "不满意");
		JOB_ATTITUDE.put(5, "非常不满意");
		
		JOB_INDUSTRY.put(1, "农、林、牧、渔业");
		JOB_INDUSTRY.put(2, "采矿业");
		JOB_INDUSTRY.put(3, "制造业");
		JOB_INDUSTRY.put(4, "电力、热力、燃气及水生产和供应业");
		JOB_INDUSTRY.put(5, "建筑业");
		JOB_INDUSTRY.put(6, "批发和零售业");
		JOB_INDUSTRY.put(7, "交通运输、仓储和邮政业");
		JOB_INDUSTRY.put(8, "住宿和餐饮业");
		JOB_INDUSTRY.put(9, "信息传输、软件和信息技术服务业");
		JOB_INDUSTRY.put(10, "金融业");
		JOB_INDUSTRY.put(11, "房地产业");
		JOB_INDUSTRY.put(12, "租赁和商务服务业");
		JOB_INDUSTRY.put(13, "科学研究和技术服务业");
		JOB_INDUSTRY.put(14, "水利、环境和公共设施管理");
		JOB_INDUSTRY.put(15, "居民服务、修理和其他服务业");
		JOB_INDUSTRY.put(16, "教育");
		JOB_INDUSTRY.put(17, "卫生和社会工作");
		JOB_INDUSTRY.put(18, "文化、体育和娱乐业");
		JOB_INDUSTRY.put(19, "公共管理、社会保障和社会组织");
		JOB_INDUSTRY.put(20, "国际组织");
		JOB_INDUSTRY.put(21, "军队");
		
		JOB_AREA.put(1, "北京市");
		JOB_AREA.put(2, "天津市");
		JOB_AREA.put(3, "河北省");
		JOB_AREA.put(4, "山西省");
		JOB_AREA.put(5, "内蒙古自治区");
		JOB_AREA.put(6, "辽宁省");
		JOB_AREA.put(7, "吉林省");
		JOB_AREA.put(8, "黑龙江省");
		JOB_AREA.put(9, "上海市");
		JOB_AREA.put(10, "江苏省");
		JOB_AREA.put(11, "浙江省");
		JOB_AREA.put(12, "安徽省");
		JOB_AREA.put(13, "福建省");
		JOB_AREA.put(14, "江西省");
		JOB_AREA.put(15, "山东省");
		JOB_AREA.put(16, "河南省");
		JOB_AREA.put(17, "湖北省");
		JOB_AREA.put(18, "湖南省");
		JOB_AREA.put(19, "广东省");
		JOB_AREA.put(20, "广西壮族自治区");
		JOB_AREA.put(21, "海南省");
		JOB_AREA.put(22, "重庆市");
		JOB_AREA.put(23, "四川省");
		JOB_AREA.put(24, "贵州省");
		JOB_AREA.put(25, "云南省");
		JOB_AREA.put(26, "西藏自治区");
		JOB_AREA.put(27, "陕西省");
		JOB_AREA.put(28, "甘肃省");
		JOB_AREA.put(29, "青海省");
		JOB_AREA.put(30, "宁夏回族自治区");
		JOB_AREA.put(31, "新疆维吾尔自治区");
		JOB_AREA.put(32, "台湾省");
		JOB_AREA.put(33, "香港特别行政区");
		JOB_AREA.put(34, "澳门特别行政区");
		
		JOB_SALARY.put(1, " 2000元及以下");
		JOB_SALARY.put(2, " 2001-3000元");
		JOB_SALARY.put(3, " 3001-4000元");
		JOB_SALARY.put(4, " 4001-5000元");
		JOB_SALARY.put(5, " 5001-7000元");
		JOB_SALARY.put(6, " 7001-10000元");
		JOB_SALARY.put(7, " 10001-15000元");
		JOB_SALARY.put(8, " 15001-20000元");
		JOB_SALARY.put(9, " 20001-30000元");
		JOB_SALARY.put(10, " 30000元以上");
	}
	
	
	
}
