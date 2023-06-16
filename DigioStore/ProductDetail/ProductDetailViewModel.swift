//
//  ProductDetailViewModel.swift
//  DigioStore
//
//  Created by Johnatas Rodrigues on 16/06/23.
//

import Foundation
import UIKit

class ProductDetailViewModel {
    private let product: Product

    var productName: String {
        return product.name ?? ""
    }

    var productDescription: String {
        return product.description ?? ""
    }

    init(product: Product) {
        self.product = product
    }

    func loadProductImage(completion: @escaping (UIImage?) -> Void) {
        guard let imageURL = product.imageURL else {
            completion(nil)
            return
        }

        UIImage.loadImage(from: imageURL) { image in
            completion(image)
        }
    }
}
