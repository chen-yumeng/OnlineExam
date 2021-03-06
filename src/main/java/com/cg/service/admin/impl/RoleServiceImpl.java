package com.cg.service.admin.impl;
/**
 * 角色role的实现类
 */
import com.cg.dao.admin.RoleDao;
import com.cg.entity.admin.Role;
import com.cg.service.admin.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao roleDao;
	
	@Override
	public int add(Role role) {
		// TODO Auto-generated method stub
		return roleDao.add(role);
	}

	@Override
	public int edit(Role role) {
		// TODO Auto-generated method stub
		return roleDao.edit(role);
	}

	@Override
	public int delete(List<Role> roles) {
		// TODO Auto-generated method stub
		return roleDao.delete(roles);
	}

	@Override
	public List<Role> findList(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return roleDao.findList(queryMap);
	}

	@Override
	public int getTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return roleDao.getTotal(queryMap);
	}

	@Override
	public Role find(Integer id) {
		// TODO Auto-generated method stub
		return roleDao.find(id);
	}

}
