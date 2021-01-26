package com.cg.service.admin;

import com.cg.entity.admin.Question;

import java.util.List;
import java.util.Map;

/**
 * @description: 试题service类
 * @author: cg
 **/

public interface QuestionService {

    /**
     * 试题插入操作
     * @param question
     * @return
     */
    int add(Question question);

    /**
     * 试题更新操作
     * @param question
     * @return
     */
    int edit(Question question);

    /**
     * 试题信息搜索查询
     * @param queryMap
     * @return
     */
    List<Question> findList(Map<String, Object> queryMap);

    /**
     * 删除试题信息
     * @param questions
     * @return
     */
    int delete(List<Question> questions);

    /**
     * 模糊搜索总条数
     * @param queryMap
     * @return
     */
    Integer getTotal(Map<String, Object> queryMap);

    /**
     * 试题信息按题目查询
     * @param title
     * @return
     */
    Question findByTitle(String title);

    /**
     * 根据试题类型获取试题数量
     * @param queryMap
     * @return
     */
    int getQuestionNumByType(Map<String, Long> queryMap);

    /**
     * 试题信息按id查询
     * @param id
     * @return
     */
    Question findById(Long id);

}
