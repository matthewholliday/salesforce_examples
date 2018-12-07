public class HttpRequestService {
    public HttpRequest myRequest {private set; public get;}
    public static final String GET_METHOD = 'GET';
    public static final String POST_METHOD = 'POST';

    public HttpRequestService(String endpointApi, String requestMethod) {
        this.myRequest = new HttpRequest();
        this.myRequest.setEndpoint(endpointApi);
        this.myRequest.setMethod(requestMethod);
    }

    public void setCustomHeader(String headerTitle, String headerValue) {
        this.myRequest.setHeader(headerTitle, headerValue);
    }

    public void setHeaderContentType(String contentType) {
        this.myRequest.setHeader('Content-Type', contentType);
    }

    public void setRequestBody(String body) {
        this.myRequest.setBody(body);
    }

    public HttpResponse sendRequest() {
        Http transfer = new Http();
        return transfer.send(this.myRequest);
    }
}