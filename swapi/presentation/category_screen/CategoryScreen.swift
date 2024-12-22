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
    @StateObject private var viewModel: CategoryViewModel
    let container: Container
    
    init(container: Container) {
        self.container = container
        _viewModel = StateObject(wrappedValue: container.categoryViewModel())
    }
    
    var body: some View {
        VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
            VStack {
                switch viewModel.state {
                    case .loading:
                        LoadingScreen()

                    case .success(let categories):
                        SuccessCategoryScreen(
                            container: container,
                            categories: categories,
                            onCategoryClick: { category in
                                category
                            }
                        )
                            .padding(.vertical, dimensions.large)

                    case .failure:
                        FailureScreen()
                }
            }
                .padding(.horizontal, dimensions.medium)
                .padding(.top, -dimensions.informationCardDecorativeImageYOffset)
                .frame(maxHeight: .infinity, alignment: .top)
                .onAppear {
                    viewModel.onEvent(.loadCategories)
                }
        }
    }
}

struct SuccessCategoryScreen: View {
    @Environment(\.colors) var colors
    let container: Container
    @State private var path = NavigationPath()
    
    let categories: [CategoryVo]
    let onCategoryClick: (CategoryVo) -> Void
    
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
        
        InformationCard(
            text: {
                firstChunk + secondChunk + thirdChunk + fourthChunk + fifthChunk
            },
            decorativeIconName: "happyWatermelonIcon",
            highlightIconName: nil,
            iconPosition: IconPosition.HIGHLIGHT_ON_START
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
                    onCategoryClick(selectedCategory)
                }
            }
        )
    }
}

#Preview("Success Category Screen") {
    @Previewable @Environment(\.colors) var colors
    @Previewable @Environment(\.dimensions) var dimensions
    
    VerticalGradientBackground(colors: [colors.lightGreen, colors.green]) {
        VStack {
            SuccessCategoryScreen(
                container: Container(),
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
                .padding(.vertical, dimensions.large)
        }
            .padding(.horizontal, dimensions.medium)
            .padding(.top, -dimensions.informationCardDecorativeImageYOffset)
            .frame(maxHeight: .infinity, alignment: .top)
    }
}
