xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare namespace acc = "http://www.tracfone.com/AccountCommonTypes";

declare variable $req as element() (:: schema-element(ns1:resetPasswordRequest) ::) external;
declare variable $emailId as xs:string external;

declare function local:func($req as element() (:: schema-element(ns1:resetPasswordRequest) ::), 
                            $emailId as xs:string) 
                            as element() (:: schema-element(ns1:resetPasswordRequest) ::) {
    <ns1:resetPasswordRequest>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($req/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($req/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:brandName>{fn:data($req/com:brandName)}</com:brandName>
        <com:sourceSystem>{fn:data($req/com:sourceSystem)}</com:sourceSystem>
        {
            if ($req/com:language)
            then <com:language>{fn:data($req/com:language)}</com:language>
            else ()
        }
        <ns1:credentials>
            <acc:email>{fn:data($emailId)}</acc:email>
            <acc:password>{fn:data($req/ns1:credentials/acc:password)}</acc:password>
        </ns1:credentials>
    </ns1:resetPasswordRequest>
};

local:func($req, $emailId)
