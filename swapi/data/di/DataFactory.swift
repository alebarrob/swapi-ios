//
//  DataFactory.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 18/12/24.
//

import Factory

extension Container {
    var categoryRepository: Factory<CategoryRepository> {
        self {
            CategoryRepositoryImpl(context: PersistenceController.shared.context)
        }
            .singleton
    }
    
    var foodRepository: Factory<FoodRepository> {
        self {
            FoodRepositoryImpl(context: PersistenceController.shared.context)
        }
            .singleton
    }
}
