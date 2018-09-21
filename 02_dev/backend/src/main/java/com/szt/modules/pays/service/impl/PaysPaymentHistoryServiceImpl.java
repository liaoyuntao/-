package com.szt.modules.pays.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szt.common.CommonServiceImpl;
import com.szt.modules.pays.dao.PaysPaymentHistoryDao;
import com.szt.modules.pays.entity.PaysPaymentHistoryEntity;
import com.szt.modules.pays.service.PaysPaymentHistoryService;
import lombok.extern.slf4j.Slf4j;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.Query;
import java.util.Map;
/**
 * 支付记录管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-09-18 12:24:24
 */
@Service("payspaysPaymentHistoryService")
public class PaysPaymentHistoryServiceImpl extends CommonServiceImpl<PaysPaymentHistoryDao, PaysPaymentHistoryEntity> implements PaysPaymentHistoryService {



}
