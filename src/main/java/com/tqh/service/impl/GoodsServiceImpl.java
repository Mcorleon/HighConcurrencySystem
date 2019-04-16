package com.tqh.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.Page;
import com.tqh.mapper.GoodsMapper;
import com.tqh.model.GoodIDAndStock;
import com.tqh.model.Goods;
import com.tqh.model.MiaoshaGoodsVo;
import com.tqh.service.GoodsService;
import com.tqh.util.JsonTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author Mcorleon
 * @Date 2019/2/21 20:16
 */
@Service
@CacheConfig(cacheNames = "goods")
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    GoodsMapper goodsMapper;
    @Autowired
    StringRedisTemplate stringRedisTemplate;
    @Override
    public Map<String, Object> getGoodsList() {
        List<Goods> list=goodsMapper.getGoodsList();
        long total = ((Page<Goods>) list).getTotal();
        Map<String, Object> map = new HashMap();
        map.put("code", 0);
        map.put("msg", "getGoodsList");
        map.put("count", total);
        map.put("data", list);
        return map;
    }

    @Override
    public String getMiaoshaGoodsList(String goods_id) {
        List<MiaoshaGoodsVo> list=goodsMapper.getMiaoshaGoodsList(goods_id);
        long total = ((Page<MiaoshaGoodsVo>) list).getTotal();
        Map<String, Object> map = new HashMap();
        map.put("code", 0);
        map.put("msg", "getMiaoshaGoodsList");
        map.put("count", total);
        map.put("data", list);
        return JsonTool.objectToJson(map);
    }

    @Override
    public MiaoshaGoodsVo getMiaoshaGoodByID(String id) {
        return goodsMapper.getMiaoshaGoodByID(id);
    }

    @Override
    @Transactional
    public boolean decreaseStock(String goods_id) {
        return goodsMapper.decreaseStock(goods_id);
    }

    @Override
    @Transactional
    public void addAllStockToRedis() {
        List<GoodIDAndStock> list=goodsMapper.getGoodsIDAndStock();
        for(GoodIDAndStock goodIDAndStock:list){
            stringRedisTemplate.opsForValue().set(goodIDAndStock.getId()+"stock",String.valueOf(goodIDAndStock.getStock()));
        }
    }
}
