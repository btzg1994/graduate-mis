package com.edu.mis.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "role")
public class Role {
    /**
     * 角色id
     */
    @Id
    private Integer id;

    /**
     * 角色名称
     */
    private String name;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 菜单id
     */
    @Column(name = "menu_id_list")
    private String menuIdList;

    private String remark;

    /**
     * 获取角色id
     *
     * @return id - 角色id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置角色id
     *
     * @param id 角色id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取角色名称
     *
     * @return name - 角色名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置角色名称
     *
     * @param name 角色名称
     */
    public void setName(String name) {
        this.name = name;
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
     * 获取菜单id
     *
     * @return menu_id_list - 菜单id
     */
    public String getMenuIdList() {
        return menuIdList;
    }

    /**
     * 设置菜单id
     *
     * @param menuIdList 菜单id
     */
    public void setMenuIdList(String menuIdList) {
        this.menuIdList = menuIdList;
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