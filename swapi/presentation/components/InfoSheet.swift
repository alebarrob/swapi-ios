//
//  InfoSheet.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 12/1/25.
//

import SwiftUI

struct InfoSheet: View {
    @Environment(\.dimensions) var dimensions
    @Environment(\.typography) var typography
    @Environment(\.colors) var colors
    
    var body: some View {
        VStack(alignment: .leading, spacing: dimensions.medium) {
            Text("Fuentes")
            .font(typography.titles.medium)
            .fontWeight(.semibold)
            Button {
                if let url = URL(string: "https://cardiacos.net/Documents/Biblioteca%20Medica/02%20-%20Cardiologia/Libros%20y%20Otros%20Espanol/Tablas%20Alimentos%20Lloret-Burgaleta/3-Equivalenciaspara%20dietas%20por%20Raciones.pdf") {
                    UIApplication.shared.open(url)
                }
            } label: {
                Text("Equivalencias para Dietas por Raciones, Sebastián Fernández y Esther Burgaleta, Hospital Clínico de Granada (PDF)")
                .font(typography.body.medium)
                .foregroundColor(.blue)
                .multilineTextAlignment(.leading)
            }
            Button {
                if let url = URL(string: "https://www.fundacionparalasalud.org/sabercomer/tabla_de_raciones_de_hidratos_de_carbono") {
                    UIApplication.shared.open(url)
                }
            } label: {
                Text("Tabla de Raciones de Hidratos de Carbono, Serafín Murillo, Especialista en Diabetes y Nutrición, Fundación para la Salud (Recurso Web)")
                .font(typography.body.medium)
                .foregroundColor(.blue)
                .multilineTextAlignment(.leading)
            }
            Spacer()
        }
        .padding(dimensions.large)
        .frame(maxWidth: .infinity, alignment: .leading)
        .presentationDetents([.medium, .large])
    }
}

#Preview("Information Sheet") {
    InfoSheet()
}
