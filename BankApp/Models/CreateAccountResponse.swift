//
//  CreateAccountResponse.swift
//  BankApp
//
//  Created by Roy Quesada on 28/3/23.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import Foundation

struct CreateAccountResponse: Decodable {
    let success: Bool
    let error: String?
}
