package kuro9.mjapi.mahjongapi

import kuro9.mjapi.mahjongapi.rest.UserData
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@SpringBootApplication
@RestController
class MahjongApiApplication{
    @GetMapping("/ping")
    fun ping(@RequestParam(value = "name", defaultValue = "world") name: String): String {
        return "Hello, ${name}!";
    }

    @GetMapping("/user")
    fun getUser(@RequestParam(value = "username", required = true) username: String): UserData {
        // Template Response
        return UserData(
            0u,
            "TestHuman",
            0,
            0,
            arrayOf(0,0,0,0),
            arrayOf(0,0,0,0),
            0,
            0
        )
    }
}

fun main(args: Array<String>) {
    runApplication<MahjongApiApplication>(*args)
}
