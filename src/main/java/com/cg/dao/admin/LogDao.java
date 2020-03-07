package com.cg.dao.admin;

import com.cg.entity.admin.Log;

import java.util.List;
import java.util.Map;

/**
 * 系统日志类dao
 * @author cg
 *
 */

public interface LogDao {

	/**
	 * 日志插入操作
	 *
	 * @param log
	 * @return
	 */
	int add(Log log);

	/**
	 * 日志信息搜索查询
	 *
	 * @param queryMap
	 * @return
	 */
	List<Log> findList(Map<String, Object> queryMap);

	/**
	 * 模糊搜索总条数
	 *
	 * @param queryMap
	 * @return
	 */
	int getTotal(Map<String, Object> queryMap);

	/**
	 * 删除日志信息
	 *
	 * @param ids
	 * @return
	 */
	int delete(String ids);
}
