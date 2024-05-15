//
//  EventDescriptionView.swift
//  PiraruCook
//
//  Created by Breno Harris on 13/05/24.
//

import SwiftUI

struct EventDescriptionView: View {
    @State var showingSheet: Bool = false
    var body: some View {
        VStack {
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .stroke(.secondary, lineWidth: 1.5)
                .frame(width: 350, height: 150)
                .foregroundStyle(.secondary)
                .overlay {
                    HStack {
                        Circle()
                            .frame(width: 100)
                        Text("Escolha seu Boi e concorra à cupons de desconto nesse evento de tempo limitado! ")
                    }
                    
                }
                .padding()
            
            Section {
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .stroke(.secondary, lineWidth: 1.5)
                    .frame(width: 350, height: 200)
                    .foregroundStyle(.secondary)
                    .overlay {
                        VStack {
                            Text("O Festival Folclórico de Parintins é uma festa popular celebrada anualmente em Parintins. A festa é realizada na última semana de junho e as apresentações acontecem no Bumbódromo. No festival competem entre si o boi Garantido e o boi Caprichoso.")
                                
                        }
                        .padding()
                    }
            } header: {
                HStack(alignment: .bottom) {
                    Text("Informações do evento")
                    Spacer()
                }
                .padding(.horizontal)
                .bold()
                
            }
            
            Spacer()
            Button("Escolher meu boi") {
                showingSheet.toggle()
            }
            .padding()
            .sheet(isPresented: $showingSheet) {
                ChooseBoiSheet()
            }
            
        }
        .navigationTitle("Festival de Parintins")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    EventDescriptionView()
}
