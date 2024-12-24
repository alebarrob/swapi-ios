//
//  Extensions.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 24/12/24.
//

import SwiftUI

extension View {
    func navigationBar(path: Binding<NavigationPath>) -> some View {
        self.modifier(NavigationBarModifier(path: path))
    }
}

extension Double {
    func formatAndRemoveTrailingZeros() -> String {
        let twoDecimalsFormattedAmount = String(format: "%.2f", self)
        let trailingZerosRegex = try! NSRegularExpression(pattern: "[.,]00$")
        let formattedEquivalentAmount = trailingZerosRegex.stringByReplacingMatches(
            in: twoDecimalsFormattedAmount,
            options: [],
            range: NSRange(location: 0, length: twoDecimalsFormattedAmount.count),
            withTemplate: ""
        )
        
        return formattedEquivalentAmount
    }
}
