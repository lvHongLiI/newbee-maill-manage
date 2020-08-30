package com.lvhongli;

import com.alibaba.fastjson.JSONObject;
import com.lvhongli.dao.GoodsCategoryMapper;
import com.lvhongli.dao.GoodsMapper;
import com.lvhongli.entity.Goods;
import com.lvhongli.entity.GoodsCategory;
import com.lvhongli.util.HttpUtil;
import com.lvhongli.util.IDGeneratorUtil;
import org.apache.http.Consts;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Random;
@RunWith(SpringRunner.class)
@SpringBootTest(classes = NewBeeMallManageApplication.class)
public class GoodsTest {

    IDGeneratorUtil idGeneratorUtil=new IDGeneratorUtil();

    @Autowired
    GoodsMapper goodsMapper;

    @Autowired
    GoodsCategoryMapper categoryMapper;
    @Test
    public void test(){
        int i=31;
        for (int i1 = 29; i1 <=i; i1++) {
            GoodsCategory category = categoryMapper.selectByPrimaryKey(i1);
            String params=null;
            List<BasicNameValuePair> list = new LinkedList<>();
            list.add(new BasicNameValuePair("count", "20"));
            list.add(new BasicNameValuePair("gprice", ""));
            list.add(new BasicNameValuePair("page",""));
            list.add(new BasicNameValuePair("keyword", category.getName()));
            try {
                params = EntityUtils.toString(new UrlEncodedFormEntity(list, Consts.UTF_8));
            } catch (IOException e) {
                e.printStackTrace();
            }
            String url = "https://odin.re.taobao.com/search_tbuad?_noSEC=true&catid=&frcatid=&ac=nvVUFw0xWDUCAXZxb/SrJkg4&ip=118.113.111.244&wangwangid=&offset=&pid=430698_1006&refpid=mm_10011550_0_0&buckid=&clk1=b7d2a40cf5cd0b4d62ac8a50a21599bb&elemtid=1&propertyid=&loc=&ismall=1&creativeid=&feature_names=spGoldMedal%2CspIsNew%2CpromoPrice%2CfeedbackContent%2CfeedbackNick%2Ctags%2CfeedbackCount%2CdsrDescribe%2CdsrDescribeGap%2CdsrService%2CdsrServiceGap%2CdsrDeliver%2CdsrDeliverGap&reqFields=eurl%2CimgUrl%2Cismall%2CitemId%2Cloc%2Cprice%2CsellCount%2CpromoPrice%2CpromoName%2CsellerPayPostfee%2Ctitle%2CdsrDeliver%2CdsrDescribe%2CdsrService%2CdsrDescribeGap%2CdsrServiceGap%2CdsrDeliverGap%2CspGoldMedal%2Cisju%2CpriceDiscount%2CwangwangId%2Credkeys&sbid=&ua=Mozilla%2F5.0%20(Windows%20NT%2010.0%3B%20WOW64)%20AppleWebKit%2F537.36%20(KHTML%2C%20like%20Gecko)%20Chrome%2F75.0.3770.100%20Safari%2F537.36&pvoff=&X-Client-Scheme=https&"+params;
            String s = HttpUtil.requestGet(url,new HashMap<>());
            Map map = JSONObject.parseObject(s,Map.class);
            JSONObject data = (JSONObject) map.get("data");
            List lss = data.getObject("data1", List.class);
            Random random=new Random();

            for (Object o : lss) {
                Map mps= (Map) o;
                System.out.println(o);
                Goods goods=new Goods();
                goods.setId(String.valueOf(idGeneratorUtil.nextId()));
                goods.setCreateTime(new Date());
                goods.setCreateUser(4);
                goods.setUpdateTime(new Date());
                goods.setUpdateUser(4);
                goods.setStatus((byte)(random.nextInt(50)%2==0?1:2));
                goods.setNum(random.nextInt(50)+20);
                goods.setSellingNum(0);
                goods.setTitle((String) mps.get("title"));
                goods.setImg((String) mps.get("imgUrl"));
                goods.setCategoryId(category.getId());
                goods.setPrice(Double.valueOf((String)mps.get("price")) );
                goods.setSellingPrice("".equals(mps.get("promoPrice"))?goods.getPrice():Double.valueOf((String) mps.get("promoPrice")));
                goodsMapper.insert(goods);
            }
        }

    }
}
