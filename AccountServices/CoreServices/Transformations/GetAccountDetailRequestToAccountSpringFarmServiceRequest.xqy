xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getAccountDetailsRequest1" element="ns3:getAccountDetailsRequest" location="../xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:getCustomerProfileRequest" location="../../SpringFarmServices/xsd/AccountSpringFarmServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountSpringFarmServices";
declare namespace ns1 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns3 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/GetAccountDetailRequestToAccountSpringFarmServiceRequest/";

declare function xf:GetAccountDetailRequestToAccountSpringFarmServiceRequest($getAccountDetailsRequest1 as element(ns3:getAccountDetailsRequest))
    as element(ns2:getCustomerProfileRequest) {
        <ns2:getCustomerProfileRequest>
            {
                let $requestToken := $getAccountDetailsRequest1/ns0:requestToken
                return
                    <ns0:requestToken>
                        <ns0:clientTransactionId>{ data($requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                        <ns0:clientId>{ data($requestToken/ns0:clientId) }</ns0:clientId>
                    </ns0:requestToken>
            }
            <ns0:brandName>{ data($getAccountDetailsRequest1/ns0:brandName) }</ns0:brandName>
            <ns0:sourceSystem>{ data($getAccountDetailsRequest1/ns0:sourceSystem) }</ns0:sourceSystem>
            <ns0:language>{ data($getAccountDetailsRequest1/ns0:language) }</ns0:language>
            <ns2:accountId>
                <ns1:accountIdentifierName>USERID</ns1:accountIdentifierName>
                <ns1:accountIdentifierValue>{ data($getAccountDetailsRequest1/ns3:accountId/ns1:accountIdentifierValue) }</ns1:accountIdentifierValue>
            </ns2:accountId>
        </ns2:getCustomerProfileRequest>
};

declare variable $getAccountDetailsRequest1 as element(ns3:getAccountDetailsRequest) external;

xf:GetAccountDetailRequestToAccountSpringFarmServiceRequest($getAccountDetailsRequest1)