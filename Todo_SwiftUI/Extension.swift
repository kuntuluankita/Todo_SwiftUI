//
//  Extension.swift
//  Todo_SwiftUI
//
//  Created by Kuntulu Ankita on 25/03/25.
//

import Foundation

extension Encodable {
    func asDictionary()-> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch  {
            return [:]
        }
    }
}
