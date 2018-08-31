/**
 * 邮箱
 * @param {*} s
 */
export function isEmail (s) {
  return /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(s)
}

/**
 * 手机号码
 * @param {*} s
 */
export function isMobile (s) {
  return /^((\+?86)|(\(\+86\)))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/.test(s)
}

/**
 * 电话号码
 * @param {*} s
 */
export function isPhone (s) {
  return /^([0-9]{3,4}-)?[0-9]{7,8}$/.test(s)
}

/**
 * 身份证
 * @param s
 * @returns {boolean}
 */
export function isIdentityCard(s){
  return /(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}$)/.test(s);
}

/**
 * 整数
 * @param s
 * @returns {boolean}
 */
export function isInteger(s){
  return /^\d+$/.test(s);
}

/**
 * 小数
 * @param s
 * @returns {boolean}
 */
export function isDecimals(s){
  return /^[0-9]+([.]{1}[0-9]+){0,1}$/.test(s);
}
/**
 * 判断非空
 * @param s
 * @returns {boolean}
 */
export function isNull(s){
  return /\S/.test(s);
}


