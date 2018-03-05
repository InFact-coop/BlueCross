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

        "Belgian Shepherd Dog Groenendael" ->
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
            Json.Decode.succeed NULL


dogBreedsList : List DogBreed
dogBreedsList =
    [ Akita
    , AlaskanMalamute
    , AmericanBullDog
    , AustralianKelpie
    , BassetHound
    , Beagle
    , BeardedCollie
    , BedlingtonTerrier
    , BelgianShepherdMalinois
    , BelgianShepherdDogGroenendael
    , BerneseMountainDog
    , BichonFrise
    , BorderCollie
    , BorderTerrier
    , BostonTerrier
    , Boxer
    , BullMastiff
    , Bulldog
    , CairnTerrier
    , CavalierKingCharlesSpaniel
    , ChihuahuaLongCoat
    , ChihuahuaSmoothCoat
    , ChineseCrested
    , ChowChow
    , CockerSpaniel
    , Corgi
    , DachshundLongHaired
    , DachshundMiniatureLongHaired
    , DachshundMiniatureSmoothHaired
    , DachshundMiniatureWireHaired
    , DachshundSmoothHaired
    , DachshundWireHaired
    , Dalmatian
    , Doberman
    , DoguedeBordeaux
    , EnglishBullTerrier
    , EnglishSetter
    , EnglishSpringerSpaniel
    , EnglishToyTerrier
    , FlatCoatedRetriever
    , FoxTerrier
    , Foxhound
    , FrenchBulldog
    , GermanLonghairedPointer
    , GermanShepherdDog
    , GermanShortHairedPointer
    , GoldenRetriever
    , GreatDane
    , Greyhound
    , GriffonBruxellois
    , Harrier
    , Havanese
    , IrishSetter
    , ItalianGreyhound
    , JackRussellTerrier
    , JapaneseSpitz
    , KingCharlesSpaniel
    , LabradorRetriever
    , LakelandTerrier
    , Leonberger
    , LhasaApso
    , Lurcher
    , Maltese
    , Mastiff
    , MiniaturePinscher
    , MiniaturePoodle
    , MiniatureSchnauzer
    , MongrelLarge
    , MongrelMedium
    , MongrelSmall
    , NorfolkTerrier
    , NovaScotiaDuckTollingRetriever
    , OldEnglishSheepdog
    , Papillon
    , ParsonsJackRussellTerrier
    , PatterdaleTerrier
    , Pointer
    , Pomeranian
    , PortuguesePodengo
    , Pug
    , PyreneanMountainDog
    , RhodesianRidgeback
    , Rottweiler
    , RussianBlackTerrier
    , SaintBernard
    , Saluki
    , ScottishTerrier
    , SharPei
    , ShetlandSheepdogSheltie
    , ShihTzu
    , SiberianHusky
    , StaffordshireBullTerrier
    , StandardPoodle
    , StandardSchnauzer
    , TibetanTerrier
    , ToyPoodle
    , TreeWalkerCoonhound
    , Weimaraner
    , WelshSpringerSpaniel
    , WestHighlandWhiteTerrier
    , Whippet
    , YorkshireTerrier
    ]
