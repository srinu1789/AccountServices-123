xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/MobileAccountServices/v2";
(:: import schema at "../../../xsd/MobileAccountServices_V2.xsd" ::)
declare namespace ns2="http://www.tracfone.com/AccountDataServices";
(:: import schema at "../../../../DataServices/xsd/AccountDataServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $removeDeviceFromDummyAccountRequest as element() (:: schema-element(ns1:removeDeviceFromDummyAccountRequest) ::) external;

declare function local:func($removeDeviceFromDummyAccountRequest as element() (:: schema-element(ns1:removeDeviceFromDummyAccountRequest) ::)) as element() (:: schema-element(ns2:removeDeviceFromDummyAccountRequest) ::) {
    <ns2:removeDeviceFromDummyAccountRequest>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($removeDeviceFromDummyAccountRequest/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($removeDeviceFromDummyAccountRequest/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:brandName>{fn:data($removeDeviceFromDummyAccountRequest/com:brandName)}</com:brandName>
        <com:sourceSystem>{fn:data($removeDeviceFromDummyAccountRequest/com:sourceSystem)}</com:sourceSystem>
        {
            if ($removeDeviceFromDummyAccountRequest/com:language)
            then <com:language>{fn:data($removeDeviceFromDummyAccountRequest/com:language)}</com:language>
            else ()
        }
        {
            if ($removeDeviceFromDummyAccountRequest/ns1:webObjId)
            then <ns2:webObjId>{fn:data($removeDeviceFromDummyAccountRequest/ns1:webObjId)}</ns2:webObjId>
            else ()
        }
        <ns2:ESN>{fn:data($removeDeviceFromDummyAccountRequest/ns1:ESN)}</ns2:ESN>
    </ns2:removeDeviceFromDummyAccountRequest>
};

local:func($removeDeviceFromDummyAccountRequest)
