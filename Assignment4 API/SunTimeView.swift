//
//  SunTimeView.swift
//  Assignment4 API
//
//  Created by Emma  Hopson on 9/20/23.
//

import SwiftUI

struct LocationTimes: Codable {
    var results: SunDetails
    var status: String
}

struct SunDetails: Codable{
    var sunrise: String
    var sunset: String
    var solar_noon: String
    var day_length: String
    var civil_twilight_begin: String
    var civil_twilight_end: String
    var nautical_twilight_begin: String
    var nautical_twilight_end: String
    var astronomical_twilight_begin: String
    var astronomical_twilight_end: String
}

struct SunTimeView: View {
    @State var suntimes:  LocationTimes?
    @State var latitude: String = ""
    @State var longitude: String = ""
    @State var submitted = false

    
    func getSunTimes(lat: String, long: String) async -> () {
        do {
            let url = URL(string: "https://api.sunrise-sunset.org/json?lat=\(lat)&lng=\(long)")!
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            suntimes = try JSONDecoder().decode(LocationTimes.self, from: data)
            
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }

    var body: some View {
        NavigationView {
            ZStack(content: {
                Image("Earth")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                Rectangle()
                    .colorInvert()
                    .frame(height: 400)
                    .opacity(0.70)
                
                VStack{
                    
                    Text("Enter a LATITUDE in the field below. This is a number between -90 and 90. You may include up to 4 decimal points")
                    TextField("Latitude", text: $latitude)
                    
                    Text("Enter a LONGITUDE in the field below. This is a number between -180 and 180. You may include up to 4 decimal points")
                    TextField("Longitude", text: $longitude)
                    
                    Button("Submit"){
                                                Task { @MainActor in
                                                    await getSunTimes(lat: latitude, long: longitude)
                                                    submitted = true
                                                }
                                        }
                    
                    if longitude != "", latitude != "", let existingSunTimes = suntimes, submitted == true {
                        Text("Sunrise time: \(existingSunTimes.results.sunrise)")
                            .foregroundColor(.pink)
                        NavigationLink(destination: TimeDetailView(suntimes: existingSunTimes)){
                            Text("Click for more details ->")
                        }
                    }
                    
                    Button("Click to reset location"){
                        submitted = false
                        longitude = ""
                        latitude = ""
                        suntimes = nil
                    }
                    
                }
                .frame(minWidth: 300, idealWidth: 300, maxWidth: 300)
            })

        }
        .navigationTitle("Set Location")
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        
        
        
    }
}

struct SunTimeView_Previews: PreviewProvider {
    static var previews: some View {
        SunTimeView()
    }
}
