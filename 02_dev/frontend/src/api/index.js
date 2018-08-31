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
import * as wjadmincart from './modules/wjadmin/wjadmincart'
import * as wjadmincoupon from './modules/wjadmin/wjadmincoupon'
import * as wjadminfeedback from './modules/wjadmin/wjadminfeedback'
import * as wjadmingoods from './modules/wjadmin/wjadmingoods'
import * as wjadmingoodscategory from './modules/wjadmin/wjadmingoodscategory'
import * as wjadminorder from './modules/wjadmin/wjadminorder'
import * as wjadminordergoods from './modules/wjadmin/wjadminordergoods'
import * as wjadminpaymenthistory from './modules/wjadmin/wjadminpaymenthistory'
import * as wjadminreplenishmentpart from './modules/wjadmin/wjadminreplenishmentpart'
import * as wjadminuseraddress from './modules/wjadmin/wjadminuseraddress'
import * as wjadminusercoupon from './modules/wjadmin/wjadminusercoupon'
import * as wjadminuserinfo from './modules/wjadmin/wjadminuserinfo'
import * as wjadminvendingmachine from './modules/wjadmin/wjadminvendingmachine'
import * as wjadminxcxuser from './modules/wjadmin/wjadminxcxuser'



export default {
  wjadminfeedback,
  wjadmincart,
  wjadmincoupon,
  wjadminorder,
  wjadminordergoods,
  wjadminpaymenthistory,
  wjadminuseraddress,
  wjadminusercoupon,
  wjadminuserinfo,
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
  sysprotocolhistory,
  wjadmingoods,
  wjadmingoodscategory,
  wjadminreplenishmentpart,
  wjadminvendingmachine,
  wjadminxcxuser
}

