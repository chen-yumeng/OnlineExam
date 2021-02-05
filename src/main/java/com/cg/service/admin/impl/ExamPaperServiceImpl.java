package com.cg.service.admin.impl;

import com.cg.dao.admin.ExamPaperDao;
import com.cg.entity.admin.ExamPaper;
import com.cg.service.admin.ExamPaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @description: 试卷service实现类
 * @author: cg
 **/
@Service
public class ExamPaperServiceImpl implements ExamPaperService {
    @Autowired
    private ExamPaperDao examPaperDao;

    @Override
    public int delete(List<ExamPaper> examPapers) {
        // TODO Auto-generated method stub
        return examPaperDao.delete(examPapers);
    }

    @Override
    public Integer getTotal(Map<String, Object> queryMap) {
        // TODO Auto-generated method stub
        return examPaperDao.getTotal(queryMap);
    }

    @Override
    public int add(ExamPaper examPaper) {
        // TODO Auto-generated method stub
        return examPaperDao.add(examPaper);
    }

    @Override
    public int edit(ExamPaper examPaper) {
        // TODO Auto-generated method stub
        return examPaperDao.edit(examPaper);
    }

    @Override
    public List<ExamPaper> findList(Map<String, Object> queryMap) {
        // TODO Auto-generated method stub
        return examPaperDao.findList(queryMap);
    }

    @Override
    public List<ExamPaper> findHistory(Map<String, Object> queryMap) {
        // TODO Auto-generated method stub
        return examPaperDao.findHistory(queryMap);
    }

    @Override
    public Integer getHistoryTotal(Map<String, Object> queryMap) {
        // TODO Auto-generated method stub
        return examPaperDao.getHistoryTotal(queryMap);
    }

    @Override
    public ExamPaper find(Map<String, Object> queryMap) {
        // TODO Auto-generated method stub
        return examPaperDao.find(queryMap);
    }

    @Override
    public int submitPaper(ExamPaper examPaper) {
        // TODO Auto-generated method stub
        return examPaperDao.submitPaper(examPaper);
    }

    @Override
    public List<Map<String, Object>> getExamStats(Integer examId) {
        // TODO Auto-generated method stub
        return examPaperDao.getExamStats(examId);
    }

    @Override
    public ExamPaper findById(Integer id) {
        return examPaperDao.findById(id);
    }
}
