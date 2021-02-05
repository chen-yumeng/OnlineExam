package com.cg.entity.admin;

/**
 * 菜单实体类
 *
 * @author cg
 */
public class Menu {

    private Integer id;

    /**
     * 父类id
     */
    private Integer parentId;

    /**
     * 父类id,用来匹配easyui的父类id
     */
    private Integer _parentId;

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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
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

    public Integer get_parentId() {
        _parentId = parentId;
        return _parentId;
    }

    public void set_parentId(Integer _parentId) {
        this._parentId = _parentId;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", parentId=" + parentId +
                ", _parentId=" + _parentId +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", icon='" + icon + '\'' +
                '}';
    }
}
