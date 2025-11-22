package org.example.wsd_hw3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// 데이터베이스 연결 및 자원 해제를 위한 유틸리티 클래스
public class JDBCUtil {

    // 사용자님의 Walab ID: W25_22400191 을 기반으로 설정했습니다.
    // DB 이름이 다른 경우, URL만 수정해 주세요.

    private static final String DRIVER = "org.mariadb.jdbc.Driver";

    // Walab 서버 주소, MariaDB 기본 포트(3306), DB 이름(ID_db) 사용
    private static final String URL = "jdbc:mariadb://walab.handong.edu:3306/W25_22400191";

    private static final String USER = "W25_22400191";

    private static final String PASSWORD = "loo5Ne";

    // JDBC 드라이버 로드
    static {
        try {
            Class.forName(DRIVER);
            System.out.println("MariaDB JDBC Driver 로드 성공!");
        } catch (ClassNotFoundException e) {
            System.err.println("MariaDB JDBC Driver 로드 실패: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // 커넥션을 얻는 메서드
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // 자원 해제 (Connection, Statement)
    public static void close(Connection conn, PreparedStatement pstmt) {
        if (pstmt != null) {
            try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        if (conn != null) {
            try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }

    // 자원 해제 (Connection, Statement, ResultSet)
    public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        if (rs != null) {
            try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        close(conn, pstmt);
    }
}