package org.example.wsd_hw3;

import java.sql.Timestamp;

// 테이블의 컬럼과 1:1로 매핑되는 Java Bean (Value Object)
public class BoardVO {
    private int id; // INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    private String title; // VARCHAR(255)
    private String author; // VARCHAR(50)
    private String content; // TEXT
    private String category; // VARCHAR(50)
    private int password; // INT - 비밀번호 (숫자로만 처리)
    private Timestamp createdAt; // DATETIME DEFAULT CURRENT_TIMESTAMP
    private int views; // INT DEFAULT 0

    // 기본 생성자
    public BoardVO() {}

    // Getter와 Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public int getPassword() { return password; }
    public void setPassword(int password) { this.password = password; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public int getViews() { return views; }
    public void setViews(int views) { this.views = views; }
}