module fcm.FCMService;

import fcm.AbstractService;
import fcm.FCMRequest;
import fcm.FCMResponse;

import requests;

import std.stdio;
import std.conv;
import vibe.data.json;

class FCMService : AbstractService {

	private enum SERVER_URL = "https://fcm.googleapis.com/fcm/send";

	this(string key) {
		super(key);
	}

	override FCMResponse request(FCMRequest data) {
 		auto request = Request();
    	request.verbosity = 2;
    	request.addHeaders([
			"User-Agent": "Mars Client 0.4",
			"Authorization": "key=" ~ serverApiKey,
			"Content-Type" : "application/json"
		]);

		writeln(data.serializeToJsonString());
    	
		auto response = request.post(SERVER_URL, data.serializeToJsonString());
		
		writeln(response.responseBody);
		writeln("StatusCode ", response.code);

		//enforce(StatusCode.isSuccess(response.code),
		//	"Cannot get result! Status code = " ~ to!string(response.code));

		return FCMResponse();//deserializeJson!FCMResponse(response.responseBody);
	}
}