{-# LANGUAGE PackageImports #-}
import Prelude              (IO, ($), putStrLn)
import "haskellers" Application (getApplicationDev)
import Network.Wai.Handler.Warp
    (runSettings, defaultSettings, setPort)
import Network.Wai.Handler.WarpTLS
  (tlsSettings, runTLS)
import Control.Concurrent (forkIO)
import System.Directory (doesFileExist, removeFile)
import System.Exit (exitSuccess)
import Control.Concurrent (threadDelay)

main :: IO ()
main = do
    let tls = tlsSettings "./cert.pem" "./key.pem"
    putStrLn "Starting devel application"
    (port, app) <- getApplicationDev
    -- forkIO $ runSettings (setPort port defaultSettings) app
    forkIO $ runTLS tls (setPort port defaultSettings) app
    loop

loop :: IO ()
loop = do
  threadDelay 100000
  e <- doesFileExist "dist/devel-terminate"
  if e then terminateDevel else loop

terminateDevel :: IO ()
terminateDevel = exitSuccess
