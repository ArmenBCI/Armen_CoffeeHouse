//
//  CatalogVeiwModel.swift
//  CoffeeProject
//
//  Created by Yurka Babayan on 17.08.23.
//

import Foundation


class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel()
    
    var allProducts = [
        
        Product(id: "1",
                title: "Սփենիշ լատտե",
                imageUrl: "spanish-latte-376x_",
                price: 1800,
                descript: "Էսպրեսսոյի հիմքով կաթնային թույլ սուրճ է՝ խտացրած կաթի հավելումով"),
        
        Product(id: "2",
                title: "Աղի Մտչ. Լատտե",
                imageUrl: "matcha-latte-376x_",
                price: 1800,
                descript: "Ճապոնական կանաչ թեյով կաթնային ըմպելիք է՝ աղի կարամելի հավելումով"),
        
        Product(id: "3",
                title: "Աղի Լատտե",
                imageUrl: "salted-caramel-latte-376x_",
                price: 1800,
                descript: "Էսպրեսսոյի հիմքով կաթնային թույլ սուրճ է ՝ աղի կարամելի հավելումով"),
        
        Product(id: "4",
                title: "Ռաֆ",
                imageUrl: "raff-376x_",
                price: 1800,
                descript: "Էսպրեսսոյի հիմքով կաթնային սուրճ է՝ կաթի և սերուցքի հավելումով, միջին քաղցրության"),
        
        Product(id: "5",
                title: "Ֆլեթ Վայթ",
                imageUrl: "flat-white-376x_",
                price: 1800,
                descript: "Կրկնակի էսպրեսսոյի հիմքով թունդ կաթնային սուրճ է"),
        
        Product(id: "6",
                title: "Լատտե",
                imageUrl: "latte-376x_",
                price: 1800,
                descript: "Էսպրեսսոյի հիմքով թույլ կաթնային սուրճ է"),
        
        Product(id: "7",
                title: "Կապուչինո",
                imageUrl: "cappuccino-376x_",
                price: 1800,
                descript: "Էսպրեսսոյի հիմքով թունդ կաթնային սուրճ է"),
        
        Product(id: "8",
                title: "Ամերիկանո",
                imageUrl: "americano-376x_",
                price: 1800,
                descript: "Էսպրեսսոյի հիմքով թունդ սուրճ է՝ ջրի հավելումով"),
        
        Product(id: "9",
                title: "Քուքիս",
                imageUrl: "cookies-376x_",
                price: 1800,
                descript: "Լուծվող քաղցր սուրճ է՝ անգլիական թխվածքաբլիթով և նուտելլայով"),
        
        Product(id: "10",
                title: "Նուտելլա",
                imageUrl: "nutella-376x_",
                price: 1800,
                descript: "Լուծվող քաղցր սուրճ է՝ նուտելլայով"),
        
        Product(id: "11",
                title: "Կինդեր",
                imageUrl: "kinder-376x_",
                price: 1800,
                descript: "Լուծվող քաղցր սուրճ է՝ կինդերով"),
        
        Product(id: "12",
                title: "Նաթս",
                imageUrl: "nuts-376x_",
                price: 1800,
                descript: "Լուծվող քաղցր սուրճ է՝ գետնանուշով և նուտելլայով"),
        
        Product(id: "13",
                title: "Վայթ Մոկա",
                imageUrl: "white-mocha-376x_",
                price: 1800,
                descript: "Լուծվող կաթնային սուրճ է, միջին քաղցրության՝ սերուցքով"),
        
        Product(id: "14",
                title: "Բլեք Սթար",
                imageUrl: "black-star-376x_",
                price: 1800,
                descript: "Լուծվող սուրճ է , միջին քաղցրության ՝ դարչինով"),
        
        Product(id: "15",
                title: "Դոլչե Գուստո",
                imageUrl: "dolce-376x_",
                price: 1800,
                descript: "Ինդոնեզիական սուրճերի միքս է, միջին քաղցրության"),
        
        Product(id: "16",
                title: "Ցիտրուս Միքս",
                imageUrl: "citrus-mix-376x_",
                price: 1800,
                descript: "Ցիտրուսային մրգերի օշարակներով, նարինջով և նանայով գազավորված զովացուցիչ ըմպելիք է"),
        
        Product(id: "17",
                title: "Էկզոտիկ Միքս",
                imageUrl: "exotic-376x_",
                price: 1800,
                descript: "Էկզոտիկ մրգերի պյուրեներով, նարինջով և նանայով գազավորված զովացուցիչ ըմպելիք է"),
        
        Product(id: "18",
                title: "Փեյշն Ֆրութ",
                imageUrl: "passion-376x_",
                price: 1800,
                descript: "Մարակույաի պյուրեով, նարինջով և նանայով գազավորված զովացուցիչ ըմպելիք է"),
        
        Product(id: "19",
                title: "Բերի Միքս",
                imageUrl: "berry-376x_",
                price: 1800,
                descript: "Հատապտղային պյուրեով, ելակով և նանայով գազավորված զովացուցիչ ըմպելիք է"),
        
        Product(id: "20",
                title: "Մանգո Միքս",
                imageUrl: "mango-376x_",
                price: 1800,
                descript: "Մանգոյի պյուրեով, ելակով և նանայով գազավորված զովացուցիչ ըմպելիք է"),
        
        Product(id: "21",
                title: "Մոխիտո Ելակով",
                imageUrl: "mojito-str-376x_",
                price: 1800,
                descript: "Լայմով, ելակով և նանայով գազավորված զովացուցիչ ըմպելիք է"),
        
        Product(id: "22",
                title: "Մոխիտո",
                imageUrl: "mojito-376x_",
                price: 1800,
                descript: "Լայմով և նանայով գազավորված զովացուցիչ ըմպելիք է"),
        
        Product(id: "23",
                title: "Կոսմո",
                imageUrl: "cosmo-376x_",
                price: 1800,
                descript: "Սառը հատապտղային թեյ է, կարկադեյի հիմքով"),
        
        Product(id: "24",
                title: "Ելակ",
                imageUrl: "elak-376x_",
                price: 1800,
                descript: "Ելակ"),
        
        Product(id: "25",
                title: "Նարինջ-Ելակ Միքս",
                imageUrl: "elak-narinj-376x_",
                price: 1800,
                descript: "Նարինջ-Ելակ Միքս"),
        
        Product(id: "26",
                title: "Նարինջ",
                imageUrl: "narinj-376x_",
                price: 1800,
                descript: "Նարինջ"),
        
        Product(id: "27",
                title: "Բանան-Ելակ Միքս",
                imageUrl: "banan-elak-376x_",
                price: 1800,
                descript: "Բանան-Ելակ Միքս"),
        
        Product(id: "28",
                title: "Բանան",
                imageUrl: "banan-376x_",
                price: 1800,
                descript: "Բանան"),
        
        Product(id: "29",
                title: "Սնիկերս Շեյք",
                imageUrl: "snickers-shake-376x_",
                price: 1800,
                descript: "Կաթնային շեյք է՝ սնիկերսով, նուտելլայով և պաղպաղակով"),
        
        Product(id: "30",
                title: "Օրեո Շեյք",
                imageUrl: "oreo-shake-376x_",
                price: 1800,
                descript: "Կաթնային շեյք է՝ օրեո թխվածքաբլիթներով և պաղպաղակով"),
        
        Product(id: "31",
                title: "Քուքիս Շեյք",
                imageUrl: "cookie-shake-376x_",
                price: 1800,
                descript: "Կաթնային շեյք է՝ անգլիական թխվածքաբլիթով, նուտելլայով և պաղպաղակով"),
        
        Product(id: "32",
                title: "Կարամել Ֆրապուչինո",
                imageUrl: "caramel-frap-376x_",
                price: 1800,
                descript: "Կաթնային շեյք է՝ կարամելով և պաղպաղակով"),
        
        Product(id: "33",
                title: "Ելակի Ֆրապուչինո",
                imageUrl: "str-frap-376x_",
                price: 1800,
                descript: "Կաթնային շեյք է՝ ելակի օշարակով և պաղպաղակով"),
        
        Product(id: "34",
                title: "Կոֆե Ֆրապուչինո",
                imageUrl: "coffee-frap-376x_",
                price: 1800,
                descript: "Կաթնային շեյք է՝ սուրճով և պաղպաղակով, միջին քաղցրության"),
        
        Product(id: "35",
                title: "Նուտելլա Ֆրապուչինո",
                imageUrl: "nutella-frap-376x_",
                price: 1800,
                descript: "Կաթնային շեյք է՝ նուտելլայով և պաղպաղակով")
    ]
    
    var esspresoBace = [
        
        Product(id: "1",
                title: "Սփենիշ լատտե",
                imageUrl: "spanish-latte-376x_",
                price: 1800,
                descript: "Էսպրեսսոյի հիմքով կաթնային թույլ սուրճ է՝ խտացրած կաթի հավելումով"),
        
        Product(id: "2",
                title: "Աղի Մտչ Լատտե",
                imageUrl: "matcha-latte-376x_",
                price: 1800,
                descript: "Ճապոնական կանաչ թեյով կաթնային ըմպելիք է՝ աղի կարամելի հավելումով"),
        
        Product(id: "3",
                title: "Աղի Լատտե",
                imageUrl: "salted-caramel-latte-376x_",
                price: 1800,
                descript: "Էսպրեսսոյի հիմքով կաթնային թույլ սուրճ է ՝ աղի կարամելի հավելումով"),
        
        Product(id: "4",
                title: "Ռաֆ",
                imageUrl: "raff-376x_",
                price: 1800,
                descript: "Էսպրեսսոյի հիմքով կաթնային սուրճ է՝ կաթի և սերուցքի հավելումով, միջին քաղցրության"),
        
        Product(id: "5",
                title: "Ֆլեթ Վայթ",
                imageUrl: "flat-white-376x_",
                price: 1800,
                descript: "Կրկնակի էսպրեսսոյի հիմքով թունդ կաթնային սուրճ է"),
        
        Product(id: "6",
                title: "Լատտե",
                imageUrl: "latte-376x_",
                price: 1800,
                descript: "Էսպրեսսոյի հիմքով թույլ կաթնային սուրճ է"),
        
        Product(id: "7",
                title: "Կապուչինո",
                imageUrl: "cappuccino-376x_",
                price: 1800,
                descript: "Էսպրեսսոյի հիմքով թունդ կաթնային սուրճ է"),
        
        Product(id: "8",
                title: "Ամերիկանո",
                imageUrl: "americano-376x_",
                price: 1800,
                descript: "Էսպրեսսոյի հիմքով թունդ սուրճ է՝ ջրի հավելումով")
        
    ]
    
    
    var coffeeMix = [
        
        Product(id: "9",
                title: "Քուքիս",
                imageUrl: "cookies-376x_",
                price: 1800,
                descript: "Լուծվող քաղցր սուրճ է՝ անգլիական թխվածքաբլիթով և նուտելլայով"),
        
        Product(id: "10",
                title: "Նուտելլա",
                imageUrl: "nutella-376x_",
                price: 1800,
                descript: "Լուծվող քաղցր սուրճ է՝ նուտելլայով"),
        
        Product(id: "11",
                title: "Կինդեր",
                imageUrl: "kinder-376x_",
                price: 1800,
                descript: "Լուծվող քաղցր սուրճ է՝ կինդերով"),
        
        Product(id: "12",
                title: "Նաթս",
                imageUrl: "nuts-376x_",
                price: 1800,
                descript: "Լուծվող քաղցր սուրճ է՝ գետնանուշով և նուտելլայով"),
        
        Product(id: "13",
                title: "Վայթ Մոկա",
                imageUrl: "white-mocha-376x_",
                price: 1800,
                descript: "Լուծվող կաթնային սուրճ է, միջին քաղցրության՝ սերուցքով"),
        
        Product(id: "14",
                title: "Բլեք Սթար",
                imageUrl: "black-star-376x_",
                price: 1800,
                descript: "Լուծվող սուրճ է , միջին քաղցրության ՝ դարչինով"),
        
        Product(id: "15",
                title: "Դոլչե Գուստո",
                imageUrl: "dolce-376x_",
                price: 1800,
                descript: "Ինդոնեզիական սուրճերի միքս է, միջին քաղցրության")
    ]
    
    var limonad = [
        
        Product(id: "16",
                title: "Ցիտրուս Միքս",
                imageUrl: "citrus-mix-376x_",
                price: 1800,
                descript: "Ցիտրուսային մրգերի օշարակներով, նարինջով և նանայով գազավորված զովացուցիչ ըմպելիք է"),
        
        Product(id: "17",
                title: "Էկզոտիկ Միքս",
                imageUrl: "exotic-376x_",
                price: 1800,
                descript: "Էկզոտիկ մրգերի պյուրեներով, նարինջով և նանայով գազավորված զովացուցիչ ըմպելիք է"),
        
        Product(id: "18",
                title: "Փեյշն Ֆրութ",
                imageUrl: "passion-376x_",
                price: 1800,
                descript: "Մարակույաի պյուրեով, նարինջով և նանայով գազավորված զովացուցիչ ըմպելիք է"),
        
        Product(id: "19",
                title: "Բերի Միքս",
                imageUrl: "berry-376x_",
                price: 1800,
                descript: "Հատապտղային պյուրեով, ելակով և նանայով գազավորված զովացուցիչ ըմպելիք է"),
        
        Product(id: "20",
                title: "Մանգո Միքս",
                imageUrl: "mango-376x_",
                price: 1800,
                descript: "Մանգոյի պյուրեով, ելակով և նանայով գազավորված զովացուցիչ ըմպելիք է"),
        
        Product(id: "21",
                title: "Մոխիտո Ելակով",
                imageUrl: "mojito-str-376x_",
                price: 1800,
                descript: "Լայմով, ելակով և նանայով գազավորված զովացուցիչ ըմպելիք է"),
        
        Product(id: "22",
                title: "Մոխիտո",
                imageUrl: "mojito-376x_",
                price: 1800,
                descript: "Լայմով և նանայով գազավորված զովացուցիչ ըմպելիք է"),
        
        Product(id: "23",
                title: "Կոսմո",
                imageUrl: "cosmo-376x_",
                price: 1800,
                descript: "Սառը հատապտղային թեյ է, կարկադեյի հիմքով")
    ]
    
    var smusy = [
        
        Product(id: "24",
                title: "Ելակ",
                imageUrl: "elak-376x_",
                price: 1800,
                descript: "Ելակ"),
        
        Product(id: "25",
                title: "Նարինջ-Ելակ Միքս",
                imageUrl: "elak-narinj-376x_",
                price: 1800,
                descript: "Նարինջ-Ելակ Միքս"),
        
        Product(id: "26",
                title: "Նարինջ",
                imageUrl: "narinj-376x_",
                price: 1800,
                descript: "Նարինջ"),
        
        Product(id: "27",
                title: "Բանան-Ելակ Միքս",
                imageUrl: "banan-elak-376x_",
                price: 1800,
                descript: "Բանան-Ելակ Միքս"),
        
        Product(id: "28",
                title: "Բանան",
                imageUrl: "banan-376x_",
                price: 1800,
                descript: "Բանան")
    ]
    
    var milkShake = [
        
        Product(id: "29",
                title: "Սնիկերս Շեյք",
                imageUrl: "snickers-shake-376x_",
                price: 1800,
                descript: "Կաթնային շեյք է՝ սնիկերսով, նուտելլայով և պաղպաղակով"),
        
        Product(id: "30",
                title: "Օրեո Շեյք",
                imageUrl: "oreo-shake-376x_",
                price: 1800,
                descript: "Կաթնային շեյք է՝ օրեո թխվածքաբլիթներով և պաղպաղակով"),
        
        Product(id: "31",
                title: "Քուքիս Շեյք",
                imageUrl: "cookie-shake-376x_",
                price: 1800,
                descript: "Կաթնային շեյք է՝ անգլիական թխվածքաբլիթով, նուտելլայով և պաղպաղակով"),
        
        Product(id: "32",
                title: "Կարամել Ֆրապուչինո",
                imageUrl: "caramel-frap-376x_",
                price: 1800,
                descript: "Կաթնային շեյք է՝ կարամելով և պաղպաղակով"),
        
        Product(id: "33",
                title: "Ելակի Ֆրապուչինո",
                imageUrl: "str-frap-376x_",
                price: 1800,
                descript: "Կաթնային շեյք է՝ ելակի օշարակով և պաղպաղակով"),
        
        Product(id: "34",
                title: "Կոֆե Ֆրապուչինո",
                imageUrl: "coffee-frap-376x_",
                price: 1800,
                descript: "Կաթնային շեյք է՝ սուրճով և պաղպաղակով, միջին քաղցրության"),
        
        Product(id: "35",
                title: "Նուտելլա Ֆրապուչինո",
                imageUrl: "nutella-frap-376x_",
                price: 1800,
                descript: "Կաթնային շեյք է՝ նուտելլայով և պաղպաղակով")
    ]
}
