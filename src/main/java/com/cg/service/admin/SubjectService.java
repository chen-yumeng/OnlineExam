package com.cg.service.admin;

import com.cg.entity.admin.Subject;

import java.util.List;
import java.util.Map;

/**
 * @description: 学科专业service类
 * @author: cg
 **/

public interface SubjectService {
    /**
     * 学科专业插入操作
     *
     * @param subject
     * @return
     */
    int add(Subject subject);

    /**
     * 学科专业更新操作
     *
     * @param subject
     * @return
     */
    int edit(Subject subject);

    /**
     * 学科专业信息搜索查询
     *
     * @param queryMap
     * @return
     */
    List<Subject> findList(Map<String, Object> queryMap);

    /**
     * 删除学科专业信息
     *
     * @param id
     * @return
     */
    int delete(Long id);

    /**
     * 模糊搜索总条数
     *
     * @param queryMap
     * @return
     */
    Integer getTotal(Map<String, Object> queryMap);

    /**
     * 学科专业信息精确查询
     *
     * @param id
     * @return
     */
    Subject findById(Long id);
}
