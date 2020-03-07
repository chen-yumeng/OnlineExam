package com.cg.entity.admin;

import java.util.Date;

/**
 * @description: 试卷信息实体
 * @author: cg
 **/

public class ExamPaper {

    private Long id;
    /**
     * 所属考试ID
     */
    private Long examId;
    /**
     * 所属学生ID
     */
    private Long studentId;
    /**
     * 试卷状态：0：未考，1：已考
     */
    private int status = 0;
    /**
     * 总分
     */
    private int totalScore;
    /**
     * 得分
     */
    private int score;
    /**
     * 开始考试时间
     */
    private Date startExamTime;
    /**
     * 结束考试时间
     */
    private Date endExamTime;
    /**
     * 考试用时
     */
    private int useTime;
    /**
     * 添加时间
     */
    private Date createTime;
    /**
     * 考试实体
     */
    private Exam exam;

    public Long getExamId() {
        return examId;
    }

    public void setExamId(Long examId) {
        this.examId = examId;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(int totalScore) {
        this.totalScore = totalScore;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Date getStartExamTime() {
        return startExamTime;
    }

    public void setStartExamTime(Date startExamTime) {
        this.startExamTime = startExamTime;
    }

    public Date getEndExamTime() {
        return endExamTime;
    }

    public void setEndExamTime(Date endExamTime) {
        this.endExamTime = endExamTime;
    }

    public int getUseTime() {
        return useTime;
    }

    public void setUseTime(int useTime) {
        this.useTime = useTime;
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }
}
