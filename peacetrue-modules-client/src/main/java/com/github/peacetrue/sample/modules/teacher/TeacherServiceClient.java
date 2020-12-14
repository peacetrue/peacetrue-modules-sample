package com.github.peacetrue.sample.modules.teacher;

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
 * 导师客户端
 *
 * @author xiayx
 */
@ReactiveFeignClient(name = "sample", url = "${peacetrue.Teacher.url:${peacetrue.server.url:}}")
public interface TeacherServiceClient {

    @PostMapping(value = "/teachers")
    Mono<TeacherVO> add(TeacherAdd params);

    @GetMapping(value = "/teachers", params = "page")
    Mono<Page<TeacherVO>> query(@Nullable @SpringQueryMap TeacherQuery params, @Nullable Pageable pageable, @SpringQueryMap String... projection);

    @GetMapping(value = "/teachers", params = "sort")
    Flux<TeacherVO> query(@SpringQueryMap TeacherQuery params, Sort sort, @SpringQueryMap String... projection);

    @GetMapping(value = "/teachers")
    Flux<TeacherVO> query(@SpringQueryMap TeacherQuery params, @SpringQueryMap String... projection);

    @GetMapping(value = "/teachers/get")
    Mono<TeacherVO> get(@SpringQueryMap TeacherGet params, @SpringQueryMap String... projection);

    @PutMapping(value = "/teachers")
    Mono<Integer> modify(TeacherModify params);

    @DeleteMapping(value = "/teachers/delete")
    Mono<Integer> delete(@SpringQueryMap TeacherDelete params);

}
