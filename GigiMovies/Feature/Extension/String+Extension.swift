//
//  String+Extension.swift
//  GigiMovies
//
//  Created by Anna on 10/06/2021.
//

import Foundation

extension String {
    
    public func removeId(_ id: Int) -> String {
        var list = self.replacingOccurrences(of: "\(id)", with: "", options: .literal, range: nil)
        list = list.replacingOccurrences(of: ",,", with: ",", options: .literal, range: nil)
        if list.last == "," {
            list.removeLast()
        }
        if list.first == "," {
            list.removeFirst()
        }
        return list
    }
    
    public func addId(_ id: Int) -> String {
        if self.isEmpty {
            return "\(id)"
        }
        return "\(self),\(id)"
    }
    
    public func containsId(_ id: Int) -> Bool {
        return self.contains("\(id)")
    }
    
}
