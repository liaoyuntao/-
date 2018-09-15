package com.szt;

import com.szt.modules.generator.config.InitBusConfig;
import com.szt.modules.generator.service.GeneratorTableFieldService;
import com.szt.modules.generator.service.GeneratorTableService;
import com.szt.modules.sys.entity.SysPbAreaEntity;
import com.szt.modules.sys.service.SysPbAreaService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@SpringBootTest
public class JwtTest {
    @Autowired
    private GeneratorTableFieldService  generatorTableFieldService;
    @Autowired
    private SysPbAreaService sysPbAreaService;
    /**
     * 更新字段索引
     */
    @Test
    public void test() {
        generatorTableFieldService.tabFieldIndexReload();
    }
    /**
     * 更新字段类型为下拉
     */
    @Test
    public void test1() {
        generatorTableFieldService.tabFieldTypeReload();
    }
    /**
     * 刷新地址列表
     */
    @Test
    public void test2() {
        sysPbAreaService.addressReload();
    }
    /**
     * 刷新地址缓存
     */
    @Test
    public void test3() {
     //   InitBusConfig.updateAddressConfig();
    }
}
