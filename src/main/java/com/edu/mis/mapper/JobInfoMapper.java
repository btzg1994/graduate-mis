package com.edu.mis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.edu.mis.entity.ColCountEntity;
import com.edu.mis.model.JobInfo;
import tk.mybatis.mapper.common.Mapper;

public interface JobInfoMapper extends Mapper<JobInfo> {
	
	List<ColCountEntity> selectCountByGroup(@Param("colName") String colName, @Param("instituteId") Integer instituteId,
			@Param("departmentId") Integer departmentId);
}