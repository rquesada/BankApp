//
//  AccountSummaryViewModel.swift
//  BankApp
//
//  Created by Roy Quesada on 26/3/23.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import Foundation

class AccountSummaryViewModel: ObservableObject {
    
    private var _accountsModels = [Account]()
    @Published var accounts = [AccountViewModel]()
    
    var total:Double {
        _accountsModels.map{ $0.balance }.reduce(0, +)
    }
    
    func getAllAccounts(){
        
        AccountService.shared.getAllAccounts { result in
            switch result {
            case .success(let accounts):
                if let accounts = accounts {
                    self._accountsModels = accounts
                    DispatchQueue.main.async {
                        self.accounts = accounts.map(AccountViewModel.init)
                    }
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

class AccountViewModel {
    var account: Account
    
    init(account: Account) {
        self.account = account
    }
    
    var name:String {
        account.name
    }
    
    var accountId: String {
        account.id.uuidString
    }
    
    var accountType:String {
        account.accountType.title
    }
    
    var balance:Double {
        account.balance
    }
}
