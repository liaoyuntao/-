package com.szt.modules.wjadmin.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szt.common.CommonServiceImpl;
import com.szt.modules.wjadmin.dao.WjadminCartDao;
import com.szt.modules.wjadmin.entity.WjadminCartEntity;
import com.szt.modules.wjadmin.service.WjadminCartService;
import lombok.extern.slf4j.Slf4j;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.Query;
import java.util.Map;
/**
 * 购物车管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-21 14:27:27
 */
@Service("wjadminwjadminCartService")
public class WjadminCartServiceImpl extends CommonServiceImpl<WjadminCartDao, WjadminCartEntity> implements WjadminCartService {



}
