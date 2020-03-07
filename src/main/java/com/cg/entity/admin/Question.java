package com.cg.entity.admin;

import java.util.Date;

/**
 * 试题实体类
 *
 * @author Administrator
 */
public class Question {

    //试题类型定义
    /**
     * 单选题型
     */
    public static int QUESTION_TYPE_SINGLE = 0;
    /**
     * 多选题型
     */
    public static int QUESTION_TYPE_MUILT = 1;
    /**
     * 判断题型
     */
    public static int QUESTION_TYPE_CHARGE = 2;
    //试题分值定义，根据试题类型定义分值
    /**
     * 单选题型，每题2分
     */
    public static int QUESTION_TYPE_SINGLE_SCORE = 2;
    /**
     * 多选题型,每题4分
     */
    public static int QUESTION_TYPE_MUILT_SCORE = 4;
    /**
     * 判断题型,每题两分
     */
    public static int QUESTION_TYPE_CHARGE_SCORE = 2;

    private Long id;
    /**
     * 学科专业类型
     */
    private Long subjectId;
    /**
     * 试题类型
     */
    private int questionType;
    /**
     * 题目
     */
    private String title;
    /**
     * 分值
     */
    private int score;
    /**
     * 选项A
     */
    private String attrA;
    /**
     * 选项B
     */
    private String attrB;
    /**
     * 选项C
     */
    private String attrC;
    /**
     * 选项D
     */
    private String attrD;
    /**
     * 正确答案
     */
    private String answer;
    /**
     * 添加时间
     */
    private Date createTime;

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getQuestionType() {
        return questionType;
    }

    public void setQuestionType(int questionType) {
        this.questionType = questionType;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAttrA() {
        return attrA;
    }

    public void setAttrA(String attrA) {
        this.attrA = attrA;
    }

    public String getAttrB() {
        return attrB;
    }

    public void setAttrB(String attrB) {
        this.attrB = attrB;
    }

    public String getAttrC() {
        return attrC;
    }

    public void setAttrC(String attrC) {
        this.attrC = attrC;
    }

    public String getAttrD() {
        return attrD;
    }

    public void setAttrD(String attrD) {
        this.attrD = attrD;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Long subjectId) {
        this.subjectId = subjectId;
    }

    /**
     * 根据试题类型设置分值
     */
    public void setScoreByType() {
        if (questionType == QUESTION_TYPE_SINGLE) {
            score = QUESTION_TYPE_SINGLE_SCORE;
        }
        if (questionType == QUESTION_TYPE_MUILT) {
            score = QUESTION_TYPE_MUILT_SCORE;
        }
        if (questionType == QUESTION_TYPE_CHARGE) {
            score = QUESTION_TYPE_CHARGE_SCORE;
        }
    }
}
