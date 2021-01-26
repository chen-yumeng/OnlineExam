package com.cg.service.admin.impl;

import com.cg.dao.admin.QuestionDao;
import com.cg.entity.admin.Question;
import com.cg.service.admin.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @description: 试题service实现类
 * @author: cg
 **/
@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private QuestionDao questionDao;

    @Override
    public int add(Question question) {
        // TODO Auto-generated method stub
        return questionDao.add(question);
    }

    @Override
    public int edit(Question question) {
        // TODO Auto-generated method stub
        return questionDao.edit(question);
    }

    @Override
    public List<Question> findList(Map<String, Object> queryMap) {
        // TODO Auto-generated method stub
        return questionDao.findList(queryMap);
    }

    @Override
    public int delete(List<Question> questions) {
        // TODO Auto-generated method stub
        return questionDao.delete(questions);
    }

    @Override
    public Integer getTotal(Map<String, Object> queryMap) {
        // TODO Auto-generated method stub
        return questionDao.getTotal(queryMap);
    }

    @Override
    public Question findByTitle(String title) {
        // TODO Auto-generated method stub
        return questionDao.findByTitle(title);
    }

    @Override
    public int getQuestionNumByType(Map<String, Long> queryMap) {
        // TODO Auto-generated method stub
        return questionDao.getQuestionNumByType(queryMap);
    }

    @Override
    public Question findById(Long id) {
        // TODO Auto-generated method stub
        return questionDao.findById(id);
    }
}
