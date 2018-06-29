import Vue from 'vue'
import Router from 'vue-router'

// 开发环境不使用懒加载, 因为懒加载页面太多的话会造成webpack热更新太慢, 所以只有开发环境使用懒加载
const _import = require('./import-' + process.env.NODE_ENV)
Vue.use(Router)

// 路由定义使用说明:
// 1. 代码中路由统一使用name属性跳转.
// 2. 开放path属性用做简短路由, 比如: '/a1', 访问地址: www.renren.io/#/a1
export default new Router({
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
          children: [
            // 以'/n'开头统一拦截, 标记为左侧菜单导航tab展示内容方式路由
            {path: '/n/user', component: _import('user/index'), name: 'user', desc: '管理员管理'},
            {path: '/n/role', component: _import('role/index'), name: 'role', desc: '角色管理'},
            {path: '/n/menu', component: _import('menu/index'), name: 'menu', desc: '菜单管理'},
            {path: '/n/sql', component: _import('sql/index'), name: 'sql', desc: 'SQL监控'},
            {path: '/n/oss/sysoss', component: _import('oss/sysoss/index'), name: 'sysoss', desc: '上传图片管理'},
            {path: '/n/job/schedulejob', component: _import('job/schedulejob/index'), name: 'schedulejob', desc: '定时任务管理'},
            {path: '/n/job/schedulejoblog', component: _import('job/schedulejoblog/index'), name: 'schedulejoblog', desc: '定时任务日志管理'},
            {path: '/n/sys/sysconfig', component: _import('sys/sysconfig/index'), name: 'sysconfig', desc: '系统字典管理'},
            {path: '/n/sys/syslog', component: _import('sys/syslog/index'), name: 'syslog', desc: '系统日志管理'},
            {path: '/n/generator/generatortemplate', component: _import('generator/generatortemplate/index'), name: 'generatortemplate', desc: '模板配置'},
            {path: '/n/generator/generatordatabase', component: _import('generator/generatordatabase/index'), name: 'generatordatabase', desc: '数据库管理'},
            {path: '/n/generator/generator', component: _import('generator/generator/index'), name: 'generator', desc: '代码生成'},
            {path: '/n/generator/generatortemplateconfig', component: _import('generator/generatortemplateconfig/index'), name: 'generatortemplateconfig', desc: '模板系统参数'},
            {path: '/n/generator/generatormodules', component: _import('generator/generatormodules/index'), name: 'generatormodules', desc: '模块管理'},
            {path: '/n/generator/generatortable', component: _import('generator/generatortable/index'), name: 'generatortable', desc: '数据库表管理'},
            {path: '/n/generator/generatortablefield', component: _import('generator/generatortablefield/index'), name: 'generatortablefield', desc: '字段管理'},
            {path: '/n/generator/generatorbusconfig', component: _import('generator/generatorbusconfig/index'), name: 'generatorbusconfig', desc: '自动生成参数管理'},
            {path: '/n/xjdc/xjdcuser', component: _import('xjdc/xjdcuser/index'), name: 'xjdcuser', desc: '用户信息'},
            {path: '/n/xjdc/xjdcdemand', component: _import('xjdc/xjdcdemand/index'), name: 'xjdcdemand', desc: '需求信息'},
            {path: '/n/xjdc/xjdchousesource', component: _import('xjdc/xjdchousesource/index'), name: 'xjdchousesource', desc: '房源信息'},
            {path: '/n/wx/wxuserinfo', component: _import('wx/wxuserinfo/index'), name: 'wxuserinfo', desc: '微信公众号管理'}
          ]
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
})
