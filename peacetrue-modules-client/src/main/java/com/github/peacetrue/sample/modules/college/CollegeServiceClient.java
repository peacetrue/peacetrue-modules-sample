package com.github.peacetrue.sample.modules.college;

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
 * 院校客户端
 *
 * @author xiayx
 */
@ReactiveFeignClient(name = "sample", url = "${peacetrue.College.url:${peacetrue.server.url:}}")
public interface CollegeServiceClient {

    @PostMapping(value = "/colleges")
    Mono<CollegeVO> add(CollegeAdd params);

    @GetMapping(value = "/colleges", params = "page")
    Mono<Page<CollegeVO>> query(@Nullable @SpringQueryMap CollegeQuery params, @Nullable Pageable pageable, @SpringQueryMap String... projection);

    @GetMapping(value = "/colleges", params = "sort")
    Flux<CollegeVO> query(@SpringQueryMap CollegeQuery params, Sort sort, @SpringQueryMap String... projection);

    @GetMapping(value = "/colleges")
    Flux<CollegeVO> query(@SpringQueryMap CollegeQuery params, @SpringQueryMap String... projection);

    @GetMapping(value = "/colleges/get")
    Mono<CollegeVO> get(@SpringQueryMap CollegeGet params, @SpringQueryMap String... projection);

    @PutMapping(value = "/colleges")
    Mono<Integer> modify(CollegeModify params);

    @DeleteMapping(value = "/colleges/delete")
    Mono<Integer> delete(@SpringQueryMap CollegeDelete params);

}
