package org.example.wsd_hw3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// 게시판 데이터베이스 작업을 처리하는 클래스
public class BoardDAO {

    // Singleton Pattern 적용 (DAO 객체는 하나만 생성)
    private static BoardDAO instance = new BoardDAO();
    private BoardDAO() {}
    public static BoardDAO getInstance() { return instance; }

    // SQL 쿼리 정의
    private static final String INSERT_POST_SQL =
            "INSERT INTO board (title, author, password, content, category) VALUES (?, ?, ?, ?, ?)";

    // 🚨 R: 검색 기능 통합을 위해 쿼리 기본 구조만 남김 🚨
    private static final String SELECT_POSTS_BASE =
            "SELECT id, title, author, category, created_at, views FROM board ";

    private static final String DELETE_POST_SQL =
            "DELETE FROM board WHERE id = ?";

    /**
     * C (Create): 새 게시글을 데이터베이스에 삽입합니다.
     * @param post 삽입할 게시글 데이터 (BoardVO 객체)
     * @return 성공 시 1, 실패 시 0
     */
    public int insertPost(BoardVO post) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(INSERT_POST_SQL);

            // 쿼리의 ? 위치에 데이터 바인딩
            pstmt.setString(1, post.getTitle());
            pstmt.setString(2, post.getAuthor());
            pstmt.setInt(3, post.getPassword()); // password는 int 타입
            pstmt.setString(4, post.getContent());
            pstmt.setString(5, post.getCategory());

            result = pstmt.executeUpdate(); // 쿼리 실행

        } catch (SQLException e) {
            System.err.println("🚨🚨🚨 게시글 삽입 중 SQL 오류 발생! 🚨🚨🚨");
            System.err.println("오류 메시지: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, pstmt);
        }
        return result;
    }

    /**
     * R (Read): 전체 게시글 목록 또는 검색된 게시글 목록을 최신 순으로 조회합니다.
     * 기존 getAllPosts()를 대체하며, 키워드가 있으면 검색을 수행합니다.
     * @param keyword 검색할 키워드 (null 또는 빈 문자열이면 전체 조회)
     * @return BoardVO 리스트
     */
    public List<BoardVO> getPosts(String keyword) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BoardVO> postList = new ArrayList<>();

        // 쿼리 문자열 조립
        String sql = SELECT_POSTS_BASE;
        boolean isSearch = keyword != null && !keyword.trim().isEmpty();

        if (isSearch) {
            // 검색 키워드가 있을 경우 WHERE 절 추가 (제목 또는 작성자 검색)
            sql += "WHERE title LIKE ? OR author LIKE ? ";
        }
        sql += "ORDER BY id DESC"; // 정렬 조건 추가

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(sql);

            if (isSearch) {
                // 키워드 바인딩 (LIKE 검색을 위해 % 사용)
                String searchKeyword = "%" + keyword + "%";
                pstmt.setString(1, searchKeyword);
                pstmt.setString(2, searchKeyword);
            }

            rs = pstmt.executeQuery();

            while (rs.next()) {
                BoardVO post = new BoardVO();
                post.setId(rs.getInt("id"));
                post.setTitle(rs.getString("title"));
                post.setAuthor(rs.getString("author"));
                post.setCategory(rs.getString("category"));
                post.setCreatedAt(rs.getTimestamp("created_at"));
                post.setViews(rs.getInt("views"));

                postList.add(post);
            }

        } catch (SQLException e) {
            System.err.println("🚨🚨🚨 게시글 조회/검색 중 SQL 오류 발생! 🚨🚨🚨");
            System.err.println("오류 메시지: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, pstmt, rs);
        }
        return postList;
    }


    /**
     * D (Delete): 특정 ID를 가진 게시글을 삭제합니다.
     */
    public int deletePost(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(DELETE_POST_SQL);

            pstmt.setInt(1, id); // 첫 번째 ? 에 ID 바인딩

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            System.err.println("🚨🚨🚨 게시글 삭제 중 SQL 오류 발생! 🚨🚨🚨");
            System.err.println("오류 메시지: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCUtil.close(conn, pstmt);
        }
        return result;
    }
}