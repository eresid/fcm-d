module fcm.FCMResponseError;

/// matches error responses to the correct regId
struct FCMResponseError
{
	/// corresponding registration id triggering the error
	string regId;

	/// see https://firebase.google.com/docs/reference/fcm/rest/v1/ErrorCode
	string type;
}
