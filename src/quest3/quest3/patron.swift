//
//  patron.swift
//  quest3
//
//  Created by Knapptan on 27.01.2024.
//

import Foundation

// Тип патрона
enum PatronType {
    case blank
    case combat
}

// Калибр
enum Caliber: Int {
    case c22 = 22
    case c32 = 32
    case c38 = 38
    case c45 = 45
}

// Класс для патрона
class Patron: Equatable {
    let id = UUID()
    let caliber: Caliber
    var type: PatronType
    var load = false
    
    init(_ caliber: Caliber,_ type: PatronType) {
        self.caliber = caliber
        self.type = type
    }
    
    static func == (lhs: Patron, rhs: Patron) -> Bool {
        return lhs.caliber == rhs.caliber && lhs.type == rhs.type
    }
    
    func shoot() {
        if type == .combat {
            print("Bang \(caliber.rawValue)")
        } else {
            print("Click \(caliber.rawValue)")
        }
        load = false
    }
    
}
