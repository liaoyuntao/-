package com.szt.modules.wjxcx.service.impl;

import com.szt.modules.wjadmin.dao.WjadminPaymentHistoryDao;
import com.szt.modules.wjadmin.entity.WjadminPaymentHistoryEntity;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szt.common.CommonServiceImpl;
import com.szt.modules.wjxcx.service.WjadminPaymentHistoryService;
import lombok.extern.slf4j.Slf4j;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.Query;
import java.util.Map;
/**
 * 支付记录管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-21 14:58:55
 */
@Service("wjxcxwjadminPaymentHistoryService")
public class WjadminPaymentHistoryServiceImpl extends CommonServiceImpl<WjadminPaymentHistoryDao, WjadminPaymentHistoryEntity> implements WjadminPaymentHistoryService {



}
