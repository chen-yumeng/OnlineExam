package com.cg.service.admin;

import com.cg.entity.admin.Menu;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 菜单管理service
 * @author cg
 *
 */
@Service
public interface MenuService {

	/**
	 * 菜单插入操作
	 *
	 * @param menu
	 * @return
	 */
	int add(Menu menu);

	/**
	 * 菜单信息模糊分页搜索查询
	 *
	 * @param queryMap
	 * @return
	 */
	List<Menu> findList(Map<String, Object> queryMap);

	/**
	 * 获取顶级菜单信息
	 *
	 * @return
	 */
	List<Menu> findTopList();

	/**
	 * 菜单信息模糊分页搜索查询总记录数
	 *
	 * @param queryMap
	 * @return
	 */
	int getTotal(Map<String, Object> queryMap);

	/**
	 * 修改菜单信息
	 *
	 * @param menu
	 * @return
	 */
	int edit(Menu menu);

	/**
	 * 删除菜单信息
	 *
	 * @param id
	 * @return
	 */
	int delete(Integer id);

	/**
	 * 获取某一分类的子菜单信息
	 *
	 * @param parentId
	 * @return
	 */
	List<Menu> findChildernList(Integer parentId);

	/**
	 * 根据菜单id获取菜单信息
	 *
	 * @param ids
	 * @return
	 */
	List<Menu> findListByIds(String ids);
}
