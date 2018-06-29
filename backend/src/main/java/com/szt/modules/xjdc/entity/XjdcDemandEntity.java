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
 * 需求信息
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-27 13:24:10
 */
@TableName("xjdc_demand")
public class XjdcDemandEntity implements Serializable {
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
    @NotBlank(message="openid不能为空")
    @ApiModelProperty(value = "openid",required = false)
    private String openid;
    /**
     * 供应商类型@0-业主,1-代理人
     */
    @ApiModelProperty(value = "供应商类型@0-业主,1-代理人",required = true)
    private String providerType;
    /**
     * 支付类型@0-一次性,1-按揭
     */
    @ApiModelProperty(value = "支付类型@0-一次性,1-按揭",required = true)
    private String payType;
    /**
     * 联系人
     */
    @NotBlank(message="联系人不能为空")
    @ApiModelProperty(value = "联系人",required = false)
    private String name;
    /**
     * 配套设备&0-电视,1-冰箱,2-洗衣机,3-空调,4-沙发,5-柜子,6-床,7-衣橱,8-宽带,9-暖气,10-热水器,11-天然气
     */
    @ApiModelProperty(value = "配套设备&0-电视,1-冰箱,2-洗衣机,3-空调,4-沙发,5-柜子,6-床,7-衣橱,8-宽带,9-暖气,10-热水器,11-天然气",required = true)
    private String facility;
    /**
     * 联系电话
     */
    @NotBlank(message="联系电话不能为空")
    @ApiModelProperty(value = "联系电话",required = false)
    private String phone;
    /**
     * 是否家电@0-带家电,1-不带家电
     */
    @ApiModelProperty(value = "是否家电@0-带家电,1-不带家电",required = true)
    private String household;
    /**
     * 区域
     */
    @NotBlank(message="区域不能为空")
    @ApiModelProperty(value = "区域",required = false)
    private String region;
    /**
     * 价格
     */
    @NotBlank(message="价格不能为空")
    @ApiModelProperty(value = "价格",required = false)
    private String price;
    /**
     * 是否电梯@0-是,1-否
     */
    @ApiModelProperty(value = "是否电梯@0-是,1-否",required = true)
    private String hasElevator;
    /**
     * 户型&0-单间,1-一室一厅,2-二室一厅,3-三室一厅,4-其他
     */
    @ApiModelProperty(value = "户型&0-单间,1-一室一厅,2-二室一厅,3-三室一厅,4-其他",required = true)
    private String houseType;
    /**
     * 平方数
     */
    @ApiModelProperty(value = "平方数",required = true)
    private BigDecimal square;
    /**
     * 类型@1-商品房,2-自建房,3-公寓,4-宅基地
     */
    @ApiModelProperty(value = "类型@1-商品房,2-自建房,3-公寓,4-宅基地",required = true)
    private String type;
    /**
     * 楼龄
     */
    @ApiModelProperty(value = "楼龄",required = true)
    private Integer buildingAge;
    /**
     * 楼层@0-低层,1-中层,2-高层
     */
    @ApiModelProperty(value = "楼层@0-低层,1-中层,2-高层",required = true)
    private String floor;
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
     * 房需类型@0-租房,1-买房
     */
    @ApiModelProperty(value = "房需类型@0-租房,1-买房",required = true)
    private String demandType;
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
     * 设置：供应商类型@0-业主,1-代理人
     */
    public void setProviderType(String providerType) {
        this.providerType = providerType;
    }
    /**
     * 获取：供应商类型@0-业主,1-代理人
     */
    public String getProviderType() {
        return providerType;
    }
    /**
     * 设置：支付类型@0-一次性,1-按揭
     */
    public void setPayType(String payType) {
        this.payType = payType;
    }
    /**
     * 获取：支付类型@0-一次性,1-按揭
     */
    public String getPayType() {
        return payType;
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
     * 设置：区域
     */
    public void setRegion(String region) {
        this.region = region;
    }
    /**
     * 获取：区域
     */
    public String getRegion() {
        return region;
    }
    /**
     * 设置：价格
     */
    public void setPrice(String price) {
        this.price = price;
    }
    /**
     * 获取：价格
     */
    public String getPrice() {
        return price;
    }
    /**
     * 设置：是否电梯@0-是,1-否
     */
    public void setHasElevator(String hasElevator) {
        this.hasElevator = hasElevator;
    }
    /**
     * 获取：是否电梯@0-是,1-否
     */
    public String getHasElevator() {
        return hasElevator;
    }
    /**
     * 设置：户型&0-单间,1-一室一厅,2-二室一厅,3-三室一厅,4-其他
     */
    public void setHouseType(String houseType) {
        this.houseType = houseType;
    }
    /**
     * 获取：户型&0-单间,1-一室一厅,2-二室一厅,3-三室一厅,4-其他
     */
    public String getHouseType() {
        return houseType;
    }
    /**
     * 设置：平方数
     */
    public void setSquare(BigDecimal square) {
        this.square = square;
    }
    /**
     * 获取：平方数
     */
    public BigDecimal getSquare() {
        return square;
    }
    /**
     * 设置：类型@1-商品房,2-自建房,3-公寓,4-宅基地
     */
    public void setType(String type) {
        this.type = type;
    }
    /**
     * 获取：类型@1-商品房,2-自建房,3-公寓,4-宅基地
     */
    public String getType() {
        return type;
    }
    /**
     * 设置：楼龄
     */
    public void setBuildingAge(Integer buildingAge) {
        this.buildingAge = buildingAge;
    }
    /**
     * 获取：楼龄
     */
    public Integer getBuildingAge() {
        return buildingAge;
    }
    /**
     * 设置：楼层@0-低层,1-中层,2-高层
     */
    public void setFloor(String floor) {
        this.floor = floor;
    }
    /**
     * 获取：楼层@0-低层,1-中层,2-高层
     */
    public String getFloor() {
        return floor;
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
     * 设置：房需类型@0-租房,1-买房
     */
    public void setDemandType(String demandType) {
        this.demandType = demandType;
    }
    /**
     * 获取：房需类型@0-租房,1-买房
     */
    public String getDemandType() {
        return demandType;
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
