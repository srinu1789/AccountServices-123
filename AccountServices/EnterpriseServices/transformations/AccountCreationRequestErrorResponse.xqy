xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $createAccountRequest as element() (:: schema-element(ns1:createAccountRequest) ::) external;

declare function local:func($createAccountRequest as element() (:: schema-element(ns1:createAccountRequest) ::)) as element() (:: schema-element(ns1:createAccountResponse) ::) {
    <ns1:createAccountResponse>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($createAccountRequest/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($createAccountRequest/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:result>
            <com:code>{ fn:data('11005') }</com:code>
            <com:message>{ fn:data('Please provide a valid password with atleast 6 characters') }</com:message>
        </com:result>
    </ns1:createAccountResponse>
};

local:func($createAccountRequest)
