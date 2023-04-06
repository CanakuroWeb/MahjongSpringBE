package kuro9.mjapi.mahjongapi.rest

data class UserData(
    val user_id: ULong,
    val user_name: String,
    val total_uma: Int, // x10 처리해 정수로 전달
    val game_count: Int,
    val rank_count: Array<Int>,
    val rank_pp: Array<Int>, //x100 처리해 정수 어쩌구
    val avg_rank: Int, //x10
    val avg_uma: Int, //x100
)
