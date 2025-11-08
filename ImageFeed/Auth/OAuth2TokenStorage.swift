import Foundation

final class OAuth2TokenStorage {
    static let shared = OAuth2TokenStorage()
    private init() {}
    
    private let tokenKey = "Bearer Token"
    private let conservation: UserDefaults = .standard
    
    var token: String? {
        get {
            conservation.string(forKey: tokenKey)
        }
        set {
            conservation.set(newValue, forKey: tokenKey)
        }
    }
}
