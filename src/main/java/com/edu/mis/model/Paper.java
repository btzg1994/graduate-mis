package com.edu.mis.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "paper")
public class Paper {
    /**
     * 论文id
     */
    @Id
    private Integer id;

    /**
     * 名称
     */
    private String name;

    /**
     * 类型
     */
    private String type;

    /**
     * 发布时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 发布教师id
     */
    @Column(name = "teacher_id")
    private String teacherId;

    /**
     * 备注
     */
    private String reamrk;

    /**
     * 简介
     */
    private String title;

    /**
     * 附件相对路径
     */
    private String filepath;

    /**
     * 获取论文id
     *
     * @return id - 论文id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置论文id
     *
     * @param id 论文id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取名称
     *
     * @return name - 名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置名称
     *
     * @param name 名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取类型
     *
     * @return type - 类型
     */
    public String getType() {
        return type;
    }

    /**
     * 设置类型
     *
     * @param type 类型
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取发布时间
     *
     * @return create_time - 发布时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置发布时间
     *
     * @param createTime 发布时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取发布教师id
     *
     * @return teacher_id - 发布教师id
     */
    public String getTeacherId() {
        return teacherId;
    }

    /**
     * 设置发布教师id
     *
     * @param teacherId 发布教师id
     */
    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    /**
     * 获取备注
     *
     * @return reamrk - 备注
     */
    public String getReamrk() {
        return reamrk;
    }

    /**
     * 设置备注
     *
     * @param reamrk 备注
     */
    public void setReamrk(String reamrk) {
        this.reamrk = reamrk;
    }

    /**
     * 获取简介
     *
     * @return title - 简介
     */
    public String getTitle() {
        return title;
    }

    /**
     * 设置简介
     *
     * @param title 简介
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 获取附件相对路径
     *
     * @return filepath - 附件相对路径
     */
    public String getFilepath() {
        return filepath;
    }

    /**
     * 设置附件相对路径
     *
     * @param filepath 附件相对路径
     */
    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }
}