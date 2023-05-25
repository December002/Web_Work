
package test.guest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.guest.dto.GuestDto;
import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class GuestDao {
	
	private static GuestDao dao;
	
	private GuestDao() {}
	
	public static GuestDao getInstance() {
		if(dao==null) {
			dao=new GuestDao();
		}
		return dao;
	}
	
	//글하나의 정보를 수정 반영하는 메소드(비밀번호가 일치해야 수정이 된다)
	public boolean update(GuestDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE guest_board"
					+ " set writer=?, content=?"
					+ " WHERE num=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			//실행할 sql 문이 미완성이라면 여기서 완성
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
			pstmt.setString(4, dto.getPwd());
			//sql 문을 수행하고 변화된(추가, 수정, 삭제된) row 의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		//만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public GuestDto getData(int num) {
		GuestDto dto = null;
		// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DbcpBean 객체를 이용해서 Connection 객체를 얻어온다(Connection pool 에서 얻어오기)
			conn = new DbcpBean().getConn();
			// 실행할 sql 문
			String sql = "select num, writer, content, pwd, regdate"
					+ " from guest_board "
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			// sql 문이 미완성이라면 여기서 완성
			pstmt.setInt(1, num);
			// query 문 수행하고 결과값 받아오기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet에 담긴 내용 추
				//MemberDto 객체 생성해서
			if(rs.next()) {
				dto=new GuestDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
	            dto.setPwd(rs.getString("pwd"));
	            dto.setRegdate(rs.getString("regdate"));

			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();// Connection 이 Connection Pool 에 반납된다.
			} catch (Exception e) {
			}
		}
		//회원 한명의 정보가 담긴 MemberDto 객체 리턴해주기
		return dto;	
	}

	
	public boolean delete(GuestDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM guest_board"
					+ " WHERE num=? AND pwd=?";
			pstmt=conn.prepareStatement(sql);
			//실행할 sql 문이 미완성이라면 여기서 완성
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getPwd());
			//sql 문을 수행하고 변화된(추가, 수정, 삭제된) row 의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		//만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean insert(GuestDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO guest_board"
					+ " (num, writer, content, pwd, regdate)"
					+ " values(guest_board_seq.nextval, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			//실행할 sql 문이 미완성이라면 여기서 완성
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getPwd());
			//sql 문을 수행하고 변화된(추가, 수정, 삭제된) row 의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		//만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	public List<GuestDto> getList(){
		List<GuestDto> list =new ArrayList<>();
		//필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다(Connection pool 에서 얻어오기)
			conn=new DbcpBean().getConn();
			//실행할 sql 문
			String sql="select num, writer, content, pwd, regdate"
					+ " from guest_board"
					+ " order by num DESC";
			pstmt=conn.prepareStatement(sql);
			//sql 문이 미완성이라면 여기서 완성
			
			//query 문 수행하고 결과값 받아오기
			rs=pstmt.executeQuery();
			//반복문 돌면서 ResultSet에 담긴 내용 추출
			while(rs.next()) {
				GuestDto dto=new GuestDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setPwd(rs.getString("pwd"));
				dto.setRegdate(rs.getString("regdate"));//날짜도 getString() 으로 읽어온다.
				//글정보가 담긴 dto 를 ArrayList 객체에 누적시킨다.
				list.add(dto);
			}
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();//Connection 이 Connection Pool 에 반납된다.
			}catch(Exception e) {}
		}
		return list;
	}
}
