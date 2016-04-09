package io.github.capucho.configuration;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.format.datetime.DateFormatterRegistrar;
import org.springframework.format.support.DefaultFormattingConversionService;
import org.springframework.format.support.FormattingConversionService;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import io.github.capucho.controllers.HomeController;
import io.github.capucho.model.ProductDAO;

/**
 *
 * This class main goal is to show to Spring MVC Servlet what are the classes
 * that should be read and loaded. So we pass HomeController as a parameter so
 * spring can read its package.
 * 
 * EnableWebMvc allows: object to xml, object to JSON, validations, RSS
 * generation ComponentScan allows to use basePackage and pass a package like
 * "io.github.xyz"
 * 
 */
@EnableWebMvc
@ComponentScan(basePackageClasses = { HomeController.class, ProductDAO.class })
public class AppWebConfiguration {

	@Bean
	public InternalResourceViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();

		resolver.setPrefix("/WEB-INF/views/");

		resolver.setSuffix(".jsp");

		return resolver;
	}

	
	@Bean
	public MessageSource messageSource(){
		
		ReloadableResourceBundleMessageSource bundle =
				new ReloadableResourceBundleMessageSource();
		
		bundle.setBasename("/WEB-INF/messages");
		bundle.setDefaultEncoding("UTF-8");
		
		bundle.setCacheSeconds(1);
		
		return bundle;
		
	}
	
	@Bean
	public FormattingConversionService mvcConversionService()
	{
		DefaultFormattingConversionService conversionService =
				new DefaultFormattingConversionService(true);
		
		DateFormatterRegistrar registrar =
				new DateFormatterRegistrar();
		
		registrar.setFormatter(new DateFormatter("yyyy-MM-dd"));
		registrar.registerFormatters(conversionService);
		
		return conversionService;
		
	}
	
}
