package com.cg.entity.admin;

import java.util.Date;

/**
 * 系统日志
 *
 * @author cg
 */
public class Log {

    private Long id;

    /**
     * 日志内容
     */
    private String content;

    /**
     * 创建时间
     */
    private Date createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
