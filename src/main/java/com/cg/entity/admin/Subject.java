package com.cg.entity.admin;

/**
 * 学科专业实体类
 *
 * @author cg
 */
public class Subject {

    private Long id;

    /**
     * 学科名称
     */
    private String name;

    /**
     * 学科任课教师
     */
    private Long userId;

    /**
     * 学科备注
     */
    private String remark;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

}
