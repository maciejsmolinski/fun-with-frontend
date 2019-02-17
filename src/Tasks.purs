module Tasks (fromJSON, toJSON, toTasks, Tasks) where

import Prelude

import Control.Monad.Except (runExcept)
import Data.Either (either)
import Data.Generic.Rep (class Generic)
import Foreign.Class (class Decode, class Encode)
import Foreign.Generic (decodeJSON, defaultOptions, encodeJSON, genericDecode, genericEncode)

newtype Task = Task { title :: String, completed :: Boolean }
newtype Tasks = Tasks (Array Task)

derive instance repTask :: Generic Task _
derive instance repTasks :: Generic Tasks _

instance decodeTask :: Decode Task where
  decode = genericDecode $ defaultOptions {unwrapSingleConstructors = true}

instance encodeTask :: Encode Task where
  encode = genericEncode $ defaultOptions {unwrapSingleConstructors = true}

instance decodeTasks :: Decode Tasks where
  decode = genericDecode $ defaultOptions {unwrapSingleConstructors = true}

instance encodeTasks :: Encode Tasks where
  encode = genericEncode $ defaultOptions {unwrapSingleConstructors = true}

instance showTask :: Show Task where
  show a = encodeJSON a

instance showTasks :: Show Tasks where
  show a = encodeJSON a

empty :: Tasks
empty = Tasks []

fromJSON :: String -> Tasks
fromJSON string = either (const empty) (identity) $ runExcept $ decodeJSON string

toJSON :: Tasks -> String
toJSON tasks = encodeJSON tasks

toTasks :: forall a. Array { title :: String, completed :: Boolean | a } -> Tasks
toTasks items = Tasks $ toTask <$> items
  where
    toTask :: { title :: String, completed :: Boolean | a } -> Task
    toTask { title, completed } = Task { title, completed }