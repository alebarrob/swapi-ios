//
//  ContentView.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 25/11/24.
//

import SwiftUI
import Factory

struct CategoryScreen: View {
    @Environment(\.colors) var colors
    @Environment(\.dimensions) var dimensions
    @Environment(\.typography) var typography
    @StateObject private var viewModel: CategoryViewModel
    
    let container: Container
    @Binding private var path: NavigationPath
    
    init(
        container: Container,
        path: Binding<NavigationPath>
    ) {
        self.container = container
        _path = path
        _viewModel = StateObject(wrappedValue: container.categoryViewModel())
    }
    
    var body: some View {
        VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
            switch viewModel.state {
                case .loading:
                    LoadingScreen()

                case .success(let categories):
                    SuccessCategoryScreen(
                        categories: categories,
                        onCategoryClick: { categoryId in
                            path.append(
                                Destination.foodSelectionScreen(categoryId: categoryId)
                            )
                        }
                    )

                case .failure:
                    FailureScreen()
            }
        }
    }
}

struct SuccessCategoryScreen: View {
    @Environment(\.colors) var colors
    @Environment(\.dimensions) var dimensions
    
    let categories: [CategoryVo]
    let onCategoryClick: (Int) -> Void
    
    var body: some View {
        let firstChunk = Text("¡Bienvenid@ a ")
        .foregroundColor(colors.black)
        let secondChunk = Text("Swapi")
        .foregroundColor(colors.red)
        .bold()
        let thirdChunk = Text("! Para empezar, elige la ")
        .foregroundColor(colors.black)
        let fourthChunk = Text("categoría")
        .foregroundColor(colors.darkGreen)
        .bold()
        let fifthChunk = Text(" del alimento que te gustaría cambiar en tu dieta.")
        .foregroundColor(colors.black)
        
        VStack(spacing: dimensions.extraLarge) {
            InformationCard(
                text: {
                    firstChunk + secondChunk + thirdChunk + fourthChunk + fifthChunk
                },
                decorativeIconName: "happyWatermelonIcon",
                highlightIconName: nil,
                iconPosition: IconPosition.highlightOnStart
            )
            DropDownButton(
                text: "CATEGORÍAS",
                options: categories.map { category in
                    category.name
                },
                onOptionClick: { categoryName in
                    if let selectedCategory = categories.first(
                        where: { category in
                            category.name == categoryName}
                    ) {
                        onCategoryClick(selectedCategory.id)
                    }
                }
            )
        }
        .padding(.horizontal, dimensions.medium)
        .padding(.top, -dimensions.informationCardDecorativeImageYOffset)
        .padding(.top, dimensions.extraSmall)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview("Success Category Screen") {
    @Previewable @Environment(\.colors) var colors
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        SuccessCategoryScreen(
            categories: [
                CategoryVo(
                    id: 1,
                    name: "Frutas",
                    conversionFactor: 130.0
                ),
                CategoryVo(
                    id: 2,
                    name: "Grasas y Proteínas",
                    conversionFactor: 110.0
                ),
                CategoryVo(
                    id: 3,
                    name: "Grasas",
                    conversionFactor: 50.0
                ),
                CategoryVo(
                    id: 4,
                    name: "Carbohidratos",
                    conversionFactor: 40.0
                ),
                CategoryVo(
                    id: 5,
                    name: "Lácteos",
                    conversionFactor: 100.0
                )
            ],
            onCategoryClick: { _ in }
        )
    }
}
