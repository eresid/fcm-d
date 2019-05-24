module fcm.FCMService;

import fcm.FCMRequest;
import fcm.FCMResponse;
import fcm.FCMServiceImpl;

interface FCMService {

	FCMResponse request(FCMRequest request);

	static FCMService newInstance(string key) {
		return new FCMServiceImpl(key);
	}
}
