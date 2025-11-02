import Foundation

enum Constants {
    static let minimumZoomScale: CGFloat = 0.1
    static let maximumZoomScale: CGFloat = 1.25
    
    static let accessKey = "4XjLIWUOR57nfSzDrnU_krFkcN8pskwdqeHclGMICgI"
    static let secretKey = "xhZQmg8zCVgY3-36wof1v7h-2vWl2KJHYAMDJxJdlpw"
    static let redirectURI = "urn:ietf:wg:oauth:2.0:oob"
    static let accessScope = "public+read_user+write_likes"
    static let defaultBaseURL: URL = URL(string: "https://api.unsplash.com/")!
    
    static let unsplashAuthorizeURLString = "https://unsplash.com/oauth/authorize"
}

