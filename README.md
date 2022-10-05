# Teapot

*Serving tea to users in need*

## What is Teapot?

Teapot is a Vapor and Swift framework that uses the status code [418](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/418), also known as "I'm a teapot". The Vapor framework contains a middleware that will return the status code of 418, unless there is a header named "isTea". The Swift framework contains extensions on URLRequest that add the required header needed.

## Why use Teapot?

**Teapot is a joke. Use it at your own discresion.**

Teapot is a simple framework to add a simple level of obscurity to your Vapor server. That is all.

> Security by obscurity alone is discouraged and not recommended by standards bodies. The National Institute of Standards and Technology (NIST) in the United States sometimes recommends against this practice: "System security should not depend on the secrecy of the implementation or its components."
[source](https://en.wikipedia.org/wiki/Security_through_obscurity) 

## Basic usage

### Vapor

```swift
import Teapot
```

### Swift Client

```swift
import SwiftTea
```

## Examples

### Vapor Middleware

```swift
app
    .grouped(TeapotMiddleware())
    .get { _ -> String in "🫖" }

try app.testable().test(.GET, "") { res in
    XCTAssertEqual(res.status, .imATeapot)
    XCTAssertNotEqual(res.body.string, "🫖")
}

let headers: HTTPHeaders = ["isTea": "true"]

try app.testable().test(.GET, "", headers: headers) { res in
    XCTAssertNotEqual(res.status, .imATeapot)
    XCTAssertEqual(res.body.string, "🫖")
}
```

### Swift URLRequest

```swift
let url: URL = ...

let teaRequest = URLRequest.tea(url: url)

// or

let existingRequest: URLRequest = ...

let teaRequest = existingRequest.teaRequest
```
