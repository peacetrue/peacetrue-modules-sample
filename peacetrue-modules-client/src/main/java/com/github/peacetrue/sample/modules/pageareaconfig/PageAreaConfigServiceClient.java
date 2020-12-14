package com.github.peacetrue.sample.modules.pageareaconfig;

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
 * 页面区域配置客户端
 *
 * @author xiayx
 */
@ReactiveFeignClient(name = "sample", url = "${peacetrue.PageAreaConfig.url:${peacetrue.server.url:}}")
public interface PageAreaConfigServiceClient {

    @PostMapping(value = "/page-area-configs")
    Mono<PageAreaConfigVO> add(PageAreaConfigAdd params);

    @GetMapping(value = "/page-area-configs", params = "page")
    Mono<Page<PageAreaConfigVO>> query(@Nullable @SpringQueryMap PageAreaConfigQuery params, @Nullable Pageable pageable, @SpringQueryMap String... projection);

    @GetMapping(value = "/page-area-configs", params = "sort")
    Flux<PageAreaConfigVO> query(@SpringQueryMap PageAreaConfigQuery params, Sort sort, @SpringQueryMap String... projection);

    @GetMapping(value = "/page-area-configs")
    Flux<PageAreaConfigVO> query(@SpringQueryMap PageAreaConfigQuery params, @SpringQueryMap String... projection);

    @GetMapping(value = "/page-area-configs/get")
    Mono<PageAreaConfigVO> get(@SpringQueryMap PageAreaConfigGet params, @SpringQueryMap String... projection);

    @PutMapping(value = "/page-area-configs")
    Mono<Integer> modify(PageAreaConfigModify params);

    @DeleteMapping(value = "/page-area-configs/delete")
    Mono<Integer> delete(@SpringQueryMap PageAreaConfigDelete params);

}
