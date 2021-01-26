package com.cg.service.admin.impl;

import com.cg.dao.admin.ExamPaperAnswerDao;
import com.cg.entity.admin.ExamPaperAnswer;
import com.cg.service.admin.ExamPaperAnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @description: 试卷答题service实现类
 * @author: cg
 **/
@Service
public class ExamPaperAnswerServiceImpl implements ExamPaperAnswerService {

    @Autowired
    private ExamPaperAnswerDao examPaperAnswerDao;

    @Override
    public int add(ExamPaperAnswer examPaperAnswer) {
        // TODO Auto-generated method stub
        return examPaperAnswerDao.add(examPaperAnswer);
    }

    @Override
    public int edit(ExamPaperAnswer examPaperAnswer) {
        // TODO Auto-generated method stub
        return examPaperAnswerDao.edit(examPaperAnswer);
    }

    @Override
    public List<ExamPaperAnswer> findList(Map<String, Object> queryMap) {
        // TODO Auto-generated method stub
        return examPaperAnswerDao.findList(queryMap);
    }

    @Override
    public int delete(List<ExamPaperAnswer> examPaperAnswers) {
        // TODO Auto-generated method stub
        return examPaperAnswerDao.delete(examPaperAnswers);
    }

    @Override
    public Integer getTotal(Map<String, Object> queryMap) {
        // TODO Auto-generated method stub
        return examPaperAnswerDao.getTotal(queryMap);
    }

    @Override
    public List<ExamPaperAnswer> findListByUser(Map<String, Object> queryMap) {
        // TODO Auto-generated method stub
        return examPaperAnswerDao.findListByUser(queryMap);
    }

    @Override
    public int submitAnswer(ExamPaperAnswer examPaperAnswer) {
        // TODO Auto-generated method stub
        return examPaperAnswerDao.submitAnswer(examPaperAnswer);
    }
}
