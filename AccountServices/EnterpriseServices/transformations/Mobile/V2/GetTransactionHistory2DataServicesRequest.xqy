xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/MobileAccountServices/v2";
(:: import schema at "../../../xsd/MobileAccountServices_V2.xsd" ::)
declare namespace ns2="http://www.tracfone.com/AccountDataServices";
(:: import schema at "../../../../DataServices/xsd/AccountDataServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $getTransactionHistoryRequest as element() (:: schema-element(ns1:getTransactionHistoryRequest) ::) external;
declare variable $ESN as xs:string external;

declare function local:getTransactionHistory2DataServicesRequest($getTransactionHistoryRequest as element() (:: schema-element(ns1:getTransactionHistoryRequest) ::), 
                                                                 $ESN as xs:string) 
                                                                 as element() (:: schema-element(ns2:getTransactionHistoryRequest) ::) {
    <ns2:getTransactionHistoryRequest>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($getTransactionHistoryRequest/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($getTransactionHistoryRequest/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:brandName>{fn:data($getTransactionHistoryRequest/com:brandName)}</com:brandName>
        <com:sourceSystem>{fn:data($getTransactionHistoryRequest/com:sourceSystem)}</com:sourceSystem>
         <com:language>{fn:data($getTransactionHistoryRequest/com:language)}</com:language>
            <ns2:ESN>{$ESN}</ns2:ESN>  
    </ns2:getTransactionHistoryRequest>
};

local:getTransactionHistory2DataServicesRequest($getTransactionHistoryRequest, $ESN)
