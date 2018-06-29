import * as common from './modules/common'
import * as user from './modules/user'
import * as role from './modules/role'
import * as menu from './modules/menu'
import * as generator from './modules/generator/generator'
import * as generatordatabase from './modules/generator/generatordatabase'
import * as generatortemplate from './modules/generator/generatortemplate'
import * as generatortemplateconfig from './modules/generator/generatortemplateconfig'
import * as generatormodules from './modules/generator/generatormodules'
import * as generatortable from './modules/generator/generatortable'
import * as generatortablefield from './modules/generator/generatortablefield'
import * as generatorbusconfig from './modules/generator/generatorbusconfig'
import * as schedulejob from './modules/job/schedulejob'
import * as schedulejoblog from './modules/job/schedulejoblog'
import * as syslog from './modules/sys/syslog'
import * as sysconfig from './modules/sys/sysconfig'
import * as sysoss from './modules/oss/sysoss'

import * as xjdcdatadict from './modules/xjdc/xjdcdatadict'
import * as xjdcdemand from './modules/xjdc/xjdcdemand'
import * as xjdchousesource from './modules/xjdc/xjdchousesource'
import * as xjdchousingresources from './modules/xjdc/xjdchousingresources'
import * as xjdcuser from './modules/xjdc/xjdcuser'

// 微信模块
import * as wxuserinfo from './modules/wx/wxuserinfo'
export default {
  common,     // 公共
  user,       // 管理员管理
  role,       // 角色管理
  menu,       // 菜单管理
  generator,
  generatordatabase,
  generatortablefield,
  generatortemplate,
  generatortemplateconfig,
  generatormodules,
  generatortable,
  generatorbusconfig,
  schedulejob,
  schedulejoblog,
  syslog,
  sysconfig,
  sysoss,
  xjdcdatadict, // 数据字典
  xjdcdemand, // 需求信息
  xjdchousesource, // 佣金方式
  xjdchousingresources, // 房源信息
  xjdcuser, // 用户信息

  wxuserinfo // 微信模块
}
