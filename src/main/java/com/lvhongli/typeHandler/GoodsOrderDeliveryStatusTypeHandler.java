package com.lvhongli.typeHandler;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedJdbcTypes(JdbcType.TINYINT)
public class GoodsOrderDeliveryStatusTypeHandler extends BaseTypeHandler<String> {

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, String parameter, JdbcType jdbcType) throws SQLException {

    }

    @Override
    public String getNullableResult(ResultSet rs, String columnName) throws SQLException {

        return getPay(Byte.valueOf(rs.getString(columnName)));
    }

    @Override
    public String getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        return getPay(Byte.valueOf(rs.getString(columnIndex)));
    }

    @Override
    public String getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        return getPay(Byte.valueOf(cs.getString(columnIndex)));
    }
    private String getPay(Byte s){
        switch (s){
            case 1:
                return "待配货";
            case 2:
                return "配货完成";
            case 3:
                return "已出库";
            case 4:
                return "运输中";
            case 5:
                return "已验收";
            case 6:
                return "已退货";
            case 7:
                return "关闭订单";
            default:
                return "";
        }
    }
}
