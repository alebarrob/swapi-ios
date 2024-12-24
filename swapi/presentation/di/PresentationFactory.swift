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
}
