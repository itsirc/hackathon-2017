//
//  IFTTTTarget.swift
//  eMag
//
//  Created by Bogdan on 9/9/17.
//  Copyright © 2017 eMag International. All rights reserved.
//

import Foundation
import Moya

let iftttURL = "https://hackathon.cristi.me/"
let pathPrefix = "api/"

enum IFTTTTTarget {
    case addedToCart(product: SProduct, context: AnyObject)
    case addedToWishlist(product: SProduct, context: AnyObject)
    case orderCompleted(cart: SCart, context: AnyObject)
}

extension IFTTTTTarget: Target {
    public var baseURL: URL {
        switch self {
        default:
            return URL(string: iftttURL)!
        }
    }
    
    public var path: String {
        switch self {
        case .addedToCart:
            return pathPrefix + "cart/added"
        case .addedToWishlist:
            return pathPrefix + "wishlist/added"
        case .orderCompleted:
            return pathPrefix + "order/placed"
        }
    }
    
    public var method: Moya.Method {
        return .post
    }
    
    public var parameters: [String: Any]? {
        switch self {
        case let .addedToCart(product, _):
            return product.toJSONString()?.convertToDictionary()
        case let .addedToWishlist(product, _):
            return product.toJSONString()?.convertToDictionary()
        case let .orderCompleted(cart, _):
            return cart.toJSONString()?.convertToDictionary()
        }
    }
    
     public var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    public var context: AnyObject {
        switch self {
        case let .addedToCart(_, context),
             let .addedToWishlist(_, context),
             let .orderCompleted(_, context):
            return context
        }
    }
}
