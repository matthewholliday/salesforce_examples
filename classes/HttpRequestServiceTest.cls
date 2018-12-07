@IsTest
public class HttpRequestServiceTest {
    @IsTest
    private static void sendRequest_getSuccess_MockSuccessHttpResponse() {
        Test.setMock(HttpCalloutMock.class, new MockSuccessHttpResponseGenerator());

        Test.startTest();
        HttpRequestService testRequestService = new HttpRequestService('Assistenza_API', HttpRequestService.POST_METHOD);
        testRequestService.setHeaderContentType('application/json');
        testRequestService.setCustomHeader('Authorization', 'password');
        HttpResponse resultResponse = testRequestService.sendRequest();
        Test.stopTest();

        System.assertEquals(200, resultResponse.getStatusCode(), 'Request was not successful');
        System.assertEquals('Success', resultResponse.getBody(), 'Retrieved unexpected response');
    }

    @IsTest
    private static void setRequestBody_getSuccess_MockString() {
        String mockString = 'Request Body';

        Test.startTest();
        HttpRequestService testRequestService = new HttpRequestService('callout:Assistenza_API/SendCases', HttpRequestService.POST_METHOD);
        testRequestService.setRequestBody(mockString);
        Test.stopTest();

        System.debug(LoggingLevel.ERROR, testRequestService.myRequest.getHeader('Authorization'));
        System.assertEquals(mockString, testRequestService.myRequest.getBody(), 'Incorrect body was set');
    }

    public class MockSuccessHttpResponseGenerator implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse mockResponse = new HttpResponse();
            mockResponse.setHeader('Content-Type', 'application/json');
            mockResponse.setBody('Success');
            mockResponse.setStatusCode(200);
            return mockResponse;
        }
    }
}