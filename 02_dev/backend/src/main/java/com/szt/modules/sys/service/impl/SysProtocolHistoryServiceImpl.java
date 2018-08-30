package com.szt.modules.sys.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szt.common.CommonServiceImpl;
import com.szt.modules.sys.dao.SysProtocolHistoryDao;
import com.szt.modules.sys.entity.SysProtocolHistoryEntity;
import com.szt.modules.sys.service.SysProtocolHistoryService;
import lombok.extern.slf4j.Slf4j;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.Query;
import java.util.Map;
/**
 * 协议历史记录
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-21 18:20:21
 */
@Service("syssysProtocolHistoryService")
public class SysProtocolHistoryServiceImpl extends CommonServiceImpl<SysProtocolHistoryDao, SysProtocolHistoryEntity> implements SysProtocolHistoryService {



}
