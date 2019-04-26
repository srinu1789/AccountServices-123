xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/MobileAccountServices/v2";
(:: import schema at "../../../xsd/MobileAccountServices_V2.xsd" ::)
declare namespace ns2="http://www.tracfone.com/GroupManagementServices";
(:: import schema at "../../../../../GroupManagementServices/CoreServices/xsd/GroupManagementServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $deleteDeviceRequest as element() (:: schema-element(ns1:deleteDeviceRequest) ::) external;
declare variable $ESN as xs:string external;

declare function local:DeleteDevice2GetGroupRequest.xqy($deleteDeviceRequest as element() (:: schema-element(ns1:deleteDeviceRequest) ::), $ESN as xs:string ) as element() (:: schema-element(ns2:getGroupRequest) ::) {
    <ns2:getGroupRequest>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($deleteDeviceRequest/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($deleteDeviceRequest/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:brandName>{fn:data($deleteDeviceRequest/com:brandName)}</com:brandName>
        <com:sourceSystem>{fn:data($deleteDeviceRequest/com:sourceSystem)}</com:sourceSystem>
        {
            if ($deleteDeviceRequest/com:language)
            then <com:language>{fn:data($deleteDeviceRequest/com:language)}</com:language>
            else ()
        }
        <ns2:esn>{$ESN}</ns2:esn>
    </ns2:getGroupRequest>
};

local:DeleteDevice2GetGroupRequest.xqy($deleteDeviceRequest, $ESN)
