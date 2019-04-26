xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$deleteEsnFromAccountRequest1" element="ns1:deleteEsnFromAccountRequest" location="../../xsd/MobileAccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns3:getCustomerProfileRequest" location="../../../SpringFarmServices/xsd/AccountSpringFarmServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns1 = "http://b2b.tracfone.com/MobileAccountServices";
declare namespace ns3 = "http://www.tracfone.com/AccountSpringFarmServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/Mobile/DeleteEsnFromAccount2AccountSpringFarmServiceRequest/";

declare function xf:DeleteEsnFromAccount2AccountSpringFarmServiceRequest($deleteEsnFromAccountRequest1 as element(ns1:deleteEsnFromAccountRequest))
    as element(ns3:getCustomerProfileRequest) {
        <ns3:getCustomerProfileRequest>
            <ns0:requestToken>
                <ns0:clientTransactionId>{ data($deleteEsnFromAccountRequest1/ns0:requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                <ns0:clientId>{ data($deleteEsnFromAccountRequest1/ns0:requestToken/ns0:clientId) }</ns0:clientId>
            </ns0:requestToken>
            <ns0:brandName>{ data($deleteEsnFromAccountRequest1/ns0:brandName) }</ns0:brandName>
            <ns0:sourceSystem>{ data($deleteEsnFromAccountRequest1/ns0:sourceSystem) }</ns0:sourceSystem>
            <ns0:language>{ data($deleteEsnFromAccountRequest1/ns0:language) }</ns0:language>
            <ns3:accountId>
                <ns2:accountIdentifierName>{ data($deleteEsnFromAccountRequest1/ns1:accountId/ns2:accountIdentifierName) }</ns2:accountIdentifierName>
                <ns2:accountIdentifierValue>{ data($deleteEsnFromAccountRequest1/ns1:accountId/ns2:accountIdentifierValue) }</ns2:accountIdentifierValue>
            </ns3:accountId>
        </ns3:getCustomerProfileRequest>
};

declare variable $deleteEsnFromAccountRequest1 as element(ns1:deleteEsnFromAccountRequest) external;

xf:DeleteEsnFromAccount2AccountSpringFarmServiceRequest($deleteEsnFromAccountRequest1)