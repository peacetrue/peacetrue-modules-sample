package com.github.peacetrue.sample.modules.activity;

import org.springframework.cloud.openfeign.SpringQueryMap;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import reactivefeign.spring.config.ReactiveFeignClient;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import javax.annotation.Nullable;

/**
 * 活动客户端
 *
 * @author xiayx
 */
@ReactiveFeignClient(name = "sample", url = "${peacetrue.Activity.url:${peacetrue.server.url:}}")
public interface ActivityServiceClient {

    @PostMapping(value = "/activitys")
    Mono<ActivityVO> add(ActivityAdd params);

    @GetMapping(value = "/activitys", params = "page")
    Mono<Page<ActivityVO>> query(@Nullable @SpringQueryMap ActivityQuery params, @Nullable Pageable pageable, @SpringQueryMap String... projection);

    @GetMapping(value = "/activitys", params = "sort")
    Flux<ActivityVO> query(@SpringQueryMap ActivityQuery params, Sort sort, @SpringQueryMap String... projection);

    @GetMapping(value = "/activitys")
    Flux<ActivityVO> query(@SpringQueryMap ActivityQuery params, @SpringQueryMap String... projection);

    @GetMapping(value = "/activitys/get")
    Mono<ActivityVO> get(@SpringQueryMap ActivityGet params, @SpringQueryMap String... projection);

    @PutMapping(value = "/activitys")
    Mono<Integer> modify(ActivityModify params);

    @DeleteMapping(value = "/activitys/delete")
    Mono<Integer> delete(@SpringQueryMap ActivityDelete params);

}
