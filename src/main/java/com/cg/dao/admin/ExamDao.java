package com.cg.dao.admin;

import com.cg.entity.admin.Exam;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @description: 考试dao层
 * @author: cg
 **/

public interface ExamDao {

    /**
     * 考试插入操作
     *
     * @param exam
     * @return
     */
    int add(Exam exam);

    /**
     * 考试更新操作
     *
     * @param exam
     * @return
     */
    int edit(Exam exam);

    /**
     * 考试信息搜索查询
     *
     * @param queryMap
     * @return
     */
    List<Exam> findList(Map<String, Object> queryMap);

    /**
     * 删除考试信息
     *
     * @param exams
     * @return
     */
    int delete(@Param("exams") List<Exam> exams);

    /**
     * 模糊搜索总条数
     *
     * @param queryMap
     * @return
     */
    Integer getTotal(Map<String, Object> queryMap);

    /**
     * 考试信息搜索查询
     *
     * @param queryMap
     * @return
     */
    List<Exam> findListByUser(Map<String, Object> queryMap);

    /**
     * 用户模糊搜索总条数
     *
     * @param queryMap
     * @return
     */
    Integer getTotalByUser(Map<String, Object> queryMap);

    /**
     * 考试信息按题目查询
     *
     * @param id
     * @return
     */
    Exam findById(Integer id);

    /**
     * 考试统计数据更新操作
     *
     * @param exam
     * @return
     */
    int updateExam(Exam exam);
}
