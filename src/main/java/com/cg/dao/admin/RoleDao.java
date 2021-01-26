package com.cg.dao.admin;

import com.cg.entity.admin.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 角色role dao
 *
 * @author cg
 */

public interface RoleDao {

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
     * @param roles
     * @return
     */
    int delete(@Param("roles") List<Role> roles);

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
