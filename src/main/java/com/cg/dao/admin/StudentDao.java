package com.cg.dao.admin;

import com.cg.entity.admin.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @description: 学生dao层
 * @author: cg
 **/

public interface StudentDao {

    /**
     * 考生插入操作
     *
     * @param student
     * @return
     */
    int add(Student student);

    /**
     * 考生更新操作
     *
     * @param student
     * @return
     */
    int edit(Student student);

    /**
     * 考生信息搜索查询
     *
     * @param queryMap
     * @return
     */
    List<Student> findList(Map<String, Object> queryMap);

    /**
     * 删除考生信息
     *
     * @param students
     * @return
     */
    int delete(@Param("students") List<Student> students);

    /**
     * 模糊搜索总条数
     *
     * @param queryMap
     * @return
     */
    Integer getTotal(Map<String, Object> queryMap);

    /**
     * 考生信息按登录名查询
     *
     * @param name
     * @return
     */
    Student findByName(String name);
}
