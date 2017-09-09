//
//  SIFTTTTAPI.swift
//  eMag
//
//  Created by Bogdan on 9/9/17.
//  Copyright © 2017 eMag International. All rights reserved.
//

import Foundation
import ObjectMapper
import PromiseKit

class SIFTTTTAPI {
    public func addedToCart(product: SProduct, context: AnyObject) -> Promise<Void> {
        return Promise { fulfill, reject in
            APIProvider().request(target: IFTTTTTarget.addedToCart(product: product,
                                                                   context: context))
                .then { _ -> Void in
                    fulfill()
                }.catch { (error) in
                    reject(error)
            }
        }
    }
    
    public func addedToWishlist(product: SProduct, context: AnyObject) -> Promise<Void> {
        return Promise { fulfill, reject in
            APIProvider().request(target: IFTTTTTarget.addedToWishlist(product: product,
                                                                   context: context))
                .then { _ -> Void in
                    fulfill()
                }.catch { (error) in
                    reject(error)
            }
        }
    }
    
    public func orderCompleted(cart: SCart, context: AnyObject) -> Promise<Void> {
        return Promise { fulfill, reject in
            APIProvider().request(target: IFTTTTTarget.orderCompleted(cart: cart,
                                                                      context: context))
                .then { _ -> Void in
                    fulfill()
                }.catch { (error) in
                    reject(error)
            }
        }
    }
}
