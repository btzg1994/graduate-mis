package com.edu.mis.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "link")
public class Link {
    /**
     * 友链id
     */
    @Id
    private Integer id;

    /**
     * 友链名称
     */
    private String name;

    @Column(name = "create_time")
    private Date createTime;

    private String remark;

    /**
     * 友链url
     */
    private String url;

    /**
     * 获取友链id
     *
     * @return id - 友链id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置友链id
     *
     * @param id 友链id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取友链名称
     *
     * @return name - 友链名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置友链名称
     *
     * @param name 友链名称
     */
    public void setName(String name) {
        this.name = name;
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
     * 获取友链url
     *
     * @return url - 友链url
     */
    public String getUrl() {
        return url;
    }

    /**
     * 设置友链url
     *
     * @param url 友链url
     */
    public void setUrl(String url) {
        this.url = url;
    }
}