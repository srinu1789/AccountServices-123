xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getPaymentHistoryRequest1" element="ns1:getPaymentHistoryRequest" location="../../xsd/MobileAccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns3:getTransactionHistoryRequest" location="../../../CoreServices/xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns1 = "http://b2b.tracfone.com/MobileAccountServices";
declare namespace ns3 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/Mobile/GetPaymentHistoryToCoreServicesRequest/";

declare function xf:GetPaymentHistoryToCoreServicesRequest($getPaymentHistoryRequest1 as element(ns1:getPaymentHistoryRequest))
    as element(ns3:getTransactionHistoryRequest) {
        <ns3:getTransactionHistoryRequest>
            <ns0:requestToken>
                <ns0:clientTransactionId>{ data($getPaymentHistoryRequest1/ns0:requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                <ns0:clientId>{ data($getPaymentHistoryRequest1/ns0:requestToken/ns0:clientId) }</ns0:clientId>
            </ns0:requestToken>
            <ns0:brandName>{ data($getPaymentHistoryRequest1/ns0:brandName) }</ns0:brandName>
            <ns0:sourceSystem>{ data($getPaymentHistoryRequest1/ns0:sourceSystem) }</ns0:sourceSystem>
            {
                for $language in $getPaymentHistoryRequest1/ns0:language
                return
                    <ns0:language>{ data($language) }</ns0:language>
            }
            <ns3:accountId>
                <ns2:accountIdentifierName>{ data($getPaymentHistoryRequest1/ns1:accountId/ns2:accountIdentifierName) }</ns2:accountIdentifierName>
                <ns2:accountIdentifierValue>{ data($getPaymentHistoryRequest1/ns1:accountId/ns2:accountIdentifierValue) }</ns2:accountIdentifierValue>
            </ns3:accountId>
            {
                for $offset in $getPaymentHistoryRequest1/ns1:offset
                return
                    <ns3:offset>{ data($offset) }</ns3:offset>
            }
            {
                for $limit in $getPaymentHistoryRequest1/ns1:limit
                return
                    <ns3:limit>{ data($limit) }</ns3:limit>
            }
        </ns3:getTransactionHistoryRequest>
};

declare variable $getPaymentHistoryRequest1 as element(ns1:getPaymentHistoryRequest) external;

xf:GetPaymentHistoryToCoreServicesRequest($getPaymentHistoryRequest1)