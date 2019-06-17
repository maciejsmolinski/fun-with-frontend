module DateTime (currentDateTime) where

import Effect (Effect)

foreign import currentDateTime :: Effect String
