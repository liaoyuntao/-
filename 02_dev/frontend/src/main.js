// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'

import store from './store' // api: https://vuex.vuejs.org/
import VueCookie from 'vue-cookie' // api: https://github.com/alfhen/vue-cookie
// import '@/element-ui'               // api: https://github.com/ElemeFE/element
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import '@/iconfont' // api: http://www.iconfont.cn/
import '@/assets/scss/index.scss'
import {isAuth,treeDataTranslate} from '@/utils'
import VueKindEditors from 'vue-kindeditor'
import 'kindeditor/kindeditor-all-min.js'
import 'kindeditor/themes/default/default.css'
import $ from 'jquery'
import requestUrl from './api/requestUrl'

import VueAwesomeSwiper from 'vue-awesome-swiper'
import 'swiper/dist/css/swiper.css'
import Router from 'vue-router'
Vue.use(VueAwesomeSwiper)
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
  // var tableFieldMap = sessionStorage.getItem("tableFieldMap");
  // if(tableFieldMap==undefined){
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
        //console.log('获取服务器配置')
        Vue.prototype.tableFieldMap = data.data
      }
    })
  // }else{
  //   Vue.prototype.tableFieldMap =JSON.parse(tableFieldMap)
  //
  // }
  // var busConfig = sessionStorage.getItem("busConfig");
  // if(busConfig==undefined){
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
        //console.log('获取服务器配置')
        Vue.prototype.busConfig = data.data
      }
    })
  var list = [];
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
      //console.log('获取服务器配置')
      //console.log(data.data);
      for(var i in data.data){
        var item = data.data[i];
        var url = item.url;
        var str = url.substring(url.indexOf("/")+1,url.lastIndexOf("."));
        var name = str.split("/");
        var names = name.length==2?name[1]:name[0];
        // //console.log("/n/"+str);
        // //console.log(str+'/index');
        // //console.log(names);
        // //console.log(item.name);
        try{
          list.push({path:"/n/"+str,component:_import( str+'/index'),name:names,desc:item.name,meta: { isTab: true }})
        }catch (e) {
         // console.error(url+"路由不存在");
        }
      }
      Vue.prototype.list = list
    }
  })
  $.ajax({
    url: requestUrl('/sys/syspbarea/getAddressConfig'),
    type: 'post', // GET
    async: false, // 或false,是否异步
    beforeSend: function (request) {
      request.setRequestHeader('token', getCookie('token'))
    },
    timeout: 5000, // 超时时间
    dataType: 'json', // 返回的数据格式：
    success: function (data, textStatus, jqXHR) {
      console.log(data);
      Vue.prototype.address=data.data.address;
      Vue.prototype.addressMap=data.data.addressMap;
    }
  })
  // }else{
  //   Vue.prototype.busConfig =JSON.parse(busConfig)
  // }


}
// 开发环境不使用懒加载, 因为懒加载页面太多的话会造成webpack热更新太慢, 所以只有开发环境使用懒加载
const _import = require('./router/import-' + process.env.NODE_ENV)
Vue.use(Router)
// 路由定义使用说明:
// 1. 代码中路由统一使用name属性跳转.
// 2. 开放path属性用做简短路由, 比如: '/a1', 访问地址: www.renren.io/#/a1
Vue.prototype.reloadConfig();
//获取业务参数
Vue.prototype.getBusConfig = function (key) {
  var map = Vue.prototype.busConfig[key];
  if (!map) {
    $.ajax({
      url: requestUrl('/generator/generatorbusconfig/querySysBusConfigByKey'),
      type: 'get', // GET
      data:{key:key},
      async: false, // 或false,是否异步
      beforeSend: function (request) {
        request.setRequestHeader('token', getCookie('token'))
      },
      timeout: 5000, // 超时时间
      dataType: 'json', // 返回的数据格式：
      success: function (data, textStatus, jqXHR) {
        for(var i in data.data.list){
          var item =data.data.list[i];
          item.confVue=parseInt(item.confVue)
        }
         map=data.data
         Vue.prototype.busConfig[key] = data.data
      }
    })
  }
    return map;
}
Vue.prototype.reloadBusConfig = function (key) {
  Vue.prototype.busConfig[key]=null;
}
//重新业务表数据加载数据
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router:new Router({
    mode: 'hash',
    routes: [
      {path: '/404', component: _import('error/404'), name: '404', desc: '404未找到'},
      {path: '/login', component: _import('login/index'), name: 'login', desc: '登录'},
      {
        path: '/',
        component: _import('layout/index'),
        name: 'layout',
        redirect: {name: 'home'},
        desc: '上左右整体布局',
        children: [
          {path: '/home', component: _import('home/index'), name: 'home', desc: '首页'},
          {
            path: '/content-tabs',
            component: _import('layout/content-tabs'),
            name: 'content-tabs',
            redirect: {name: '404'},
            desc: '内容需通过tabs展示',
            children: /*[
              //   {path: '/n/sql', component: _import('sql/index'), name: 'sql', desc: 'SQL监控'},
        //    ...Vue.prototype.list,
            ]*/
            Vue.prototype.list,
          }

        ],
        beforeEnter (to, from, next) {
          let token = Vue.cookie.get('token')
          if (!token || !/\S/.test(token)) {
            next({name: 'login'})
          }
          next()
        }
      },
      {path: '*', redirect: {name: '404'}}

    ]
  }),
  store,
  template: '<App/>',
  components: {App}
})
