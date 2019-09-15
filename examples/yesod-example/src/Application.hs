{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module Application where

import Control.Exception (Exception, throw)
import Yesod.Core

data App = App

mkYesod "App" [parseRoutes|
/success SuccessR GET
/error   ErrorR   GET
/fail    FailR    GET
/throw   ThrowR   GET
|]

instance Yesod App

data CustomException = CustomException
  deriving Show

instance Exception CustomException

getSuccessR :: Handler Value
getSuccessR = return "OK"

getErrorR :: Handler Value
getErrorR = error "error"

getFailR :: Handler Value
getFailR = fail "error"

getThrowR :: Handler Value
getThrowR = throw CustomException
