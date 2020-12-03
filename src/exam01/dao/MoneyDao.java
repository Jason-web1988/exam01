package exam01.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import exam01.ds.jdbcUtil;
import exam01.dto.Money;

public class MoneyDao {
	public static final MoneyDao instance = new MoneyDao();

	public MoneyDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static final MoneyDao getInstance() {
		return instance;
	}
	
	public List<Money> selectMoneyByAll(){
		String sql = "select m.custno, custname, grade, total\r\n" + 
				"from member_tbl_01 m join (select custno, sum(price) as total\r\n" + 
				"							from money_tbl_01\r\n" + 
				"							group by custno)n on m.custno = n.custno\r\n" + 
				"							order by total desc";
		try(Connection con = jdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();){
			if(rs.next()) {
				List<Money> list =new ArrayList<>();
				do {
					list.add(getMoney(rs));
				}while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	private Money getMoney(ResultSet rs) throws SQLException {
		int custNo = rs.getInt("custNo");
		String custName = rs.getString("custname");
		String grade = rs.getString("grade");
		int total = rs.getInt("total");
		return new Money(custNo, custName, grade, total);
	}
}
