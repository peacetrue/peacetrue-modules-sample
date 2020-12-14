package com.github.peacetrue.sample;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.ImportAutoConfiguration;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebAutoConfiguration;
import org.springframework.boot.autoconfigure.http.HttpMessageConvertersAutoConfiguration;
import org.springframework.boot.autoconfigure.web.servlet.WebMvcAutoConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ActiveProfiles;

/**
 * @author xiayx
 */
@Configuration
@ImportAutoConfiguration(classes = {
        TestServiceSampleAutoConfiguration.class,
        WebMvcAutoConfiguration.class,
        HttpMessageConvertersAutoConfiguration.class,
        ControllerSampleAutoConfiguration.class,
        SpringDataWebAutoConfiguration.class,
})
@EnableAutoConfiguration
@ActiveProfiles("sample-controller-test")
public class TestControllerSampleTagAutoConfiguration {

}
