//
//  FoodResultScreenState.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 24/12/24.
//

enum FoodResultScreenState {
    case loading
    
    case success(
        discardedFood: FoodVo,
        discardedFoodAmount: String,
        equivalentFoods: [FoodVo]
    )
    
    case failure
}
