xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/MobileAccountServices/v2";
(:: import schema at "../xsd/MobileAccountServices_V2.xsd" ::)
declare namespace ns2="http://www.tracfone.com/AccountSpringFarmServices";
(:: import schema at "../../SpringFarmServices/xsd/AccountSpringFarmServices.xsd" ::)
declare namespace ns3="http://www.tracfone.com/DeEnrollmentServices";
(:: import schema at "../xsd/DeEnrollmentServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare namespace pho = "http://www.tracfone.com/PhoneCommonTypes";

declare namespace acc = "http://www.tracfone.com/AccountCommonTypes";

declare variable $deleteDeviceRequestParam as element() (:: schema-element(ns1:deleteDeviceRequest) ::) external;
declare variable $getCustomerProfileResponseParam as element() (:: schema-element(ns2:getCustomerProfileResponse) ::) external;

declare function local:func($deleteDeviceRequestParam as element() (:: schema-element(ns1:deleteDeviceRequest) ::), 
                            $getCustomerProfileResponseParam as element() (:: schema-element(ns2:getCustomerProfileResponse) ::)) 
                            as element() (:: schema-element(ns3:doCompleteDeEnrollRequest) ::) {
    <ns3:doCompleteDeEnrollRequest>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($deleteDeviceRequestParam/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($deleteDeviceRequestParam/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:brandName>{fn:data($deleteDeviceRequestParam/com:brandName)}</com:brandName>
        <com:sourceSystem>{fn:data($deleteDeviceRequestParam/com:sourceSystem)}</com:sourceSystem>
        {
            if ($deleteDeviceRequestParam/com:language)
            then <com:language>{fn:data($deleteDeviceRequestParam/com:language)}</com:language>
            else ()
        }
        <ns3:esn>{fn:data($deleteDeviceRequestParam/ns1:device/pho:esn)}</ns3:esn>
        <ns3:webuserId>{fn:data($deleteDeviceRequestParam/ns1:accountId/acc:accountIdentifierValue)}</ns3:webuserId>
        <ns3:contactId>{fn:data($getCustomerProfileResponseParam/ns2:contactId)}</ns3:contactId>
    </ns3:doCompleteDeEnrollRequest>
};

local:func($deleteDeviceRequestParam, $getCustomerProfileResponseParam)
