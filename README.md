# FCM Service
Firebase Cloud Messaging library written on D language


## How to use

```D
import std.json;
import std.stdio;

import fcm;

void main {
	FCMService fcm = FCMService.newInstance("api key");

	auto request = FCMRequest();
	request.registrationIds ~= "device token";

	JSONValue json;
	json["field1"] = "foo";
	json["field2"] = 42.0;
	json["field3"] = true;

	request.data = json;

	FCMResponse response = fcm.request(request);

	writeln("response: ", response);
}
```

## TODO
[0.2.0]
* Changed API, not use `FCMService.newInstance("api key")` to get FCM instance

[0.1.0]
* initial release
* Implement [dlang-requests](https://github.com/ikod/dlang-requests) library
* correct json serialization/deserialization with [LibMir asdf](https://github.com/libmir/asdf) library

[Backlog]
* add unit tests
* add screens
* add documentation
* add [RxD](https://github.com/lempiji/rx) sample
* XMPP protocol
