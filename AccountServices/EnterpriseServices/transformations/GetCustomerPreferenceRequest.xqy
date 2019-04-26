xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare namespace pho = "http://www.tracfone.com/PhoneCommonTypes";

declare variable $getPreference as element() (:: schema-element(ns1:getCustomerPrefRequest) ::) external;

declare function local:func($getPreference as element() (:: schema-element(ns1:getCustomerPrefRequest) ::)) as element() (:: schema-element(ns1:getCustomerPrefRequest) ::) {
    <ns1:getCustomerPrefRequest>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($getPreference/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($getPreference/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:brandName>{fn:data($getPreference/com:brandName)}</com:brandName>
        <com:sourceSystem>{fn:data($getPreference/com:sourceSystem)}</com:sourceSystem>
        <ns1:deviceId>
         
                    <pho:min>{fn:data($getPreference/ns1:deviceId/pho:min)}</pho:min>
         
                    <pho:esn>{fn:data($getPreference/ns1:deviceId/pho:esn)}</pho:esn>
          
        </ns1:deviceId>
    </ns1:getCustomerPrefRequest>
};

local:func($getPreference)
