//
//  FoodSelectionViewModel.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 22/12/24.
//

import Foundation
import Combine

class FoodSelectionViewModel : ObservableObject {
    @Published private(set) var state: FoodSelectionScreenState = .loading
    private let getFoodsByCategoryId: GetFoodsByCategoryId
    
    init(getFoodsByCategoryId: GetFoodsByCategoryId, categoryId: Int) {
        self.getFoodsByCategoryId = getFoodsByCategoryId
        
        onEvent(FoodSelectionScreenEvent.loadFoods(categoryId: categoryId))
    }
    
    func onEvent(_ event: FoodSelectionScreenEvent) {
        switch event {
        case .loadFoods(let categoryId):
            loadFoods(categoryId: categoryId)
        }
    }
    
    private func loadFoods(categoryId: Int) {
        state = .loading
        
        Task {
            let result = await getFoodsByCategoryId.execute(params: GetFoodsByCategoryId.Params(id: categoryId))
            
            await MainActor.run { [weak self] in
                guard let self = self else { return }
                
                switch result {
                case .success(let foods):
                    self.state = .success(
                        foods: foods.map { food in
                            food.toFoodVo()
                        }
                    )
                case .failure:
                    self.state = .failure
                }
            }
        }
    }
}
