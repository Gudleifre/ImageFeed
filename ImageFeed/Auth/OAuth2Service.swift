import UIKit

final class OAuth2Service {
    static let shared = OAuth2Service()
    private init() {}
    
    // MARK: - Public methods
    func fetchOAuthToken(_ code: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let request = requestOAuthToken(code: code) else {
            return
        }
        
        let task = URLSession.shared.data(for: request) { result in
            switch result {
            case .success(let data):
                do {
                    let tokenResponse = try JSONDecoder().decode(OAuthTokenResponseBody.self, from: data)
                    let bearerToken = tokenResponse.accessToken
                    
                    OAuth2TokenStorage.shared.token = bearerToken
                    completion(.success(bearerToken))
                    
                } catch {
                    print("Failed to decode OAuth token response: \(error.localizedDescription)")
                    completion(.failure(NetworkError.decodingError(error)))
                }
            case .failure(let error):
                print("Network error while fetching OAuth token: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    // MARK: - Private methods
    private func requestOAuthToken(code: String) -> URLRequest? {
        guard var urlComponents = URLComponents(string: Constants.oauthTokenURLString) else {
            return nil
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: Constants.accessKey),
            URLQueryItem(name: "client_secret", value: Constants.secretKey),
            URLQueryItem(name: "redirect_uri", value: Constants.redirectURI),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "grant_type", value: "authorization_code")
        ]
        
        guard let authTokenURL = urlComponents.url else {
            print("The URL for OAuth token isn't formed")
            return nil
        }
        
        var request = URLRequest(url: authTokenURL)
        request.httpMethod = "POST"
        return request
    }
}
