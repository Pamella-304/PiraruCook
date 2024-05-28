//
//  EditAddressView.swift
//  PiraruCook
//
//  Created by Breno Harris on 13/05/24.
//

import SwiftUI

struct EditAddressView: View {

    @Environment(User.self) private var user: User
    @State var exampleAddress = [Address]()
    @State var editingAddress: Int? = nil
    @State var isEditingList = false
    @State var currentAddress = 0
    @State var isShowingSheetNewAddress = false
    
    @State var searchingAddress = ""
    @State var editingAddressName = ""
    @State var editingAddressLocation = ""
    @State var editingAddressPicture = "house"
    
    
    @State var newAddressName = ""
    @State var newAddressLocation = ""
    @State var newAddressPicture = "house"
    
    
    
    var symbols = ["suitcase", "sofa", "house", "house.lodge"]
    
    var body: some View {
        
        
        List {
            ForEach(0..<exampleAddress.count, id: \.self) { index in
                Button {
                    currentAddress = index
                    print("Current adddress = \(index)")
                } label: {
                    CardAddressView(myAddress: $exampleAddress[index], isCurrentAddress: (index == currentAddress), isEditing: $isEditingList, myIndex: index, editingAddress: $editingAddress, editingAddressName: $editingAddressName, editingAddressLocation: $editingAddressLocation, editingAddressPicture: $editingAddressPicture)
                }
                
            }
            .onDelete(perform: { indexSet in
                exampleAddress.remove(atOffsets: indexSet)
            })
        }
        .listStyle(.inset)
        
        Button {
            isShowingSheetNewAddress.toggle()
        }label:{
            Text("Adicionar endereço").font(Font(Fonts.title3Font))
                            .foregroundColor(.white)
                            .padding(16)
                            .frame(maxWidth: .infinity)
                            .background(.brandPrimary).bold()
                    }
                    .cornerRadius(10)
                    .padding(16)
        
        
        
                    .sheet(isPresented: $isShowingSheetNewAddress) {
                        VStack{
                            List {
                                
                                Section {
                                    TextField("Nome do endereço", text: $newAddressName)
                                        .foregroundStyle(.secondary)
                                    
                                    
                                    
                                } header: {
                                    HStack {
                                        Text("Nome do endereço")
                                            .font(Font(Fonts.title4Font))
                                            .foregroundStyle(.brandSecondary)
                                        
                                        Spacer()
                                    }
                                    
                                }
                                
                                
                                
                                
                                Section {
                                    TextField("Endereço", text: $editingAddressLocation, axis: .vertical)
                                        .foregroundStyle(.secondary)
                                    
                                    
                                    TextField("Número", text: $editingAddressLocation, axis: .vertical)
                                        .foregroundStyle(.secondary)
                                    
                                    
                                    TextField("CEP", text: $editingAddressLocation, axis: .vertical)
                                        .foregroundStyle(.secondary)
                                    
                                    
                                    
                                } header: {
                                    HStack {
                                        Text("Endereço")
                                            .font(Font(Fonts.title4Font))
                                            .foregroundStyle(.brandSecondary)
                                        Spacer()
                                    }
                                    
                                }
                            }
                                
                                
                                
                                Picker("Figura", selection: $newAddressPicture) {
                                    ForEach(symbols, id: \.self) {
                                        Image(systemName: $0)
                                    }
                                }
                                .padding()
                                .pickerStyle(.palette)
                            
                                
                                Spacer()
                                Button {
                                    createNewAddress()
                                    isShowingSheetNewAddress.toggle()
                                } label: {
                                    Text("Salvar Alterações")
                                        .font(Font(Fonts.title4Font))
                                        .foregroundStyle(.white)
                                        .padding()
                                }
                                .frame(maxWidth: .infinity)
                                .background(.brandPrimary)
                                .clipShape(Capsule()).padding()
                            
                        }.presentationDetents([.fraction(0.6)])
            
        }
        
        .sheet(isPresented: $isEditingList) {
            VStack{
                List {
                    
                    Section {
                        TextField("Nome do endereço", text: $editingAddressName)
                            .foregroundStyle(.secondary)
                        
                        
                        
                    } header: {
                        HStack {
                            Text("Alterar Nome do endereço")
                                .font(Font(Fonts.title4Font))
                                .foregroundStyle(.brandSecondary)
                            
                            Spacer()
                        }
                        
                    }
                    
                    
                    
                    Section {
                        TextField("Endereço", text: $editingAddressLocation, axis: .vertical)
                            .foregroundStyle(.secondary)
                        
                        
                        TextField("Número", text: $editingAddressLocation, axis: .vertical)
                            .foregroundStyle(.secondary)
                        
                        
                        TextField("CEP", text: $editingAddressLocation, axis: .vertical)
                            .foregroundStyle(.secondary)
                        
                        
                        
                    } header: {
                        HStack {
                            Text("Alterar endereço")
                                .font(Font(Fonts.title4Font))
                                .foregroundStyle(.brandSecondary)
                            
                            
                        }
                        
                    }
                }
                    
                    
                    
                    Picker("Figura", selection: $editingAddressPicture) {
                        ForEach(symbols, id: \.self) {
                            Image(systemName: $0)
                        }
                    }
                    .padding()
                    .pickerStyle(.palette)
                
                    
                    
                    Spacer()
                    Button {
                        updateAddress()
                        isEditingList.toggle()
                    } label: {
                        Text("Salvar Alterações")
                            .font(Font(Fonts.title4Font))
                            .foregroundStyle(.white)
                            .padding()
                    }
                    .cornerRadius(10)
                    .background(.brandPrimary)
                    .clipShape(Capsule())
                    .padding()
                    
                
            }.presentationDetents([.fraction(0.5)])
            
        }
        .task {
            exampleAddress = user.addresses
        }
        .navigationTitle("Endereços")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchingAddress, placement: .navigationBarDrawer(displayMode: .always), prompt: "Buscar endereço")
            

    }
    
    
    func createNewAddress() {
        var newAddress = Address(location: newAddressLocation, nickname: newAddressName, picture: newAddressPicture)
        exampleAddress.append(newAddress)
        
        user.addresses.append(newAddress)
        user.updateUser(user: user)
    }
    
    func updateAddress() {
        exampleAddress[editingAddress ?? 0].nickname = editingAddressName
        
        exampleAddress[editingAddress ?? 0].location = editingAddressLocation
        
        exampleAddress[editingAddress ?? 0].picture = editingAddressPicture
        
        user.addresses[editingAddress ?? 0].nickname = editingAddressName
        
        user.addresses[editingAddress ?? 0].location = editingAddressLocation
        
        user.addresses[editingAddress ?? 0].picture = editingAddressPicture
        user.updateUser(user: user)
        
//        UserDefaults.standard.dictionaryRepresentation().keys.first(where: { $0.hasPrefix("user_ ") 
    }
}

struct Address: Hashable, Codable {
    var location: String
    var nickname: String
    var picture: String
}

#Preview {
    EditAddressView()
}
