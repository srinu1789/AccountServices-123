xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$forgotPasswordRequest1" element="ns3:forgotPasswordRequest" location="../xsd/AccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns1:generateTokenForAccountRequest" location="../../../OAuthServices/EnterpriseServices/xsd/OAuthAccountServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns1 = "http://oauth.b2b.tracfone.com/OAuthAccountServices";
declare namespace ns3 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/GenerateAccountUserTokenRequest/";

declare function xf:GenerateAccountUserTokenRequest($forgotPasswordRequest1 as element(ns3:forgotPasswordRequest),
    $string1 as xs:string)
    as element(ns1:generateTokenForAccountRequest) {
        <ns1:generateTokenForAccountRequest>
            <ns0:requestToken>{ $forgotPasswordRequest1/ns0:requestToken/@* , $forgotPasswordRequest1/ns0:requestToken/node() }</ns0:requestToken>
            <ns0:brandName>{ data($forgotPasswordRequest1/ns0:brandName) }</ns0:brandName>
            <ns0:sourceSystem>{ data($forgotPasswordRequest1/ns0:sourceSystem) }</ns0:sourceSystem>
            {
                for $language in $forgotPasswordRequest1/ns0:language
                return
                    <ns0:language>{ data($language) }</ns0:language>
            }
            <ns1:accountCredentials>
                <ns2:email>{ data($forgotPasswordRequest1/ns3:emailID) }</ns2:email>
                <ns2:password>{ $string1 }</ns2:password>
            </ns1:accountCredentials>
        </ns1:generateTokenForAccountRequest>
};

declare variable $forgotPasswordRequest1 as element(ns3:forgotPasswordRequest) external;
declare variable $string1 as xs:string external;

xf:GenerateAccountUserTokenRequest($forgotPasswordRequest1,
    $string1)