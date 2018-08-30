package com.szt.modules.swagger;

import org.springframework.context.annotation.Bean;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

/**
 * @author zh
 * @ClassName cn.saytime.Swgger2
 * @Description
 * @date 2017-07-10 22:12:31
 */
//@Configuration
//@EnableSwagger2
public class Swagger2 {

	@Bean(value = "groupRestApi0")
	public Docket createRestApi() {
		return new Docket(DocumentationType.SWAGGER_2)
				.apiInfo(new ApiInfoBuilder()
						.title("springboot利用swagger构建api文档")
						.description("简单优雅的restfun风格，http://blog.csdn.net/saytime")
						.termsOfServiceUrl("http://blog.csdn.net/saytime")
						.version("1.0")
						.build())
				.select()
				.apis(RequestHandlerSelectors.basePackage("com.szt.modules.distribution.controller"))
				.paths(PathSelectors.any())
				.build();
	}

	/*@Bean(value = "defaultApi")
	public Docket defaultApi() {
		return new Docket(DocumentationType.SWAGGER_2)
				.apiInfo(new ApiInfoBuilder()
						.title("swagger-bootstrap-ui-demo RESTful APIs")
						.description("swagger-bootstrap-ui-demo RESTful APIs")
						.termsOfServiceUrl("http://www.xx.com/")
						.contact("xx@qq.com")
						.version("1.0")
						.build())
				.groupName("默认接口")
				.select()
				.apis(RequestHandlerSelectors.basePackage("com.szt.modules.distribution.controller"))
				.paths(PathSelectors.any())
				.build();
	}
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
				.groupName("分组接口")
				.select()
				.apis(RequestHandlerSelectors.basePackage("com.szt.modules.distribution.controller"))
				.paths(PathSelectors.any())
				.build();
	}*/




}