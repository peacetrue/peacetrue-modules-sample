package com.github.peacetrue.sample;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;


/**
 * @author xiayx
 */
@Configuration
@EnableConfigurationProperties(ControllerSampleProperties.class)
@ComponentScan(basePackageClasses = ControllerSampleAutoConfiguration.class)
@PropertySource("classpath:/application-sample-controller.yml")
public class ControllerSampleAutoConfiguration {

    @ControllerAdvice
    public static class StringTrimmerControllerAdvice {
        @InitBinder
        public void registerCustomEditors(WebDataBinder binder) {
            binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
        }
    }

}
