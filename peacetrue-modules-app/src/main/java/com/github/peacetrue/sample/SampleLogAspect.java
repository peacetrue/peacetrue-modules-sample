package com.github.peacetrue.sample;

import com.github.peacetrue.aspect.AroundService;
import com.github.peacetrue.aspect.supports.AroundParamsImpl;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author xiayx
 */
@Aspect
@Component
public class SampleLogAspect {

    @Autowired
    private AroundService logAroundService;

    @Around("(execution(* com.github.peacetrue..*Service.add(..))||execution(* com.github.peacetrue..*Service.modify(..))||execution(* com.github.peacetrue..*Service.delete(..)))&&(!execution(* com.github.peacetrue..LogService.*(..)))")
    public Object advice(ProceedingJoinPoint joinPoint) throws Throwable {
        return logAroundService.proceed(new AroundParamsImpl(joinPoint));
    }
}
