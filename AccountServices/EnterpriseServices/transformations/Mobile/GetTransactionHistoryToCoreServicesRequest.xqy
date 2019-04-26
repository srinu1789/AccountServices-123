xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getTransactionHistoryRequest1" element="ns3:getTransactionHistoryRequest" location="../../xsd/MobileAccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:getTransactionHistoryRequest" location="../../../CoreServices/xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns1 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns3 = "http://b2b.tracfone.com/MobileAccountServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/Mobile/GetTransactionHistoryToCoreServicesRequest/";

declare function xf:GetTransactionHistoryToCoreServicesRequest($getTransactionHistoryRequest1 as element(ns3:getTransactionHistoryRequest))
    as element(ns2:getTransactionHistoryRequest) {
        <ns2:getTransactionHistoryRequest>
            <ns0:requestToken>{ $getTransactionHistoryRequest1/ns0:requestToken/@* , $getTransactionHistoryRequest1/ns0:requestToken/node() }</ns0:requestToken>
            <ns0:brandName>{ data($getTransactionHistoryRequest1/ns0:brandName) }</ns0:brandName>
            <ns0:sourceSystem>{ data($getTransactionHistoryRequest1/ns0:sourceSystem) }</ns0:sourceSystem>
            <ns0:language>{ data($getTransactionHistoryRequest1/ns0:language) }</ns0:language>
            <ns2:accountId>
                <ns1:accountIdentifierName>{ data($getTransactionHistoryRequest1/ns3:accountId/ns1:accountIdentifierName) }</ns1:accountIdentifierName>
                <ns1:accountIdentifierValue>{ data($getTransactionHistoryRequest1/ns3:accountId/ns1:accountIdentifierValue) }</ns1:accountIdentifierValue>
            </ns2:accountId>
            <ns2:offset>{ data($getTransactionHistoryRequest1/ns3:offset) }</ns2:offset>
            <ns2:limit>{ data($getTransactionHistoryRequest1/ns3:limit) }</ns2:limit>
        </ns2:getTransactionHistoryRequest>
};

declare variable $getTransactionHistoryRequest1 as element(ns3:getTransactionHistoryRequest) external;

xf:GetTransactionHistoryToCoreServicesRequest($getTransactionHistoryRequest1)