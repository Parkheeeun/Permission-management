package Pkg.Boards.DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import Pkg.Boards.Commons.DB.DBCon;
import Pkg.Boards.VO.BoardVO;
import Pkg.Boards.VO.MemberVO;
import oracle.jdbc.OracleTypes;

@Repository
public class BoardDAOImpl implements BoardDAO{

	public ArrayList<BoardVO> getBoardsList(String idx){
		ArrayList<BoardVO> boardsList=new ArrayList<BoardVO>();
		try {
			Connection con=DBCon.getConnection();
			String strSql="{call PKG_BOARD.PROC_SEL_BOARD(?,?)}";
			ArrayList<String> params=new ArrayList<String>();
			params.add(idx);
			
			CallableStatement csmt=DBCon.getCallableStatement(con, strSql, params);
			csmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			csmt.executeQuery();
			
			ResultSet rs=(ResultSet)csmt.getObject(2);
			
			while(rs.next()) {
				BoardVO vo=new BoardVO();
				vo.setIdx(rs.getString("IDX"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setUserID(rs.getString("USERID"));
				boardsList.add(vo);
			}
			
			rs.close();
			rs=null;
			csmt.close();
			csmt=null;
			con.close();
			con=null;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return boardsList;
	}
	public ArrayList<MemberVO> getMembersList(String userID){
		ArrayList<MemberVO> membersList=new ArrayList<MemberVO>();
		try {
			Connection con=DBCon.getConnection();
			String strSql="{call PKG_BOARD.PROC_SEL_MEMBER(?,?)}";
			ArrayList<String> params=new ArrayList<String>();
			params.add(userID);
			
			CallableStatement csmt=DBCon.getCallableStatement(con, strSql, params);
			csmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			csmt.executeQuery();
			
			ResultSet rs=(ResultSet)csmt.getObject(2);
			
			while(rs.next()) {
				MemberVO vo=new MemberVO();
				vo.setUserID(rs.getString("USERID"));
				vo.setUserName(rs.getString("USERNAME"));
				membersList.add(vo);
			}
			
			rs.close();
			rs=null;
			csmt.close();
			csmt=null;
			con.close();
			con=null;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return membersList;
	}
	
	
	public void saveBoard(String[] idx, String[] title, String[] userID, String[] status) {
		Connection con=DBCon.getConnection();
		CallableStatement csmt=null;
		String strSql="{call PKG_BOARD.PROC_SAVE_BOARD(?,?,?)}";
		try {
			con.setAutoCommit(false);
			for(int i=0; i<title.length; i++) {
				ArrayList<String> params=new ArrayList<String>();
				params.add(idx[i]);
				params.add(title[i]);
				params.add(userID[i]);
				
				
				csmt=DBCon.getCallableStatement(con, strSql, params);
				
				if(status[i]!=null) {
					csmt.executeUpdate();
				}
			}
			con.commit();
			
			
		}catch(Exception e) {
			try {
				con.rollback();
			}catch(SQLException a) {
				a.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				csmt.close();
				csmt=null;
				con.close();
				con=null;
			}catch(Exception b) {
				b.printStackTrace();
			}
		}
	}
	
	
	public void deleteBoard(String[] idx) {
		Connection con=DBCon.getConnection();
		CallableStatement csmt=null;
		String strSql="{call PKG_BOARD.PROC_DEL_BOARD(?)}";
		try {
			con.setAutoCommit(false);
			for(int i=0; i<idx.length; i++) {
				ArrayList<String> params=new ArrayList<String>();
				params.add(idx[i]);
				
				csmt=DBCon.getCallableStatement(con, strSql, params);
				
				csmt.executeUpdate();
			}
			con.commit();
			
			
		}catch(Exception e) {
			try {
				con.rollback();
			}catch(SQLException a) {
				a.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				csmt.close();
				csmt=null;
				con.close();
				con=null;
			}catch(Exception b) {
				b.printStackTrace();
			}
		}
	}
	
	
	

}
