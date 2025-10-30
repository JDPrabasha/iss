import ballerina/os;
import ballerina/log;
configurable string salesforceClientID = getSecretFromEnvVariable("SF_CLIENT_ID");
configurable string salesforceClientSecret = getSecretFromEnvVariable("SF_CLIENT_SECRET");
configurable string salesforceTokenUrl = "https://api.asgardeo.io/t/wso2/oauth2/token";

public function getSecretFromEnvVariable(string envVariable) returns string {
    string envVariableVal = os:getEnv(envVariable);
    if (envVariableVal == "") {
        log:printWarn("Secret value not found for the key: " + envVariable);
    }
    return envVariableVal;
}

