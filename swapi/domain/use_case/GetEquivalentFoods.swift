//
//  GetEquivalentFoods.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 17/12/24.
//

class GetEquivalentFoods {
    func execute(params: Params) -> [Food] {
        return params.replacementFoods
        .removeDiscardedFood(discardedFood: params.discardedFood)
        .map { food in
            Food(
                id: food.id,
                name: food.name,
                iconName: food.iconName,
                standardAmount: food.standardAmount,
                equivalentAmount: getEquivalentAmount(
                    discardedFood: params.discardedFood,
                    discardedFoodAmount: params.discardedFoodAmount,
                    desiredFood: food
                ),
                category: food.category,
                unit: food.unit
            )
        }
    }
    
    private func getEquivalentAmount(
        discardedFood: Food,
        discardedFoodAmount: Double,
        desiredFood: Food
    ) -> Double {
        let discardedToStandardAmount =
                    discardedFoodAmount * discardedFood.category.conversionFactor / discardedFood.standardAmount
        let equivalentDesiredFoodAmount =
                    discardedToStandardAmount * desiredFood.standardAmount / discardedFood.category.conversionFactor
        
        return equivalentDesiredFoodAmount
    }
    
    struct Params {
        let discardedFood: Food
        let discardedFoodAmount: Double
        let replacementFoods: [Food]
    }
}

private extension Array where Element == Food {
    func removeDiscardedFood(discardedFood: Food) -> [Food] {
        return self.filter { food in
            food.id != discardedFood.id
        }
    }
}
