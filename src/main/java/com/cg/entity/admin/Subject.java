package com.cg.entity.admin;

/**
 * 学科专业实体类
 *
 * @author cg
 */
public class Subject {

    private Integer id;

    /**
     * 学科名称
     */
    private String name;

    /**
     * 学科任课教师
     */
    private Integer userId;

    /**
     * 学科备注
     */
    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

}
