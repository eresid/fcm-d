module tests;

import fcm;

// dub test
unittest {
	import std.json;
	import std.stdio;

	// auto fcm = new FCMService("api key");
	auto fcm = new FCMService("AAAAa8SgFxM:APA91bHZf24QK50ZqWnecv4qOgaOCqSnCw1IQp9WPLSw8SA_0DxKj6vUVtP5R6gNn2HHYKK3gVUCu2OP0SRBKmTjmiQbgQJSJZekLU-e9SOkZTptd9HS-qym7oJd7mAkvcFNJDK3apyL");

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
