//
//  Account.swift
//  BankApp
//
//  Created by Roy Quesada on 26/3/23.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import Foundation

enum AccountType: String, Codable, CaseIterable {
    case checking
    case saving
}

extension AccountType {
    var title:String{
        switch self {
        case .checking:
            return "Checking"
        case .saving:
            return "Saving"
        }
    }
}

struct Account: Codable {
    var id: UUID
    var name: String
    var accountType: AccountType
    var balance: Double
}
