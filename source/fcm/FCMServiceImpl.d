module fcm.FCMServiceImpl;

import fcm.FCMService;
import fcm.FCMRequest;
import fcm.FCMResponse;

import requests;
import asdf;

import std.stdio;
import std.conv;
import std.exception;

class FCMServiceImpl : FCMService {

	private enum SERVER_URL = "https://fcm.googleapis.com/fcm/send";
	private enum USER_AGENT = "fcm-d 0.2.0";

	private string serverApiKey;

	this(string key) {
		this.serverApiKey = key;
	}

	override FCMResponse request(FCMRequest data) {
 		auto request = Request();
    	request.verbosity = 2;
    	request.addHeaders([
			"User-Agent": USER_AGENT,
			"Authorization": "key=" ~ serverApiKey,
			"Content-Type" : "application/json"
		]);

		auto requestData = data.serializeToJson();
		writeln("Request Data: ", requestData);
    	
		auto response = request.post(SERVER_URL, requestData);
		auto responseBody = cast(string)response.responseBody.data;

		writeln("Response Body: ", responseBody);
		writeln("Status Code ", response.code);

		enforce(response.code == 200, "Cannot get result! Status code = " ~ to!string(response.code));

		return responseBody.deserialize!FCMResponse;
	}
}