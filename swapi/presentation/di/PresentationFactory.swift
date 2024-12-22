//
//  PresentationFactory.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 21/12/24.
//

import Factory

extension Container {
    var categoryViewModel: Factory<CategoryViewModel> {
        self { CategoryViewModel(getAllCategories: self.getAllCategories()) }
                .singleton
        }
}
