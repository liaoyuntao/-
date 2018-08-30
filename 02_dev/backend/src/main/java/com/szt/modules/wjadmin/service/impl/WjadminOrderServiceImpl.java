package com.szt.modules.wjadmin.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szt.common.CommonServiceImpl;
import com.szt.modules.wjadmin.dao.WjadminOrderDao;
import com.szt.modules.wjadmin.entity.WjadminOrderEntity;
import com.szt.modules.wjadmin.service.WjadminOrderService;
import lombok.extern.slf4j.Slf4j;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.Query;
import java.util.Map;
/**
 * 订单管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-21 14:27:27
 */
@Service("wjadminwjadminOrderService")
public class WjadminOrderServiceImpl extends CommonServiceImpl<WjadminOrderDao, WjadminOrderEntity> implements WjadminOrderService {



}
