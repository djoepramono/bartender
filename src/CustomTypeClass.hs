class Stringable a where
  toString :: a -> String

data Person = Person {name :: String} 

instance Stringable Person where
  toString (Person s) = "My name is " ++ s

run :: [Char]
run = toString $ Person "Joe"
