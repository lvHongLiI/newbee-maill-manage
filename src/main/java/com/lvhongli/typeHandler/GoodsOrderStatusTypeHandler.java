package com.lvhongli.typeHandler;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedJdbcTypes(JdbcType.TINYINT)
public class GoodsOrderStatusTypeHandler extends BaseTypeHandler<String> {

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, String parameter, JdbcType jdbcType) throws SQLException {

    }

    @Override
    public String getNullableResult(ResultSet rs, String columnName) throws SQLException {

        return getStatus(Byte.valueOf(rs.getString(columnName)));
    }

    @Override
    public String getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        return getStatus(Byte.valueOf(rs.getString(columnIndex)));
    }

    @Override
    public String getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        return getStatus(Byte.valueOf(cs.getString(columnIndex)));
    }

    private String getStatus(Byte s){
        switch (s){
            case 1:
                return "待支付";
            case 2:
                return "已支付";
            case 21:
                return "支付异常";
            case 3:
                return "已退款";
            case 31:
                return "退款异常";
            case  4:
                return "超时失效";
            default:
                return "";
        }
    }
}
