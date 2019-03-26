package com.edu.mis.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "message")
public class Message {
    /**
     * 留言id
     */
    @Id
    private Integer id;

    /**
     * 留言人昵称
     */
    private String nickname;

    /**
     * qq
     */
    private String qq;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 电话
     */
    private String phone;

    /**
     * 留言时间
     */
    @Column(name = "leave_time")
    private Date leaveTime;

    /**
     * 回复时间
     */
    @Column(name = "reply_time")
    private Date replyTime;

    /**
     * 回复教师id
     */
    @Column(name = "reply_teacher_id")
    private String replyTeacherId;

    /**
     * 备注
     */
    private String remark;

    /**
     * 留言内容
     */
    private String content;

    /**
     * 回复内容
     */
    @Column(name = "reply_content")
    private String replyContent;

    /**
     * 获取留言id
     *
     * @return id - 留言id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置留言id
     *
     * @param id 留言id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取留言人昵称
     *
     * @return nickname - 留言人昵称
     */
    public String getNickname() {
        return nickname;
    }

    /**
     * 设置留言人昵称
     *
     * @param nickname 留言人昵称
     */
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    /**
     * 获取qq
     *
     * @return qq - qq
     */
    public String getQq() {
        return qq;
    }

    /**
     * 设置qq
     *
     * @param qq qq
     */
    public void setQq(String qq) {
        this.qq = qq;
    }

    /**
     * 获取邮箱
     *
     * @return email - 邮箱
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置邮箱
     *
     * @param email 邮箱
     */
    public void setEmail(String email) {
        this.email = email;
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
     * 获取留言时间
     *
     * @return leave_time - 留言时间
     */
    public Date getLeaveTime() {
        return leaveTime;
    }

    /**
     * 设置留言时间
     *
     * @param leaveTime 留言时间
     */
    public void setLeaveTime(Date leaveTime) {
        this.leaveTime = leaveTime;
    }

    /**
     * 获取回复时间
     *
     * @return reply_time - 回复时间
     */
    public Date getReplyTime() {
        return replyTime;
    }

    /**
     * 设置回复时间
     *
     * @param replyTime 回复时间
     */
    public void setReplyTime(Date replyTime) {
        this.replyTime = replyTime;
    }

    /**
     * 获取回复教师id
     *
     * @return reply_teacher_id - 回复教师id
     */
    public String getReplyTeacherId() {
        return replyTeacherId;
    }

    /**
     * 设置回复教师id
     *
     * @param replyTeacherId 回复教师id
     */
    public void setReplyTeacherId(String replyTeacherId) {
        this.replyTeacherId = replyTeacherId;
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
     * 获取留言内容
     *
     * @return content - 留言内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置留言内容
     *
     * @param content 留言内容
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 获取回复内容
     *
     * @return reply_content - 回复内容
     */
    public String getReplyContent() {
        return replyContent;
    }

    /**
     * 设置回复内容
     *
     * @param replyContent 回复内容
     */
    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }
}