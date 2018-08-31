import request from '../request'
import requestUrl from '../requestUrl'
import requestParam from '../requestParam'

// 获取验证码
export function captcha (uuid) {
  return requestUrl(`/captcha.jpg?uuid=${uuid}`)
}

// 登录
export function login (params) {
  return request({
    url: requestUrl('/sys/login'),
    method: 'post',
    data: requestParam(params)
  })
}

// 退出
export function logout () {
  return request({
    url: requestUrl('/sys/logout'),
    method: 'post',
    data: requestParam()
  })
}
// 获取系统业务参数
export function getSysBuConfig (key) {
  return request({
    url: requestUrl('sys/sysbusconfig/querySysBusConfigList'),
    method: 'get',
    data: requestParam()
  })
}
