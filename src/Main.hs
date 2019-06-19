module Main where

--import Prelude hiding (Right, Left)
import Data.Either

-- type alias
-- type Drink = String
-- type Pay = String
-- type Unknown = String

data Request = Drink | Pay 
data Error = ParsingError -- you cannot just put Error (type), you need ParsingError (value) as well. Right side of =
-- data ParsedInput = Either Error Request -- wrong way apparently
-- data Either Error Request = Left Error | Right Request
type ParsedInput = Either Error Request 
-- data ParsedInput = Either Error Request -- using data instead of type will blow up. Why? Not sure but more or less because Either is not a proper data constructor.
-- data ParsedInput = Left Error | Right Request -- This is also not working, not sure why but basically it's ambiguous now as Left a | Right b is not Either a b


main :: IO ()
main = do
  putStrLn "Bartender: How can I help you?"
  putStr "You: "
  input <- getLine 
  let request = parseRequest (input)
  let response = respond (request)
  putStrLn response

parseRequest :: String -> ParsedInput -- Not sure why I can't use ParsedInput
parseRequest "drink" = Right Drink
parseRequest "pay" = Right Pay
parseRequest _ = Left ParsingError 

respond :: ParsedInput -> String 
-- respond :: Either Error Request -> String -- works as well
respond (Right Drink)  = "Bartender: Here you go"
respond (Right Pay)  = "Bartender: Thanks"
respond (Left ParsingError) = "Bartender: I don't get you"
