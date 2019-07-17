class CanCry a where
  cry :: a -> String

class CanTalk a where
  talk :: a -> String


data Adult = Adult
instance CanCry Adult where
  cry Adult = "Sob sob"
instance CanTalk Adult where
  talk Adult = "Hi there"

data Baby = Baby
instance CanCry Baby where
  cry Baby = "Waaah"

doCry :: (CanCry a) => a -> String
doCry b = cry b

doTalk :: (CanTalk a) => a -> String
doTalk b = talk b
