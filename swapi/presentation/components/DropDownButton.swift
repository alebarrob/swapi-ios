//
//  DropDownButton.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 22/12/24.
//

import SwiftUI

struct DropDownButton: View {
    @Environment(\.typography) var typography
    @Environment(\.colors) var colors
    
    let text: String
    let options: [String]
    let onOptionClick: (String) -> Void
    
    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button {
                    onOptionClick(option)
                } label: {
                    Text(option.uppercased())
                        .font(typography.labels.medium)
                        .foregroundColor(colors.black)
                }
            }
        } label: {
            ActionButton(
                text: text,
                onClick: {}
            )
        }
    }
}

#Preview("Dropdown Button") {
    DropDownButton(
        text: "CATEGORÍAS",
        options: ["Frutas", "Grasas y Proteínas", "Grasas", "Carbohidratos", "Lácteos"],
        onOptionClick: { _ in }
    )
}
