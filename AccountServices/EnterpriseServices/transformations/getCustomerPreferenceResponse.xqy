xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $getPrefeResponse as element() (:: schema-element(ns1:getCustomerPrefResponse) ::) external;

declare function local:func($getPrefeResponse as element() (:: schema-element(ns1:getCustomerPrefResponse) ::)) as element() (:: schema-element(ns1:getCustomerPrefResponse) ::) {
    <ns1:getCustomerPrefResponse>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($getPrefeResponse/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($getPrefeResponse/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>

 <com:result>
            <com:code>{fn:data($getPrefeResponse/com:result/com:code)}</com:code>
            <com:message>{fn:data($getPrefeResponse/com:result/com:message)}</com:message>
        </com:result>


 <ns1:emailPreference>{fn:data($getPrefeResponse/ns1:emailPreference)}</ns1:emailPreference>
         <ns1:phonePreference>{fn:data($getPrefeResponse/ns1:phonePreference)} </ns1:phonePreference>
         <ns1:smsPreference>{fn:data($getPrefeResponse/ns1:smsPreference)} </ns1:smsPreference>
         <ns1:mailPreference>{fn:data($getPrefeResponse/ns1:mailPreference)} </ns1:mailPreference>
    </ns1:getCustomerPrefResponse>
};

local:func($getPrefeResponse)
