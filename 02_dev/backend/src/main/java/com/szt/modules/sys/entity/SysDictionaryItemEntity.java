package com.szt.modules.sys.entity;
import com.szt.common.CommonConstant;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.hibernate.validator.constraints.NotBlank;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.apache.shiro.SecurityUtils;
import com.szt.modules.sys.entity.SysUserEntity;
import com.szt.modules.sys.entity.SysCommcomFieldEntity;
import javax.validation.constraints.NotNull;
import org.springframework.stereotype.Controller;
    import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;

/**
 * 字典
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-07-09 23:03:33
 */
@TableName("sys_dictionary_item")
public class SysDictionaryItemEntity implements Serializable {
    private static final long serialVersionUID = 1L;

        /**
         *  主键
         */
        @TableId
        @ApiModelProperty(value = " 主键",required = false)
    private Long id;
        /**
         * 父主键
         */
        @ApiModelProperty(value = "父主键",required = true)
    private String pid;
        /**
         * 编码
         */
        @ApiModelProperty(value = "编码",required = true)
    private String code;
        /**
         * 名称
         */
        @ApiModelProperty(value = "名称",required = true)
    private String name;
        /**
         * 表名
         */
        @ApiModelProperty(value = "表名",required = true)
    private String tableName;
        /**
         * 是否启用
         */
            @NotNull(message="是否启用不能为空")
        @ApiModelProperty(value = "是否启用",required = false)
    private Integer enabled;
        /**
         * 删除标识
         */
        @ApiModelProperty(value = "删除标识",required = true)
    private String deleteFlag;
        /**
         * 描述
         */
        @ApiModelProperty(value = "描述",required = true)
    private String description;
        /**
         * 创建日期
         */
        @ApiModelProperty(value = "创建日期",required = true)
        @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
        @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date createTime;
        /**
         * 创建人主键
         */
        @ApiModelProperty(value = "创建人主键",required = true)
    private String createUserId;
        /**
         * 创建人
         */
        @ApiModelProperty(value = "创建人",required = true)
    private String createBy;
        /**
         * 更新时间
         */
        @ApiModelProperty(value = "更新时间",required = true)
        @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
        @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date updateTime;
        /**
         * 更新人主键
         */
        @ApiModelProperty(value = "更新人主键",required = true)
    private String updateUserId;
        /**
         * 更新人
         */
        @ApiModelProperty(value = "更新人",required = true)
    private String updateBy;
        /**
         * 创建Mac
         */
        @ApiModelProperty(value = "创建Mac",required = true)
    private String createMac;
        /**
         * 更新mac
         */
        @ApiModelProperty(value = "更新mac",required = true)
    private String updateMac;
        /**
         * 创建IP
         */
        @ApiModelProperty(value = "创建IP",required = true)
    private String createIp;
        /**
         * 更新ip
         */
        @ApiModelProperty(value = "更新ip",required = true)
    private String updateIp;
        /**
         * 版本号
         */
        @ApiModelProperty(value = "版本号",required = true)
    private Integer versionNo;
        /**
         * 排序
         */
        @ApiModelProperty(value = "排序",required = true)
    private Integer sort;

