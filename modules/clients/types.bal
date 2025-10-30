// Copyright (c) 2024 WSO2 LLC (http://www.wso2.com). All Rights Reserved.
//
// This software is the property of WSO2 LLC and its suppliers, if any.
// Dissemination of any information or reproduction of any material contained
// herein in any form is strictly forbidden, unless permitted by WSO2 expressly.
// You may not alter or remove any copyright or other notice from copies of this content.
public type SalesforceObject record {|
    Transaction[] transactions;
    string customerEmail;
    string closeDate;
    string customerId;
|};

public type Transaction record {|
    string planId;
    float amount;
    SalesforceInvoice invoice;
|};

public type SalesforceInvoice record {|
    string invoiceId;
    string periodStartDate;
    string periodEndDate;
    string invoicePaidDate;
    string invoiceDueDate;
|};
