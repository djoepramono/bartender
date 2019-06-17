module Main where

--import Prelude hiding (Right, Left)
import Data.Either

-- type alias
type Drink = String
type Pay = String
type Unknown = String

data Request = Drink | Pay 
-- data Unknown
data ParsedInput = Either Unknown Request

main :: IO ()
main = do
  putStrLn "Bartender: How can I help you?"
  putStr "You: "
  input <- getLine 
  let request = parseCommand (input)
  respond request

parseRequest :: String -> ParsedInput -- Not sure why I can't use ParsedInput
parseRequest "drink" = Right Drink
parseRequest "pay" = Right Pay
parseRequest _ = Left Unknown

parseCommand :: String -> Request 
parseCommand command = do
  case command of
    "drink" -> Right Drink  
    "pay" -> Right Pay  
    _ -> Left Unknown

respond :: ParsedInput -> String 
respond Right Drink  = "Bartender: Here you go"
respond Right Pay  = "Bartender: Thanks"
respond Left unknown = "Bartender: I don't get you"
