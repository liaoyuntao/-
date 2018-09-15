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
import * as syspbarea from './modules/sys/syspbarea'
import * as sysconfig from './modules/sys/sysconfig'
import * as sysoss from './modules/oss/sysoss'
import * as sysagreement from './modules/sys/sysagreement'
import * as sysprotocolhistory from './modules/sys/sysprotocolhistory'


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
  syspbarea,
  sysagreement,
  sysprotocolhistory
}