        /**
         * 设置： 主键
         */
        public void setId(Long id) {
            this.id = id;
        }
        /**
         * 获取： 主键
         */
        public Long getId() {
            return id;
        }
        /**
         * 设置：父主键
         */
        public void setPid(String pid) {
            this.pid = pid;
        }
        /**
         * 获取：父主键
         */
        public String getPid() {
            return pid;
        }
        /**
         * 设置：编码
         */
        public void setCode(String code) {
            this.code = code;
        }
        /**
         * 获取：编码
         */
        public String getCode() {
            return code;
        }
        /**
         * 设置：名称
         */
        public void setName(String name) {
            this.name = name;
        }
        /**
         * 获取：名称
         */
        public String getName() {
            return name;
        }
        /**
         * 设置：表名
         */
        public void setTableName(String tableName) {
            this.tableName = tableName;
        }
        /**
         * 获取：表名
         */
        public String getTableName() {
            return tableName;
        }
        /**
         * 设置：是否启用
         */
        public void setEnabled(Integer enabled) {
            this.enabled = enabled;
        }
        /**
         * 获取：是否启用
         */
        public Integer getEnabled() {
            return enabled;
        }
        /**
         * 设置：删除标识
         */
        public void setDeleteFlag(String deleteFlag) {
            this.deleteFlag = deleteFlag;
        }
        /**
         * 获取：删除标识
         */
        public String getDeleteFlag() {
            return deleteFlag;
        }
        /**
         * 设置：描述
         */
        public void setDescription(String description) {
            this.description = description;
        }
        /**
         * 获取：描述
         */
        public String getDescription() {
            return description;
        }
        /**
         * 设置：创建日期
         */
        public void setCreateTime(Date createTime) {
            this.createTime = createTime;
        }
        /**
         * 获取：创建日期
         */
        public Date getCreateTime() {
            return createTime;
        }
        /**
         * 设置：创建人主键
         */
        public void setCreateUserId(String createUserId) {
            this.createUserId = createUserId;
        }
        /**
         * 获取：创建人主键
         */
        public String getCreateUserId() {
            return createUserId;
        }
        /**
         * 设置：创建人
         */
        public void setCreateBy(String createBy) {
            this.createBy = createBy;
        }
        /**
         * 获取：创建人
         */
        public String getCreateBy() {
            return createBy;
        }
        /**
         * 设置：更新时间
         */
        public void setUpdateTime(Date updateTime) {
            this.updateTime = updateTime;
        }
        /**
         * 获取：更新时间
         */
        public Date getUpdateTime() {
            return updateTime;
        }
        /**
         * 设置：更新人主键
         */
        public void setUpdateUserId(String updateUserId) {
            this.updateUserId = updateUserId;
        }
        /**
         * 获取：更新人主键
         */
        public String getUpdateUserId() {
            return updateUserId;
        }
        /**
         * 设置：更新人
         */
        public void setUpdateBy(String updateBy) {
            this.updateBy = updateBy;
        }
        /**
         * 获取：更新人
         */
        public String getUpdateBy() {
            return updateBy;
        }
        /**
         * 设置：创建Mac
         */
        public void setCreateMac(String createMac) {
            this.createMac = createMac;
        }
        /**
         * 获取：创建Mac
         */
        public String getCreateMac() {
            return createMac;
        }
        /**
         * 设置：更新mac
         */
        public void setUpdateMac(String updateMac) {
            this.updateMac = updateMac;
        }
        /**
         * 获取：更新mac
         */
        public String getUpdateMac() {
            return updateMac;
        }
        /**
         * 设置：创建IP
         */
        public void setCreateIp(String createIp) {
            this.createIp = createIp;
        }
        /**
         * 获取：创建IP
         */
        public String getCreateIp() {
            return createIp;
        }
        /**
         * 设置：更新ip
         */
        public void setUpdateIp(String updateIp) {
            this.updateIp = updateIp;
        }
        /**
         * 获取：更新ip
         */
        public String getUpdateIp() {
            return updateIp;
        }
        /**
         * 设置：版本号
         */
        public void setVersionNo(Integer versionNo) {
            this.versionNo = versionNo;
        }
        /**
         * 获取：版本号
         */
        public Integer getVersionNo() {
            return versionNo;
        }
        /**
         * 设置：排序
         */
        public void setSort(Integer sort) {
            this.sort = sort;
        }
        /**
         * 获取：排序
         */
        public Integer getSort() {
            return sort;
        }

    public void insert(){
        this.createTime = new Date();
        this.updateTime = new Date();
        this.sort = this.sort == null ? 0 : this.sort;
        if(this.deleteFlag == null || this.deleteFlag.length()==0){
            this.deleteFlag = "0";
        }
        this.versionNo=1;
    }
    public void update(){
        this.updateTime = new Date();
    }
}
