#include <iostream>
#include <string>
#include <regex>

#include "GarrysMod/Lua/Interface.h"
using namespace GarrysMod::Lua;

LUA_FUNCTION(match) {
	if (!LUA->IsType(1, Type::STRING)) {
		LUA->ArgError(1, "Expected a string");
		LUA->PushBool(false);
		return 1;
	}

	if (!LUA->IsType(2, Type::STRING)) {
		LUA->ArgError(2, "Expected a string");
		LUA->PushBool(false);
		return 1;
	}

	std::string theContent(LUA->GetString(1));
	std::regex theRegex(LUA->GetString(2));

	std::smatch matches;

	if (std::regex_match(theContent, matches, theRegex)) {
		LUA->CreateTable();

		for (size_t i = 0; i < matches.size(); i++) {
			std::string matchValue(matches[i]);
			LUA->PushNumber(i);
			LUA->PushString(matchValue.c_str());
			LUA->SetTable(-3);
		}
	}

	return 1;
}

GMOD_MODULE_OPEN() {
	LUA->PushSpecial(SPECIAL_GLOB);
		LUA->CreateTable();
			LUA->PushCFunction(match);
			LUA->SetField(-2, "match");
		LUA->SetField(-2, "regex");
	LUA->Pop();

	return 1;
}

GMOD_MODULE_CLOSE() {
	return 0;
}