package com.github.peacetrue.sample.modules.successcase;

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
@ReactiveFeignClient(name = "sample", url = "${peacetrue.SuccessCase.url:${peacetrue.server.url:}}")
public interface SuccessCaseServiceClient {

    @PostMapping(value = "/success-cases")
    Mono<SuccessCaseVO> add(SuccessCaseAdd params);

    @GetMapping(value = "/success-cases", params = "page")
    Mono<Page<SuccessCaseVO>> query(@Nullable @SpringQueryMap SuccessCaseQuery params, @Nullable Pageable pageable, @SpringQueryMap String... projection);

    @GetMapping(value = "/success-cases", params = "sort")
    Flux<SuccessCaseVO> query(@SpringQueryMap SuccessCaseQuery params, Sort sort, @SpringQueryMap String... projection);

    @GetMapping(value = "/success-cases")
    Flux<SuccessCaseVO> query(@SpringQueryMap SuccessCaseQuery params, @SpringQueryMap String... projection);

    @GetMapping(value = "/success-cases/get")
    Mono<SuccessCaseVO> get(@SpringQueryMap SuccessCaseGet params, @SpringQueryMap String... projection);

    @PutMapping(value = "/success-cases")
    Mono<Integer> modify(SuccessCaseModify params);

    @DeleteMapping(value = "/success-cases/delete")
    Mono<Integer> delete(@SpringQueryMap SuccessCaseDelete params);

}
