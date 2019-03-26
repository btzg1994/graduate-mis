package com.edu.mis.model;

import javax.persistence.*;

@Table(name = "department")
public class Department {
    @Id
    private Integer id;

    private String name;

    @Column(name = "institute_id")
    private Integer instituteId;

    private String remark;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return institute_id
     */
    public Integer getInstituteId() {
        return instituteId;
    }

    /**
     * @param instituteId
     */
    public void setInstituteId(Integer instituteId) {
        this.instituteId = instituteId;
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