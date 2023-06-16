//
//  MainResponse.swift
//  DigioStore
//
//  Created by Johnatas Rodrigues on 15/06/23.
//

import Foundation

struct APIResponse: Codable {
    let spotlight: [SpotlightItem]
    let products: [Product]
    let cash: CashItem
}

struct CashItem: Codable {
    let title: String?
    let bannerURL: String?
    let description: String?

    init(title: String? = "",
         bannerURL: String? = "",
         description: String? = "") {
        self.title = title
        self.bannerURL = bannerURL
        self.description = description
    }
}
