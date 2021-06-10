//
//  UserRepository.swift
//  GigiMovies
//
//  Created by Anna on 10/06/2021.
//

import Foundation

class UserRepository {
    enum Key: String, CaseIterable {
        case favorites
        func make(for userID: String) -> String {
            return self.rawValue + "_" + userID
        }
    }
    let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func saveFavoritesUserInfo(forUserID userID: String, favorites: String) {
        saveValue(forKey: .favorites, value: favorites, userID: userID)
    }
    
    func getFavoritesUserInfo(forUserID userID: String) -> String {
        let favorites: String? = readValue(forKey: .favorites, userID: userID)
        return favorites ?? ""
    }
    
    func removeUserInfo(forUserID userID: String) {
        Key
            .allCases
            .map { $0.make(for: userID) }
            .forEach { key in
                userDefaults.removeObject(forKey: key)
        }
    }
    
    // MARK: - Private
    private func saveValue(forKey key: Key, value: Any, userID: String) {
        userDefaults.set(value, forKey: key.make(for: userID))
    }
    
    private func readValue<T>(forKey key: Key, userID: String) -> T? {
        return userDefaults.value(forKey: key.make(for: userID)) as? T
    }
}
