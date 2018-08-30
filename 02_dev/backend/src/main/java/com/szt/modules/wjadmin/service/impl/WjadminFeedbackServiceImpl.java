package com.szt.modules.wjadmin.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szt.common.CommonServiceImpl;
import com.szt.modules.wjadmin.dao.WjadminFeedbackDao;
import com.szt.modules.wjadmin.entity.WjadminFeedbackEntity;
import com.szt.modules.wjadmin.service.WjadminFeedbackService;
import lombok.extern.slf4j.Slf4j;
import com.szt.common.utils.PageUtils;
import com.szt.common.utils.Query;
import java.util.Map;
/**
 * 反馈管理
 *
 * @author liao
 * @email 1171964050@qq.com
 * @date 2018-08-21 14:27:27
 */
@Service("wjadminwjadminFeedbackService")
public class WjadminFeedbackServiceImpl extends CommonServiceImpl<WjadminFeedbackDao, WjadminFeedbackEntity> implements WjadminFeedbackService {



}
