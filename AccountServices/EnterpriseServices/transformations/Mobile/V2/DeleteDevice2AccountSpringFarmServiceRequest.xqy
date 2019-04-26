xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$deleteDeviceRequest1" element="ns1:deleteDeviceRequest" location="../../xsd/MobileAccountServices_V2.xsd" ::)
(:: pragma bea:global-element-return element="ns3:getCustomerProfileRequest" location="../../../SpringFarmServices/xsd/AccountSpringFarmServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns1 = "http://b2b.tracfone.com/MobileAccountServices/v2";
declare namespace ns3 = "http://www.tracfone.com/AccountSpringFarmServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/Mobile/deleteDevice2AccountSpringFarmServiceRequest/";

declare function xf:deleteDevice2AccountSpringFarmServiceRequest($deleteDeviceRequest1 as element(ns1:deleteDeviceRequest))
    as element(ns3:getCustomerProfileRequest) {
        <ns3:getCustomerProfileRequest>
            <ns0:requestToken>
                <ns0:clientTransactionId>{ data($deleteDeviceRequest1/ns0:requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                <ns0:clientId>{ data($deleteDeviceRequest1/ns0:requestToken/ns0:clientId) }</ns0:clientId>
            </ns0:requestToken>
            <ns0:brandName>{ data($deleteDeviceRequest1/ns0:brandName) }</ns0:brandName>
            <ns0:sourceSystem>{ data($deleteDeviceRequest1/ns0:sourceSystem) }</ns0:sourceSystem>
            <ns0:language>{ data($deleteDeviceRequest1/ns0:language) }</ns0:language>
            <ns3:accountId>
                <ns2:accountIdentifierName>{ data($deleteDeviceRequest1/ns1:accountId/ns2:accountIdentifierName) }</ns2:accountIdentifierName>
                <ns2:accountIdentifierValue>{ data($deleteDeviceRequest1/ns1:accountId/ns2:accountIdentifierValue) }</ns2:accountIdentifierValue>
            </ns3:accountId>
        </ns3:getCustomerProfileRequest>
};

declare variable $deleteDeviceRequest1 as element(ns1:deleteDeviceRequest) external;

xf:deleteDevice2AccountSpringFarmServiceRequest($deleteDeviceRequest1)