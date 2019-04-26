xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getAccountDetailsRequest1" element="ns3:getAccountDetailsRequest" location="../../xsd/MobileAccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:getAccountDetailsRequest" location="../../../CoreServices/xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns1 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns3 = "http://b2b.tracfone.com/MobileAccountServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/Mobile/GetAccountDetailsToCoreServicesRequest/";

declare function xf:GetAccountDetailsToCoreServicesRequest($getAccountDetailsRequest1 as element(ns3:getAccountDetailsRequest))
    as element(ns2:getAccountDetailsRequest) {
        <ns2:getAccountDetailsRequest>
            <ns0:requestToken>{ $getAccountDetailsRequest1/ns0:requestToken/@* , $getAccountDetailsRequest1/ns0:requestToken/node() }</ns0:requestToken>
            <ns0:brandName>{ data($getAccountDetailsRequest1/ns0:brandName) }</ns0:brandName>
            <ns0:sourceSystem>{ data($getAccountDetailsRequest1/ns0:sourceSystem) }</ns0:sourceSystem>
            <ns0:language>{ data($getAccountDetailsRequest1/ns0:language) }</ns0:language>
            <ns2:accountId>
                <ns1:accountIdentifierName>{ data($getAccountDetailsRequest1/ns3:accountId/ns1:accountIdentifierName) }</ns1:accountIdentifierName>
                <ns1:accountIdentifierValue>{ data($getAccountDetailsRequest1/ns3:accountId/ns1:accountIdentifierValue) }</ns1:accountIdentifierValue>
            </ns2:accountId>
        </ns2:getAccountDetailsRequest>
};

declare variable $getAccountDetailsRequest1 as element(ns3:getAccountDetailsRequest) external;

xf:GetAccountDetailsToCoreServicesRequest($getAccountDetailsRequest1)