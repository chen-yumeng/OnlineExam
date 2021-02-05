package com.cg.service.admin;

import com.cg.entity.admin.ExamPaper;

import java.util.List;
import java.util.Map;

/**
 * @program: OnlineExam->ExamPaperService
 * @description: 试卷service类
 * @author: cg
 * @create: 2020-01-12 23:10
 **/

public interface ExamPaperService {

    /**
     * 试卷插入操作
     *
     * @param examPaper
     * @return
     */
    int add(ExamPaper examPaper);

    /**
     * 试卷更新操作
     *
     * @param examPaper
     * @return
     */
    int edit(ExamPaper examPaper);

    /**
     * 试卷信息搜索查询
     *
     * @param queryMap
     * @return
     */
    List<ExamPaper> findList(Map<String, Object> queryMap);

    /**
     * 删除试卷信息
     *
     * @param examPapers
     * @return
     */
    int delete(List<ExamPaper> examPapers);

    /**
     * 模糊搜索总条数
     *
     * @param queryMap
     * @return
     */
    Integer getTotal(Map<String, Object> queryMap);

    /**
     * 用户查询考过的试卷信息
     *
     * @param queryMap
     * @return
     */
    List<ExamPaper> findHistory(Map<String, Object> queryMap);

    /**
     * 模糊搜索总条数
     *
     * @param queryMap
     * @return
     */
    Integer getHistoryTotal(Map<String, Object> queryMap);

    /**
     * 考生试卷信息搜索查询
     *
     * @param queryMap
     * @return
     */
    ExamPaper find(Map<String, Object> queryMap);

    /**
     * 交卷操作
     *
     * @param examPaper
     * @return
     */
    int submitPaper(ExamPaper examPaper);

    /**
     * 考试信息统计
     *
     * @param examId
     * @return
     */
    List<Map<String, Object>> getExamStats(Integer examId);

    /**
     * 通过id获取试卷信息
     * @param id
     * @return
     */
    ExamPaper findById(Integer id);
}
