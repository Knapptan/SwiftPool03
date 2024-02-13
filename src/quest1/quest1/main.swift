//
//  main.swift
//  quest1
//
//  Created by Knapptan on 24.01.2024.
//

import Foundation


// Пример использования
print("1. Adding elements")

let revolver = RevolverMoonClip<Int>(elements: [3, 54, 7, 2, 56, 4])
print(revolver.toStringDescription())

print("\n2. Subscript")
print("\(revolver[0]!), \(revolver[5]!)")

print("\n3. Scroll")
revolver.scroll()
print(revolver.toStringDescription())

print("\n4. Deletion")
_ = revolver.shoot()
_ = revolver.shoot()
_ = revolver.shoot()
_ = revolver.shoot()
print(revolver.toStringDescription())

print("\n5. Supply collection")
let supplyCollection = [4, 6, 3, 22, 77, 43, 76, 5]
print("Before: ")
print("Supply collection: \(supplyCollection)")

print(revolver.toStringDescription())
revolver.add(supplyCollection)

print("\nAfter add operation performed:")
print(revolver.toStringDescription())

print("\n6. Extraction")
let extractedList = revolver.unloadAll()
print("The extracted list: \(extractedList)")
print("size: \(extractedList.count)")
print("\n\(revolver.toStringDescription())")
print("size: \(revolver.getSize())")

print("\n7. Supply collection 2")
let supplyCollection2 = [77, 43, 76, 5]
print("Before:")
print("Supply collection: \(supplyCollection2)")

print(revolver.toStringDescription())
revolver.add(supplyCollection2)
//
print("\nAfter add operation performed:")
print(revolver.toStringDescription())

print("\n8. Equals")
let bulets = revolver.unloadAll().compactMap { $0 }
let revolverCopy = RevolverMoonClip<Int>(elements: bulets)
revolver.add(bulets)


revolverCopy.scroll()
print(revolver.toStringDescription())

print("\n\(revolverCopy.toStringDescription())")

if revolver == revolverCopy {
    print("\nResult: equals")
} else {
    print("\nResult: not equals")
}

