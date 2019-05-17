import std.stdio;

import fcm;

void main()
{
	import vibe.data.json;
	
	// auto fcm = new FCMService("api key");
	auto fcm = new FCMService("AAAAa8SgFxM:APA91bHZf24QK50ZqWnecv4qOgaOCqSnCw1IQp9WPLSw8SA_0DxKj6vUVtP5R6gNn2HHYKK3gVUCu2OP0SRBKmTjmiQbgQJSJZekLU-e9SOkZTptd9HS-qym7oJd7mAkvcFNJDK3apyL");
	
	auto request = FCMRequest();
	request.registrationIds ~= "device token";
	
	Json j2 = Json.emptyObject;
	j2["field1"] = "foo";
	j2["field2"] = 42.0;
	j2["field3"] = true;
	
	writeln(j2.toString);
	
	request.data = j2;

	FCMResponse response = fcm.request(request);
	
	writeln("response: ", response);
}
