solution "Regex"
	language "C++"
	location ("solutions/"..os.target().."-".._ACTION)
	targetdir ( "build/"..os.target().."/")
	includedirs {
		"source/",
		"include/"
	}
	if os.target() == "macosx" or os.target() == "linux" then
		buildoptions{ "-std=c++11 -fPIC" }
		linkoptions{ "-fPIC -static-libstdc++" }
	end

	configurations { "Release" }
	platforms { "x86", "x86_64" }

	if os.target() == "windows" then
		defines{ "WIN32" }
	elseif os.target() == "linux" then
		defines{ "LINUX" }
	end

	local platform
	if os.target() == "windows" then
		platform = "win"
	elseif os.target() == "macosx" then
		platform = "osx"
	elseif os.target() == "linux" then
		platform = "linux"
	else
		error "Unsupported platform."
	end

	filter "platforms:x86"
		architecture "x86"
		if os.target() == "windows" then
			targetname("gmsv_regex_".. platform.."32")
		else
			targetname("gmsv_regex_"..platform)
		end
	filter "platforms:x86_64"
		architecture "x86_64"
		targetname("gmsv_regex_"..platform.."64")

	project "Regex"
		symbols "On"
		editandcontinue "Off"
		vectorextensions "SSE"
		floatingpoint "Fast"
		optimize "On"

		defines{ "GMMODULE", "NDEBUG" }
		files{ "source/**.*", "include/**.*" }
		kind "SharedLib"
		targetprefix ("")
		targetextension (".dll")
		targetdir("build/"..os.target())