project "date"

dofile(_BUILD_DIR .. "/static_library.lua")

configuration { "*" }

uuid "422C8CCD-5D01-4D78-B0D9-2041681C4EE8"

includedirs {
  "include",
}


files {
  "include/date/**.h",
  "src/**.cpp",
}

if (_PLATFORM_ANDROID) then
end

if (_PLATFORM_COCOA) then
end

if (_PLATFORM_IOS) then
  files {
    "src/ios.mm",
  }
end

if (_PLATFORM_LINUX) then
end

if (_PLATFORM_MACOS) then
end

if (_PLATFORM_WINDOWS) then
  defines{
    "__ORDER_BIG_ENDIAN__=4321", -- Equivalent to Clang Macros lacked by MSVC. We define them as Little Endian.
    "__ORDER_LITTLE_ENDIAN__=1234",
    "__BYTE_ORDER__=__ORDER_LITTLE_ENDIAN__",
  }
end

if (_PLATFORM_WINUWP) then
  defines{
    "__ORDER_BIG_ENDIAN__=4321", -- Equivalent to Clang Macros lacked by MSVC. We define them as Little Endian.
    "__ORDER_LITTLE_ENDIAN__=1234",
    "__BYTE_ORDER__=__ORDER_LITTLE_ENDIAN__",
  }
end
