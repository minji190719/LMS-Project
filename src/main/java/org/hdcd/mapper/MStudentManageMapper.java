package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface MStudentManageMapper {

	List<Map<String, Object>> selectAllStudent(@Param("stu_dep")String stu_dep, @Param("stu_record")String stu_record,@Param("mem_name") String mem_name);

	Map<String, Object> selectStudentDetail(String smem_no);

}
