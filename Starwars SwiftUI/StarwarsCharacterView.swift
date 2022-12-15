//
//  ContentView.swift
//  Starwars SwiftUI
//
//  Created by Jana Schmehrsahl on 13.12.22.
//

import SwiftUI

struct StarwarsCharacterView: View {
    @ObservedObject var viewModel = StarwarsCharacterViewModel()
    
    // Triggert die Shuffelfunktion einmalig zum Start der App.
    init() {
        viewModel.getRandomStarwarsCharacterDataFromApi()
    }
    
    //MARK: Erstellung View
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
                HStack(alignment: .center){
                    Image("starwars")
                        .resizable()
                        .frame(width: 300, height: 150, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                }
                .frame(maxWidth:.infinity)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 5){
                        let character = viewModel.character
                        let errorOccured = viewModel.errorOccurred
                        
                        if errorOccured {
                                Text("An Error occurred! Please try again!")
                        } else {
                       
                            Group {
                                Text("Firstname: \(character?.getFirstName() ?? "")")
                                Text("Lastname: \(character?.getLastName() ?? "")")
                                Text("Height: \(character?.height ?? "")")
                                Text("Mass: \(character?.mass ?? "")")
                                Text("Bmi: \(character?.getCharacterBmi() ?? "")")
                                Text("Hair color: \(character?.hairColor ?? "")")
                                Text("Skin color: \(character?.skinColor ?? "")")
                                Text("Eye color: \(character?.eyeColor ?? "")")
                                Text("Birth year: \(character?.getYearforChristus() ?? "")")
                                Text("Gender: \(character?.gender ?? "")")
                            }
                            .foregroundColor(.white)
                                          
                            Group{
                                Text("Homeworld: \(character?.homeworld ?? "")")
                                buildFilmCategory(film: character?.films ?? [])
                                buildSpeciesCategory(species: character?.species ?? [])
                                buildStarshipsCategory(starships: character?.starships ?? [])
                                Text("Created: \(character?.created ?? "")")
                                Text("Edited: \(character?.edited ?? "")")
                            }
                            .foregroundColor(.white)
                        }
                    }
                }
                .padding(0.0)
                                        
                HStack{
                    Button(action: {
                         viewModel.getRandomStarwarsCharacterDataFromApi()
                     }) {
                         HStack {
                                 Text("Shuffle")
                                 .fontWeight(.semibold)
                                 .font(.body)
                         }
                         .frame(minWidth: 0, maxWidth: .infinity)
                         .padding(.all, 10.0)
                         .foregroundColor(.black)
                         .background(.yellow)
                         .cornerRadius(30)
                     }
                 }
                .padding(.bottom, 5)
                .frame(maxWidth:.infinity,maxHeight: 50, alignment: .bottom)
            }
            .padding(.horizontal, 20.0)
            .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StarwarsCharacterView()
    }
}

//MARK: Erstellung der Listen im UI

@ViewBuilder
private func buildFilmCategory(film: [String]) -> some View {
        Text("Films:").underline()
        .padding(.top, 5.0)
        buildTextGroupForList(list: film)
}

@ViewBuilder
private func buildSpeciesCategory(species: [String]) -> some View {
        Text("Species:").underline()
        .padding(.top, 5.0)
        buildTextGroupForList(list: species)
}

@ViewBuilder
private func buildStarshipsCategory(starships: [String]) -> some View {
        Text("Starships:").underline()
        .padding(.top, 5.0)
        buildTextGroupForList(list: starships)
}

// Gibt eine Liste an Texten zurück, anhand der jeweiligen Einträge der Kategorie.
private func buildTextGroupForList(list: [String]) -> some View {
    return Group{
        ForEach(list, id: \.self){ item in
           Text(item)
        }
    }
}





