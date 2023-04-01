//
//  TransferFundResponse.swift
//  BankApp
//
//  Created by Roy Quesada on 31/3/23.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import Foundation

struct TransferFundResponse: Decodable {
    let success: Bool
    let error: String?
}
