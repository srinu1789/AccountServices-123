xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$deleteDeviceRequest1" element="ns1:deleteDeviceRequest" location="../../xsd/MobileAccountServices_V2.xsd" ::)
(:: pragma bea:global-element-return element="ns2:getESNFromMINRequest" location="../../../../PhoneServices/CoreServices/xsd/PhoneCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/PhoneCoreServices";
declare namespace ns1 = "http://b2b.tracfone.com/MobileAccountServices/v2";
declare namespace ns3 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns4 = "http://www.tracfone.com/PhoneCommonTypes";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/Mobile/deleteDevice2CoreGetEsnFromMinRequest/";

declare function xf:deleteDevice2CoreGetEsnFromMinRequest($deleteDeviceRequest1 as element(ns1:deleteDeviceRequest))
    as element(ns2:getESNFromMINRequest) {
        <ns2:getESNFromMINRequest>
            <ns0:requestToken>
                <ns0:clientTransactionId>{ data($deleteDeviceRequest1/ns0:requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                <ns0:clientId>{ data($deleteDeviceRequest1/ns0:requestToken/ns0:clientId) }</ns0:clientId>
            </ns0:requestToken>
            <ns0:brandName>{ data($deleteDeviceRequest1/ns0:brandName) }</ns0:brandName>
            <ns0:sourceSystem>{ data($deleteDeviceRequest1/ns0:sourceSystem) }</ns0:sourceSystem>
            <ns0:language>{ data($deleteDeviceRequest1/ns0:language) }</ns0:language>
            <ns2:min>{ data($deleteDeviceRequest1/ns1:device/ns4:min) }</ns2:min>
        </ns2:getESNFromMINRequest>
};

declare variable $deleteDeviceRequest1 as element(ns1:deleteDeviceRequest) external;

xf:deleteDevice2CoreGetEsnFromMinRequest($deleteDeviceRequest1)