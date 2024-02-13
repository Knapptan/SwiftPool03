//
//  revolver.swift
//  quest2
//
//  Created by Knapptan on 26.01.2024.
//

import Foundation

// Класс револьвера
class RevolverMoonClip: Equatable {
    private var objects: [Patron?]
    private var pointer: Int
    private let caliber: Caliber
    
    init(_ caliber: Caliber) {
        self.objects = Array(repeating: nil, count: 6)
        self.pointer = 0
        self.caliber = caliber
    }
    
    static func == (lhs: RevolverMoonClip, rhs: RevolverMoonClip) -> Bool {
        guard lhs.caliber == rhs.caliber else {
            return false // Если калибры разные, револьверы не равны
        }
        
        // Подсчет количества заряженных патронов и патронов разных типов в каждом револьвере
        let lhsChargedPatrons = lhs.objects.filter { $0?.type == .combat }
        let rhsChargedPatrons = rhs.objects.filter { $0?.type == .combat }
        
        let lhsUniquePatronsCount = Set(lhs.objects.compactMap { $0?.id }).count
        let rhsUniquePatronsCount = Set(rhs.objects.compactMap { $0?.id }).count
        
        // Если количество заряженных патронов и количество патронов разных типов совпадает,
        // то револьверы считаются равными
        return lhsChargedPatrons.count == rhsChargedPatrons.count &&
               lhsUniquePatronsCount == rhsUniquePatronsCount
    }

    
    func add(_ patron: Patron) -> Bool {
        guard patron.caliber == caliber else {
            print("Cannot add patron with different caliber")
            return false
        }
        
        guard patron.load == false else {
            print("Cannot add patron that’s already loaded")
            return false
        }
        
        guard let index = objects.firstIndex(of: nil) else {
            print("Revolver is full")
            return false
        }
        
        patron.load = true
        objects[index] = patron
        return true
    }
    
    func add(_ patrons: [Patron]) {
        for patron in patrons {
            _ = add(patron)
        }
    }
    
    func shoot() {
        guard getSize() > 0, let patron = objects[pointer] else {
            print("Click")
            click()
            return
        }
        patron.shoot()
        
        objects[pointer] = nil
        click()
        patron.load = false // Сбрасываем флаг загрузки после выстрела
    }
    
    func unloadAll() -> [Patron?] {
        let unloadedObjects = objects
        for object in objects{
            object?.load = false
        }
        objects = Array(repeating: nil, count: 6)
        return unloadedObjects
    }
    
    func unload(index: Int) -> Patron? {
        guard index < objects.count else {
            return nil
        }
        
        let patron = objects[index]
        objects[index] = nil
        patron?.load = false
        return patron
    }
    
    func scroll() {
        let iters = Int.random(in: 0..<objects.count)
        for _ in 0..<iters {
            click()
        }
    }
    
    func getSize() -> Int {
        return objects.compactMap { $0 }.count
    }
    
    func toStringDescription() -> String {
        var description = "Structure: RevolverMoonClip \(caliber) caliber\nObjects: ["
        let objectStrings = objects.map { $0 != nil ? "\nPatron(id: \($0!.id), \($0!.type), \($0!.caliber.rawValue))" : "nil" }
        description += objectStrings.joined(separator: ", ")
        description += "]"
        description += "\nPointer: "
        if pointer < objects.count, let patron = objects[pointer] {
            description += "Patron(id: \(patron.id), \(patron.type), \(patron.caliber.rawValue))"
        } else {
            description += "nil"
        }
        return description
    }

    subscript(index: Int) -> Patron? {
        guard index < objects.count else {
            fatalError("Index out of range")
        }
        return objects[index]
    }
    
    private func click() {
        let firstObject = objects.removeFirst()
        objects.append(firstObject)
    }
}
