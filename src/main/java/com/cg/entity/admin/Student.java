package com.cg.entity.admin;

import com.cg.util.DateFormatUtil;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * @description: 考生实体类
 * @author: cg
 **/

public class Student {

    private Integer id;

    /**
     * 考生学号
     */
    private String studentId;

    /**
     * 所属学科专业ID
     */
    private Integer subjectId;

    /**
     * 登录名
     */
    private String name;

    /**
     * 登录密码
     */
    private String password;

    /**
     * 姓名
     */
    private String trueName;

    /**
     * 手机号
     */
    private String tel;

    /**
     * 注册时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", studentId=" + studentId +
                ", subjectId=" + subjectId +
                ", name='" + name + '\'' +
                ", trueName='" + trueName + '\'' +
                ", tel='" + tel + '\'' +
                ", createTime=" + DateFormatUtil.getDate(createTime) +
                '}';
    }
}
