{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Application
import qualified Data.Text                      as T
import           Network.Wai.Handler.Warp       (run)
import           Network.Wai.Middleware.Rollbar
import           Rollbar.AccessToken
import           Rollbar.Item.Environment
import           System.Environment
import           Yesod.Core

main :: IO ()
main = do
  settings <- mkSettings
  app      <- toWaiAppPlain App
  run 3000 $ requests settings app

mkSettings :: IO (Settings '[])
mkSettings =
  Settings <$> (AccessToken . T.pack <$> getEnv "ROLLBAR_ACCESS_TOKEN")
           <*> pure Nothing
           <*> pure Nothing
           <*> pure (Environment "development")
