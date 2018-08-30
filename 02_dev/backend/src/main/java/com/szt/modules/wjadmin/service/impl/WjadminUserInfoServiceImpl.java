package com.szt.modules.wjadmin.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szt.common.CommonServiceImpl;
import com.szt.modules.wjadmin.dao.WjadminUserInfoDao;
import com.szt.modules.wjadmin.entity.WjadminUserInfoEntity;
import com.szt.modules.wjadmin.service.WjadminUserInfoService;
import lombok.extern.slf4j.Slf4j;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.Query;
import java.util.Map;
/**
 * 小程序用户详细信息
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-21 14:27:27
 */
@Service("wjadminwjadminUserInfoService")
public class WjadminUserInfoServiceImpl extends CommonServiceImpl<WjadminUserInfoDao, WjadminUserInfoEntity> implements WjadminUserInfoService {



}
