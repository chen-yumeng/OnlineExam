package com.cg.dao.admin;

import com.cg.entity.admin.Subject;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @description: 学科专业dao层
 * @author: cg
 **/

public interface SubjectDao {

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
     * @param subjects
     * @return
     */
    int delete(@Param("subjects") List<Subject> subjects);

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
    Subject findById(Integer id);

    List<Subject> findByUserId(Integer userId);
}
