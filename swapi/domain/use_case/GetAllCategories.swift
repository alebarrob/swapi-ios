//
//  GetAllCategories.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 17/12/24.
//

class GetAllCategories {
    private let categoryRepository: CategoryRepository
    
    init(categoryRepository: CategoryRepository) {
        self.categoryRepository = categoryRepository
    }
    
    func execute() async -> Result<[Category], Error> {
        return await categoryRepository.getAllCategories()
    }
}
