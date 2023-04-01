//
//  AccountSummaryScreen.swift
//  BankApp
//
//  Created by Roy Quesada on 26/3/23.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import SwiftUI

enum ActiveSheet {
    case addAccount
    case transferFunds
}

struct AccountSummaryScreen: View {
    
    @ObservedObject private var accountSummaryVM = AccountSummaryViewModel()
    @State private var isPresented: Bool = false
    @State private var activeSheet: ActiveSheet = .addAccount
    
    var body: some View {
        VStack{
            GeometryReader{ g in
                VStack{
                    AccountListView(accounts: self.accountSummaryVM.accounts)
                        .frame(height: g.size.height/2)
                    Text("\(self.accountSummaryVM.total)")
                    Spacer()
                    Button("Transfer Funds"){
                        self.activeSheet = .transferFunds
                        self.isPresented = true
                    }.padding()
                }
            }
        }
        
        .onAppear(){
            self.accountSummaryVM.getAllAccounts()
        }
        .sheet(isPresented: $isPresented,onDismiss: {
            self.accountSummaryVM.getAllAccounts()
        }){
            if self.activeSheet == .transferFunds {
                TransferFundsScreen()
            }else if self.activeSheet == .addAccount {
                AddAccountScreen()
            }
        }
        .navigationBarItems(trailing: Button("Add Account"){
            self.activeSheet = .addAccount
            self.isPresented = true
        })
        .navigationBarTitle("Account Summary")
        .embedInNavigationView()
    }
}

struct AccountSummaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountSummaryScreen()
    }
}
