-- DROP DATABASE db_mjproj;
-- 이건 하고나서

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
    PRIMARY KEY pkey_tb_game_result(game_id,user_rank),
    FOREIGN KEY (game_id) REFERENCES tb_game(game_id),
    
);
-- tb_game(game_id) 를 외래키로 가진다.


CREATE INDEX idx_tb_game_result ON tb_game_result(game_id,user_rank);
CREATE INDEX idx_tb_game ON tb_game(game_id);
CREATE INDEX idx_tb_user ON tb_user(userid);
COMMIT;

BEGIN
DELIMITER //
CREATE PROCEDURE search_usernick_by_id(
	IN user_id BIGINT, OUT usernick varchar(50)
)
-- 유저 id로 닉을 찾는 프로시저이다.
BEGIN
	SELECT usernick INTO usernick FROM tb_user WHERE userid=user_id;
END //

COMMIT; -- fail-saftiy

BEGIN 
DELIMITER//
-- 게임을 삽입하는 함수이다. 결과로는 삽입 성공과 실패를 return 하자.
CREATE FUNCTION insert_new_game(

)
RETURNS
DECLARE


BEGIN


END

COMMIT;
