//
//  FoodRepository.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 17/12/24.
//

protocol FoodRepository {
    func getFoodById(id: Int) async -> Result<Food, Error>
    func getFoodsByCategoryId(id: Int) async -> Result<[Food], Error>
}
