xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)
declare namespace ns2="http://www.tracfone.com/AccountSpringFarmServices";
(:: import schema at "../../SpringFarmServices/xsd/AccountSpringFarmServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $forgotreq as element() (:: schema-element(ns1:forgotPasswordRequest) ::) external;
declare variable $customerprofileresp as element() (:: schema-element(ns2:getCustomerProfileResponse) ::) external;

declare function local:func($forgotreq as element() (:: schema-element(ns1:forgotPasswordRequest) ::), 
                            $customerprofileresp as element() (:: schema-element(ns2:getCustomerProfileResponse) ::)) 
                            as element() (:: schema-element(ns1:forgotPasswordRequest) ::) {
    <ns1:forgotPasswordRequest>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($forgotreq/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($forgotreq/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:brandName>{fn:data($forgotreq/com:brandName)}</com:brandName>
        <com:sourceSystem>{fn:data($forgotreq/com:sourceSystem)}</com:sourceSystem>
        {
            if ($forgotreq/com:language)
            then <com:language>{fn:data($forgotreq/com:language)}</com:language>
            else ()
        }
        <ns1:emailID>{fn:data($customerprofileresp/ns2:loginEmail)}</ns1:emailID>
        <ns1:callbackurl>{fn:data($forgotreq/ns1:callbackurl)}</ns1:callbackurl>
    </ns1:forgotPasswordRequest>
};

local:func($forgotreq, $customerprofileresp)
