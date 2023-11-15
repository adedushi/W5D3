PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;
CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;
CREATE TABLE question_follows(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS replies;
CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    reply_id INTEGER,
    user_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (reply_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_likes;
CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO users (fname, lname) VALUES ('John', 'Doe');
INSERT INTO users (fname, lname) VALUES ('Alice', 'Smith');
INSERT INTO users (fname, lname) VALUES ('Bob', 'Johnson');


INSERT INTO questions (title, body, user_id) VALUES ('Question 1', 'Question', 1);
INSERT INTO questions (title, body, user_id) VALUES ('Question 2', 'question.', 2);


INSERT INTO question_follows (question_id, user_id) VALUES (1, 2);
INSERT INTO question_follows (question_id, user_id) VALUES (1, 3);
INSERT INTO question_follows (question_id, user_id) VALUES (2, 1);


INSERT INTO replies (body, question_id, user_id) VALUES ('Hello!!', 1, 2);
INSERT INTO replies (body, question_id, user_id) VALUES ('Fake Reply', 1, 3);
INSERT INTO replies (body, question_id, user_id) VALUES ('Sadness', 2, 1);


INSERT INTO question_likes (user_id, question_id) VALUES (1, 1);
INSERT INTO question_likes (user_id, question_id) VALUES (2, 1);
INSERT INTO question_likes (user_id, question_id) VALUES (3, 2);