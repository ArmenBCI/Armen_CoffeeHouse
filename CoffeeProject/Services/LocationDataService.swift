//
//  LocationDataService.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 07.09.23.
//

import Foundation
import MapKit

class LocationDataService {
    
    static let location: [Location] = [
        
        Location(name: "Զվարթնոց",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.158268607650406, longitude: 44.40020837370478),
                 description: "Զվարթնոց» միջազգային օդանավակայան",
                 imageNames: "optimized-c26a0058-3-180x_",
                 time: "Երկ - Կիր 24/7"
                ),
        
        Location(name: "Էրեբունի",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.147052460569476, longitude: 44.5208429504287),
                 description: "Էրեբունի 17/1",
                 imageNames: "photo-2023-03-19-155044-180x_",
                 time: "Երկ - Կիր 09:00 - 00:00"
                ),
        
        Location(name: "Մեգամոլ",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.197211122040464, longitude: 44.56711416135892),
                 description: "Գայի պողոտա 16",
                 imageNames: "photo-2023-03-19-155037-180x_",
                 time: "Երկ - Կիր 10:00 - 22:00"
                ),
        
        Location(name: "Հովսեփ Էմին",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.210676467956816, longitude: 44.50348865380185),
                 description: "(Սլավոնական համալսարանի հարևանությամբ) Հովսեփ Էմին 126",
                 imageNames: "photo-2023-03-19-155054-180x_",
                 time: "Երկ – Ուրբ 08:30 - 23:00 \n Շաբ - Կիր 09:00 - 23:00"
                ),
        
        Location(name: "Լեռ Կամսար փ․",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.197556982057144, longitude: 44.5039832758015),
                 description: "(AUA համալսարանի հարևանությամբ) Լեռ Կամսար 15/1",
                 imageNames: "photo-2023-03-19-155056-180x_",
                 time: "Երկ - Ուրբ 08:30 - 23:00 \n Շաբ - Կիր 09:00 - 23:00"
                ),
        
        Location(name: "Վահրամ Փափազյան",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.20908772187856, longitude: 44.50149265366693),
                 description: "Վահրամ Փափազյան 21",
                 imageNames: "photo-2023-03-19-155020-180x_",
                 time: "Երկ - Կիր 09:00 - 22:00"
                ),
        
        Location(name: "Կոմիտասի պողոտա",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.209753163806184, longitude: 44.520949830994596),
                 description: "(Երևան Սիթի սուպերմարկետ) Կոմիտասի պողոտա 60/2",
                 imageNames: "photo-2023-03-19-155053-180x_",
                 time: "Երկ - Կիր 09:00-23:00"
                ),
        
        Location(name: "Բանգլադեշ",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.17074334909972, longitude: 44.442731351673295),
                 description: "Անդրանիկի 141/1",
                 imageNames: "photo-2023-03-19-155051-180x_",
                 time: "Երկ - Կիր 09:00 - 23:00"
                ),
        
        Location(name: "Նալբանդյան փ.",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.188578484355496, longitude: 44.524784298082515),
                 description: "(ՀՊՏՀ-ի հարևանությամբ) Նալբանդյան 128",
                 imageNames: "photo-2023-03-19-155101-180x_",
                 time: "Երկ - Ուրբ 08:30-19:30 \n Շաբ 10:00 - 19:00 \n Կիր Փակ է"
                ),
        
        Location(name: "Տերյան փ․",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.190099, longitude: 44.523452),
                 description: "(ՀԱՊՀ-ի հարևանությամբ) Տերյան 72",
                 imageNames: "photo-2023-03-19-155059-180x_",
                 time: "Երկ - Ուրբ 08:30-20:30 \n Շաբ 09:30-19:00 \n Կիր 10:00-18:00"
                ),
        
        Location(name: "Արամի փ․",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.182052, longitude: 44.509582),
                 description: "(Անցում համար 1) 20/4 Մեսրոպ Մաշտոցի պող.",
                 imageNames: "photo-2023-03-19-155107-180x_",
                 time: "Երկ – Կիր 09:00 - 0:00"
                ),
        
        Location(name: "Աբովյան փ․",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.187151, longitude: 44.523317),
                 description: "Աբովյան 42",
                 imageNames: "photo-2023-03-19-155025-180x_",
                 time: "Երկ - Ուրբ 08:30 - 22:00 \n Շաբ - Կիր 09:00 - 22:00"
                ),
        
        Location(name: "Իսահակյան փ․",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.186365, longitude: 44.522527),
                 description: "(մետրոյի հարևանությամբ) Իսահակյան 29",
                 imageNames: "photo-2023-03-19-155057-180x_",
                 time: "Երկ – Ուրբ 08:30 - 00:00 \n Շաբ - Կիր 09:00 - 00:00"
                ),
        
        Location(name: "Ալեք Մանուկյան փ․",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.174794996095756, longitude: 44.522868143081865),
                 description: "Ալեք Մանուկյան 15Ա",
                 imageNames: "photo-2023-03-19-155103-180x_",
                 time: "Երկ – Ուրբ 08:30 - 19:00 \n Շաբ 09:00 – 17:00 \n Կիր Փակ է"
                ),
        
        Location(name: "Մովսես Խորենացու փ․",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.175182, longitude: 44.510085),
                 description: "(Էլիտ պլազա բիզնես կենտրոն) Մովսես Խորենացի 15",
                 imageNames: "photo-2023-03-19-155117-180x_",
                 time: "Երկ - Ուրբ 08:30 - 21:00 \n Շաբ 09։00 - 19:00 \n Կիր 10։00 - 19։00"
                ),
        
        Location(name: "Տիգրան Մեծի պողոտա",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.176464, longitude: 44.513400),
                 description: "Տիգրան Մեծ 2/2",
                 imageNames: "photo-2023-03-19-155042-180x_",
                 time: "Երկ - Կիր 08:30 - 00:00"
                ),
        
        Location(name: "Նալբանդյան փ․",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.178448, longitude: 44.515125),
                 description: "(Հանրապետության հրապարակի հարևանությամբ) Նալբանդյան 46/3",
                 imageNames: "photo-2023-03-19-155115-180x_",
                 time: "Երկ - Կիր 08:30 - 00:00"
                ),
        
        Location(name: "Ամիրյան փ․",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.180702, longitude: 44.508432),
                 description: "Ամիրյան 12",
                 imageNames: "photo-2023-03-19-155106-180x_",
                 time: "Երկ - Կիր 09:00 - 00:30"
                ),
        
        Location(name: "Մաշտոց պողոտա",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.165693, longitude: 44.036125),
                 description: "Մաշտոց 21",
                 imageNames: "mashtoc-ch-u2665ufe0f-180x_",
                 time: "Երկ - Կիր 09:00 - 00:00"
                ),
        
        Location(name: "Թումանյան փ․",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.150198, longitude: 44.039404),
                 description: "Թումանյան 35",
                 imageNames: "photo-2023-03-19-155109-180x_",
                 time: "Երկ - Ուրբ 08:30 - 23:00 \n Շաբ - Կիր 09:00 - 23:00"
                ),
        
        Location(name: "Սայաթ-Նովայի պողոտա",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.216177, longitude: 44.582831),
                 description: "Սայաթ - Նովա 8",
                 imageNames: "photo-2023-03-19-155048-180x_",
                 time: "Երկ - Կիր 09:00 - 01:00"
                ),
        
        Location(name: "Հյուսիսային պողոտա 2",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.184250, longitude: 44.514586),
                 description: "Հյուսիսային պողոտա 2",
                 imageNames: "photo-2023-03-19-154511-180x_",
                 time: "Երկ - Կիր 09:00 - 00:00"
                ),
        
        Location(name: "Հյուսիսային պողոտա 3",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.183161, longitude: 44.515367),
                 description: "(Պարմա Սուպերմարկետ) Հյուսիսային պողոտա 3",
                 imageNames: "photo-2023-03-19-153133-180x_",
                 time: "Երկ - Կիր 24/7"
                ),
        
        Location(name: "Հյուսիսային պողոտա 18",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.180784, longitude: 44.514262),
                 description: "Հյուսիսային պողոտա 18",
                 imageNames: "photo-2023-03-19-152541-180x_",
                 time: "Երկ - Կիր 24/7"
                ),
        
        Location(name: "Մոսկվա կինոթատրոն",
                 cityName: "Yerevan",
                 cordinate: CLLocationCoordinate2D(latitude: 40.1872598492901, longitude: 44.51674927521155),
                 description: "(Մոսկվա կինոթատրոնի հարևանությամբ) \n Աբովյան 18/3",
                 imageNames: "img-8239-1-180x_",
                 time: "Երկ - Կիր 24/7"
                )
        
    ]
}
