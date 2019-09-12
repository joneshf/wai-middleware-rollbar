import Application
import Yesod.Core
import Network.Wai.Handler.Warp
import System.Environment
import qualified Data.Text as T
import Rollbar.AccessToken

main :: IO ()
main = do
  _accessToken <- AccessToken . T.pack <$> getEnv "ROLLBAR_ACCESS_TOKEN"
  toWaiAppPlain App >>=  run 3000
