package com.edu.mis.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "graduate")
public class Graduate {
    /**
     * 学号
     */
    @Id
    private String id;

    /**
     * 登录密码
     */
    @Column(name = "login_pwd")
    private String loginPwd;

    /**
     * 姓名
     */
    private String name;

    /**
     * 性别(0/1,女/男)
     */
    private Integer gender;

    /**
     * 电话
     */
    private String phone;

    /**
     * 身份证
     */
    private String idcard;

    /**
     * 籍贯
     */
    @Column(name = "native_place")
    private String nativePlace;

    private String remark;

    @Column(name = "create_time")
    private Date createTime;

    /**
     * 就业信息(-1:未就业)
     */
    @Column(name = "job_info_id")
    private Integer jobInfoId;

    /**
     * 指导教师id
     */
    @Column(name = "teacher_id")
    private String teacherId;

    /**
     * 角色id
     */
    @Column(name = "role_id")
    private Integer roleId;

    /**
     * 专业_id
     */
    @Column(name = "department_id")
    private Integer departmentId;

    /**
     * 学院_id
     */
    @Column(name = "institute_id")
    private Integer instituteId;

    /**
     * 图片相对路径
     */
    @Column(name = "img_url")
    private String imgUrl;

    /**
     * 获取学号
     *
     * @return id - 学号
     */
    public String getId() {
        return id;
    }

    /**
     * 设置学号
     *
     * @param id 学号
     */
    public void setId(String id) {
        this.id = id;
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
     * 获取姓名
     *
     * @return name - 姓名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置姓名
     *
     * @param name 姓名
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取性别(0/1,女/男)
     *
     * @return gender - 性别(0/1,女/男)
     */
    public Integer getGender() {
        return gender;
    }

    /**
     * 设置性别(0/1,女/男)
     *
     * @param gender 性别(0/1,女/男)
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
     * 获取身份证
     *
     * @return idcard - 身份证
     */
    public String getIdcard() {
        return idcard;
    }

    /**
     * 设置身份证
     *
     * @param idcard 身份证
     */
    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    /**
     * 获取籍贯
     *
     * @return native_place - 籍贯
     */
    public String getNativePlace() {
        return nativePlace;
    }

    /**
     * 设置籍贯
     *
     * @param nativePlace 籍贯
     */
    public void setNativePlace(String nativePlace) {
        this.nativePlace = nativePlace;
    }

    /**
     * @return remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return create_time
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取就业信息(-1:未就业)
     *
     * @return job_info_id - 就业信息(-1:未就业)
     */
    public Integer getJobInfoId() {
        return jobInfoId;
    }

    /**
     * 设置就业信息(-1:未就业)
     *
     * @param jobInfoId 就业信息(-1:未就业)
     */
    public void setJobInfoId(Integer jobInfoId) {
        this.jobInfoId = jobInfoId;
    }

    /**
     * 获取指导教师id
     *
     * @return teacher_id - 指导教师id
     */
    public String getTeacherId() {
        return teacherId;
    }

    /**
     * 设置指导教师id
     *
     * @param teacherId 指导教师id
     */
    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
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
     * 获取专业_id
     *
     * @return department_id - 专业_id
     */
    public Integer getDepartmentId() {
        return departmentId;
    }

    /**
     * 设置专业_id
     *
     * @param departmentId 专业_id
     */
    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    /**
     * 获取学院_id
     *
     * @return institute_id - 学院_id
     */
    public Integer getInstituteId() {
        return instituteId;
    }

    /**
     * 设置学院_id
     *
     * @param instituteId 学院_id
     */
    public void setInstituteId(Integer instituteId) {
        this.instituteId = instituteId;
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