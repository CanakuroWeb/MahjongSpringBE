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
	game_id BIGINT,
    user_rank TINYINT,
    user_id BIGINT,
    user_score BIGINT,
    PRIMARY KEY pkey_tb_game_result(game_id,user_rank),
    FOREIGN KEY (game_id) REFERENCES tb_game(game_id),
);
-- tb_game(game_id) 를 외래키로 가진다.


CREATE INDEX idx_tb_game_result ON tb_game_result(game_id,user_rank); -- 인덱스 걸어서 검색때 더 빠르게 SELECT 
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
    _rank_user BIGINT[],
    _rank_score BIGINT[],
    _discord_server BIGINT,
    _added_user BIGINT,
    _game_id BIGINT
)
RETURNS BOOLEAN;
BEGIN
    INSERT INTO tb_game (game_id,added_by,guild_id) VALUES (_game_id,_added_user,_discord_server);
    DECLARE i INT DEFAULT 0;
    loop_insertplayer:LOOP
        INSERT INTO tb_game_result (game_id,user_rank,user_id,user_score) VALUES (_game_id,i+1,_rank_user[i],_rank_score[i]);
        IF i >=4 THEN
            LEAVE loop_insertplayer;
        END IF;
        SET i = i+1;
    END LOOP;
    RETURN true;
END;
COMMIT;


-- 개인 연습용

-- tb_game의 guild_id가 19000 에서 등록된 모든 게임의 "결과"를 tb_game_result에서 불러오라.
SELECT B.* FROM tb_game AS A LEFT JOIN tb_game_result AS B ON A.game_id = B.game_id WHERE A.guild_id = 19000; -- 이러면 tb_game_result만 가져오게 될 것
-- OUTER 은 '조건에 부합하지 않아도' 붙힌다는점을 명심하자. 헷갈렸다. 
-- PS. Bad Example by Sub-query
SELECT * FROM tb_game_result WHERE game_id = ( SELECT game_id FROM tb_game WHERE guild_id = 19000 ) ;

-- 마작내에서 3 or 4 위를 가장 많이 한 사람을 찾으라.
-- 2중 join
SELECT user_id,COUNT(user_rank) FROM tb_game_result WHERE user_rank=3 OR user_rank=4 GROUP BY user_id ORDER BY COUNT(user_rank) LIMIT 1;
