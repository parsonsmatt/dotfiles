#!/usr/bin/env stack
{- stack --allow-different-user --resolver lts-11.0 script --package yaml --package aeson
 --package text --package process --package containers
-}

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

import Data.Foldable (for_)
import Data.Traversable (for)
import           Control.Monad  (void)
import           Data.Map       (Map)
import qualified Data.Map       as Map
import           Data.Text      (Text)
import qualified Data.Text      as Text
import           Data.Yaml
import           System.Exit
import           System.Process

main :: IO ()
main = do
    econfig <- decodeFileEither "install.yml"
    config <- case econfig of
                  Left err ->
                      error $ prettyPrintParseException err
                  Right a ->
                      pure a

    installAptPackages (dcAptPackages config)
    installOtherPackages (dcOtherPackages config)

installAptPackages :: [String] -> IO ()
installAptPackages dcAptPackages = do
    (exitCode, _, _) <- readProcessWithExitCode "apt" ("install" : "-y" : dcAptPackages) []
    case exitCode of
        ExitFailure _ ->
            error $ "Failed installing apt packages: " ++ show dcAptPackages
        _ ->
            pure ()

installOtherPackages :: Map String InstallPlan -> IO ()
installOtherPackages =
    void . Map.traverseWithKey installPackage

installPackage :: String -> InstallPlan -> IO ()
installPackage pkg InstallPlan{..} = do
    exitCode <- procToSuccess <$> for ipTest (\test -> let (cmd:args) = words test in readProcessWithExitCode cmd args [])
    case exitCode of
        ExitSuccess -> do
            putStrLn $ pkg ++ " already installed."
            pure ()
        -- assuming that an exit code means we need to run the install
        ExitFailure _ -> do
            for_ ipInstall $ \cmd -> do
                (exitCode, out, err) <- readProcessWithExitCode cmd [] []
                case exitCode of
                    ExitFailure code ->
                        error . unlines $
                            [ "Failed to install: " ++ pkg
                            , "    Command:    " ++ cmd
                            , "    Error code: " ++ show code
                            , "    stderr:     " ++ err
                            , "    stdout:     " ++ out
                            ]
                    ExitSuccess ->
                        pure ()
            putStrLn $ "Successfully installed: " ++ pkg


procToSuccess :: Maybe (ExitCode, a, b) -> ExitCode
procToSuccess mexitCode =
    case mexitCode of
        Nothing -> ExitSuccess
        Just (ex, _, _) -> ex

data DotConfig
    = DotConfig
    { dcAptPackages   :: [String]
    , dcOtherPackages :: Map String InstallPlan
    }

instance FromJSON DotConfig where
    parseJSON = withObject "DotConfig" $ \o -> do
        dcAptPackages <- o .: "apt-packages"
        dcOtherPackages <- o .: "other-packages"
        pure DotConfig {..}

data InstallPlan
    = InstallPlan
    { ipTest    :: Maybe String
    , ipInstall :: [String]
    }

instance FromJSON InstallPlan where
    parseJSON = withObject "InstallPlan" $ \o -> do
        ipTest <- o .:? "test"
        ipInstall <- fmap lines (o .: "install")
        pure InstallPlan {..}
