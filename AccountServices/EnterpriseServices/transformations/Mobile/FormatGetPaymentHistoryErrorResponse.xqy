xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getPaymentHistoryRequest1" element="ns1:getPaymentHistoryRequest" location="../../xsd/MobileAccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns1:getPaymentHistoryResponse" location="../../xsd/MobileAccountServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns1 = "http://b2b.tracfone.com/MobileAccountServices";
declare namespace ns3 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/Mobile/FormatGetPaymentHistoryErrorResponse/";

declare function xf:FormatGetPaymentHistoryErrorResponse($getPaymentHistoryRequest1 as element(ns1:getPaymentHistoryRequest),
    $errorCode as xs:string,
    $errorMessage as xs:string)
    as element(ns1:getPaymentHistoryResponse) {
        <ns1:getPaymentHistoryResponse>
            <ns0:requestToken>
                <ns0:clientTransactionId>{ data($getPaymentHistoryRequest1/ns0:requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                <ns0:clientId>{ data($getPaymentHistoryRequest1/ns0:requestToken/ns0:clientId) }</ns0:clientId>
            </ns0:requestToken>
            <ns0:result>
                <ns0:code>{ $errorCode }</ns0:code>
                <ns0:message>{ $errorMessage }</ns0:message>
            </ns0:result>
        </ns1:getPaymentHistoryResponse>
};

declare variable $getPaymentHistoryRequest1 as element(ns1:getPaymentHistoryRequest) external;
declare variable $errorCode as xs:string external;
declare variable $errorMessage as xs:string external;

xf:FormatGetPaymentHistoryErrorResponse($getPaymentHistoryRequest1,
    $errorCode,
    $errorMessage)