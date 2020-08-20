module Data.Home exposing (..)

import Types exposing (..)


timeScaleTypes : List TimeScale
timeScaleTypes =
    [ UpTo1Week
    , UpTo3Weeks
    , UpTo2Months
    , Over2Months
    ]


petTypes : List PetType
petTypes =
    [ Dog
    , Cat
    ]
