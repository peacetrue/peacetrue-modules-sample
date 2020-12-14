package com.github.peacetrue.sample;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * 控制器配置
 *
 * @author xiayx
 */
@Getter
@Setter
@ConfigurationProperties(prefix = "com.github.peacetrue.sample")
public class ControllerSampleProperties {

}
