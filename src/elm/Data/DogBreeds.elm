module Data.DogBreeds exposing (..)

import Json.Decode exposing (Decoder)
import Types exposing (..)


decoderDogBreed : String -> Decoder DogBreed
decoderDogBreed val =
    case val of
        "Akita" ->
            Json.Decode.succeed Akita

        "Alaskan Malamute" ->
            Json.Decode.succeed AlaskanMalamute

        "American Bull Dog" ->
            Json.Decode.succeed AmericanBullDog

        "Australian Kelpie" ->
            Json.Decode.succeed AustralianKelpie

        "Basset Hound" ->
            Json.Decode.succeed BassetHound

        "Beagle" ->
            Json.Decode.succeed Beagle

        "Bearded Collie" ->
            Json.Decode.succeed BeardedCollie

        "Bedlington Terrier" ->
            Json.Decode.succeed BedlingtonTerrier

        "Belgian Shepherd Malinois" ->
            Json.Decode.succeed BelgianShepherdMalinois

        "Belgian Shepherd Dog (Groenendael)" ->
            Json.Decode.succeed BelgianShepherdDogGroenendael

        "Bernese Mountain Dog" ->
            Json.Decode.succeed BerneseMountainDog

        "Bichon Frise" ->
            Json.Decode.succeed BichonFrise

        "Border Collie" ->
            Json.Decode.succeed BorderCollie

        "Border Terrier" ->
            Json.Decode.succeed BorderTerrier

        "Boston Terrier" ->
            Json.Decode.succeed BostonTerrier

        "Boxer" ->
            Json.Decode.succeed Boxer

        "Bull Mastiff" ->
            Json.Decode.succeed BullMastiff

        "Bulldog" ->
            Json.Decode.succeed Bulldog

        "Carin Terrier" ->
            Json.Decode.succeed CairnTerrier

        "Cavalier King Charles Spaniel" ->
            Json.Decode.succeed CavalierKingCharlesSpaniel

        "Chihuahua Long Coat" ->
            Json.Decode.succeed ChihuahuaLongCoat

        "Chihuahua Smooth Coat" ->
            Json.Decode.succeed ChihuahuaSmoothCoat

        "Chinese Crested" ->
            Json.Decode.succeed ChineseCrested

        "Chow Chow" ->
            Json.Decode.succeed ChowChow

        "Cocker Spaniel" ->
            Json.Decode.succeed CockerSpaniel

        "Corgi" ->
            Json.Decode.succeed Corgi

        "Daschund Long Haired" ->
            Json.Decode.succeed DachshundLongHaired

        "Daschund Miniature Long Haired" ->
            Json.Decode.succeed DachshundMiniatureLongHaired

        "Daschund Miniature Smooth Haired" ->
            Json.Decode.succeed DachshundMiniatureSmoothHaired

        "Daschund Miniature Wire Haired" ->
            Json.Decode.succeed DachshundMiniatureWireHaired

        "Daschund Smooth Haired" ->
            Json.Decode.succeed DachshundSmoothHaired

        "Daschund Wire Haired" ->
            Json.Decode.succeed DachshundWireHaired

        "Dalmation" ->
            Json.Decode.succeed Dalmatian

        "Doberman" ->
            Json.Decode.succeed Doberman

        "Doguede Bordeaux" ->
            Json.Decode.succeed DoguedeBordeaux

        "English Bull Terrier" ->
            Json.Decode.succeed EnglishBullTerrier

        "English Setter" ->
            Json.Decode.succeed EnglishSetter

        "English Springer Spaniel" ->
            Json.Decode.succeed EnglishSpringerSpaniel

        "English Toy Terrier" ->
            Json.Decode.succeed EnglishToyTerrier

        "Flat Coated Retriever" ->
            Json.Decode.succeed FlatCoatedRetriever

        "Fox Terrier" ->
            Json.Decode.succeed FoxTerrier

        "Foxhound" ->
            Json.Decode.succeed Foxhound

        "French Bulldog" ->
            Json.Decode.succeed FrenchBulldog

        "German Longhaired Pointer" ->
            Json.Decode.succeed GermanLonghairedPointer

        "German Shepherd Dog" ->
            Json.Decode.succeed GermanShepherdDog

        "German Short Haired Pointer" ->
            Json.Decode.succeed GermanShortHairedPointer

        "Golden Retriever" ->
            Json.Decode.succeed GoldenRetriever

        "Great Dane" ->
            Json.Decode.succeed GreatDane

        "Greyhound" ->
            Json.Decode.succeed Greyhound

        "Griffon Bruxellois" ->
            Json.Decode.succeed GriffonBruxellois

        "Harrier" ->
            Json.Decode.succeed Harrier

        "Havanese" ->
            Json.Decode.succeed Havanese

        "Irish Setter" ->
            Json.Decode.succeed IrishSetter

        "Italian Greyhound" ->
            Json.Decode.succeed ItalianGreyhound

        "Jack Russell Terrier" ->
            Json.Decode.succeed JackRussellTerrier

        "Japanese Spitz" ->
            Json.Decode.succeed JapaneseSpitz

        "King Charles Spaniel" ->
            Json.Decode.succeed KingCharlesSpaniel

        "Labrador Retriever" ->
            Json.Decode.succeed LabradorRetriever

        "Lakeland Terrier" ->
            Json.Decode.succeed LakelandTerrier

        "Leonberger" ->
            Json.Decode.succeed Leonberger

        "Lhasa Apso" ->
            Json.Decode.succeed LhasaApso

        "Lurcher" ->
            Json.Decode.succeed Lurcher

        "Maltese" ->
            Json.Decode.succeed Maltese

        "Mastiff" ->
            Json.Decode.succeed Mastiff

        "Miniature Pinscher" ->
            Json.Decode.succeed MiniaturePinscher

        "Miniature Poodle" ->
            Json.Decode.succeed MiniaturePoodle

        "Miniature Schnauzer" ->
            Json.Decode.succeed MiniatureSchnauzer

        "Mongrel Large" ->
            Json.Decode.succeed MongrelLarge

        "Mongrel Medium" ->
            Json.Decode.succeed MongrelMedium

        "Mongrel Small" ->
            Json.Decode.succeed MongrelSmall

        "Norfolk Terrier" ->
            Json.Decode.succeed NorfolkTerrier

        "Nova Scotia Duck Tolling Retriever" ->
            Json.Decode.succeed NovaScotiaDuckTollingRetriever

        "Old English Sheepdog" ->
            Json.Decode.succeed OldEnglishSheepdog

        "Papillon" ->
            Json.Decode.succeed Papillon

        "Parsons Jack Russell Terrier" ->
            Json.Decode.succeed ParsonsJackRussellTerrier

        "Patterdale Terrier" ->
            Json.Decode.succeed PatterdaleTerrier

        "Pointer" ->
            Json.Decode.succeed Pointer

        "Pomeranian" ->
            Json.Decode.succeed Pomeranian

        "Portuguese Podengo" ->
            Json.Decode.succeed PortuguesePodengo

        "Pug" ->
            Json.Decode.succeed Pug

        "Pyrenean Mountain Dog" ->
            Json.Decode.succeed PyreneanMountainDog

        "Rhodesian Ridgeback" ->
            Json.Decode.succeed RhodesianRidgeback

        "Rottweiler" ->
            Json.Decode.succeed Rottweiler

        "Russian Black Terrier" ->
            Json.Decode.succeed RussianBlackTerrier

        "Saint Bernard" ->
            Json.Decode.succeed SaintBernard

        "Saluki" ->
            Json.Decode.succeed Saluki

        "Affenpinscher" ->
            Json.Decode.succeed Affenpinscher

        "Afghan Hound" ->
            Json.Decode.succeed AfghanHound

        "Airedale Terrier" ->
            Json.Decode.succeed AiredaleTerrier

        "American Cocker Spaniel" ->
            Json.Decode.succeed AmericanCockerSpaniel

        "American Water Spaniel" ->
            Json.Decode.succeed AmericanWaterSpaniel

        "Anatolian Shepherd Dog" ->
            Json.Decode.succeed AnatolianShepherdDog

        "Australian Cattle Dog" ->
            Json.Decode.succeed AustralianCattleDog

        "Australian Shepherd" ->
            Json.Decode.succeed AustralianShepherd

        "Australian Silky Terrier" ->
            Json.Decode.succeed AustralianSilkyTerrier

        "Australian Terrier" ->
            Json.Decode.succeed AustralianTerrier

        "Basenji" ->
            Json.Decode.succeed Basenji

        "Basset Bleu de Gascogne" ->
            Json.Decode.succeed BassetBleudeGascogne

        "Basset Fauve de Bretagne" ->
            Json.Decode.succeed BassetFauvedeBretagne

        "Basset Griffon Vendeen (Grand)" ->
            Json.Decode.succeed BassetGriffonVendeenGrand

        "Basset Griffon Vendeen (Petit)" ->
            Json.Decode.succeed BassetGriffonVendeenPetit

        "Bavarian Mountain Hound" ->
            Json.Decode.succeed BavarianMountainHound

        "Beauceron" ->
            Json.Decode.succeed Beauceron

        "Bergamasco" ->
            Json.Decode.succeed Bergamasco

        "Bloodhound" ->
            Json.Decode.succeed Bloodhound

        "Bolognese" ->
            Json.Decode.succeed Bolognese

        "Borzoi" ->
            Json.Decode.succeed Borzoi

        "Bouvier Des Flandres" ->
            Json.Decode.succeed BouvierDesFlandres

        "Bracco Italiano" ->
            Json.Decode.succeed BraccoItaliano

        "Briard" ->
            Json.Decode.succeed Briard

        "Brittany" ->
            Json.Decode.succeed Brittany

        "German Spitz" ->
            Json.Decode.succeed GermanSpitz

        "German Wirehaired Pointer" ->
            Json.Decode.succeed GermanWirehairedPointer

        "Giant Schnauzer" ->
            Json.Decode.succeed GiantSchnauzer

        "Glen of Imaal Terrier" ->
            Json.Decode.succeed GlenofImaalTerrier

        "Gordon Setter" ->
            Json.Decode.succeed GordonSetter

        "Grand Bleu De Gascoigne" ->
            Json.Decode.succeed GrandBleuDeGascoigne

        "Hamiltonstovare" ->
            Json.Decode.succeed Hamiltonstovare

        "Hovawart" ->
            Json.Decode.succeed Hovawart

        "Hungarian Kuvasz" ->
            Json.Decode.succeed HungarianKuvasz

        "Hungarian Puli" ->
            Json.Decode.succeed HungarianPuli

        "Hungarian Vizsla" ->
            Json.Decode.succeed HungarianVizsla

        "Ibizan Hound" ->
            Json.Decode.succeed IbizanHound

        "Irish Red & White Setter" ->
            Json.Decode.succeed IrishRedAndWhiteSetter

        "Irish Terrier" ->
            Json.Decode.succeed IrishTerrier

        "Irish Water Spaniel" ->
            Json.Decode.succeed IrishWaterSpaniel

        "Irish Wolfhound" ->
            Json.Decode.succeed IrishWolfhound

        "Italian Spinone" ->
            Json.Decode.succeed ItalianSpinone

        "Japanese Chin" ->
            Json.Decode.succeed JapaneseChin

        "Keeshound" ->
            Json.Decode.succeed Keeshound

        "Kerry Blue Terrier" ->
            Json.Decode.succeed KerryBlueTerrier

        "Komondor" ->
            Json.Decode.succeed Komondor

        "Kooikerhondje" ->
            Json.Decode.succeed Kooikerhondje

        "Lancashire Heeler" ->
            Json.Decode.succeed LancashireHeeler

        "Large Munsterlander" ->
            Json.Decode.succeed LargeMunsterlander

        "Lowchen" ->
            Json.Decode.succeed Lowchen

        "Manchester Terrier" ->
            Json.Decode.succeed ManchesterTerrier

        "Maremma Sheepdog" ->
            Json.Decode.succeed MaremmaSheepdog

        "Shiba Inu" ->
            Json.Decode.succeed ShibaInu

        "Skye Terrier" ->
            Json.Decode.succeed SkyeTerrier

        "Sloughi" ->
            Json.Decode.succeed Sloughi

        "Small Munsterlander" ->
            Json.Decode.succeed SmallMunsterlander

        "Smooth Collie" ->
            Json.Decode.succeed SmoothCollie

        "Soft Coated Wheaten Terrier" ->
            Json.Decode.succeed SoftCoatedWheatenTerrier

        "Spanish Water Hound" ->
            Json.Decode.succeed SpanishWaterHound

        "Sussex Spaniel" ->
            Json.Decode.succeed SussexSpaniel

        "Swedish Lapphund" ->
            Json.Decode.succeed SwedishLapphund

        "Swedish Vallhund" ->
            Json.Decode.succeed SwedishVallhund

        "Tibetan Mastiff" ->
            Json.Decode.succeed TibetanMastiff

        "Tibetan Spaniel" ->
            Json.Decode.succeed TibetanSpaniel

        "Utonagon" ->
            Json.Decode.succeed Utonagon

        "Welsh Terrier" ->
            Json.Decode.succeed WelshTerrier

        "Canaan Dog" ->
            Json.Decode.succeed CanaanDog

        "Canadian Eskimo Dog" ->
            Json.Decode.succeed CanadianEskimoDog

        "Cesky Terrier" ->
            Json.Decode.succeed CeskyTerrier

        "Chesapeake Bay Retriever" ->
            Json.Decode.succeed ChesapeakeBayRetriever

        "Chihuahua (Long Coat)" ->
            Json.Decode.succeed ChihuahuaLongCoat

        "Chihuahua (Smooth Coat)" ->
            Json.Decode.succeed ChihuahuaSmoothCoat

        "Clumber Spaniel" ->
            Json.Decode.succeed ClumberSpaniel

        "Coton de tulear" ->
            Json.Decode.succeed Cotondetulear

        "Curly Coated Retriever" ->
            Json.Decode.succeed CurlyCoatedRetriever

        "Dachshund (Miniature Long-Haired)" ->
            Json.Decode.succeed DachshundMiniatureLongHaired

        "Dachshund (Miniature Smooth-Haired)" ->
            Json.Decode.succeed DachshundMiniatureSmoothHaired

        "Dachshund (Miniature Wire-Haired)" ->
            Json.Decode.succeed DachshundMiniatureWireHaired

        "Dachshund (Smooth-Haired)" ->
            Json.Decode.succeed DachshundSmoothHaired

        "Dachshund (Wire-Haired)" ->
            Json.Decode.succeed DachshundWireHaired

        "Dandie Dinmont Terrier" ->
            Json.Decode.succeed DandieDinmontTerrier

        "Deer Hound" ->
            Json.Decode.succeed DeerHound

        "English Bull Terrier (Miniature)" ->
            Json.Decode.succeed EnglishBullTerrierMiniature

        "Estrelea Mountain Dog" ->
            Json.Decode.succeed EstreleaMountainDog

        "Fell Terrier" ->
            Json.Decode.succeed FellTerrier

        "Field Spaniel" ->
            Json.Decode.succeed FieldSpaniel

        "Finnish Lapphund" ->
            Json.Decode.succeed FinnishLapphund

        "Finnish Spitz" ->
            Json.Decode.succeed FinnishSpitz

        "German Pinscher" ->
            Json.Decode.succeed GermanPinscher

        "Mexican Hairless" ->
            Json.Decode.succeed MexicanHairless

        "Miniature Bull Terrier" ->
            Json.Decode.succeed MiniatureBullTerrier

        "Mongrel – Large" ->
            Json.Decode.succeed MongrelLarge

        "Mongrel – Medium" ->
            Json.Decode.succeed MongrelMedium

        "Mongrel – Small" ->
            Json.Decode.succeed MongrelSmall

        "Neapolitan Mastiff" ->
            Json.Decode.succeed NeapolitanMastiff

        "New Zealand Huntaway" ->
            Json.Decode.succeed NewZealandHuntaway

        "Newfoundland" ->
            Json.Decode.succeed Newfoundland

        "Northern Inuit" ->
            Json.Decode.succeed NorthernInuit

        "Norwegian Buhund" ->
            Json.Decode.succeed NorwegianBuhund

        "Norwegian Elkhound" ->
            Json.Decode.succeed NorwegianElkhound

        "Norwich Terrier" ->
            Json.Decode.succeed NorwichTerrier

        "Otterhound" ->
            Json.Decode.succeed Otterhound

        "Pekingese" ->
            Json.Decode.succeed Pekingese

        "Pharaoh Hound" ->
            Json.Decode.succeed PharaohHound

        "Polish Lowland Sheepdog" ->
            Json.Decode.succeed PolishLowlandSheepdog

        "Portuguese Water Dog" ->
            Json.Decode.succeed PortugueseWaterDog

        "Pyrenean Sheepdog" ->
            Json.Decode.succeed PyreneanSheepdog

        "Rough Collie" ->
            Json.Decode.succeed RoughCollie

        "Samoyed" ->
            Json.Decode.succeed Samoyed

        "Schipperke" ->
            Json.Decode.succeed Schipperke

        "Sealyham Terrier" ->
            Json.Decode.succeed SealyhamTerrier

        "Segugio Italiano" ->
            Json.Decode.succeed SegugioItaliano

        "Shetland Sheepdog (Sheltie)" ->
            Json.Decode.succeed ShetlandSheepdogSheltie

        "Scottish Terrier" ->
            Json.Decode.succeed ScottishTerrier

        "Shar Pei" ->
            Json.Decode.succeed SharPei

        "Shetland Sheepdog Sheltie" ->
            Json.Decode.succeed ShetlandSheepdogSheltie

        "Shih Tzu" ->
            Json.Decode.succeed ShihTzu

        "Siberian Husky" ->
            Json.Decode.succeed SiberianHusky

        "Staffordshire Bull Terrier" ->
            Json.Decode.succeed StaffordshireBullTerrier

        "Standard Poodle" ->
            Json.Decode.succeed StandardPoodle

        "Standard Schnauzer" ->
            Json.Decode.succeed StandardSchnauzer

        "Tibetan Terrier" ->
            Json.Decode.succeed TibetanTerrier

        "Toy Poodle" ->
            Json.Decode.succeed ToyPoodle

        "Tree Walker Coonhound" ->
            Json.Decode.succeed TreeWalkerCoonhound

        "Weimaraner" ->
            Json.Decode.succeed Weimaraner

        "Welsh Springer Spaniel" ->
            Json.Decode.succeed WelshSpringerSpaniel

        "West Highland White Terrier" ->
            Json.Decode.succeed WestHighlandWhiteTerrier

        "Whippet" ->
            Json.Decode.succeed Whippet

        "Yorkshire Terrier" ->
            Json.Decode.succeed YorkshireTerrier

        _ ->
            Json.Decode.succeed DogBreedNotChosen


