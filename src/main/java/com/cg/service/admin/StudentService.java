package com.cg.service.admin;

import com.cg.entity.admin.Student;

import java.util.List;
import java.util.Map;

/**
 * @description: 考生service类
 * @author: cg
 **/

public interface StudentService {
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
     * 考生信息按登录名查询
     *
     * @param name
     * @return
     */
    Student findByName(String name);
}
