//
//  revolver.swift
//  quest1
//
//  Created by Knapptan on 25.01.2024.
//

import Foundation

// Класс револевера - название из задания
class RevolverMoonClip<T: Equatable & Comparable>: Equatable {
    // Инициализация
    init (elements: [T]) {
        self.objects = Array(repeating: nil, count: 6)
        add(elements)
    }
    
    // Функия для протокола Equatable статчиная
    static func == (lhs: RevolverMoonClip<T>, rhs: RevolverMoonClip<T>) -> Bool {
        let sortedObjects1 = lhs.objects.compactMap { $0 }.sorted()
        let sortedObjects2 = rhs.objects.compactMap { $0 }.sorted()
        return sortedObjects1 == sortedObjects2
    }
    
    // Функция добавления перменных
    func add(_ element: T) -> Bool{
        guard let index = objects.firstIndex(of: nil) else {
            return false
        }
        objects[index] = element
        return true
    }
    
    // Функция добавления массива перменных
    func add(_ elements: [T]){
        for element in elements {
            _ = add(element)
        }
    }
    
    // Функция выстрела - возвращает элемент
    func shoot() -> T? {
        guard pointer < objects.count, let shotElement = objects[pointer] else {
            return nil
        }
        objects[pointer] = nil
        click()
        return shotElement
    }
    
    // Функция возвращает список всех извлеченных элементов
    func unloadAll() -> [T?] {
        let unloadedObjects = objects
        objects = Array(repeating: nil, count: 6)
        return unloadedObjects
    }
    
    //  Функция возвращает извлеченный элемент
    func unload(index: Int) -> T? {
        guard index < objects.count, let unloadedObject = objects[index] else {
            return nil
        }
        objects[index] = nil
        return unloadedObject
    }
    
    // Функция случайной прокрутки обоймы
    func scroll() {
        let iters = Int.random(in: 0..<objects.count)
        var i = 0
        while i <= iters {
            click()
            i += 1
        }
    }
    
    // Функция возвращает количество элементов в револьвере
    func getSize() -> Int {
        return objects.compactMap { $0 }.count
    }
    
    // Функция для описания класса
    func toStringDescription() -> String {
        var description = "Structure: RevolverMoonClip<\(T.self)>\nObjects: ["
        let objectStrings = objects.map { $0.map { String(describing: $0) } ?? "nil" }
        description += objectStrings.joined(separator: ", ")
        description += "]"
        if objects[pointer] != nil{
            description += "\nPointer: \(String(describing: objects[pointer]!))"
        } else {
            description += "\nPointer: nil"
        }
        return description
    }

    // Скрипт для доступа к ячейкам
    subscript(index: Int) -> T? {
        guard index < objects.count else {
            fatalError("Index out of range")
        }
        return objects[index]
    }
    
    // Функция прокрутки обоймы на 1
    private func click() {
        var newObjects = objects
        let firstObject = newObjects.removeFirst()
        newObjects.append(firstObject)
        objects = newObjects
    }
    
    // обойма
    private var objects: [T?]
    // курок
    private let pointer: Int = 0
}
