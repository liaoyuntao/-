package com.szt.modules.sys.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szt.common.CommonServiceImpl;
import com.szt.modules.sys.dao.SysLogDao;
import com.szt.modules.sys.entity.SysLogEntity;
import com.szt.modules.sys.service.SysLogService;
import lombok.extern.slf4j.Slf4j;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.Query;
import java.util.Map;
/**
 * 系统日志管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-06-19 20:14:29
 */
@Service("syssysLogService")
public class SysLogServiceImpl extends CommonServiceImpl<SysLogDao, SysLogEntity> implements SysLogService {



}
