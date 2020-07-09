project "assimp"
	kind "StaticLib"
	language "C++"
	cppdialect "C++14"
	staticruntime "On"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"code/**.cpp",
		"code/**.h",
		"contrib/irrXML/*.cpp",
		"contrib/irrXML/*.h",
		"contrib/unzip/*.c",
		"contrib/unzip/*.h",
		"contrib/zlib/*.c",
		"contrib/openddlparser/code/*.cpp",
		"contrib/poly2tri/poly2tri/**.cc",
		"contrib/clipper/*.cpp",
	}

	includedirs 
	{
		"",
		"code/",
		"include/",
		"contrib/irrXML/",
		"contrib/rapidjson/include/",
		"contrib/openddlparser/include/",
		"contrib/unzip/",
		"contrib/zlib/",
	}

	defines 
	{
		"_CRT_SECURE_NO_WARNINGS",
		"ASSIMP_BUILD_NO_C4D_IMPORTER",
		"OPENDDL_STATIC_LIBARY",
	}

	removefiles 
	{
		"code/AssetLib/IFC/IFCReaderGen_4.*",
	}

	buildoptions  
	{
		"/bigobj"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"	-- debug version --

	filter "configurations:Release"
		runtime "Release"
		optimize "on"	-- release version --
