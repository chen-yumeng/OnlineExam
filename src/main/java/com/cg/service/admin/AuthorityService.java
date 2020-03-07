package com.cg.service.admin;

import com.cg.entity.admin.Authority;

import java.util.List;

/**
 * 权限service接口
 *
 * @author cg
 */
public interface AuthorityService {

    /**
     * 权限插入操作
     *
     * @param authority
     * @return
     */
    int add(Authority authority);

    /**
     * 删除权限信息
     *
     * @param roleId
     * @return
     */
    int deleteByRoleId(Long roleId);

    /**
     * 权限信息搜索查询
     *
     * @param roleId
     * @return
     */
    List<Authority> findListByRoleId(Long roleId);
}
