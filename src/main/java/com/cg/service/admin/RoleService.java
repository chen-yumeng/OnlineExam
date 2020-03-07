package com.cg.service.admin;

import com.cg.entity.admin.Role;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 角色role service
 * @author cg
 *
 */
@Service
public interface RoleService {

	/**
	 * 角色插入操作
	 *
	 * @param role
	 * @return
	 */
	int add(Role role);

	/**
	 * 修改角色信息
	 *
	 * @param role
	 * @return
	 */
	int edit(Role role);

	/**
	 * 删除角色信息
	 *
	 * @param id
	 * @return
	 */
	int delete(Long id);

	/**
	 * 角色信息模糊分页搜索查询
	 *
	 * @param queryMap
	 * @return
	 */
	List<Role> findList(Map<String, Object> queryMap);

	/**
	 * 角色信息模糊分页搜索查询总记录数
	 *
	 * @param queryMap
	 * @return
	 */
	int getTotal(Map<String, Object> queryMap);

	/**
	 * 根据id获取角色
	 *
	 * @param id
	 * @return
	 */
	Role find(Long id);
}
