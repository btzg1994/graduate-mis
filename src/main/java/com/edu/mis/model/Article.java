package com.edu.mis.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "article")
public class Article {
    /**
     * 文章id
     */
    @Id
    private Integer id;

    /**
     * 文章标题
     */
    private String title;

    /**
     * 文章分类(1/2/3,公告/新闻/招聘信息)
     */
    private Integer type;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    private String remark;

    /**
     * 文章内容
     */
    private String content;

    /**
     * 图片相对路径
     */
    @Column(name = "img_url")
    private String imgUrl;

    /**
     * 获取文章id
     *
     * @return id - 文章id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置文章id
     *
     * @param id 文章id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取文章标题
     *
     * @return title - 文章标题
     */
    public String getTitle() {
        return title;
    }

    /**
     * 设置文章标题
     *
     * @param title 文章标题
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 获取文章分类(1/2/3,公告/新闻/招聘信息)
     *
     * @return type - 文章分类(1/2/3,公告/新闻/招聘信息)
     */
    public Integer getType() {
        return type;
    }

    /**
     * 设置文章分类(1/2/3,公告/新闻/招聘信息)
     *
     * @param type 文章分类(1/2/3,公告/新闻/招聘信息)
     */
    public void setType(Integer type) {
        this.type = type;
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
     * 获取文章内容
     *
     * @return content - 文章内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置文章内容
     *
     * @param content 文章内容
     */
    public void setContent(String content) {
        this.content = content;
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