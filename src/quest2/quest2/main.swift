//
//  main.swift
//  quest2
//
//  Created by Knapptan on 26.01.2024.
//

import Foundation

// Создание двух револьверов с калибром 32
let revolver1 = RevolverMoonClip(Caliber.c32)
let revolver2 = RevolverMoonClip(Caliber.c32)

// Создание патронов
let patron1 = Patron(Caliber.c32, PatronType.combat)
let patron2 = Patron(Caliber.c32, PatronType.combat)
let patron3 = Patron(Caliber.c32, PatronType.combat)
let patron4 = Patron(Caliber.c32, PatronType.combat)

// Печать состояния револьверов до добавления патронов
print("\n1. Shoot or damp")
print(revolver1.toStringDescription())
print(revolver2.toStringDescription())

// Добавление патронов в револьверы
_ = revolver1.add(patron1)
_ = revolver1.add(patron2)
_ = revolver2.add(patron3)
_ = revolver2.add(patron4)

// Печать состояния револьверов после добавления патронов
print("\nAfter adding patrons")
print(revolver1.toStringDescription())
print(revolver2.toStringDescription())

// Стрельба из первого револьвера
print("\nShoot # call shoot()")
revolver1.shoot()
print(revolver1.toStringDescription())

// Стрельба из второго револьвера
print("\nShoot")
revolver2.shoot()
print(revolver2.toStringDescription())

// Попытка стрельбы из пустого револьвера
print("\nShoot")
_ = revolver1.unloadAll()
revolver1.shoot()
print(revolver1.toStringDescription())

// Добавление патрона в обе коллекции и проверка уникальности
let patronsToAdd = [patron1, patron2, patron3]
let revolver3 = RevolverMoonClip(Caliber.c32)
let revolver4 = RevolverMoonClip(Caliber.c32)

print("\n2. Unique Patron")
print("Revolver1: \(revolver3.toStringDescription())")
print("Revolver2: \(revolver4.toStringDescription())")

print("\nAdd1 # call add()")
for patron in patronsToAdd {
    _ = revolver3.add(patron)
}
print("Revolver1: \(revolver3.toStringDescription())")
print("Revolver2: \(revolver4.toStringDescription())")

print("\nAdd2")
for patron in patronsToAdd {
    _ = revolver4.add(patron)
}
print("Revolver1: \(revolver3.toStringDescription())")
print("Revolver2: \(revolver4.toStringDescription())")

// Попытка добавления коллекции патронов с одинаковым содержимым в обе коллекции револьверов
let patronsToAddCollection1 = [patron1, patron2, patron3]
let patronsToAddCollection2 = [patron1, patron4]

print("\n3. Unique Patron in collection")
print("Revolver1: \(revolver3.toStringDescription())")
print("Revolver2: \(revolver4.toStringDescription())")

print("\n[Unique Patron in collection 1]: \(patronsToAddCollection1.map { "Patron(id: \($0.id), \($0.type), \($0.caliber.rawValue))" })")
print("[Unique Patron in collection 2]: \(patronsToAddCollection2.map { "Patron(id: \($0.id), \($0.type), \($0.caliber.rawValue))" })")

print("\nAdd1 # call add for 1st collection")
revolver3.add(patronsToAddCollection1)
print("Revolver1: \(revolver3.toStringDescription())")
print("Revolver2: \(revolver4.toStringDescription())")

print("\nAdd2")
revolver4.add(patronsToAddCollection2)
print("Revolver1: \(revolver3.toStringDescription())")
print("Revolver2: \(revolver4.toStringDescription())")
