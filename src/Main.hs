module Main where

--import Prelude hiding (Right, Left)
import Data.Either

-- type alias
-- type Drink = String
-- type Pay = String
-- type Unknown = String

data Request = Drink | Pay 
data Error = ParsingError -- you cannot just put Error (type), you need ParsingError (value) as well. Right side of =
data ParsedInput = Either Error Request

main :: IO ()
main = do
  putStrLn "Bartender: How can I help you?"
  putStr "You: "
  input <- getLine 
  request <- parseRequest (input)
  response <- respond (request)
  putStrLn response

parseRequest :: String -> ParsedInput -- Not sure why I can't use ParsedInput
parseRequest "drink" = Right Drink
parseRequest "pay" = Right Pay
parseRequest _ = Left ParsingError 

-- parseCommand :: String -> Request 
-- parseCommand command = do
--   case command of
--     "drink" -> Right Drink  
--     "pay" -> Right Pay  
--     _ -> Left Unknown

respond :: ParsedInput -> String 
respond Right Drink  = "Bartender: Here you go"
respond Right Pay  = "Bartender: Thanks"
respond Left ParsingError = "Bartender: I don't get you"
