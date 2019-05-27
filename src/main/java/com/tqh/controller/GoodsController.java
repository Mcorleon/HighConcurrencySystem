package com.tqh.controller;

import com.github.pagehelper.PageHelper;
import com.tqh.model.Goods;
import com.tqh.model.MiaoshaGoodsVo;
import com.tqh.service.impl.GoodsServiceImpl;
import com.tqh.service.impl.OrderServiceImpl;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @Author Mcorleon
 * @Date 2019/2/21 20:15
 */
@Api(tags = "商品模块")
@RestController
@RequestMapping("/goods")
public class GoodsController implements InitializingBean{
    @Autowired
    GoodsServiceImpl goodsService;

    @GetMapping("/getGoodsList")
    @ApiOperation(value = "获取商品列表", notes = "分页获取商品列表，配合前端layui使用")
    public Map getGoodsList(int page,int limit){
        PageHelper.startPage(page, limit);
        Map<String, Object> map = goodsService.getGoodsList();
        return map;
    }
    @PostMapping("/getMiaoshaGoodsList/{goods_id}")
    @ApiOperation(value = "获取秒杀商品列表", notes = "分页获取秒杀商品列表，配合前端layui使用")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "page", value = "当前页", required = true),
            @ApiImplicitParam(name = "limit", value = "每页数量", required = true),
            @ApiImplicitParam(name = "goods_id", value = "商品id", required = true)
    })
    public String getMiaoshaGoodsList(int page, int limit, @PathVariable String goods_id){
        PageHelper.startPage(page, limit);
        return   goodsService.getMiaoshaGoodsList(goods_id);

    }
    @ApiOperation(value = "获取秒杀商品", notes = "根据id获取秒杀商品")
    @PostMapping("/getMiaoshaGoodByID")
    public MiaoshaGoodsVo getMiaoshaGoodByID(String id){
        return   goodsService.getMiaoshaGoodByID(id);

    }


    @Override
    public void afterPropertiesSet() throws Exception {
        System.out.println("将所有库存加入redis缓存");
        goodsService.addAllStockToRedis();
    }
}
