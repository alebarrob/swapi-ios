//
//  FoodSelectionScreenState.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 22/12/24.
//

enum FoodSelectionScreenState {
    case loading
    case success(foods: [FoodVo])
    case failure
}
