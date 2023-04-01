


import Foundation

extension URL {
    
    static func urlForAccounts() -> URL? {
         return URL(string: "https://sunny-cooked-lily.glitch.me/api/accounts")
    }
    
    static func urlForCreateAccounts() -> URL? {
        return URL(string: "https://sunny-cooked-lily.glitch.me/api/accounts")
    }
    
    static func urlForTransferFunds() -> URL? {
        return URL(string: "https://sunny-cooked-lily.glitch.me/api/transfer")
    }
}
