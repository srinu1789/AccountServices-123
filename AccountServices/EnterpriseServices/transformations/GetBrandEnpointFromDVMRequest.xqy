xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $request as element() (:: schema-element(ns1:forgotPasswordRequest) ::) external;
declare variable $endPoint as xs:string external;

declare function local:func($request as element() (:: schema-element(ns1:forgotPasswordRequest) ::), 
                            $endPoint as xs:string) 
                            as element() (:: schema-element(ns1:forgotPasswordRequest) ::) {
    <ns1:forgotPasswordRequest>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($request/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($request/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:brandName>{fn:data($request/com:brandName)}</com:brandName>
        <com:sourceSystem>{fn:data($request/com:sourceSystem)}</com:sourceSystem>
        {
            if ($request/com:language)
            then <com:language>{fn:data($request/com:language)}</com:language>
            else ()
        }
        <ns1:emailID>{fn:data($request/ns1:emailID)}</ns1:emailID>
        <ns1:callbackurl>{fn:data($endPoint)}</ns1:callbackurl>
    </ns1:forgotPasswordRequest>
};

local:func($request, $endPoint)
