//
//  IFTTTTAPI.swift
//  eMag
//
//  Created by Bogdan on 9/9/17.
//  Copyright © 2017 eMag International. All rights reserved.
//

import Foundation
import PromiseKit

@objc class IFTTTTAPI: NSObject {
    @objc func addedToCart(_ product: SProduct, context: AnyObject) {
        _ = AnyPromise(SIFTTTTAPI().addedToCart(product: product, context: context))
    }
    
    @objc func addedToWishlist(_ product: SProduct, context: AnyObject) {
        _ = AnyPromise(SIFTTTTAPI().addedToWishlist(product: product, context: context))
    }
    
    @objc func orderCompleted(_ cart: SCart, context: AnyObject) {
        _ = AnyPromise(SIFTTTTAPI().orderCompleted(cart: cart, context: context))
    }
}
