xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)
declare namespace ns2="http://www.tracfone.com/AccountCoreServices";
(:: import schema at "../../CoreServices/xsd/AccountCoreServices.xsd" ::)

declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace ns3 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns4="http://www.tracfone.com/AccountServices";

declare variable $getAccountDetailsRequest as element() (:: schema-element(ns1:getAccountDetailsRequest) ::) external;

declare function local:GetAccountDetailsToCoreServicesRequest($getAccountDetailsRequest as element() (:: schema-element(ns1:getAccountDetailsRequest) ::)) as element() (:: schema-element(ns2:getAccountDetailsRequest) ::) {
        <ns2:getAccountDetailsRequest>
            <ns0:requestToken>{ $getAccountDetailsRequest/ns0:requestToken/@* , $getAccountDetailsRequest/ns0:requestToken/node() }</ns0:requestToken>
            <ns0:brandName>{ data($getAccountDetailsRequest/ns0:brandName) }</ns0:brandName>
            <ns0:sourceSystem>{ data($getAccountDetailsRequest/ns0:sourceSystem) }</ns0:sourceSystem>
            <ns0:language>{ data($getAccountDetailsRequest/ns0:language) }</ns0:language>
            <ns2:accountId>
                <ns3:accountIdentifierName>{ data($getAccountDetailsRequest/ns1:accountId/ns3:accountIdentifierName) }</ns3:accountIdentifierName>
                <ns3:accountIdentifierValue>{ data($getAccountDetailsRequest/ns1:accountId/ns3:accountIdentifierValue) }</ns3:accountIdentifierValue>
            </ns2:accountId>
        </ns2:getAccountDetailsRequest>
};

local:GetAccountDetailsToCoreServicesRequest($getAccountDetailsRequest)
