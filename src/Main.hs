module Main where

data Input = Drink | Pay
data Error
data ParsedInput = Either Error Input

main :: IO ()
main = do
  putStrLn "Bartender: How can I help you?"
  putStr "You: "
  input <- getLine 
  parseCommand (input)

parseInput :: String -> Either Error Input -- Not sure why I can't use ParsedInput
parseInput "drink" = Right Drink
parseInput "pay" = Right Pay

parseCommand :: String -> IO ()
parseCommand command = do
  case command of
    "drink" -> putStrLn "Bartender: Here you go"
    "pay" -> putStrLn "Bartender: Thanks"
    _ -> putStrLn "Bartender: I don't get you"
