import Foundation

public extension URLRequest {
    /// Create a new request that has "isTea" added as a header.
    var teaRequest: Self {
        let cookieKey = "isTea"
        let cookieValue = true.description
        var request = self
        
        if request.allHTTPHeaderFields == nil {
            request.allHTTPHeaderFields = [:]
        }
        
        request.allHTTPHeaderFields?[cookieKey] = cookieValue
        
        return request
    }
    
    /// Create a new request that has "isTea" as a header.
    static func tea(
        url: URL,
        cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
        timeoutInterval: TimeInterval = 60.0
    ) -> Self {
        URLRequest(
            url: url,
            cachePolicy: cachePolicy,
            timeoutInterval: timeoutInterval
        )
        .teaRequest
    }
}
