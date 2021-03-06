package com.tqh.controller;

import com.github.pagehelper.PageHelper;
import com.tqh.model.Result;
import com.tqh.service.impl.OrderServiceImpl;
import com.tqh.util.AccessLimit;
import com.tqh.util.JsonTool;
import com.tqh.util.SnowFlake;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * @Author Mcorleon
 * @Date 2019/2/22 21:20
 */

@RequestMapping("/order")
@RestController
@Api(tags = "订单模块")
public class OrderController {
    @Autowired
    OrderServiceImpl orderService;

    /**
     *QPS: 447
     * 1000*10
     * rabbitMQ+接口优化后600
     */
    @PostMapping("/generateOrder")
    @ApiOperation(value = "生成订单", notes = "过程：redis预减库存->生成订单->交给mq")
//    @AccessLimit(limit = 500,sec = 5)
    public Result generateOrder(String nickName, String miaosha_id, int goods_num, String address_id) {
        return orderService.generateOrder(miaosha_id,nickName,goods_num,address_id);
    }

    /**
     *QPS: 285
     * 500*20
     */
    @PostMapping("/getOrderVoByUid")
    @ApiOperation(value = "获取订单列表视图" )
    public String getOrderVoByUid(int page, int limit,String uid){
        PageHelper.startPage(page, limit);
        Map<String, Object> map = orderService.getOrderVoByUid(uid);
        return JsonTool.objectToJson(map);
    }



}
