-- +goose Up
-- +goose StatementBegin
CREATE TABLE user (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(1000) NOT NULL
);

CREATE TABLE activity (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    due_date TIMESTAMP NOT NULL
);

CREATE TABLE user_activity (
    user_id INT,
    activity_id INT,
    delivery_date TIMESTAMP NOT NULL,
    score FLOAT NOT NULL,

    PRIMARY KEY (user_id, activity_id),
    CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES user(id),
    CONSTRAINT activity_fk FOREIGN KEY (activity_id) REFERENCES activity(id),
)
-- +goose StatementEnd


-- +goose Down
-- +goose StatementBegin
DROP TABLE user_activity;
DROP TABLE activity;
DROP TABLE user;
-- +goose StatementEnd
