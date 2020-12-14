package com.github.peacetrue.sample.modules.goodnews;

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
 * 喜报客户端
 *
 * @author xiayx
 */
@ReactiveFeignClient(name = "sample", url = "${peacetrue.GoodNews.url:${peacetrue.server.url:}}")
public interface GoodNewsServiceClient {

    @PostMapping(value = "/good-newss")
    Mono<GoodNewsVO> add(GoodNewsAdd params);

    @GetMapping(value = "/good-newss", params = "page")
    Mono<Page<GoodNewsVO>> query(@Nullable @SpringQueryMap GoodNewsQuery params, @Nullable Pageable pageable, @SpringQueryMap String... projection);

    @GetMapping(value = "/good-newss", params = "sort")
    Flux<GoodNewsVO> query(@SpringQueryMap GoodNewsQuery params, Sort sort, @SpringQueryMap String... projection);

    @GetMapping(value = "/good-newss")
    Flux<GoodNewsVO> query(@SpringQueryMap GoodNewsQuery params, @SpringQueryMap String... projection);

    @GetMapping(value = "/good-newss/get")
    Mono<GoodNewsVO> get(@SpringQueryMap GoodNewsGet params, @SpringQueryMap String... projection);

    @PutMapping(value = "/good-newss")
    Mono<Integer> modify(GoodNewsModify params);

    @DeleteMapping(value = "/good-newss/delete")
    Mono<Integer> delete(@SpringQueryMap GoodNewsDelete params);

}
