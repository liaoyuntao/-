package com.szt.modules.swagger;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class SwaggerConfiguration {
    @Bean(value = "defaultApi")
    public Docket defaultApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(new ApiInfoBuilder()
                        .title("elwl后台接口")
                        .description("elwu后台接口")
                        .termsOfServiceUrl("http://192.168.1.124:8080/renren-fast/doc.html")
                        .contact("group@qq.com")
                        .version("1.0")
                        .build())
                .groupName("elwl后台接口")
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.szt.modules.elwl.controller"))
                .paths(PathSelectors.any())
                .build();
    }
//    @Bean(value = "defaultApi")
//    public Docket defaultApi() {
//        return new Docket(DocumentationType.SWAGGER_2)
//                .apiInfo(new ApiInfoBuilder()
//                        .title("swagger-bootstrap-ui-demo RESTful APIs")
//                        .description("swagger-bootstrap-ui-demo RESTful APIs")
//                        .termsOfServiceUrl("http://www.xx.com/")
//                        .contact("xx@qq.com")
//                        .version("1.0")
//                        .build())
//                .groupName("默认接口")
//                .select()
//                .apis(RequestHandlerSelectors.basePackage("com.szt.modules.swagger.controller"))
//                .paths(PathSelectors.any())
//                .build();
//    }
    @Bean(value = "groupRestApi")
    public Docket groupRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(new ApiInfoBuilder()
                        .title("分组Api")
                        .description("swagger-bootstrap-ui-demo RESTful APIs")
                        .termsOfServiceUrl("http://www.group.com/")
                        .contact("group@qq.com")
                        .version("1.0")
                        .build())
                .groupName("demo接口")
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.szt.modules.sys.controller"))
                .paths(PathSelectors.any())
                .build();
    }



}