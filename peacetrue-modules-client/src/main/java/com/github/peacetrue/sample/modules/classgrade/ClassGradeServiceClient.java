package com.github.peacetrue.sample.modules.classgrade;

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
 * 班级客户端
 *
 * @author xiayx
 */
@ReactiveFeignClient(name = "sample", url = "${peacetrue.ClassGrade.url:${peacetrue.server.url:}}")
public interface ClassGradeServiceClient {

    @PostMapping(value = "/class-grades")
    Mono<ClassGradeVO> add(ClassGradeAdd params);

    @GetMapping(value = "/class-grades", params = "page")
    Mono<Page<ClassGradeVO>> query(@Nullable @SpringQueryMap ClassGradeQuery params, @Nullable Pageable pageable, @SpringQueryMap String... projection);

    @GetMapping(value = "/class-grades", params = "sort")
    Flux<ClassGradeVO> query(@SpringQueryMap ClassGradeQuery params, Sort sort, @SpringQueryMap String... projection);

    @GetMapping(value = "/class-grades")
    Flux<ClassGradeVO> query(@SpringQueryMap ClassGradeQuery params, @SpringQueryMap String... projection);

    @GetMapping(value = "/class-grades/get")
    Mono<ClassGradeVO> get(@SpringQueryMap ClassGradeGet params, @SpringQueryMap String... projection);

    @PutMapping(value = "/class-grades")
    Mono<Integer> modify(ClassGradeModify params);

    @DeleteMapping(value = "/class-grades/delete")
    Mono<Integer> delete(@SpringQueryMap ClassGradeDelete params);

}
