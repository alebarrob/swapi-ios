//
//  PresentationFactory.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 21/12/24.
//

import Factory

extension Container {
    var categoryViewModel: Factory<CategoryViewModel> {
        self {
            CategoryViewModel(getAllCategories: self.getAllCategories())
        }
        .singleton
    }
    
    var foodSelectionViewModel: ParameterFactory<Int, FoodSelectionViewModel> {
        self { categoryId in
            FoodSelectionViewModel(
                getFoodsByCategoryId: self.getFoodsByCategoryId(),
                categoryId: categoryId
            )
        }
    }
    
    var foodAmountSelectionViewModel: ParameterFactory<Int, FoodAmountSelectionViewModel> {
        self { foodId in
            FoodAmountSelectionViewModel(
                getFoodById: self.getFoodById(),
                isValidFoodAmount: self.isValidFoodAmount(),
                foodId: foodId
            )
        }
    }
    
    var foodResultViewModel: ParameterFactory<(Int, String), FoodResultViewModel> {
            self { (discardedFoodId, discardedFoodAmount) in
                FoodResultViewModel(
                    getFoodById: self.getFoodById(),
                    getFoodsByCategoryId: self.getFoodsByCategoryId(),
                    getEquivalentFoods: self.getEquivalentFoods(),
                    discardedFoodId: discardedFoodId,
                    discardedFoodAmount: discardedFoodAmount
                )
            }
        }
}
