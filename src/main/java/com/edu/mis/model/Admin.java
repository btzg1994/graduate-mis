package com.edu.mis.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "admin")
public class Admin {
    @Id
    @Column(name = "login_name")
    private String loginName;

    @Column(name = "login_pwd")
    private String loginPwd;

    private String name;

    @Column(name = "role_id")
    private Integer roleId;

    @Column(name = "create_time")
    private Date createTime;

    private String remark;

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getLoginPwd() {
        return loginPwd;
    }

    public void setLoginPwd(String loginPwd) {
        this.loginPwd = loginPwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}