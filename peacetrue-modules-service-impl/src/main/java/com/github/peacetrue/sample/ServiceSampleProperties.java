package com.github.peacetrue.sample;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @author xiayx
 */
@Data
@ConfigurationProperties(prefix = "com.github.peacetrue.sample")
public class ServiceSampleProperties {


}
