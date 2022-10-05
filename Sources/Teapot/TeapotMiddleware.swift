import Vapor

/// A Vapor Middleware that always returns status code 418, unless there is a header of "isTea".
public struct TeapotMiddleware {
    enum Header: String {
        case isTea
    }
}

extension TeapotMiddleware: Middleware {
    /// Check to see if the headers contain "isTea".
    public func respond(
        to request: Vapor.Request,
        chainingTo next: Vapor.Responder
    ) -> NIOCore.EventLoopFuture<Vapor.Response> {
        guard request.headers.contains(name: Header.isTea.rawValue) else {
            return request.eventLoop.future(error: Abort(.imATeapot))
        }
        
        return next.respond(to: request)
    }
}

@available(macOS 12, *)
extension TeapotMiddleware: AsyncMiddleware {
    /// Check to see if the headers contain "isTea".
    public func respond(
        to request: Vapor.Request,
        chainingTo next: Vapor.AsyncResponder
    ) async throws -> Vapor.Response {
        guard request.headers.contains(name: Header.isTea.rawValue) else {
            throw Abort(.imATeapot)
        }
        
        return try await next.respond(to: request)
    }
}
