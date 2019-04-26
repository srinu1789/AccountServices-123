xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/MobileAccountServices/v2";
(:: import schema at "../../../xsd/MobileAccountServices_V2.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $getTransactionHistoryRequest as element() (:: schema-element(ns1:getTransactionHistoryRequest) ::) external;
declare variable $errorCode as xs:string external;
declare variable $errorString as xs:string external;

declare function local:formatGetTransactionHistoryErrorResponse($getTransactionHistoryRequest as element() (:: schema-element(ns1:getTransactionHistoryRequest) ::), 
                                                                $errorCode as xs:string, 
                                                                $errorString as xs:string) 
                                                                as element() (:: schema-element(ns1:getTransactionHistoryResponse) ::) {
    <ns1:getTransactionHistoryResponse>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($getTransactionHistoryRequest/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($getTransactionHistoryRequest/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:result>
        <com:code>{$errorCode}</com:code>
         <com:message>{$errorString}</com:message>
        </com:result>
        
    </ns1:getTransactionHistoryResponse>
};

local:formatGetTransactionHistoryErrorResponse($getTransactionHistoryRequest, $errorCode, $errorString)
