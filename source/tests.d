module tests;

import fcm;

// dub test
unittest {
	import std.json;
	import std.stdio;

	auto fcm = new FCMService("api key");

	auto request = FCMRequest();
	request.registrationIds ~= "device token";

	JSONValue json;
	json["field1"] = "foo";
	json["field2"] = 42.0;
	json["field3"] = true;

	writeln("json: ", json.toString);

	request.data = json;

	FCMResponse response = fcm.request(request);

	assert(2 != 3);

	writeln("response: ", response);
}
