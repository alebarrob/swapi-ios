//
//  CategoryViewModel.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 21/12/24.
//

import Foundation
import Combine

class CategoryViewModel : ObservableObject {
    @Published private(set) var state: CategoryScreenState = .loading
    private let getAllCategories: GetAllCategories
    
    init(getAllCategories: GetAllCategories) {
        self.getAllCategories = getAllCategories
        
        onEvent(.loadCategories)
    }
    
    func onEvent(_ event: CategoryScreenEvent) {
        switch event {
        case .loadCategories:
            loadCategories()
        }
    }
    
    private func loadCategories() {
        state = .loading
        
        Task {
            let result = await getAllCategories.execute()
            
            await MainActor.run { [weak self] in
                guard let self = self else { return }
                
                switch result {
                case .success(let categories):
                    self.state = .success(
                        categories: categories.map { category in
                            category.toCategoryVo()
                        }
                    )
                case .failure:
                    self.state = .failure
                }
            }
        }
    }
}
