xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)
declare namespace ns2="http://www.tracfone.com/AccountSpringFarmServices";
(:: import schema at "../../SpringFarmServices/xsd/AccountSpringFarmServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $IsValidAccountRequest as element() (:: schema-element(ns1:isValidAccountRequest) ::) external;

declare function local:IsValidAccount($IsValidAccountRequest as element() (:: schema-element(ns1:isValidAccountRequest) ::)) as element() (:: schema-element(ns2:accountRecoveryAccountStatusRequest) ::) {
    <ns2:accountRecoveryAccountStatusRequest>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($IsValidAccountRequest/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($IsValidAccountRequest/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:brandName>{fn:data($IsValidAccountRequest/com:brandName)}</com:brandName>
        <com:sourceSystem>{fn:data($IsValidAccountRequest/com:sourceSystem)}</com:sourceSystem>
        {
            if ($IsValidAccountRequest/com:language)
            then <com:language>{fn:data($IsValidAccountRequest/com:language)}</com:language>
            else ()
        }
        <ns2:min>{fn:data($IsValidAccountRequest/ns1:min)}</ns2:min>
    </ns2:accountRecoveryAccountStatusRequest>
};

local:IsValidAccount($IsValidAccountRequest)
