//
//  StarwarsCharacter.swift
//  Starwars SwiftUI
//
//  Created by Jana Schmehrsahl on 13.12.22.
//

import Foundation

struct StarwarsCharacter: Decodable {
    let name : String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let homeworld: String
    
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String] 
    let created: String
    let edited: String
    let url: String
        
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender
        case homeworld
        case films
        case species
        case vehicles
        case starships
        case created
        case edited
        case url
    }
    
    // MARK: Anpassung der StarwarsCharacterDaten
    
    // Trennt den Vornamen vom Nachnamen.
    func getFirstName() -> String {
        var components = name.components(separatedBy:  " ")
        if components.count > 0 {
            return components.removeFirst()
        }
        return ""
    }
    
    // Trennt den Vornamen vom Nachnamen. Gibt den letzten separierten Teil des Namens als Nachnamen zurück.
    func getLastName() -> String {
        let components = name.components(separatedBy:  " ")
        if components.count > 0 {
            return components.last ?? ""
        }
        return ""
    }
    
    // Rechnet die Höhe in Meter um.
    // Errechnet den BMI und rundet ihn auf zwei Nachkommastellen.
    func getCharacterBmi() -> String {
        let heightInMeter = (Double(height) ?? 0.0) / 100.00
        let mass = Double(mass) ?? 0.0
        let bmi = mass / (heightInMeter * heightInMeter)
        return String(format: "%.2f", bmi)
    }
    
    // Erstetzt "BBY" mit "vor Christus"
    func getYearforChristus() -> String{
        let formattedYear = birthYear.replacingOccurrences(of: "BBY", with: " vor Christus")
        return formattedYear
    }
}


