module Weather (getAndLogWeather) where

import Prelude

import Affjax (get)
import Affjax.ResponseFormat (string)
import Data.Either (Either(..), either)
import Effect (Effect)
import Effect.Aff (Aff, launchAff_)
import Effect.Class (liftEffect)
import Effect.Class.Console (log, logShow)
import Foreign (MultipleErrors)
import Simple.JSON as SimpleJSON

type Result a = Either MultipleErrors a

type ConsolidatedWeather = {
  consolidated_weather :: Array {
    min_temp :: Number,
    max_temp :: Number,
    the_temp :: Number,
    weather_state_name :: String
  }
}

type Weather = Array {
  min :: Number,
  max :: Number,
  avg :: Number,
  state :: String
}

toWeather :: ConsolidatedWeather -> Weather
toWeather { consolidated_weather } = weather <$> consolidated_weather
  where
    weather ({ min_temp, max_temp, the_temp, weather_state_name }) = { min: min_temp, max: max_temp, avg: the_temp, state: weather_state_name }

getWeather :: Aff (Result Weather)
getWeather = do
  result <- _.body <$> get string "https://www.metaweather.com/api/location/753692/"
  pure $ toWeather <$> ((SimpleJSON.readJSON :: String -> Result ConsolidatedWeather) $ either (const "") identity result)

getAndLogWeather :: Effect Unit
getAndLogWeather = launchAff_ $ do
  getWeather >>= case _ of
    Left _ -> liftEffect $ log $ "Could not fetch weather information"
    Right temperature -> liftEffect $ logShow $ temperature