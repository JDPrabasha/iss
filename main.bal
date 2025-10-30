import ballerina/io;
import iss.clients;
import ballerina/http;


public function main() {
    io:println("Hello, World!");
    clients:SalesforceObject salesforceObject = {
        transactions: [],
        customerEmail: "test@test.com",
        closeDate: "2021-01-01",
        customerId: "1234567890"
    };
    http:Response|error response = clients:publishCustomerMonthlyTransactions(salesforceObject);
    if (response is error) {
        io:println("Error: ");
        io:println(response.message());
    } else {
        io:println("Success: ");
        io:println(response.getTextPayload());
    }
}
