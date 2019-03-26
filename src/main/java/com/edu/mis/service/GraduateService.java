package com.edu.mis.service;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.edu.mis.model.Graduate;
import com.edu.mis.service.base.BaseService;
import com.github.pagehelper.util.StringUtil;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class GraduateService extends BaseService<Graduate>{

	public List<Graduate> selectByCondition(Graduate graduate) {
		String name = graduate.getName();
		Integer gender = graduate.getGender();
		String phone = graduate.getPhone();
		String idcard = graduate.getIdcard();
		String id = graduate.getId();
		
		Example example = new Example(Graduate.class);
		Criteria criteria = example.createCriteria();
		
		if(StringUtils.isNotBlank(name)){
			criteria.andLike("name", "%"+name+"%");
		}
		if(gender != null){
			criteria.andLike("gender", "%"+gender+"%");
		}
		if(StringUtils.isNotBlank(phone)){
			criteria.andLike("phone", "%"+phone+"%");
		}
		if(StringUtils.isNotBlank(idcard)){
			criteria.andLike("idcard", "%"+idcard+"%");
		}
		if(StringUtils.isNotBlank(id)){
			criteria.andLike("id", "%"+id+"%");
		}
		
		return mapper.selectByExample(example);
	}

}
