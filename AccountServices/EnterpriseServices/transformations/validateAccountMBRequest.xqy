xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$validateAccountRequestMB1" element="ns2:validateAccountRequestMB" location="../xsd/AccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns3:authenticateSecurityPinRequestMB" location="../../DataServices/xsd/AccountDataServices.xsd" ::)

declare namespace ns2 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns1 = "http://www.tracfone.com/SecurityCommonTypes";
declare namespace ns3 = "http://www.tracfone.com/AccountDataServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/validateAccountMBRequest/";

declare function xf:validateAccountMBRequest($validateAccountRequestMB1 as element(ns2:validateAccountRequestMB))
    as element(ns3:authenticateSecurityPinRequestMB) {
        <ns3:authenticateSecurityPinRequestMB>
            <ns0:requestToken>
                <ns0:clientTransactionId>{ data($validateAccountRequestMB1/ns0:requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                <ns0:clientId>{ data($validateAccountRequestMB1/ns0:requestToken/ns0:clientId) }</ns0:clientId>
            </ns0:requestToken>
            <ns0:brandName>{ data($validateAccountRequestMB1/ns0:brandName) }</ns0:brandName>
            <ns0:sourceSystem>{ data($validateAccountRequestMB1/ns0:sourceSystem) }</ns0:sourceSystem>
            {
                for $language in $validateAccountRequestMB1/ns0:language
                return
                    <ns0:language>{ data($language) }</ns0:language>
            }
            <ns3:authenticationCredentialsMB>
                <ns1:mbUserId>{ data($validateAccountRequestMB1/ns2:MBCredentials/ns1:mbUserId) }</ns1:mbUserId>
                <ns1:mbSecurityPin>{ data($validateAccountRequestMB1/ns2:MBCredentials/ns1:mbSecurityPin) }</ns1:mbSecurityPin>
            </ns3:authenticationCredentialsMB>
        </ns3:authenticateSecurityPinRequestMB>
};

declare variable $validateAccountRequestMB1 as element(ns2:validateAccountRequestMB) external;

xf:validateAccountMBRequest($validateAccountRequestMB1)