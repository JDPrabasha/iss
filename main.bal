import ballerina/http;

configurable string username = "bob";

service / on new http:Listener(8080) {
    resource function get hello() returns string {
        return "Hello, " + username + "!";
    }
}
