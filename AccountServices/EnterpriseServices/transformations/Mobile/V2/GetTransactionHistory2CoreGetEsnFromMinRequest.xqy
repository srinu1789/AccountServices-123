xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/MobileAccountServices/v2";
(:: import schema at "../../../xsd/MobileAccountServices_V2.xsd" ::)
declare namespace ns2="http://www.tracfone.com/PhoneCoreServices";
(:: import schema at "../../../../../PhoneServices/CoreServices/xsd/PhoneCoreServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare namespace pho = "http://www.tracfone.com/PhoneCommonTypes";

declare variable $getTransactionHistoryRequest as element() (:: schema-element(ns1:getTransactionHistoryRequest) ::) external;

declare function local:getTransactionHistory2CoreGetEsnFromMinRequest($getTransactionHistoryRequest as element() (:: schema-element(ns1:getTransactionHistoryRequest) ::)) as element() (:: schema-element(ns2:getESNFromMINRequest) ::) {
    <ns2:getESNFromMINRequest>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($getTransactionHistoryRequest/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($getTransactionHistoryRequest/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:brandName>{fn:data($getTransactionHistoryRequest/com:brandName)}</com:brandName>
        <com:sourceSystem>{fn:data($getTransactionHistoryRequest/com:sourceSystem)}</com:sourceSystem>
        {
            if ($getTransactionHistoryRequest/com:language)
            then <com:language>{fn:data($getTransactionHistoryRequest/com:language)}</com:language>
            else ()
        }
        <ns2:min>{fn:data($getTransactionHistoryRequest/ns1:device/pho:min)}</ns2:min>
    </ns2:getESNFromMINRequest>
};

local:getTransactionHistory2CoreGetEsnFromMinRequest($getTransactionHistoryRequest)
