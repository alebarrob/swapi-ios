//
//  FailureScreen.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 22/12/24.
//

import SwiftUI

struct FailureScreen: View {
    @Environment(\.dimensions) var dimensions
    
    var body: some View {
        ErrorPopup()
    }
}

#Preview("Failure Screen") {
    FailureScreen()
}
