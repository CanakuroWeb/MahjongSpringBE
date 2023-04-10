BEGIN;
CREATE DATABASE db_mjproj;

USE db_mjproj;
CREATE TABLE tb_user(
 userid BIGINT PRIMARY KEY,
 username varchar(50)
);

CREATE TABLE tb_game (
	game_id BIGINT PRIMARY KEY,
    added_by BIGINT,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    guild_id BIGINT
);

CREATE TABLE tb_game_result(
	game_id BIGINT ,
    user_rank TINYINT,
    user_id BIGINT,
    user_score BIGINT,
    PRIMARY KEY(game_id,user_rank)
);

CREATE INDEX idx_tb_game_result ON tb_game_result(game_id,user_rank);
CREATE INDEX idx_tb_game ON tb_game(game_id);
CREATE INDEX idx_tb_user ON tb_user(userid);
COMMIT;

