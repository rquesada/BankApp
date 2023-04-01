//
//  AccountService.swift
//  BankApp
//
//  Created by Roy Quesada on 26/3/23.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badurl
    case decodingError
    case noData
}

class AccountService {
    
    static let shared = AccountService()
    
    func transferFunds(transferFundRequest:TransferFundRequest, completion: @escaping (Result<TransferFundResponse, NetworkError>)->Void){
        
        guard let url = URL.urlForTransferFunds() else {
            return completion(.failure(.badurl))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try?  JSONEncoder().encode(transferFundRequest)
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let transferFundRes = try? JSONDecoder().decode(TransferFundResponse.self, from: data)
            if let transferFundRes = transferFundRes  {
                completion(.success(transferFundRes))
            }else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    
    func createAccount(createAccountRequest: CreateAccountRequest, completion: @escaping(Result<CreateAccountResponse,NetworkError>) -> Void){
        guard let url = URL.urlForCreateAccounts() else {
            return completion(.failure(.badurl))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try?  JSONEncoder().encode(createAccountRequest)
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let createAccountResponse = try? JSONDecoder().decode(CreateAccountResponse.self, from: data)
            if let createAccountResponse = createAccountResponse  {
                completion(.success(createAccountResponse))
            }else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func getAllAccounts(completion: @escaping(Result<[Account]?, NetworkError>) -> Void){
        
        guard let url = URL.urlForAccounts() else {
            return completion(.failure(.badurl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            let accounts = try? JSONDecoder().decode([Account].self, from: data)
            if accounts == nil {
                completion(.failure(.decodingError))
            }else{
                completion(.success(accounts))
            }
        }.resume()
    }
}
