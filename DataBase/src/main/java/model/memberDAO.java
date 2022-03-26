package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// 오라클 데이터베이스에 연결하고 select, insert, delete 작업을 실행해주는 클래스
public class memberDAO {
	
	//오라클에 접속하는 소스 작성 - 커넥션풀을 이용해서 가져오기에 이젠 필요 없음
//	String id = "system";	//접속아이디
//	String pass = "123456";
//	String url = "jdbc:oracle:thin:@localhost:1521:XE";	//접속 URL
	
	Connection con;	//데이터베이스에 접근할수 있도록 설정
	PreparedStatement pstmt; //데이터베이스에서 쿼리를 실행시켜주는 객체	
	ResultSet rs;	//데이터베이스의 테이블의 결과를 리턴받아 자바에 저장해주는 객체
	
	//데이터베이스에 접근할 수 있도록 도와주는 메소드 생성
	public void getCon() {
		//커넥션 풀을 이용하여 데이터베이스에 접근
		try {
			//외부에서 데이터를 읽어드려야 하기에 context 사용
			Context initctx = new InitialContext();
			//톰캣 서버의 정보를 담아놓은 곳으로 이동
			Context envctx = (Context) initctx.lookup("java:comp/env");
			//데이터 소스 객체를 선언
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			//데이터 소스를 기준으로 커넥션을 연결
			con = ds.getConnection();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
//		try {
//			//1. 해당 데이터베이스를 사용한다고 선언(클래스 등록 - 오라클용)
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			
//			//2. 해당 데이터베이스에 접속
//			con = DriverManager.getConnection(url, id, pass);		
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
	}
	
	//데이터베이스에 한사람의 회원 정보를 저장해주는 메소드
	public void insertMember(memberBean mbean) {
		try {
			getCon();
			
			//3. 접속 후 쿼리준비
			String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?)";
			
			//4. 쿼리 사용 설정
			PreparedStatement pstmt = con.prepareStatement(sql);
			//?에 맞게 데이터를 맵핑
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPw1());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getHobby());
			pstmt.setString(6, mbean.getJob());
			pstmt.setString(7, mbean.getAge());
			pstmt.setString(8, mbean.getInfo());
			
			
			//5.오라클에서 쿼리를 실행
			pstmt.executeUpdate();	//insert, updae, delete 시 사용하는 메소드
			
			//6.자원 반납
			con.close();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//모든회원의 정보를 리턴해주는 메소드 호출
	public Vector<memberBean> allSelectMember() {
		//가변길이로 데이터를 저장
		Vector<memberBean> v = new Vector<>();
		
		// 데이터베이스, 쓰레드, io입출력, 네트워크는 무조건 예외처리 필수
		try {
			//커넥션 연결 - 데이터베이스 접속
			getCon();
			
			//쿼리준비
			String sql = "SELECT * FROM MEMBER";
			
			//쿼리 실행시켜주는 객체 생성
			pstmt = con.prepareStatement(sql);
			
			//쿼리 실행 결과를 리턴(오라클 테이블의 검색된 결과를 자바에 리턴)
			rs = pstmt.executeQuery();
			
			//반복문을 사용해서 rs에 저장된 데이터를 추출
			while(rs.next()) {		//저장된 데이터만큼까지 반복문을 돌림
				memberBean mbean = new memberBean();	//컬럼으로 나뉘어진 데이터를 bean클래스에 저장
				mbean.setId(rs.getString(1));
				mbean.setPw1(rs.getString(2));
				mbean.setEmail(rs.getString(3));
				mbean.setTel(rs.getString(4));
				mbean.setHobby(rs.getString(5));
				mbean.setJob(rs.getString(6));
				mbean.setAge(rs.getString(7));
				mbean.setInfo(rs.getString(8));
			
				//패키징된 memberBean 클래스를 벡터에 저장
				v.add(mbean);		//0번지부터 순서대로 데이터를 저장
			}
			//자원 반납
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		//다 저장된 벡터를 리턴
		return v; 
	}
	
	//한사람에 대한 정보를 리턴하는 메소드
	public memberBean oneSelectMember(String id) {
		//한사람에 대한 정보만 리턴하기에 빈클래스 객체 생성
		memberBean mbean = new memberBean();
		
		try {
			//커넥션 연결
			getCon();
			
			//쿼리준비
			String sql = "SELECT * FROM MEMBER WHERE ID = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);	//?에 값을 맵핑
			
			//쿼리 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	//레코드가 있다면
				mbean.setId(rs.getString(1));
				mbean.setPw1(rs.getString(2));
				mbean.setEmail(rs.getString(3));
				mbean.setTel(rs.getString(4));
				mbean.setHobby(rs.getString(5));
				mbean.setJob(rs.getString(6));
				mbean.setAge(rs.getString(7));
				mbean.setInfo(rs.getString(8));
			}
			
			//자원반납
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return mbean;
	}
	
	//한 회원의 비밀번호 리턴 메소드
	public String getPw(String id) {
		String pw = "";
		
		try {
			getCon();
			
			String sql = "SELECT PW1 FROM MEMBER WHERE ID = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pw = rs.getString(1);
			}
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return pw;
	}
	
	//한 회원의 정보를 수정
	public void updateMember(memberBean bean) {
		getCon();
		
		try {
			String sql = "UPDATE MEMBER SET EMAIL=?, TEL=? WHERE ID=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getEmail());
			pstmt.setString(2, bean.getTel());
			pstmt.setString(3, bean.getId());
			
			pstmt.executeUpdate();
			
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//한 회원을 삭제하는 메소드
	public void deleteMember(String id) {
		getCon();
		
		try {
			String sql = "DELETE FROM MEMBER WHERE ID=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
}
