//
//  DietistContactSheet.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 10/1/25.
//

import SwiftUI

struct DietistContactSheet: View {
    @Environment(\.dimensions) var dimensions
    @Environment(\.typography) var typography
    @Environment(\.colors) var colors
    
    var body: some View {
        VStack(spacing: dimensions.medium) {
            Image("monicaIcon")
            .resizable()
            .scaledToFit()
            .frame(width: dimensions.giant, height: dimensions.giant)
            .cornerRadius(dimensions.medium)
            .overlay(
                RoundedRectangle(cornerRadius: dimensions.medium)
                .stroke(colors.gold, lineWidth: dimensions.highlightImageBorderLineWidth)
            )
            
            Text("¿Necesitas Asesoría Profesional?")
            .font(typography.titles.medium)
            .bold()
            .multilineTextAlignment(.center)

            Text("Contacta con nuestra Dietista Mónica Barrera para un Plan Personalizado.")
            .font(typography.body.medium)
            .multilineTextAlignment(.center)
            .padding(.horizontal)

            HStack(spacing: dimensions.extraLarge) {
                Button(
                    action: {
                        if let url = URL(string: "https://www.instagram.com/monicabr_dietista/") {
                            UIApplication.shared.open(url)
                        }
                    }
                ) {
                    VStack {
                        Image("instagramIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimensions.large, height: dimensions.large)
                        Text("Instagram")
                        .font(typography.labels.small)
                        .fontWeight(Font.Weight.semibold)
                        .foregroundColor(Color.primary)
                    }
                }

                Button(
                    action: {
                        let email = "monicabarrerarobles@gmail.com"
                        let subject = "Consulta Profesional con la Dietista Mónica Barrera"
                        let encodedSubject = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

                        if let mailtoUrl = URL(string: "mailto:\(email)?subject=\(encodedSubject)") {
                            UIApplication.shared.open(mailtoUrl)
                        }
                    }
                ) {
                    VStack {
                        Image("emailIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimensions.large, height: dimensions.large)
                        Text("Email")
                        .font(typography.labels.small)
                        .fontWeight(Font.Weight.semibold)
                        .foregroundColor(Color.primary)
                    }
                }
            }
            .padding(.top)
            Spacer()
        }
        .padding(dimensions.large)
        .presentationDetents([.medium, .large])
    }
}

#Preview("Dietist Contact Sheet") {
    DietistContactSheet()
}
