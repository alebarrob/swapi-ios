//
//  CategoryRepository.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 17/12/24.
//

protocol CategoryRepository {
    func getAllCategories() async -> Result<[Category], Error>
}
