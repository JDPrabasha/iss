// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.
//
// This software is the property of WSO2 LLC. and its suppliers, if any.
// Dissemination of any information or reproduction of any material contained
// herein in any form is strictly forbidden, unless permitted by WSO2 expressly.
// You may not alter or remove any copyright or other notice from copies of this content.
import ballerina/http;

final http:OAuth2ClientCredentialsGrantConfig salesforceAuthConfig = {
    clientId: salesforceClientID,
    clientSecret: salesforceClientSecret,
    tokenUrl: salesforceTokenUrl

};
final http:RetryConfig salesforceRetryConfig = {
    count: 3
};
http:Client salesforceClient = check getSalesforceClient();

function getSalesforceClient() returns http:Client|error {
    return new http:Client(
        "",
        auth = salesforceAuthConfig,
        retryConfig = salesforceRetryConfig,
        httpVersion = "1.1"
    );
}

public function publishCustomerMonthlyTransactions(SalesforceObject payload) returns http:Response|error {
    string resourcePath = string `v1.0/event`;
    http:Response|error response = salesforceClient->post(resourcePath, payload);
    if (response is error) {
        return response;
    }
    // We expect a 200 response from the Salesforce client for a successful transaction
    if (response.statusCode != 200) {
        string|http:ClientError responsePayload = response.getTextPayload();
        if responsePayload is string {
            return error(responsePayload);
        }
        return responsePayload;
    }
    return response;
}