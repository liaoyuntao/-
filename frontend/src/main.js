// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router' // api: https://router.vuejs.org/
import store from './store' // api: https://vuex.vuejs.org/
import VueCookie from 'vue-cookie' // api: https://github.com/alfhen/vue-cookie
// import '@/element-ui'               // api: https://github.com/ElemeFE/element
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import '@/iconfont' // api: http://www.iconfont.cn/
import '@/assets/scss/index.scss'
import {isAuth} from '@/utils'
import VueKindEditors from 'vue-kindeditor'
import 'kindeditor/kindeditor-all-min.js'
import 'kindeditor/themes/default/default.css'
import $ from 'jquery'
import requestUrl from './api/requestUrl'
Vue.prototype.$ELEMENT = {size: 'small'}
Vue.config.productionTip = false
Vue.use(ElementUI)
Vue.use(VueCookie)
Vue.use(VueKindEditors)
Vue.prototype.isAuth = isAuth // 挂载权限方法
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
Vue.prototype.reloadConfig = function () {
  $.ajax({
    url: requestUrl('/generator/generatortable/queryTableFilePreviewVO'),
    type: 'get', // GET
    async: false, // 或false,是否异步
    data: { },
    timeout: 5000, // 超时时间
    dataType: 'json', // 返回的数据格式：
    beforeSend: function (request) {
      request.setRequestHeader('token', getCookie('token'))
    },
    success: function (data, textStatus, jqXHR) {
      console.log('获取服务器配置')
      Vue.prototype.tableFieldMap = data.data
    }
  })
  $.ajax({
    url: requestUrl('/generator/generatorbusconfig/querySysBusConfigList'),
    type: 'get', // GET
    async: false, // 或false,是否异步
    beforeSend: function (request) {
      request.setRequestHeader('token', getCookie('token'))
    },
    timeout: 5000, // 超时时间
    dataType: 'json', // 返回的数据格式：
    success: function (data, textStatus, jqXHR) {
      console.log('获取服务器配置')
      Vue.prototype.busConfig = data.data
    }
  })
}
Vue.prototype.reloadConfig()
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  template: '<App/>',
  components: {App}
})
