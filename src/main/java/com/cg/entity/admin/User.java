package com.cg.entity.admin;

/**
 * 用户实体类
 *
 * @author cg
 */
public class User {
    /**
     * 用户id，设置自增
     */
    private Integer id;
    /**
     * 用户名，登录名
     */
    private String username;
    /**
     * 登录密码
     */
    private String password;
    /**
     * 所属角色id
     */
    private Integer roleId;
    /**
     * 头像照片地址
     */
    private String photo;
    /**
     * 性别0,代表未知，1代表男，2代表女
     */
    private int sex;
    /**
     * 年龄
     */
    private Integer age;
    /**
     * 家庭住址
     */
    private String address;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

}
