xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/MobileAccountServices/v2";
(:: import schema at "../xsd/MobileAccountServices_V2.xsd" ::)
declare namespace ns3="http://www.tracfone.com/AccountSpringFarmServices";
(:: import schema at "../../SpringFarmServices/xsd/AccountSpringFarmServices.xsd" ::)
declare namespace ns2="http://www.tracfone.com/GroupManagementServices";
(:: import schema at "../../../GroupManagementServices/CoreServices/xsd/GroupManagementServices.xsd" ::)
declare namespace ns4="http://www.tracfone.com/ServiceProvesioningCoreService";
(:: import schema at "../../../ServiceProvesioningServices/CoreServices/xsd/ServiceProvesioningCoreService.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare namespace pho = "http://www.tracfone.com/PhoneCommonTypes";

declare namespace acc = "http://www.tracfone.com/AccountCommonTypes";

declare variable $deleteDeviceRequestParam as element() (:: schema-element(ns1:deleteDeviceRequest) ::) external;
declare variable $getGroupResponseParam as element() (:: schema-element(ns2:getGroupResponse) ::) external;
declare variable $getCustProfileResponseParam as element() (:: schema-element(ns3:getCustomerProfileResponse) ::) external;

declare function local:func($deleteDeviceRequestParam as element() (:: schema-element(ns1:deleteDeviceRequest) ::), 
                            $getGroupResponseParam as element() (:: schema-element(ns2:getGroupResponse) ::), 
                            $getCustProfileResponseParam as element() (:: schema-element(ns3:getCustomerProfileResponse) ::)) 
                            as element() (:: schema-element(ns4:deEnrollRequest) ::) {
    <ns4:deEnrollRequest>
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
        <ns4:programEnrollObjectId>{fn:data($getGroupResponseParam/ns2:groupInfo/ns2:programeErollmentID)}</ns4:programEnrollObjectId>
        <ns4:webUserObjectId>{fn:data($deleteDeviceRequestParam/ns1:accountId/acc:accountIdentifierValue)}</ns4:webUserObjectId>
        {
            if ($getCustProfileResponseParam/ns3:contactId)
            then <ns4:contactId>{fn:data($getCustProfileResponseParam/ns3:contactId)}</ns4:contactId>
            else ()
        }
        <ns4:esn>{fn:data($deleteDeviceRequestParam/ns1:device/pho:esn)}</ns4:esn>
        
    </ns4:deEnrollRequest>
};

local:func($deleteDeviceRequestParam, $getGroupResponseParam, $getCustProfileResponseParam)
