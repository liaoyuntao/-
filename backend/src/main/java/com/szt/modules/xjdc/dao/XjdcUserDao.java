package com.szt.modules.xjdc.dao;

import com.szt.modules.xjdc.entity.XjdcUserEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * 用户信息
 * 
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-20 12:07:56
 */
@Mapper
public interface XjdcUserDao extends BaseMapper<XjdcUserEntity> {

    @Select("select count(id) from xjdc_user where openid=#{openid}")
    Long selectXjdcUserByOpenid(String openId);
}
