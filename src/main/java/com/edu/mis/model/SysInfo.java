package com.edu.mis.model;

import javax.persistence.*;

@Table(name = "sys_info")
public class SysInfo {
    @Id
    private Integer id;

    /**
     * 系统公告
     */
    @Column(name = "sys_notice")
    private String sysNotice;

    /**
     * 系统简介
     */
    @Column(name = "sys_intro")
    private String sysIntro;

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
     * 获取系统公告
     *
     * @return sys_notice - 系统公告
     */
    public String getSysNotice() {
        return sysNotice;
    }

    /**
     * 设置系统公告
     *
     * @param sysNotice 系统公告
     */
    public void setSysNotice(String sysNotice) {
        this.sysNotice = sysNotice;
    }

    /**
     * 获取系统简介
     *
     * @return sys_intro - 系统简介
     */
    public String getSysIntro() {
        return sysIntro;
    }

    /**
     * 设置系统简介
     *
     * @param sysIntro 系统简介
     */
    public void setSysIntro(String sysIntro) {
        this.sysIntro = sysIntro;
    }
}