import $ from "jquery";
import requestUrl from "./requestUrl";
// import * as common from './modules/common'
// import * as user from './modules/user'
// import * as role from './modules/role'
// import * as menu from './modules/menu'
// import * as generator from './modules/generator/generator'
// import * as generatordatabase from './modules/generator/generatordatabase'
// import * as generatortemplate from './modules/generator/generatortemplate'
// import * as generatortemplateconfig from './modules/generator/generatortemplateconfig'
// import * as generatormodules from './modules/generator/generatormodules'
// import * as generatortable from './modules/generator/generatortable'
// import * as generatortablefield from './modules/generator/generatortablefield'
// import * as generatorbusconfig from './modules/generator/generatorbusconfig'
// import * as schedulejob from './modules/job/schedulejob'
// import * as schedulejoblog from './modules/job/schedulejoblog'
// import * as syslog from './modules/sys/syslog'
// import * as syspbarea from './modules/sys/syspbarea'
// import * as sysconfig from './modules/sys/sysconfig'
// import * as sysoss from './modules/oss/sysoss'
// import * as sysagreement from './modules/sys/sysagreement'
// import * as sysprotocolhistory from './modules/sys/sysprotocolhistory'

//轮播图管理
//import * as slideshowslideshow from './modules/slideshow/slideshowslideshow'
var getCookie = function (name) {
  var strcookie = document.cookie// 获取cookie字符串
  var arrcookie = strcookie.split('; ')// 分割
// 遍历匹配
  for (var i = 0; i < arrcookie.length; i++) {
    var arr = arrcookie[i].split('=')
    if (arr[0] === name) {
      return arr[1]
    }
  }
  return ''
}
var map = {};
//自动配置路由
$.ajax({
  url: requestUrl('/sys/menu/router'),
  type: 'post', // GET
  async: false, // 或false,是否异步
  beforeSend: function (request) {
    request.setRequestHeader('token', getCookie('token'))
  },
  timeout: 5000, // 超时时间
  dataType: 'json', // 返回的数据格式：
  success: function (data, textStatus, jqXHR) {
    for(var i in data.data){
      var item = data.data[i];
      var url = item.url;
      var str = url.substring(url.indexOf("/")+1,url.lastIndexOf("."));
      var name = str.split("/");
      var names = name.length==2?name[1]:name[0];
      try{
        map[names]=require('@/api/modules/' + name[0]+'/'+name[1] + '.js');
        //list.push({path:"/n/"+str,component:_import( str+'/index'),name:names,desc:item.name,meta: { isTab: true }})
      }catch (e) {
        // console.error(url+"路由不存在");
      }
    }
  }
})

map.common=require('@/api/modules/common.js');
export default map

