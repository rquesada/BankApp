//
//  TransferFundRequest.swift
//  BankApp
//
//  Created by Roy Quesada on 31/3/23.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import Foundation

struct TransferFundRequest: Codable {
    
    let accountFromId:String
    let accountToId:String
    let amount:Double
    
}
