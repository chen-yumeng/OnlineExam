package com.cg.page.admin;

import org.springframework.stereotype.Component;

/**
 * 分页基本信息
 *
 * @author cg
 */
@Component
public class Page {

    /**
     * 当前页码
     */
    private int page = 1;

    /**
     * 每页显示数量
     */
    private int rows;

    /**
     * 对应数据库中的偏移量
     */
    private int offset;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getOffset() {
        this.offset = (page - 1) * rows;
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

}
