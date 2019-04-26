xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/MobileAccountServices/v2";
(:: import schema at "../xsd/MobileAccountServices_V2.xsd" ::)
declare namespace ns2="http://www.tracfone.com/PhoneDataServices";
(:: import schema at "../../../PhoneServices/DataServices/xsd/PhoneDataServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare namespace pho = "http://www.tracfone.com/PhoneCommonTypes";

declare variable $requestParam as element() (:: schema-element(ns1:deleteDeviceRequest) ::) external;

declare function local:func($requestParam as element() (:: schema-element(ns1:deleteDeviceRequest) ::)) as element() (:: schema-element(ns2:getEsnAttributesRequest) ::) {
    <ns2:getEsnAttributesRequest>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($requestParam/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($requestParam/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:brandName>{fn:data($requestParam/com:brandName)}</com:brandName>
        <com:sourceSystem>{fn:data($requestParam/com:sourceSystem)}</com:sourceSystem>
        {
            if ($requestParam/com:language)
            then <com:language>{fn:data($requestParam/com:language)}</com:language>
            else ()
        }
        <ns2:device>
            {
                if ($requestParam/ns1:device/pho:esn) 
                then 
                  <pho:esn>{fn:data($requestParam/ns1:device/pho:esn)}</pho:esn>
                else ()              
            }
        </ns2:device>
        <ns2:attributesList>STATUS</ns2:attributesList>
    </ns2:getEsnAttributesRequest>
};

local:func($requestParam)
