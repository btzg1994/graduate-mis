package com.edu.mis.service;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.edu.mis.model.Graduate;
import com.edu.mis.model.Teacher;
import com.edu.mis.service.base.BaseService;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class TeacherService extends BaseService<Teacher>{
	public List<Teacher> selectByCondition(Teacher teacher) {
		String name = teacher.getName();
		Integer gender = teacher.getGender();
		String phone = teacher.getPhone();
		String id = teacher.getId();
		
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
		if(StringUtils.isNotBlank(id)){
			criteria.andLike("id", "%"+id+"%");
		}
		
		return mapper.selectByExample(example);
	}
}
