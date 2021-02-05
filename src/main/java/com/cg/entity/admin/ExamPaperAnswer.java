package com.cg.entity.admin;

/**
 * @description: 试卷答题信息实体
 * @author: cg
 **/

public class ExamPaperAnswer {

    private Integer id;
    /**
     * 所属学生ID
     */
    private Integer studentId;
    /**
     * 所属考试ID
     */
    private Integer examId;
    /**
     * 所属试卷ID
     */
    private Integer examPaperId;
    /**
     * 所属试题ID
     */
    private Integer questionId;
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getExamPaperId() {
        return examPaperId;
    }

    public void setExamPaperId(Integer examPaperId) {
        this.examPaperId = examPaperId;
    }

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
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

    public Integer getExamId() {
        return examId;
    }

    public void setExamId(Integer examId) {
        this.examId = examId;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    @Override
    public String toString() {
        return "ExamPaperAnswer{" +
                "id=" + id +
                ", studentId=" + studentId +
                ", examId=" + examId +
                ", examPaperId=" + examPaperId +
                ", questionId=" + questionId +
                ", answer='" + answer + '\'' +
                ", isCorrect=" + isCorrect +
                '}';
    }
}
