package exam01.ds;

import java.sql.Connection;
import java.util.List;

import exam01.dao.MoneyDao;
import exam01.dto.Money;

public class JdbcUtilTest {

	public static void main(String[] args) {
		Connection con = jdbcUtil.getConnection();
		System.out.println("con >> " + con);
		
		MoneyDao moneyDao = MoneyDao.getInstance();
		
		List<Money> list = moneyDao.selectMoneyByAll();
		list.stream().forEach(System.out::println);
		
	}

}
