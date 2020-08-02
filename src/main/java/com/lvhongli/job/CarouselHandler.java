package com.lvhongli.job;

import com.lvhongli.dao.CarouselMapper;
import com.lvhongli.entity.Carousel;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.type.TypeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

@Slf4j
@Component
@EnableScheduling
public class CarouselHandler {

    @Autowired
    private CarouselMapper carouselMapper;


    @Scheduled(cron="0 1 0 * * ?")
    public void CarouselStatusPast(){
        int totalCount=0;
        int successCount=0;
        log.info("关闭过期的轮播图定时任务开始！");
        List<Carousel> list=carouselMapper.getPast();
        totalCount=list.size();
        for (Carousel carousel : list) {
            carousel.setStatus("4");
            successCount+=carouselMapper.updateByPrimaryKeySelective(carousel);
        }
        log.info("关闭过期的轮播图定时任务结束：总个数："+totalCount+" 成功个数:"+successCount);
    }

}
