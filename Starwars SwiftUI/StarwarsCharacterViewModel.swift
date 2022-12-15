//
//  StarwarsCharacterViewModel.swift
//  Starwars SwiftUI
//
//  Created by Jana Schmehrsahl on 13.12.22.
//

import Foundation
import Alamofire

class StarwarsCharacterViewModel: ObservableObject{

    private let basePeopleUrl = "https://swapi.dev/api/people/"
    
    @Published var character: StarwarsCharacter? = nil
    @Published var errorOccurred = false
    
    // Funktion generiert zufällige ID zwischen 1 und 83, da die API nur 83 People beinhaltet.
    // Für den Request soll eine zufällige PeopleID erstellt werden.
    private func getRandomId() -> Int{
        return Int.random(in: 1..<83)
    }

    // Request URL wird anhand der Base URL und der Random ID erstellt.
    // Es erfolgt ein GET Request. Wenn der Request erfolgreich ist, wird der Response zu einem StarwarsCharacter gemapped.
    // Ist dieser nicht erfolgreich, wird ein Error Text angezeigt. 
    func getRandomStarwarsCharacterDataFromApi(){
        let requestUrl = basePeopleUrl + "\(getRandomId())"
        AF.request(requestUrl)
            .responseDecodable(of: StarwarsCharacter.self) { (response) in
                guard let starwarsCharacter = response.value else {
                    self.errorOccurred = true
                    return
                }
                self.character = starwarsCharacter
                self.errorOccurred = false
            }
    }
}

