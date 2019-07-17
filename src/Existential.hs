{-# LANGUAGE ExistentialQuantification #-}

data Error = Error
data Pair = forall a. (Num a) =>  Either Error a
