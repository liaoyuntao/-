package com.szt.modules.xjdc.entity;
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
 * 佣金方式
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-27 11:04:21
 */
@TableName("xjdc_house_source")
public class XjdcHouseSourceEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId
    @ApiModelProperty(value = "主键",required = false)
    private Long id;
    /**
     * openid
     */
    @ApiModelProperty(value = "openid",required = true)
    private String openid;
    /**
     * 区域,地址
     */
    @ApiModelProperty(value = "区域,地址",required = true)
    private String region;
    /**
     * 联系人
     */
    @NotBlank(message="联系人不能为空")
    @ApiModelProperty(value = "联系人",required = false)
    private String name;
    /**
     * 联系电话
     */
    @NotBlank(message="联系电话不能为空")
    @ApiModelProperty(value = "联系电话",required = false)
    private String phone;
    /**
     * 配套设备&0-电视,1-冰箱,2-洗衣机,3-空调,4-沙发,5-柜子,6-床,7-衣橱,8-宽带,9-暖气,10-热水器,11-天然气
     */
    @ApiModelProperty(value = "配套设备&0-电视,1-冰箱,2-洗衣机,3-空调,4-沙发,5-柜子,6-床,7-衣橱,8-宽带,9-暖气,10-热水器,11-天然气",required = true)
    private String facility;
    /**
     * 面积(平方米)
     */
    @ApiModelProperty(value = "面积(平方米)",required = true)
    private Float square;
    /**
     * 类型@1-商品房,2-房改房,3-公寓,4-其他
     */
    @ApiModelProperty(value = "类型@1-商品房,2-房改房,3-公寓,4-其他",required = true)
    private String houseStyle;
    /**
     * 户型@1-一室一厅,2-二室一厅,3-三室一厅,4-其他
     */
    @ApiModelProperty(value = "户型@1-一室一厅,2-二室一厅,3-三室一厅,4-其他",required = true)
    private String houseType;
    /**
     * 朝向
     */
    @ApiModelProperty(value = "朝向",required = true)
    private String orientation;
    /**
     * 楼龄(年)
     */
    @ApiModelProperty(value = "楼龄(年)",required = true)
    private Integer buildingAge;
    /**
     * 提供人类型@0-业主,1-代理人
     */
    @NotBlank(message="提供人类型不能为空")
    @ApiModelProperty(value = "提供人类型@0-业主,1-代理人",required = false)
    private String providerType;
    /**
     * 楼层
     */
    @ApiModelProperty(value = "楼层",required = true)
    private String floor;
    /**
     * 楼高(总层数)
     */
    @ApiModelProperty(value = "楼高(总层数)",required = true)
    private String houseHeight;
    /**
     * 架构@0-框架结构j,1-混合结构,2-其他
     */
    @ApiModelProperty(value = "架构@0-框架结构j,1-混合结构,2-其他",required = true)
    private String houseFrame;
    /**
     * 电梯@0-有,1-无
     */
    @ApiModelProperty(value = "电梯@0-有,1-无",required = true)
    private String hasElevator;
    /**
     * 是否家电@0-带家电,1-不带家电
     */
    @ApiModelProperty(value = "是否家电@0-带家电,1-不带家电",required = true)
    private String household;
    /**
     * 价格(万元)
     */
    @ApiModelProperty(value = "价格(万元)",required = true)
    private BigDecimal price;
    /**
     * 装修@1-毛胚,2-简装,3-精装
     */
    @ApiModelProperty(value = "装修@1-毛胚,2-简装,3-精装",required = true)
    private String decoration;
    /**
     * 房源标签&0-近地铁,1-近商圈,2-电梯楼,3-品质小区,4-品质小区,5-随时看房
     */
    @ApiModelProperty(value = "房源标签&0-近地铁,1-近商圈,2-电梯楼,3-品质小区,4-品质小区,5-随时看房",required = true)
    private String labelTag;
    /**
     * 房源图片
     */
    @ApiModelProperty(value = "房源图片",required = true)
    private String imagePath;
    /**
     * 房源描述
     */
    @ApiModelProperty(value = "房源描述",required = true)
    private String describeInfo;
    /**
     * 模块@0-二手房出售,1-租房
     */
    @ApiModelProperty(value = "模块@0-二手房出售,1-租房",required = true)
    private String module;
    /**
     * 支付方式@0-一次性,1-按揭
     */
    @ApiModelProperty(value = "支付方式@0-一次性,1-按揭",required = true)
    private String payType;
    /**
     * 其他(满二唯一,满五唯一,满五不唯一)
     */
    @ApiModelProperty(value = "其他(满二唯一,满五唯一,满五不唯一)",required = true)
    private String others;
    /**
     * 佣金方式
     */
    @ApiModelProperty(value = "佣金方式",required = true)
    private String commissionType;
    /**
     * 备注
     */
    @ApiModelProperty(value = "备注",required = true)
    private String remarks;
    /**
     * 版本号
     */
    @NotNull(message="版本号不能为空")
    @ApiModelProperty(value = "版本号",required = false)
    private Integer versionNo;
    /**
     * 创建人id
     */
    @ApiModelProperty(value = "创建人id",required = true)
    private Long createBy;
    /**
     * 创建时间
     */
    @NotNull(message="创建时间不能为空")
    @ApiModelProperty(value = "创建时间",required = false)
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date createTime;
    /**
     * 修改人id
     */
    @ApiModelProperty(value = "修改人id",required = true)
    private Long updateBy;
    /**
     * 修改时间
     */
    @NotNull(message="修改时间不能为空")
    @ApiModelProperty(value = "修改时间",required = false)
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date updateTime;
    /**
     * 逻辑删除@0-存在,1-隐藏,2-删除,3-停用
     */
    @NotBlank(message="逻辑删除不能为空")
    @ApiModelProperty(value = "逻辑删除@0-存在,1-隐藏,2-删除,3-停用",required = false)
    private String deleteFlag;
    /**
     * 排序
     */
    @NotNull(message="排序不能为空")
    @ApiModelProperty(value = "排序",required = false)
    private Integer sort;

    /**
     * 设置：主键
     */
    public void setId(Long id) {
        this.id = id;
    }
    /**
     * 获取：主键
     */
    public Long getId() {
        return id;
    }
    /**
     * 设置：openid
     */
    public void setOpenid(String openid) {
        this.openid = openid;
    }
    /**
     * 获取：openid
     */
    public String getOpenid() {
        return openid;
    }
    /**
     * 设置：区域,地址
     */
    public void setRegion(String region) {
        this.region = region;
    }
    /**
     * 获取：区域,地址
     */
    public String getRegion() {
        return region;
    }
    /**
     * 设置：联系人
     */
    public void setName(String name) {
        this.name = name;
    }
    /**
     * 获取：联系人
     */
    public String getName() {
        return name;
    }
    /**
     * 设置：联系电话
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }
    /**
     * 获取：联系电话
     */
    public String getPhone() {
        return phone;
    }
    /**
     * 设置：配套设备&0-电视,1-冰箱,2-洗衣机,3-空调,4-沙发,5-柜子,6-床,7-衣橱,8-宽带,9-暖气,10-热水器,11-天然气
     */
    public void setFacility(String facility) {
        this.facility = facility;
    }
    /**
     * 获取：配套设备&0-电视,1-冰箱,2-洗衣机,3-空调,4-沙发,5-柜子,6-床,7-衣橱,8-宽带,9-暖气,10-热水器,11-天然气
     */
    public String getFacility() {
        return facility;
    }
    /**
     * 设置：面积(平方米)
     */
    public void setSquare(Float square) {
        this.square = square;
    }
    /**
     * 获取：面积(平方米)
     */
    public Float getSquare() {
        return square;
    }
    /**
     * 设置：类型@1-商品房,2-房改房,3-公寓,4-其他
     */
    public void setHouseStyle(String houseStyle) {
        this.houseStyle = houseStyle;
    }
    /**
     * 获取：类型@1-商品房,2-房改房,3-公寓,4-其他
     */
    public String getHouseStyle() {
        return houseStyle;
    }
    /**
     * 设置：户型@1-一室一厅,2-二室一厅,3-三室一厅,4-其他
     */
    public void setHouseType(String houseType) {
        this.houseType = houseType;
    }
    /**
     * 获取：户型@1-一室一厅,2-二室一厅,3-三室一厅,4-其他
     */
    public String getHouseType() {
        return houseType;
    }
    /**
     * 设置：朝向
     */
    public void setOrientation(String orientation) {
        this.orientation = orientation;
    }
    /**
     * 获取：朝向
     */
    public String getOrientation() {
        return orientation;
    }
    /**
     * 设置：楼龄(年)
     */
    public void setBuildingAge(Integer buildingAge) {
        this.buildingAge = buildingAge;
    }
    /**
     * 获取：楼龄(年)
     */
    public Integer getBuildingAge() {
        return buildingAge;
    }
    /**
     * 设置：提供人类型@0-业主,1-代理人
     */
    public void setProviderType(String providerType) {
        this.providerType = providerType;
    }
    /**
     * 获取：提供人类型@0-业主,1-代理人
     */
    public String getProviderType() {
        return providerType;
    }
    /**
     * 设置：楼层
     */
    public void setFloor(String floor) {
        this.floor = floor;
    }
    /**
     * 获取：楼层
     */
    public String getFloor() {
        return floor;
    }
    /**
     * 设置：楼高(总层数)
     */
    public void setHouseHeight(String houseHeight) {
        this.houseHeight = houseHeight;
    }
    /**
     * 获取：楼高(总层数)
     */
    public String getHouseHeight() {
        return houseHeight;
    }
    /**
     * 设置：架构@0-框架结构j,1-混合结构,2-其他
     */
    public void setHouseFrame(String houseFrame) {
        this.houseFrame = houseFrame;
    }
    /**
     * 获取：架构@0-框架结构j,1-混合结构,2-其他
     */
    public String getHouseFrame() {
        return houseFrame;
    }
    /**
     * 设置：电梯@0-有,1-无
     */
    public void setHasElevator(String hasElevator) {
        this.hasElevator = hasElevator;
    }
    /**
     * 获取：电梯@0-有,1-无
     */
    public String getHasElevator() {
        return hasElevator;
    }
    /**
     * 设置：是否家电@0-带家电,1-不带家电
     */
    public void setHousehold(String household) {
        this.household = household;
    }
    /**
     * 获取：是否家电@0-带家电,1-不带家电
     */
    public String getHousehold() {
        return household;
    }
    /**
     * 设置：价格(万元)
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    /**
     * 获取：价格(万元)
     */
    public BigDecimal getPrice() {
        return price;
    }
    /**
     * 设置：装修@1-毛胚,2-简装,3-精装
     */
    public void setDecoration(String decoration) {
        this.decoration = decoration;
    }
    /**
     * 获取：装修@1-毛胚,2-简装,3-精装
     */
    public String getDecoration() {
        return decoration;
    }
    /**
     * 设置：房源标签&0-近地铁,1-近商圈,2-电梯楼,3-品质小区,4-品质小区,5-随时看房
     */
    public void setLabelTag(String labelTag) {
        this.labelTag = labelTag;
    }
    /**
     * 获取：房源标签&0-近地铁,1-近商圈,2-电梯楼,3-品质小区,4-品质小区,5-随时看房
     */
    public String getLabelTag() {
        return labelTag;
    }
    /**
     * 设置：房源图片
     */
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
    /**
     * 获取：房源图片
     */
    public String getImagePath() {
        return imagePath;
    }
    /**
     * 设置：房源描述
     */
    public void setDescribeInfo(String describeInfo) {
        this.describeInfo = describeInfo;
    }
    /**
     * 获取：房源描述
     */
    public String getDescribeInfo() {
        return describeInfo;
    }
    /**
     * 设置：模块@0-二手房出售,1-租房
     */
    public void setModule(String module) {
        this.module = module;
    }
    /**
     * 获取：模块@0-二手房出售,1-租房
     */
    public String getModule() {
        return module;
    }
    /**
     * 设置：支付方式@0-一次性,1-按揭
     */
    public void setPayType(String payType) {
        this.payType = payType;
    }
    /**
     * 获取：支付方式@0-一次性,1-按揭
     */
    public String getPayType() {
        return payType;
    }
    /**
     * 设置：其他(满二唯一,满五唯一,满五不唯一)
     */
    public void setOthers(String others) {
        this.others = others;
    }
    /**
     * 获取：其他(满二唯一,满五唯一,满五不唯一)
     */
    public String getOthers() {
        return others;
    }
    /**
     * 设置：佣金方式
     */
    public void setCommissionType(String commissionType) {
        this.commissionType = commissionType;
    }
    /**
     * 获取：佣金方式
     */
    public String getCommissionType() {
        return commissionType;
    }
    /**
     * 设置：备注
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    /**
     * 获取：备注
     */
    public String getRemarks() {
        return remarks;
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
     * 设置：创建人id
     */
    public void setCreateBy(Long createBy) {
        this.createBy = createBy;
    }
    /**
     * 获取：创建人id
     */
    public Long getCreateBy() {
        return createBy;
    }
    /**
     * 设置：创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    /**
     * 获取：创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }
    /**
     * 设置：修改人id
     */
    public void setUpdateBy(Long updateBy) {
        this.updateBy = updateBy;
    }
    /**
     * 获取：修改人id
     */
    public Long getUpdateBy() {
        return updateBy;
    }
    /**
     * 设置：修改时间
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
    /**
     * 获取：修改时间
     */
    public Date getUpdateTime() {
        return updateTime;
    }
    /**
     * 设置：逻辑删除@0-存在,1-隐藏,2-删除,3-停用
     */
    public void setDeleteFlag(String deleteFlag) {
        this.deleteFlag = deleteFlag;
    }
    /**
     * 获取：逻辑删除@0-存在,1-隐藏,2-删除,3-停用
     */
    public String getDeleteFlag() {
        return deleteFlag;
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
