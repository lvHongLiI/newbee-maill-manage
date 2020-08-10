package com.lvhongli.typeHandler;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
@MappedJdbcTypes(JdbcType.TINYINT)
public class PlatformUserSTypeHandler extends BaseTypeHandler<String> {
    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, String parameter, JdbcType jdbcType) throws SQLException {

    }

    @Override
    public String getNullableResult(ResultSet rs, String columnName) throws SQLException {
        return getType(Byte.valueOf(rs.getString(columnName)));
    }

    @Override
    public String getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        return getType(Byte.valueOf(rs.getString(columnIndex)));
    }

    @Override
    public String getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        return getType(Byte.valueOf(cs.getString(columnIndex)));
    }

    private String getType(Byte s){
        switch (s){
            case 1:
                return "平台";
            case 2:
                return "微信";
            case 3:
                return "支付宝";
            default:
                return "";
        }
    }
}
