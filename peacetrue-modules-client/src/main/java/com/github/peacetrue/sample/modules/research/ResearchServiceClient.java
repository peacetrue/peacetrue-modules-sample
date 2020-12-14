package com.github.peacetrue.sample.modules.research;

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
 * 主题研学客户端
 *
 * @author xiayx
 */
@ReactiveFeignClient(name = "sample", url = "${peacetrue.Research.url:${peacetrue.server.url:}}")
public interface ResearchServiceClient {

    @PostMapping(value = "/researchs")
    Mono<ResearchVO> add(ResearchAdd params);

    @GetMapping(value = "/researchs", params = "page")
    Mono<Page<ResearchVO>> query(@Nullable @SpringQueryMap ResearchQuery params, @Nullable Pageable pageable, @SpringQueryMap String... projection);

    @GetMapping(value = "/researchs", params = "sort")
    Flux<ResearchVO> query(@SpringQueryMap ResearchQuery params, Sort sort, @SpringQueryMap String... projection);

    @GetMapping(value = "/researchs")
    Flux<ResearchVO> query(@SpringQueryMap ResearchQuery params, @SpringQueryMap String... projection);

    @GetMapping(value = "/researchs/get")
    Mono<ResearchVO> get(@SpringQueryMap ResearchGet params, @SpringQueryMap String... projection);

    @PutMapping(value = "/researchs")
    Mono<Integer> modify(ResearchModify params);

    @DeleteMapping(value = "/researchs/delete")
    Mono<Integer> delete(@SpringQueryMap ResearchDelete params);

}
