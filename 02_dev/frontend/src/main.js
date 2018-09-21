// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'

import store from './store' // api: https://vuex.vuejs.org/
import VueCookie from 'vue-cookie' // api: https://github.com/alfhen/vue-cookie
// import '@/element-ui'
import router from './router'       // api: https://router.vuejs.org/
// api: https://github.com/ElemeFE/element
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import '@/iconfont' // api: http://www.iconfont.cn/
import '@/assets/scss/index.scss'
import {isAuth,treeDataTranslate,getCookie} from '@/utils'
import VueKindEditors from 'vue-kindeditor'
import 'kindeditor/kindeditor-all-min.js'
import 'kindeditor/themes/default/default.css'
import $ from 'jquery'
import requestUrl from './api/requestUrl'

import VueAwesomeSwiper from 'vue-awesome-swiper'
import 'swiper/dist/css/swiper.css'
Vue.use(VueAwesomeSwiper)
Vue.prototype.$ELEMENT = {size: 'small'}
Vue.config.productionTip = false

Vue.use(ElementUI)
Vue.use(VueCookie)
Vue.use(VueKindEditors)
Vue.prototype.isAuth = isAuth // 挂载权限方法
Vue.prototype.reloadConfig = function () {

}
Vue.prototype.reloadConfig();
Vue.prototype.busConfig={};
//获取业务参数
Vue.prototype.getBusConfig = function (module,key) {
  if(Vue.prototype.busConfig[module]==null){
    //查询所需业务参数
    $.ajax({
      url: requestUrl('/generator/generatorbusconfig/queryModuleBusConfig'),
      type: 'get', // GET
      data:{module:this.model+this.pathUrl},
      async: false, // 或false,是否异步
      beforeSend: function (request) {
        request.setRequestHeader('token', getCookie('token'))
      },
      dataType: 'json', // 返回的数据格式：
      success: function (data, textStatus, jqXHR) {
        Vue.prototype.busConfig[module]=data.data
      }
    })
  }
  var map = Vue.prototype.busConfig[module][key];
  if (!map) {
    $.ajax({
      url: requestUrl('/generator/generatorbusconfig/querySysBusConfigByKey'),
      type: 'get', // GET
      data:{key:key},
      async: false, // 或false,是否异步
      beforeSend: function (request) {
        request.setRequestHeader('token', getCookie('token'))
      },
      dataType: 'json', // 返回的数据格式：
      success: function (data, textStatus, jqXHR) {
        for(var i in data.data.list){
          var item =data.data.list[i];
          item.confVue=parseInt(item.confVue)
        }
        Vue.prototype.busConfig[module][key]=data.data;
         map=data.data
      }
    })
  }
    return map;
}
Vue.prototype.reloadBusConfig = function (module,key) {
  if(Vue.prototype.busConfig[module]!=null){
    Vue.prototype.busConfig[module][key]=null;
  }
}
//重新业务表数据加载数据
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router:router,
  store,
  template: '<App/>',
  components: {App}
})
