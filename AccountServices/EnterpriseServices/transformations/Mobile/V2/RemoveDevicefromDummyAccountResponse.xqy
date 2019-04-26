xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://b2b.tracfone.com/MobileAccountServices/v2";
(:: import schema at "../../../xsd/MobileAccountServices_V2.xsd" ::)
declare namespace ns1="http://www.tracfone.com/AccountDataServices";
(:: import schema at "../../../../DataServices/xsd/AccountDataServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $removeDeviceFromDummyAccountResponse as element() (:: schema-element(ns1:removeDeviceFromDummyAccountResponse) ::) external;

declare function local:func($removeDeviceFromDummyAccountResponse as element() (:: schema-element(ns1:removeDeviceFromDummyAccountResponse) ::)) as element() (:: schema-element(ns2:removeDeviceFromDummyAccountResponse) ::) {
    <ns2:removeDeviceFromDummyAccountResponse>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($removeDeviceFromDummyAccountResponse/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($removeDeviceFromDummyAccountResponse/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:result>
            <com:code>{fn:data($removeDeviceFromDummyAccountResponse/com:result/com:code)}</com:code>
            <com:message>{fn:data($removeDeviceFromDummyAccountResponse/com:result/com:message)}</com:message>
        </com:result>
    </ns2:removeDeviceFromDummyAccountResponse>
};

local:func($removeDeviceFromDummyAccountResponse)
