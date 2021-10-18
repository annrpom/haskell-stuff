{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_lab1 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/apompa/Documents/School/haskell-stuff/funprog/lab1/.stack-work/install/x86_64-osx/9eea7d4e88a226f927ec29fc3f738ba71268a6e498402d155973ca0a3af554c7/8.10.7/bin"
libdir     = "/Users/apompa/Documents/School/haskell-stuff/funprog/lab1/.stack-work/install/x86_64-osx/9eea7d4e88a226f927ec29fc3f738ba71268a6e498402d155973ca0a3af554c7/8.10.7/lib/x86_64-osx-ghc-8.10.7/lab1-0.1.0.0-1iyKLzdgTo0Dyo5oYEUHHW-lab1"
dynlibdir  = "/Users/apompa/Documents/School/haskell-stuff/funprog/lab1/.stack-work/install/x86_64-osx/9eea7d4e88a226f927ec29fc3f738ba71268a6e498402d155973ca0a3af554c7/8.10.7/lib/x86_64-osx-ghc-8.10.7"
datadir    = "/Users/apompa/Documents/School/haskell-stuff/funprog/lab1/.stack-work/install/x86_64-osx/9eea7d4e88a226f927ec29fc3f738ba71268a6e498402d155973ca0a3af554c7/8.10.7/share/x86_64-osx-ghc-8.10.7/lab1-0.1.0.0"
libexecdir = "/Users/apompa/Documents/School/haskell-stuff/funprog/lab1/.stack-work/install/x86_64-osx/9eea7d4e88a226f927ec29fc3f738ba71268a6e498402d155973ca0a3af554c7/8.10.7/libexec/x86_64-osx-ghc-8.10.7/lab1-0.1.0.0"
sysconfdir = "/Users/apompa/Documents/School/haskell-stuff/funprog/lab1/.stack-work/install/x86_64-osx/9eea7d4e88a226f927ec29fc3f738ba71268a6e498402d155973ca0a3af554c7/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "lab1_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "lab1_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "lab1_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "lab1_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "lab1_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "lab1_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
