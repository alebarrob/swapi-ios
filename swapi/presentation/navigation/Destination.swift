//
//  Destination.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 24/12/24.
//

enum Destination: Hashable {
    case foodSelectionScreen(categoryId: Int)
    
    case foodAmountSelectionScreen(foodId: Int)
    
    case foodResultScreen(
        discardedFoodId: Int,
        discardedFoodAmount: String
    )
}
