package com.edu.mis.model;

import javax.persistence.*;

@Table(name = "job_info")
public class JobInfo {
    /**
     * 就业信息id
     */
    @Id
    private Integer id;

    /**
     * 就业状况
     */
    private Integer status;

    /**
     * 就业状况满意度
     */
    private Integer attitude;

    /**
     * 所属行业
     */
    private Integer industry;

    /**
     * 所在地区
     */
    private Integer area;

    /**
     * 月薪
     */
    private Integer salary;

    private String remark;

    /**
     * 获取就业信息id
     *
     * @return id - 就业信息id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置就业信息id
     *
     * @param id 就业信息id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取就业状况
     *
     * @return status - 就业状况
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置就业状况
     *
     * @param status 就业状况
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取就业状况满意度
     *
     * @return attitude - 就业状况满意度
     */
    public Integer getAttitude() {
        return attitude;
    }

    /**
     * 设置就业状况满意度
     *
     * @param attitude 就业状况满意度
     */
    public void setAttitude(Integer attitude) {
        this.attitude = attitude;
    }

    /**
     * 获取所属行业
     *
     * @return industry - 所属行业
     */
    public Integer getIndustry() {
        return industry;
    }

    /**
     * 设置所属行业
     *
     * @param industry 所属行业
     */
    public void setIndustry(Integer industry) {
        this.industry = industry;
    }

    /**
     * 获取所在地区
     *
     * @return area - 所在地区
     */
    public Integer getArea() {
        return area;
    }

    /**
     * 设置所在地区
     *
     * @param area 所在地区
     */
    public void setArea(Integer area) {
        this.area = area;
    }

    /**
     * 获取月薪
     *
     * @return salary - 月薪
     */
    public Integer getSalary() {
        return salary;
    }

    /**
     * 设置月薪
     *
     * @param salary 月薪
     */
    public void setSalary(Integer salary) {
        this.salary = salary;
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
}