package com.github.peacetrue.sample;

import org.flywaydb.core.Flyway;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.flyway.FlywayProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.r2dbc.core.DatabaseClient;
import org.springframework.data.r2dbc.core.R2dbcEntityOperations;
import org.springframework.data.r2dbc.core.R2dbcEntityTemplate;

import java.util.Objects;

/**
 * @author xiayx
 */
@Configuration
@EnableConfigurationProperties({ServiceSampleProperties.class, FlywayProperties.class})
@ComponentScan(basePackageClasses = ServiceSampleAutoConfiguration.class)
@PropertySource("classpath:/application-sample-service.yml")
public class ServiceSampleAutoConfiguration {

    private ServiceSampleProperties properties;

    public ServiceSampleAutoConfiguration(ServiceSampleProperties properties) {
        this.properties = Objects.requireNonNull(properties);
    }

    @Bean
    @ConditionalOnMissingBean({R2dbcEntityOperations.class})
    public R2dbcEntityTemplate r2dbcEntityTemplate(DatabaseClient databaseClient) {
        return new R2dbcEntityTemplate(databaseClient);
    }

    @Bean(initMethod = "migrate")
    @ConditionalOnMissingBean(Flyway.class)
    public Flyway flyway(FlywayProperties properties) {
        return new Flyway(Flyway.configure()
                .baselineOnMigrate(properties.isBaselineOnMigrate())
                .validateOnMigrate(properties.isValidateOnMigrate())
                .dataSource(properties.getUrl(), properties.getUser(), properties.getPassword())
        );
    }
}
