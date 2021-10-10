workspace "lua-5.4.3"
   configurations { "Debug", "Release" }

project "lua"
   kind "SharedLib"
   language "C"
   targetdir "bin/lib/%{cfg.buildcfg}"

   links { "m" }

   files { "src/**.h", "src/**.c" }
   removefiles { "src/lua.c", "src/luac.c" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"

project "luai"
   kind "ConsoleApp"
   language "C"
   targetdir "bin/exec/interpreter/%{cfg.buildcfg}"

   includedirs { "src/" }
   links { "m", "lua" }

   files { "src/lua.c" }

   filter "configurations:Debug"
      libdirs { "bin/lib/Debug" }
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"

project "luac"
   kind "ConsoleApp"
   language "C"
   targetdir "bin/exec/compiler/%{cfg.buildcfg}"

   includedirs { "src/" }
   links { "m" }
   
   files { "src/**.h", "src/**.c" }
   removefiles { "src/luac.c" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
