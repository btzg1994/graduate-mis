package com.edu.mis.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "teacher")
public class Teacher {
    /**
     * 教师工号
     */
    @Id
    private String id;

    /**
     * 教师名称
     */
    private String name;

    /**
     * 登录密码
     */
    @Column(name = "login_pwd")
    private String loginPwd;

    /**
     * 性别
     */
    private Integer gender;

    /**
     * 电话
     */
    private String phone;

    /**
     * 出生日期
     */
    private String birthdate;

    /**
     * 主要科目
     */
    private String subject;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 备注
     */
    private String remark;

    /**
     * 角色id
     */
    @Column(name = "role_id")
    private Integer roleId;

    /**
     * 图片相对路径
     */
    @Column(name = "img_url")
    private String imgUrl;

    /**
     * 获取教师工号
     *
     * @return id - 教师工号
     */
    public String getId() {
        return id;
    }

    /**
     * 设置教师工号
     *
     * @param id 教师工号
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取教师名称
     *
     * @return name - 教师名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置教师名称
     *
     * @param name 教师名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取登录密码
     *
     * @return login_pwd - 登录密码
     */
    public String getLoginPwd() {
        return loginPwd;
    }

    /**
     * 设置登录密码
     *
     * @param loginPwd 登录密码
     */
    public void setLoginPwd(String loginPwd) {
        this.loginPwd = loginPwd;
    }

    /**
     * 获取性别
     *
     * @return gender - 性别
     */
    public Integer getGender() {
        return gender;
    }

    /**
     * 设置性别
     *
     * @param gender 性别
     */
    public void setGender(Integer gender) {
        this.gender = gender;
    }

    /**
     * 获取电话
     *
     * @return phone - 电话
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置电话
     *
     * @param phone 电话
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取出生日期
     *
     * @return birthdate - 出生日期
     */
    public String getBirthdate() {
        return birthdate;
    }

    /**
     * 设置出生日期
     *
     * @param birthdate 出生日期
     */
    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    /**
     * 获取主要科目
     *
     * @return subject - 主要科目
     */
    public String getSubject() {
        return subject;
    }

    /**
     * 设置主要科目
     *
     * @param subject 主要科目
     */
    public void setSubject(String subject) {
        this.subject = subject;
    }

    /**
     * 获取创建时间
     *
     * @return create_time - 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间
     *
     * @param createTime 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取备注
     *
     * @return remark - 备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置备注
     *
     * @param remark 备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取角色id
     *
     * @return role_id - 角色id
     */
    public Integer getRoleId() {
        return roleId;
    }

    /**
     * 设置角色id
     *
     * @param roleId 角色id
     */
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    /**
     * 获取图片相对路径
     *
     * @return img_url - 图片相对路径
     */
    public String getImgUrl() {
        return imgUrl;
    }

    /**
     * 设置图片相对路径
     *
     * @param imgUrl 图片相对路径
     */
    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }
}