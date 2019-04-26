xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)
declare namespace ns2="http://oauth.tracfone.com/OAuthAccountServices";
(:: import schema at "../../../OAuthServices/DataServices/xsd/OAuthAccountServicesBPEL.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $request as element() (:: schema-element(ns1:resetPasswordRequest) ::) external;

declare function local:func($request as element() (:: schema-element(ns1:resetPasswordRequest) ::)) as element() (:: schema-element(ns2:ValidateUserTokenRequest) ::) {
    <ns2:ValidateUserTokenRequest>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($request/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($request/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:brandName>{fn:data($request/com:brandName)}</com:brandName>
        <com:sourceSystem>{fn:data($request/com:sourceSystem)}</com:sourceSystem>
       <com:language>{fn:data($request/com:language)}</com:language>
        <ns2:userToken>{fn:data($request/ns1:token)}</ns2:userToken>  
    </ns2:ValidateUserTokenRequest>
};

local:func($request)
