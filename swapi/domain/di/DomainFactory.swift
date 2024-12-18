//
//  DomainFactory.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 18/12/24.
//

import Factory

extension Container {
    var getAllCategories: Factory<GetAllCategories> {
        self { GetAllCategories(categoryRepository: self.categoryRepository()) }
                .singleton
        }
    
    var getEquivalentFoods: Factory<GetEquivalentFoods> {
        self { GetEquivalentFoods() }
                .singleton
        }
    
    var getFoodById: Factory<GetFoodById> {
        self { GetFoodById(foodRepository: self.foodRepository()) }
                .singleton
        }
    
    var getFoodsByCategoryId: Factory<GetFoodsByCategoryId> {
        self { GetFoodsByCategoryId(foodRepository: self.foodRepository()) }
                .singleton
        }
    
    var isValidFoodAmount: Factory<IsValidFoodAmount> {
        self { IsValidFoodAmount() }
                .singleton
        }
}
