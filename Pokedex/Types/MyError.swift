//
//  MyError.swift
//  Pokedex
//
//  Created by Christos Papantonis on 20/10/20.
//

import Foundation

protocol MyError: Error {
    var errorDesc: String { get }
}

enum NetworkError {
    enum HttpError: MyError {
        case generic

        var errorDesc: String {
            switch self {
                default: return "No response received"
            }
        }
    }

    enum ResponseCodeError: Int, MyError {
        case badRequest = 400
        case anauthorised = 401
        case notFound = 404
        case unknown

        var errorDesc: String {
            switch self {
                case .badRequest: return "Bad request"
                case .anauthorised: return "Anuthorised"
                case .notFound: return "Not found"
                case .unknown: return "error uknown"
            }
        }

        init(fromRawValue: Int) {
            self = ResponseCodeError(rawValue: fromRawValue) ?? ResponseCodeError.unknown
        }
    }
}
