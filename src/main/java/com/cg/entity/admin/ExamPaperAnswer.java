package com.cg.entity.admin;

/**
 * @description: 试卷答题信息实体
 * @author: cg
 **/

public class ExamPaperAnswer {

    private Long id;
    /**
     * 所属学生ID
     */
    private Long studentId;
    /**
     * 所属考试ID
     */
    private Long examId;
    /**
     * 所属试卷ID
     */
    private Long examPaperId;
    /**
     * 所属试题ID
     */
    private Long questionId;
    /**
     * 提交答案
     */
    private String answer;
    /**
     * 是否正确
     */
    private int isCorrect;
    /**
     * 试题集
     */
    private Question question;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public Long getExamPaperId() {
        return examPaperId;
    }

    public void setExamPaperId(Long examPaperId) {
        this.examPaperId = examPaperId;
    }

    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public int getIsCorrect() {
        return isCorrect;
    }

    public void setIsCorrect(int isCorrect) {
        this.isCorrect = isCorrect;
    }

    public Long getExamId() {
        return examId;
    }

    public void setExamId(Long examId) {
        this.examId = examId;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }
}
