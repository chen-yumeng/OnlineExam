package com.cg.service.admin.impl;

import com.cg.dao.admin.SubjectDao;
import com.cg.entity.admin.Subject;
import com.cg.service.admin.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @description: 学科专业service实现类
 * @author: cg
 **/
@Service
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    SubjectDao subjectDao;

    @Override
    public int add(Subject subject) {
        return subjectDao.add(subject);
    }

    @Override
    public int edit(Subject subject) {
        return subjectDao.edit(subject);
    }

    @Override
    public List<Subject> findList(Map<String, Object> queryMap) {
        return subjectDao.findList(queryMap);
    }

    @Override
    public int delete(List<Subject> subjects) {
        return subjectDao.delete(subjects);
    }

    @Override
    public Integer getTotal(Map<String, Object> queryMap) {
        return subjectDao.getTotal(queryMap);
    }

    @Override
    public Subject findById(Integer id) {
        return subjectDao.findById(id);
    }

    @Override
    public List<Subject> findByUserId(Integer userId) {
        return subjectDao.findByUserId(userId);
    }
}
