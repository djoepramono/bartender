-- {-# OPTIONS_GHC -fwarn-incomplete-patterns #-}

data Activity = Eat | Drink deriving (Show)

parseActivity :: String -> Activity 
parseActivity "eat" = Eat
parseActivity "drink" = Drink

type Name = String
data Robot = Robot Name (String -> Activity)
android = Robot "android" parseActivity 
