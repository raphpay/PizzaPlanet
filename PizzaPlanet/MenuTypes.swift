//
//  MenuTypes.swift
//  PizzaPlanet
//
//  Created by Raphaël Payet on 22/07/2020.
//  Copyright © 2020 Oriapy. All rights reserved.
//

import Foundation

struct MenuType : Identifiable {
    let id          = UUID()
    var name        : String
    var isSelected  : Bool
}
