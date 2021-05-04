package com.sample.dockerspringboot.resources;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rest/docker/hello")
public class HelloResource {

    @GetMapping
    public String hello(){
        return "This is my sample task\n I am doing some changes";
    }
}
