//
//  AddAccountScreen.swift
//  BankApp
//
//  Created by Roy Quesada on 28/3/23.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct AddAccountScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var addAccountVM = AddAccountViewModel()
    
    var body: some View {
        Form {
            TextField("name", text: self.$addAccountVM.name)
            Picker(selection: self.$addAccountVM.accountType, label: EmptyView()){
                ForEach(AccountType.allCases, id: \.self){
                    accountType in
                    Text(accountType.title).tag(accountType)
                }
            }.pickerStyle(SegmentedPickerStyle())
            TextField("Balance", text: self.$addAccountVM.balance)
            
            HStack {
                Spacer()
                Button("Submit"){
                    self.addAccountVM.createAccount{ sucesss in
                        if sucesss {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                Spacer()
            }
            Text(self.addAccountVM.errorMessage)
        }
        .navigationBarTitle("Add Account")
        .embedInNavigationView()
    }
}

struct AddAccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddAccountScreen()
    }
}
