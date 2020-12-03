package exam01.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import exam01.ds.jdbcUtil;
import exam01.dto.Member;

public class MemberDao {
	private static final MemberDao instance = new MemberDao();

	public MemberDao() {
		super();
	}

	public static final MemberDao getInstance() {
		return instance;
	}
	
	public List<Member> selectMemberByAll(){
		String sql=" select custno, custname, phone, address, joindate, grade, city from member_tbl_01 ";
		try(Connection con = jdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			if(rs.next()) {
				List<Member> list = new ArrayList<>();
				do {
					list.add(getMember(rs));
				}while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Member getMember(ResultSet rs) throws SQLException {
		int custNo = rs.getInt("custno");
		String custName =rs.getString("custname");
		String phone = rs.getString("phone");
		String address = rs.getString("address");
		Timestamp joinDate = rs.getTimestamp("joindate");
		String grade = rs.getString("grade");
		String city =  rs.getString("city");
		
		return new Member(custNo, custName, phone, address, joinDate, grade, city);
	}
	
	public int nextCustNo() {
		String sql = "SELECT MAX(custno)+1 from member_tbl_01 ";
		try(Connection con = jdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int insertMember(Member member) {
		String sql ="INSERT INTO member_tbl_01 VALUES(?, ?, ?, ?, sysdate, ?, ?)";
		try(Connection con = jdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
				pstmt.setInt(1, member.getCustNo());
				pstmt.setString(2, member.getCustName());
				pstmt.setString(3, member.getPhone());
				pstmt.setString(4, member.getAddress());
				pstmt.setString(5, member.getGrade());
				pstmt.setString(6, member.getCity());
				return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int updateMember(Member member) {
		String sql = "UPDATE member_tbl_01 SET custname=?, phone=?, address=?, grade=?, city=? where custno=? ";
		try(Connection con = jdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, member.getCustName());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getAddress());
			pstmt.setString(4, member.getGrade());
			pstmt.setString(5, member.getCity());
			pstmt.setInt(6, member.getCustNo());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public Member selectMemberByNo(int custNo) {
		String sql ="select custno, custname, phone, address, joindate, grade, city from member_tbl_01 where custNo=?";
		try(Connection con = jdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, custNo);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					return getMember(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
