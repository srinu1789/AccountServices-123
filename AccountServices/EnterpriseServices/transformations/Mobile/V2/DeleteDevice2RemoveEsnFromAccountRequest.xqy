xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/MobileAccountServices/v2";
(:: import schema at "../../../xsd/MobileAccountServices_V2.xsd" ::)
declare namespace ns2="http://www.tracfone.com/AccountCoreServices";
(:: import schema at "../../../../CoreServices/xsd/AccountCoreServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare namespace acc = "http://www.tracfone.com/AccountCommonTypes";

declare variable $deleteDeviceRequest as element() (:: schema-element(ns1:deleteDeviceRequest) ::) external;
declare variable $contactId as xs:string external;
declare variable $ESN as xs:string external;

declare function local:DeleteDevice2RemoveEsnFromAccountRequest($deleteDeviceRequest as element() (:: schema-element(ns1:deleteDeviceRequest) ::), 
                                                                $contactId as xs:string, 
                                                                $ESN as xs:string) 
                                                                as element() (:: schema-element(ns2:removeMultipleEsnToAccountRequest) ::) {
    <ns2:removeMultipleEsnToAccountRequest>
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
        <ns2:contactObjId>{$contactId}</ns2:contactObjId>
        <ns2:esn>{$ESN}</ns2:esn>
        <ns2:businessAccountId>{fn:data($deleteDeviceRequest/ns1:accountId/acc:accountIdentifierValue)}</ns2:businessAccountId>
    </ns2:removeMultipleEsnToAccountRequest>
};

local:DeleteDevice2RemoveEsnFromAccountRequest($deleteDeviceRequest, $contactId, $ESN)
