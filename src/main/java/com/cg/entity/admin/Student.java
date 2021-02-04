package com.cg.entity.admin;

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
    private Integer studentId;

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
    private Date createTime;

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
}
