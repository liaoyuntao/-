/**
 * Copyright 2018 人人开源 http://www.renren.io
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */

package com.szt.modules.sys.service.impl;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.szt.common.utils.Constant;
import com.szt.common.utils.MapUtils;
import com.szt.modules.sys.dao.SysMenuDao;
import com.szt.modules.sys.entity.SysMenuEntity;
import com.szt.modules.sys.service.SysMenuService;
import com.szt.modules.sys.service.SysRoleMenuService;
import com.szt.modules.sys.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service("sysMenuService")
public class SysMenuServiceImpl extends ServiceImpl<SysMenuDao, SysMenuEntity> implements SysMenuService {

	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysRoleMenuService sysRoleMenuService;
	@Value("${spring.profiles.active}")
	private String active;
	@Override
	public List<SysMenuEntity> queryListParentId(Long parentId, List<Long> menuIdList) {
		List<SysMenuEntity> menuList = queryListParentId(parentId);
		if(menuIdList == null){
			return menuList;
		}
		
		List<SysMenuEntity> userMenuList = new ArrayList<>();
		for(SysMenuEntity menu : menuList){
			if(menuIdList.contains(menu.getId())){
				userMenuList.add(menu);
			}
		}
		return userMenuList;
	}

	@Override
	public List<SysMenuEntity> queryListParentId(Long parentId) {
		return baseMapper.queryListParentId(parentId);
	}

	@Override
	public List<SysMenuEntity> queryNotButtonList() {
		return baseMapper.queryNotButtonList();
	}

	@Override
	public List<SysMenuEntity> getUserMenuList(Long userId) {
		//系统管理员，拥有最高权限
		if(userId == Constant.SUPER_ADMIN || active.equals("dev")){
			return getAllMenuList(null);
		}
		
		//用户菜单列表
		List<Long> menuIdList = sysUserService.queryAllMenuId(userId);
		return getAllMenuList(menuIdList);
	}

	@Override
	public void delete(Long menuId){
		//删除菜单
		this.deleteById(menuId);
		//删除菜单与角色关联
		sysRoleMenuService.deleteByMap(new MapUtils().put("menu_id", menuId));
	}

	@Override
	public List<SysMenuEntity> router() {
		return baseMapper.router();
	}
	//                -- 菜单SQL
//                INSERT INTO `sys_menu` (`parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
//                VALUES ('1', '${comments}', 'modules/${moduleName}/${pathName}.html', NULL, '1', 'fa fa-file-code-o', '6');
//
//                -- 按钮父菜单ID
//                set @parentId = @@identity;
//
//                -- 菜单对应按钮SQL
//                INSERT INTO `sys_menu` (`parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
//                SELECT @parentId, '查看', null, '', '2', null, '6';
//                INSERT INTO `sys_menu` (`parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
//                SELECT @parentId, '新增', null, '${moduleName}:${pathName}:save', '2', null, '6';
//                INSERT INTO `sys_menu` (`parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
//                SELECT @parentId, '修改', null, '${moduleName}:${pathName}:update', '2', null, '6';
//                INSERT INTO `sys_menu` (`parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
//                SELECT @parentId, '删除', null, '${moduleName}:${pathName}:delete', '2', null, '6';
	@Override
	public void insertPermission(String comments, String moduleName, String pathName) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("url","modules/"+moduleName+"/"+pathName+".html");
		if(baseMapper.selectByMap(map).size()==0){
			SysMenuEntity entity = new SysMenuEntity();
			entity.setParentId(1L);
			entity.setName(comments);
			entity.setUrl("modules/"+moduleName+"/"+pathName+".html");
			entity.setPerms(null);
			entity.setType(1);
			entity.setIcon("fa fa-file-code-o");
			entity.setOrderNum(6);
			baseMapper.insert(entity);
			SysMenuEntity entity1 = new SysMenuEntity();
			entity1.setParentId(entity.getId());
			entity1.setName("查看");
			entity1.setUrl(null);
			entity1.setPerms(moduleName+":"+pathName+":list,"+moduleName+":"+pathName+":info");
			entity1.setType(2);
			entity1.setIcon("fa fa-file-code-o");
			entity1.setOrderNum(6);
			baseMapper.insert(entity1);
			entity1 = new SysMenuEntity();
			entity1.setParentId(entity.getId());
			entity1.setName("新增");
			entity1.setUrl(null);
			entity1.setPerms(moduleName+":"+pathName+":save");
			entity1.setType(2);
			entity1.setIcon("fa fa-file-code-o");
			entity1.setOrderNum(6);
			baseMapper.insert(entity1);
			entity1 = new SysMenuEntity();
			entity1.setParentId(entity.getId());
			entity1.setName("修改");
			entity1.setUrl(null);
			entity1.setPerms(moduleName+":"+pathName+":update");
			entity1.setType(2);
			entity1.setIcon("fa fa-file-code-o");
			entity1.setOrderNum(6);
			baseMapper.insert(entity1);
			entity1 = new SysMenuEntity();
			entity1.setParentId(entity.getId());
			entity1.setName("删除");
			entity1.setUrl(null);
			entity1.setPerms(moduleName+":"+pathName+":delete");
			entity1.setType(2);
			entity1.setIcon("fa fa-file-code-o");
			entity1.setOrderNum(6);
			baseMapper.insert(entity1);
		}

	}

	@Override
	public List<SysMenuEntity> listThisMenu(Long userId) {
		return baseMapper.listThisMenu(userId);
	}

	/**
	 * 获取所有菜单列表
	 */
	private List<SysMenuEntity> getAllMenuList(List<Long> menuIdList){
		//查询根菜单列表
		List<SysMenuEntity> menuList = queryListParentId(0L, menuIdList);
		//递归获取子菜单
		getMenuTreeList(menuList, menuIdList);
		
		return menuList;
	}

	/**
	 * 递归
	 */
	private List<SysMenuEntity> getMenuTreeList(List<SysMenuEntity> menuList, List<Long> menuIdList){
		List<SysMenuEntity> subMenuList = new ArrayList<SysMenuEntity>();
		
		for(SysMenuEntity entity : menuList){
			//目录
			if(entity.getType() == Constant.MenuType.CATALOG.getValue()){
				entity.setList(getMenuTreeList(queryListParentId(entity.getId(), menuIdList), menuIdList));
			}
			subMenuList.add(entity);
		}
		
		return subMenuList;
	}
}
