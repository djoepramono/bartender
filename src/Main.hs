module Main where

import Prelude hiding (Right, Left)

data Request = Drink | Pay
data Unknown
data ParsedInput = Left Unknown | Right Request

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

parseCommand :: String -> Request 
parseCommand command = do
  case command of
    "drink" -> Right Drink  
    "pay" -> Right Pay  
    _ -> Left Error 

respond :: ParsedInput -> IO ()
respond (Right Drink) = putStrLn "Bartender: Here you go"
respond (Right Pay) = putStrLn "Bartender: Thanks"
respond (Left Unknown) = putStrln "Bartender: I don't get you"
