//
//  FoodAmountSelectionScreen.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 24/12/24.
//

import SwiftUI
import Factory

struct FoodAmountSelectionScreen: View {
    @Environment(\.colors) var colors
    @Environment(\.dimensions) var dimensions
    @Environment(\.typography) var typography
    @StateObject private var viewModel: FoodAmountSelectionViewModel
    
    let container: Container
    @Binding private var path: NavigationPath

    init(
        container: Container,
        path: Binding<NavigationPath>,
        foodId: Int
    ) {
        self.container = container
        _path = path
        _viewModel = StateObject(wrappedValue: container.foodAmountSelectionViewModel(foodId))
    }

    var body: some View {
        VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
            switch viewModel.state {
                case .loading:
                    LoadingScreen()

                case .success(let food):
                    SuccessFoodAmountSelectionScreen(
                        food: food,
                        isValidFoodAmount: { amount in
                            viewModel.isValidFoodAmount(amount: amount)
                        },
                        onCalculateClick: { discardedFoodId, discardedFoodAmount in
                            path.append(
                                Destination.foodResultScreen(
                                    discardedFoodId: discardedFoodId,
                                    discardedFoodAmount: discardedFoodAmount
                                )
                            )
                        }
                    )

                case .failure:
                    FailureScreen()
            }
        }
    }
}

struct SuccessFoodAmountSelectionScreen: View {
    @State var amount: String = ""
    @State var isError: Bool = false
    @Environment(\.colors) var colors
    @Environment(\.dimensions) var dimensions
    @Environment(\.typography) var typography
    
    let food: FoodVo
    let isValidFoodAmount: (String) -> Bool
    let onCalculateClick: (Int, String) -> Void
    @FocusState private var isFocused: Bool
    
    var body: some View {
        let firstChunk = Text("¡Casi hemos terminado! Dime cuánta cantidad de este alimento ibas a consumir. Después, pulsa en ")
        .foregroundColor(colors.black)
        let secondChunk = Text("Calcular equivalencias")
        .foregroundColor(colors.darkGreen)
        .bold()
        let thirdChunk = Text(".")
        .foregroundColor(colors.black)
        
        ZStack {
            Color.clear
                .ignoresSafeArea()
                .contentShape(Rectangle()) // Asegura que el área completa sea interactiva
                .onTapGesture {
                    isFocused = false
                }
            
            VStack(spacing: dimensions.medium) {
                InformationCard(
                    text: {
                        firstChunk + secondChunk + thirdChunk
                    },
                    decorativeIconName: "surprisedWatermelonIcon",
                    highlightIconName: nil,
                    iconPosition: IconPosition.decorativeOnStart
                )
                FoodAmountCard(
                    food: food,
                    amount: $amount,
                    isError: isError,
                    isFocused: $isFocused
                )
                ActionButton(
                    text: "¡Calcular Equivalencias!",
                    onClick: {
                        if isValidFoodAmount(amount) {
                            isError = false
                            onCalculateClick(
                                food.id,
                                amount.replacingOccurrences(of: ",", with: ".")
                            )
                        } else {
                            isError = true
                        }
                    }
                )
            }
            .padding(.horizontal, dimensions.large)
            .padding(.top, -dimensions.informationCardDecorativeImageYOffset)
            .padding(.top, dimensions.medium)
            .frame(maxHeight: .infinity, alignment: .top)
            .alert(isPresented: $isError) {
                Alert(
                    title: Text("¡Atención!"),
                    message: Text("La cantidad introducida no es válida."),
                    dismissButton: .default(Text("ACEPTAR"))
                )
            }
        }
    }
}

#Preview("Success Food Amount Selection Screen") {
    @Previewable @Environment(\.colors) var colors
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        SuccessFoodAmountSelectionScreen(
            food: FoodVo(
                id: 49,
                name: "Aguacate",
                iconName: "avocadoIcon",
                standardAmount: "50.0",
                equivalentAmount: "45.0",
                category: CategoryVo(
                    id: 3,
                    name: "Grasas",
                    conversionFactor: 50.0
                ),
                unit: UnitVo(
                    id: 1,
                    name: "gr."
                )
            ),
            isValidFoodAmount: { _ in true },
            onCalculateClick: { _, _ in }
        )
    }
}
