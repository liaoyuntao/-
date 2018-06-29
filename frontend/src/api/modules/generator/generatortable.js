import request from '../../request'
import requestUrl from '../../requestUrl'
import requestParam from '../../requestParam'
import isInteger from 'lodash/isInteger'

// 获取列表
export function list (params) {
  return request({
    url: requestUrl('/generator/generatortable/list'),
    method: 'get',
    params: requestParam(params, 'get')
  })
}

// 获取信息
export function info (id) {
  return request({
    url: requestUrl('/generator/generatortable/info' + (isInteger(id) ? `/${id}` : '')),
    method: 'get',
    params: requestParam({}, 'get')
  })
}

// 添加
export function add (params) {
  return request({
    url: requestUrl('/generator/generatortable/save'),
    method: 'post',
    data: requestParam(params)
  })
}

// 修改
export function update (params) {
  return request({
    url: requestUrl('/generator/generatortable/update'),
    method: 'post',
    data: requestParam(params)
  })
}

// 删除
export function del (params) {
  return request({
    url: requestUrl('/generator/generatortable/delete'),
    method: 'post',
    data: requestParam(params, 'post', false)
  })
}

// 模板预览
export function preview (params) {
  return request({
    url: requestUrl('/generator/generatortable/preview'),
    method: 'get',
    params: requestParam(params, 'get')
  })
}
// 查询所有表格字段数据
export function queryTableFilePreviewVO (params) {
  return request({
    url: requestUrl('/generator/generatortable/queryTableFilePreviewVO'),
    method: 'get',
    data: requestParam(params, 'get', false)
  })
}
// 生成
export function generator (params) {
  return request({
    url: requestUrl('/generator/generatortable/generate'),
    method: 'post',
    data: requestParam(params, 'post', false)
  })
}
