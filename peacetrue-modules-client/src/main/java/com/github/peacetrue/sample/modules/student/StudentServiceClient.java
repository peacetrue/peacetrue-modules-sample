package com.github.peacetrue.sample.modules.student;

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
 * 学生客户端
 *
 * @author xiayx
 */
@ReactiveFeignClient(name = "sample", url = "${peacetrue.Student.url:${peacetrue.server.url:}}")
public interface StudentServiceClient {

    @PostMapping(value = "/students")
    Mono<StudentVO> add(StudentAdd params);

    @GetMapping(value = "/students", params = "page")
    Mono<Page<StudentVO>> query(@Nullable @SpringQueryMap StudentQuery params, @Nullable Pageable pageable, @SpringQueryMap String... projection);

    @GetMapping(value = "/students", params = "sort")
    Flux<StudentVO> query(@SpringQueryMap StudentQuery params, Sort sort, @SpringQueryMap String... projection);

    @GetMapping(value = "/students")
    Flux<StudentVO> query(@SpringQueryMap StudentQuery params, @SpringQueryMap String... projection);

    @GetMapping(value = "/students/get")
    Mono<StudentVO> get(@SpringQueryMap StudentGet params, @SpringQueryMap String... projection);

    @PutMapping(value = "/students")
    Mono<Integer> modify(StudentModify params);

    @DeleteMapping(value = "/students/delete")
    Mono<Integer> delete(@SpringQueryMap StudentDelete params);

}