dogBreedsList : List DogBreed
dogBreedsList =
    [ Affenpinscher
    , AfghanHound
    , AiredaleTerrier
    , Akita
    , AlaskanMalamute
    , AmericanBullDog
    , AmericanCockerSpaniel
    , AmericanWaterSpaniel
    , AnatolianShepherdDog
    , AustralianCattleDog
    , AustralianKelpie
    , AustralianShepherd
    , AustralianSilkyTerrier
    , AustralianTerrier
    , Basenji
    , BassetBleudeGascogne
    , BassetFauvedeBretagne
    , BassetGriffonVendeenGrand
    , BassetGriffonVendeenPetit
    , BassetHound
    , BavarianMountainHound
    , Beagle
    , BeardedCollie
    , Beauceron
    , BedlingtonTerrier
    , BelgianShepherd
    , BelgianShepherdDog
    , BelgianShepherdDogGroenendael
    , BelgianShepherdMalinois
    , Bergamasco
    , BerneseMountainDog
    , BichonFrise
    , Bloodhound
    , Bolognese
    , BorderCollie
    , BorderTerrier
    , Borzoi
    , BostonTerrier
    , BouvierDesFlandres
    , Boxer
    , BraccoItaliano
    , Briard
    , Brittany
    , BullMastiff
    , Bulldog
    , CairnTerrier
    , CanaanDog
    , CanadianEskimoDog
    , CavalierKingCharlesSpaniel
    , CeskyTerrier
    , ChesapeakeBayRetriever
    , Chihuahua
    , ChihuahuaLongCoat
    , ChihuahuaSmoothCoat
    , ChineseCrested
    , ChowChow
    , ClumberSpaniel
    , CockerSpaniel
    , Corgi
    , Cotondetulear
    , CurlyCoatedRetriever
    , Dachshund
    , DachshundLongHaired
    , DachshundMiniatureLongHaired
    , DachshundMiniatureSmoothHaired
    , DachshundMiniatureWireHaired
    , DachshundSmoothHaired
    , DachshundWireHaired
    , Dalmatian
    , DandieDinmontTerrier
    , DeerHound
    , Doberman
    , DoguedeBordeaux
    , EnglishBullTerrier
    , EnglishBullTerrierMiniature
    , EnglishSetter
    , EnglishSpringerSpaniel
    , EnglishToyTerrier
    , EstreleaMountainDog
    , FellTerrier
    , FieldSpaniel
    , FinnishLapphund
    , FinnishSpitz
    , FlatCoatedRetriever
    , FoxTerrier
    , Foxhound
    , FrenchBulldog
    , GermanLonghairedPointer
    , GermanPinscher
    , GermanShepherdDog
    , GermanShortHairedPointer
    , GermanSpitz
    , GermanWirehairedPointer
    , GiantSchnauzer
    , GlenofImaalTerrier
    , GoldenRetriever
    , GordonSetter
    , GrandBleuDeGascoigne
    , GreatDane
    , Greyhound
    , GriffonBruxellois
    , Hamiltonstovare
    , Harrier
    , Havanese
    , Hovawart
    , HungarianKuvasz
    , HungarianPuli
    , HungarianVizsla
    , IbizanHound
    , IrishRedAndWhiteSetter
    , IrishSetter
    , IrishTerrier
    , IrishWaterSpaniel
    , IrishWolfhound
    , ItalianGreyhound
    , ItalianSpinone
    , JackRussellTerrier
    , JapaneseChin
    , JapaneseSpitz
    , Keeshound
    , KerryBlueTerrier
    , KingCharlesSpaniel
    , Komondor
    , Kooikerhondje
    , LabradorRetriever
    , LakelandTerrier
    , LancashireHeeler
    , LargeMunsterlander
    , Leonberger
    , LhasaApso
    , LongCoat
    , Lowchen
    , Lurcher
    , Malinois
    , Maltese
    , ManchesterTerrier
    , MaremmaSheepdog
    , Mastiff
    , MexicanHairless
    , MiniatureBullTerrier
    , MiniatureLongHaired
    , MiniaturePinscher
    , MiniaturePoodle
    , MiniatureSchnauzer
    , MongrelLarge
    , MongrelMedium
    , MongrelSmall
    , NeapolitanMastiff
    , NewZealandHuntaway
    , Newfoundland
    , NorfolkTerrier
    , NorthernInuit
    , NorwegianBuhund
    , NorwegianElkhound
    , NorwichTerrier
    , NovaScotiaDuckTollingRetriever
    , OldEnglishSheepdog
    , Otterhound
    , Papillon
    , ParsonsJackRussellTerrier
    , PatterdaleTerrier
    , Pekingese
    , PharaohHound
    , Pointer
    , PolishLowlandSheepdog
    , Pomeranian
    , PortuguesePodengo
    , PortugueseWaterDog
    , Pug
    , PyreneanMountainDog
    , PyreneanSheepdog
    , RhodesianRidgeback
    , Rottweiler
    , RoughCollie
    , RussianBlackTerrier
    , SaintBernard
    , Saluki
    , Samoyed
    , Schipperke
    , ScottishTerrier
    , SealyhamTerrier
    , SegugioItaliano
    , SharPei
    , Sheltie
    , ShetlandSheepdog
    , ShetlandSheepdogSheltie
    , ShibaInu
    , ShihTzu
    , SiberianHusky
    , SkyeTerrier
    , Sloughi
    , SmallMunsterlander
    , SmoothCollie
    , SoftCoatedWheatenTerrier
    , SpanishWaterHound
    , StaffordshireBullTerrier
    , StandardPoodle
    , StandardSchnauzer
    , SussexSpaniel
    , SwedishLapphund
    , SwedishVallhund
    , TibetanMastiff
    , TibetanSpaniel
    , TibetanTerrier
    , ToyPoodle
    , TreeWalkerCoonhound
    , Utonagon
    , Weimaraner
    , WelshSpringerSpaniel
    , WelshTerrier
    , WestHighlandWhiteTerrier
    , Whippet
    , YorkshireTerrier
    ]
