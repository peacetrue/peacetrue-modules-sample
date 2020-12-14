package com.github.peacetrue.sample.modules.casesummary;

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
 * 案例总结客户端
 *
 * @author xiayx
 */
@ReactiveFeignClient(name = "sample", url = "${peacetrue.CaseSummary.url:${peacetrue.server.url:}}")
public interface CaseSummaryServiceClient {

    @PostMapping(value = "/case-summarys")
    Mono<CaseSummaryVO> add(CaseSummaryAdd params);

    @GetMapping(value = "/case-summarys", params = "page")
    Mono<Page<CaseSummaryVO>> query(@Nullable @SpringQueryMap CaseSummaryQuery params, @Nullable Pageable pageable, @SpringQueryMap String... projection);

    @GetMapping(value = "/case-summarys", params = "sort")
    Flux<CaseSummaryVO> query(@SpringQueryMap CaseSummaryQuery params, Sort sort, @SpringQueryMap String... projection);

    @GetMapping(value = "/case-summarys")
    Flux<CaseSummaryVO> query(@SpringQueryMap CaseSummaryQuery params, @SpringQueryMap String... projection);

    @GetMapping(value = "/case-summarys/get")
    Mono<CaseSummaryVO> get(@SpringQueryMap CaseSummaryGet params, @SpringQueryMap String... projection);

    @PutMapping(value = "/case-summarys")
    Mono<Integer> modify(CaseSummaryModify params);

    @DeleteMapping(value = "/case-summarys/delete")
    Mono<Integer> delete(@SpringQueryMap CaseSummaryDelete params);

}
