package com.cg.entity.admin;

/**
 * 菜单实体类
 *
 * @author cg
 */
public class Menu {

    private Long id;

    /**
     * 父类id
     */
    private Long parentId;

    /**
     * 父类id,用来匹配easyui的父类id
     */
    private Long _parentId;

    /**
     * 菜单名称
     */
    private String name;

    /**
     * 点击后的url
     */
    private String url;

    /**
     * 菜单icon图表
     */
    private String icon;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Long get_parentId() {
        _parentId = parentId;
        return _parentId;
    }

    public void set_parentId(Long _parentId) {
        this._parentId = _parentId;
    }
}
