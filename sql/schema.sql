-- Users テーブルの作成
CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE COMMENT 'ユーザー名', 
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'メールアドレス', 
    password_hash VARCHAR(255) NOT NULL COMMENT 'パスワードのハッシュ', 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT='ユーザー情報を保存するテーブル';

-- ToDoLists テーブルの作成
CREATE TABLE ToDoLists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL COMMENT 'ユーザーID', 
    title VARCHAR(100) NOT NULL COMMENT 'タイトル', 
    description TEXT COMMENT '説明', 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
) COMMENT='ユーザーのToDoリストを保存するテーブル';

-- Tasks テーブルの作成
CREATE TABLE Tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    todo_list_id INT NOT NULL COMMENT 'ToDoリストID',
    title VARCHAR(100) NOT NULL COMMENT 'タスクのタイトル',
    description TEXT COMMENT 'タスクの説明',
    due_date DATE COMMENT '期限日',
    status ENUM('pending', 'in_progress', 'completed') NOT NULL DEFAULT 'pending' COMMENT 'ステータス',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (todo_list_id) REFERENCES ToDoLists(id) ON DELETE CASCADE
) COMMENT='ToDoリストのタスクを保存するテーブル';
