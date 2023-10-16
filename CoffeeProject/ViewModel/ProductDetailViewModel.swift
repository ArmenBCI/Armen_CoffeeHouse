//
//  ProductDetailViewModel.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 29.08.23.
//

import Foundation

class ProductDetailViewModel: ObservableObject {

    
//    static let shared = ProductDetailViewModel(product: Product(id: "",
//                                                                title: "",
//                                                                imageUrl: "",
//                                                                price: 0,
//                                                                descript: ""))
//    
    @Published var product: Product
    @Published var sizes = ["Tall", "Grande", "Venti"]

    init(product: Product) {
        self.product = product
    }

    func getPrice(sizes: String) -> Int {
        switch sizes {
        case "Tall":
            return product.price
        case "Grande":
            return Int(Double(product.price) * 1.25)
        case "Venti":
            return Int(Double(product.price) * 1.5)
        default:
            return 0
        }
    }

}
