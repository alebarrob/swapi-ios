//
//  FoodAmountSelectionViewModel.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 24/12/24.
//

import Foundation
import Combine

class FoodAmountSelectionViewModel : ObservableObject {
    @Published private(set) var state: FoodAmountSelectionScreenState = .loading
    private let getFoodById: GetFoodById
    private let isValidFoodAmount: IsValidFoodAmount
    
    init(
        getFoodById: GetFoodById,
        isValidFoodAmount: IsValidFoodAmount,
        foodId: Int
    ) {
        self.getFoodById = getFoodById
        self.isValidFoodAmount = isValidFoodAmount
        
        onEvent(FoodAmountSelectionScreenEvent.loadFood(id: foodId))
    }
    
    func onEvent(_ event: FoodAmountSelectionScreenEvent) {
        switch event {
        case .loadFood(let id):
            loadFood(id: id)
        }
    }
    
    private func loadFood(id: Int) {
        state = .loading
        
        Task {
            let result = await getFoodById.execute(params: GetFoodById.Params(id: id))
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                switch result {
                case .success(let food):
                    self.state = .success(
                        food: food.toFoodVo()
                    )
                case .failure:
                    self.state = .failure
                }
            }
        }
    }
    
    func isValidFoodAmount(amount: String) -> Bool {
        return isValidFoodAmount.execute(params: IsValidFoodAmount.Params(amount: amount))
    }
}
