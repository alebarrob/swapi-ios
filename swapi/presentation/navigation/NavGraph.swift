//
//  NavGraph.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 24/12/24.
//

import SwiftUI
import Factory

struct NavGraph: View {
    @Environment(\.colors) var colors
    @State private var path = NavigationPath()
    
    let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    var body: some View {
        VStack {
            NavigationStack(path: $path) {
                // Start destination
                CategoryScreen(
                    container: container,
                    path: $path
                )
                .navigationDestination(
                    for: Destination.self,
                    destination: { destination in
                        switch destination {
                            case .foodSelectionScreen(let categoryId):
                                FoodSelectionScreen(
                                    container: container,
                                    path: $path,
                                    categoryId: categoryId
                                )
                                .navigationBar(path: $path)
                            
                            case .foodAmountSelectionScreen(let foodId):
                                FoodAmountSelectionScreen(
                                    container: container,
                                    path: $path,
                                    foodId: foodId
                                )
                                .navigationBar(path: $path)
                            
                            case .foodResultScreen(
                                let discardedFoodId,
                                let discardedFoodAmount
                            ):
                                FoodResultScreen(
                                    container: container,
                                    path: $path,
                                    discardedFoodId: discardedFoodId,
                                    discardedFoodAmount: discardedFoodAmount
                                )
                                .navigationBar(path: $path)
                            }
                    }
                )
            }
            .accentColor(colors.white)
        }
    }
}
