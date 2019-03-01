package com.sleep.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@SpringBootApplication
@Controller
public class ServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServerApplication.class, args);
    }

    /**
     * 获取当前登录用户的个人信息
     *
     * @return 当前登录用户的个人信息
     */
    @RequestMapping("/user/me")
    @ResponseBody
    public Map<String, Object> me() {
        Map<String, Object> result = new HashMap<>();
        result.put("username", "admin");
        result.put("roles", Arrays.asList("admin", "normal", "none"));
        result.put("depts", Arrays.asList("办公室", "组织部"));
        result.put("menus", Arrays.asList("工作台", "系统管理"));
        return result;
    }
}
