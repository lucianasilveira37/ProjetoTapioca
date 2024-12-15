package com.example.projetoTapioca

import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import java.util.Optional

@RestController
@CrossOrigin
class tapiocasController (val foodsRepository_: foodsRepository,
                          val recheiosRepository: recheiosRepository,
                          val salesRepository: SalesRepository)
{
    @GetMapping("/food")
    fun getrecheiosByFoodId(@RequestParam("id") id: Int = 0): Map<String, Any> {
        try {

            val food = foodsRepository_.findById(id);
            val recheios: List<Map<String, Float>> = recheiosRepository.getAllrecheiosByfoodId(id)
            val response: Map<String, Any> =
                mapOf(
                    "price" to food.get().price,
                    "recheio" to recheios
                )

            return response;
        } catch (e: Exception) {
            return mapOf("error" to e.message.toString());


        }
    }
    @GetMapping("/history")
    fun getAllSalesByCpfClient(@RequestParam("cpf") cpf: String): List<Sales>{
        return  salesRepository.getAllSalesByCpfClient(cpf);

    }
}



