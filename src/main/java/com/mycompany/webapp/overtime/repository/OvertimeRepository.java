package com.mycompany.webapp.overtime.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.component.Pager;
import com.mycompany.webapp.overtime.model.Overtime;

@Repository
public interface OvertimeRepository {

	int insertOvertime(Overtime overtime);

	int selectOvertimeRow(@Param("empId") String empId, @Param("status") String status,  @Param("type") int type);

	List<Overtime> selectOvertimeList(@Param("pager") Pager pager, @Param("empId") String empId, @Param("status") String status,@Param("type") int type);

	Overtime selectOvertime(int overtimeId);

	int selecWeekOverTime(@Param("sunday") String sunday,@Param("empId") String empId);

	int updateOvertimeAtt(Overtime overtime);

	void updateOvertime(Overtime overtime);
	
	

}
